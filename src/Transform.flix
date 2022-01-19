namespace Transform {

    use Ast.Body;
    use Ast.Call.Call;
    use Ast.Call;
    use Ast.Context;
    use Ast.Def.Def;
    use Ast.Def;
    use Ast.Effect;
    use Ast.Impl.Impl;
    use Ast.Impl;
    use Ast.Import;
    use Ast.Namespace.Namespace;
    use Ast.Namespace;
    use Ast.Type_;

    use Options.Options;
    use Options.Options.Options;
    use Options.PureLevel;
    use Options.ResultLevel;

    type alias Class = ##java.lang.Class
    type alias Field = ##java.lang.reflect.Field
    type alias Method = ##java.lang.reflect.Method

    pub def visitClass(o: Options, c: Class): Namespace = {
        import java.lang.Class.getDeclaredMethods(): & Pure;
        import java.lang.Class.getSimpleName(): & Pure;
        import java.lang.Class.getDeclaredFields(): & Pure;
        let defs1 = {
            getDeclaredMethods(c) 
            |> Array.toList 
            |> List.filter(isPublic) 
            |> List.filter(isBlackMagic >> Bool.not)
            |> List.map(visitMethod(o))
        } as & Pure;
        let defs2 = {
            getDeclaredFields(c)
            |> Array.toList
            |> List.filter(isPublicField)
            |> List.flatMap(visitField(o))
        } as & Pure;
        let Options(opts) = o;
        let name = opts.namespace_ |> Option.getWithDefault(getSimpleName(c));
        Namespace(name, defs1 ::: defs2)
    }

    pub def visitMethod(o: Options, m: Method): Ast.Def = {
        import java.lang.reflect.Method.getName(): & Pure;
        import java.lang.reflect.Method.getParameterTypes(): & Pure;
        import java.lang.reflect.Method.getReturnType(): & Pure;
        import java.lang.reflect.Method.getDeclaringClass(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        import java.lang.reflect.Method.getExceptionTypes(): & Pure;
        let name = getName(m);
        let eff = match o {
            case Options(opts) if opts.pureLevel >= PureLevel.PureButSetters => Effect.Pure_
            case _ => Effect.Impure_
        };
        let return = getReturnType(m) |> visitType;
        let clazz = getDeclaringClass(m);
        let clazzName = getCanonicalName(clazz);
        let context = if (isStatic(m)) Context.Static else Context.Instance;
        let importParamTypes = { getParameterTypes(m) |> Array.toList |> List.map(visitType) } as & Pure;
        let outerParamTypes = match context {
            case Context.Static => importParamTypes
            case Context.Instance => visitType(clazz) :: importParamTypes
        };
        let canFail = getExceptionTypes(m) |> Array.isEmpty |> Bool.not;
        let catchException = match (o, canFail) {
            case (Options(opts), true) if opts.resultLevel >= ResultLevel.ResultChecked => true
            case (Options(opts), _) if opts.resultLevel >= ResultLevel.ResultAll => true
            case _ => false
        };
        let outerReturnType = if (catchException) {
            Type_.Result_(return, Type_.Ref("java.lang.Exception"))
        } else {
            return
        };
        let paramNames = List.range(0, List.length(outerParamTypes)) |> List.map(i -> "x${i}");
        let params = List.zip(paramNames, outerParamTypes);
        let imp = Import.Method(context, clazzName + "." + name, importParamTypes, eff);
        let call = Call(name, paramNames);
        let body = if (catchException) Body.TryCatch(call) else Body.NoTry(call);
        let impl = Impl(imp, body);
        Def(name, params, outerReturnType, eff, impl)
    }

    pub def visitField(o: Options, f: Field): List[Ast.Def] = {
        if (isFinalField(f)) {
            mkGetter(o, f) :: Nil
        } else {
            mkGetter(o, f) :: mkSetter(o, f) :: Nil
        }
    }

    def mkGetter(o: Options, f: Field): Ast.Def = {
        import java.lang.reflect.Field.getDeclaringClass(): & Pure;
        import java.lang.reflect.Field.getName(): & Pure;
        import java.lang.reflect.Field.getType(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        let context = if (isStaticField(f)) Context.Static else Context.Instance;
        let eff = match (o, isFinalField(f)) {
            case (Options(opts), true) if opts.pureLevel >= PureLevel.PureFinal => Effect.Pure_
            case (Options(opts), _) if opts.pureLevel >= PureLevel.PureButSetters => Effect.Pure_
            case _ => Effect.Impure_
        };
        let name = getName(f);
        let clazz = getDeclaringClass(f);
        let clazzName = getCanonicalName(clazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => Nil
            case Context.Instance => visitType(clazz) :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let params = List.zip(paramNames, paramTypes);
        let funcName = getterName(name);
        let imp = Import.GetField(context, clazzName + "." + name, eff, funcName);
        let call = Call(funcName, paramNames);
        let body = Body.NoTry(call);
        let impl = Impl(imp, body);
        Def(funcName, params, fieldType, eff, impl)
    }

    def mkSetter(o: Options, f: Field): Ast.Def = {
        import java.lang.reflect.Field.getDeclaringClass(): & Pure;
        import java.lang.reflect.Field.getName(): & Pure;
        import java.lang.reflect.Field.getType(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        let context = if (isStaticField(f)) Context.Static else Context.Instance;
        let eff = match o {
            case Options(opts) if opts.pureLevel >= PureLevel.PureAll => Effect.Pure_
            case _ => Effect.Impure_
        };
        let name = getName(f);
        let clazz = getDeclaringClass(f);
        let clazzName = getCanonicalName(clazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => fieldType :: Nil
            case Context.Instance => visitType(clazz) :: fieldType :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let params = List.zip(paramNames, paramTypes);
        let funcName = setterName(name);
        let imp = Import.SetField(context, clazzName + "." + name, eff, funcName);
        let call = Call(funcName, paramNames);
        let body = Body.NoTry(call);
        let impl = Impl(imp, body);
        Def(funcName, params, fieldType, eff, impl)
    }

    pub def visitType(t: Class): Ast.Type_ = {
        import java.lang.Class.getCanonicalName(): & Pure;
        import java.lang.Class.isArray(): & Pure;
        import java.lang.Class.getComponentType(): & Pure;
        if (isArray(t)) {
            let ct = getComponentType(t);
            Type_.Array_(visitType(ct))
        } else {
            match getCanonicalName(t) {
                case "byte" => Type_.Int8_
                case "short" => Type_.Int16_
                case "int" => Type_.Int32_
                case "long" => Type_.Int64_
                case "float" => Type_.Float32_
                case "double" => Type_.Float64_
                case "boolean" => Type_.Bool_
                case "char" => Type_.Char_
                case "java.lang.String" => Type_.String_
                case "java.math.BigInteger" => Type_.BigInt_
                case "void" => Type_.Unit_
                case name => Type_.Ref(name)
            }
        }
    }

    def isStaticField(f: Field): Bool = {
        import java.lang.reflect.Field.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isStatic(Int): & Pure;
        getModifiers(f) |> isStatic
    }

    def isFinalField(f: Field): Bool = {
        import java.lang.reflect.Field.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isFinal(Int): & Pure;
        getModifiers(f) |> isFinal
    }

    def isStatic(m: Method): Bool = {
        import java.lang.reflect.Method.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isStatic(Int): & Pure;
        getModifiers(m) |> isStatic
    }

    def isPublic(m: Method): Bool = {
        import java.lang.reflect.Method.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isPublic(Int): & Pure;
        getModifiers(m) |> isPublic
    }

    def isPublicField(f: Field): Bool = {
        import java.lang.reflect.Field.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isPublic(Int): & Pure;
        getModifiers(f) |> isPublic
    }

    /// A method with an undocumented modifier.
    /// Causes issues as it may have signature overlap.
    def isBlackMagic(m: Method): Bool = {
        import java.lang.reflect.Method.getModifiers(): & Pure;
        getModifiers(m) &&& 4096 != 0
    }

    def getterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(1, fieldName);
        "get" + "${Char.toUpperCase(head)}" + tail
    }

    def setterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(1, fieldName);
        "set" + "${Char.toUpperCase(head)}" + tail
    }
}