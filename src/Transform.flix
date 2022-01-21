namespace Transform {

    use Ast.Arg;
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
    use Ast.Wrap;

    use Options.OptionLevel;
    use Options.Options.Options;
    use Options.Options;
    use Options.PureLevel;
    use Options.ResultLevel;
    use Options.SuperLevel;

    use Wrapped/Class.getMethods;
    use Wrapped/Class.getSimpleName;
    use Wrapped/Class.{getName => getClassName};

    use Wrapped/Field.{getName => getFieldName};
    use Wrapped/Field.{getDeclaringClass => getFieldDeclaringClass};

    use Wrapped/Method.{getName => getMethodName};
    use Wrapped/Method.{getDeclaringClass => getMethodDeclaringClass};

    type alias Class = ##java.lang.Class
    type alias Field = ##java.lang.reflect.Field
    type alias Method = ##java.lang.reflect.Method
    type alias Exception = ##java.lang.Exception

    pub def visitClass(o: Options, c: Class): Result[Namespace, Exception] = {
        use Result.flatMap;
        let* methods = getMethodsFor(o, c);
        let defs1 = methods
            |> List.filter(isBlackMagic >> Bool.not)
            |> List.map(visitMethod(o, c));
        let defs2 = {
            getFieldsFor(o, c)
            |> List.flatMap(visitField(o, c))
        };
        let Options(opts) = o;
        let name = opts.namespace_ |> Option.getWithDefault(getSimpleName(c));
        Namespace(name, defs1 ::: defs2) |> Ok
    }

    def getMethodsFor(o: Options, c: Class): Result[List[Method], Exception] = {
        use Result.flatMap;
        let Options(opts) = o;
        let clazzName = getClassName(c);
        let* methods = getMethods(c);
        match opts.superLevel {
            case SuperLevel.SuperNone => methods |> Array.toList |> List.filter(m -> getClassName(getMethodDeclaringClass(m)) == clazzName)
            case SuperLevel.SuperButObject => methods |> Array.toList |> List.filter(m -> getClassName(getMethodDeclaringClass(m)) != "java.lang.Object")
            case SuperLevel.SuperAll => methods |> Array.toList
        } as & Pure |> Ok
    }

    def getFieldsFor(o: Options, c: Class): List[Field] = {
        import java.lang.Class.getFields(): & Pure;
        let Options(opts) = o;
        let clazzName = getClassName(c);
        match opts.superLevel {
            case SuperLevel.SuperNone => getFields(c) |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) == clazzName)
            case SuperLevel.SuperButObject => getFields(c) |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) != "java.lang.Object")
            case SuperLevel.SuperAll => getFields(c) |> Array.toList
        } as & Pure
    }

    // MATT split into static/instance
    pub def visitMethod(o: Options, c: Class, m: Method): Ast.Def = {
        import java.lang.reflect.Method.getParameterTypes(): & Pure;
        import java.lang.reflect.Method.getReturnType(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        import java.lang.Class.isPrimitive(): & Pure;
        import java.lang.reflect.Method.getExceptionTypes(): & Pure;
        let name = getMethodName(m);
        let return = getReturnType(m) |> visitType;
        let eff = match o  {
            case Options(opts) if opts.pureLevel >= PureLevel.PureButUnit and return != Type_.Unit_ => Effect.Pure_
            case _ => Effect.Impure_
        };
        let importClazz = getMethodDeclaringClass(m);
        let importClazzName = getCanonicalName(importClazz);
        let context = if (isStatic(m)) Context.Static else Context.Instance;
        let importParamTypes = { getParameterTypes(m) |> Array.toList |> List.map(visitType) } as & Pure;
        let outerParamTypes = match context {
            case Context.Static => importParamTypes
            case Context.Instance => visitType(c) :: importParamTypes
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
        let isInherited = importClazzName != getCanonicalName(c);
        let args = match context {
            case Context.Instance if isInherited => match paramNames {
                case hd :: tl => Arg.Cast(hd, visitType(importClazz)) :: List.map(Arg.NoCast, tl)
                case Nil => bug!("unexpected empty parameter list")
            }
            case _ => List.map(Arg.NoCast, paramNames)
        };
        let params = List.zip(paramNames, outerParamTypes);
        let imp = Import.Method(context, importClazzName + "." + name, importParamTypes, eff);
        let call = Call(name, args);
        let wrap = match (o, isPrimitive(getReturnType(m))) {
            case (Options(opts), false) if opts.optionLevel >= OptionLevel.OptionRef => Wrap.WrapOption(call)
            case (Options(opts), _) if opts.optionLevel >= OptionLevel.OptionAll => Wrap.WrapOption(call)
            case _ => Wrap.NoWrap(call)
        };
        let body = if (catchException) Body.TryCatch(wrap) else Body.NoTry(wrap);
        let impl = Impl(imp, body);
        Def(name, params, outerReturnType, eff, impl)
    }

    pub def visitField(o: Options, c: Class, f: Field): List[Ast.Def] = {
        if (isFinalField(f)) {
            mkGetter(o, c, f) :: Nil
        } else {
            mkGetter(o, c, f) :: mkSetter(o, c, f) :: Nil
        }
    }

    def mkGetter(o: Options, c: Class, f: Field): Ast.Def = {
        import java.lang.reflect.Field.getType(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        import java.lang.Class.isPrimitive(): & Pure;
        let context = if (isStaticField(f)) Context.Static else Context.Instance;
        let eff = match (o, isFinalField(f)) {
            case (Options(opts), true) if opts.pureLevel >= PureLevel.PureFinal => Effect.Pure_
            case (Options(opts), _) if opts.pureLevel >= PureLevel.PureButUnit => Effect.Pure_
            case _ => Effect.Impure_
        };
        let name = getFieldName(f);
        let importClazz = getFieldDeclaringClass(f);
        let importClazzName = getCanonicalName(importClazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => Nil
            case Context.Instance => visitType(c) :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let isInherited = importClazzName != getCanonicalName(c);
        let args = match context {
            case Context.Static => List.map(Arg.NoCast, paramNames)
            case Context.Instance if isInherited => match paramNames {
                case hd :: tl => Arg.Cast(hd, visitType(importClazz)) :: List.map(Arg.NoCast, tl)
                case Nil => bug!("unexpected empty parameter list")
            }
        };
        let params = List.zip(paramNames, paramTypes);
        let funcName = getterName(name);
        let imp = Import.GetField(context, importClazzName + "." + name, eff, funcName);
        let call = Call(funcName, args);
        let wrap = match (o, isPrimitive(getType(f))) {
            case (Options(opts), false) if opts.optionLevel >= OptionLevel.OptionRef => Wrap.WrapOption(call)
            case (Options(opts), _) if opts.optionLevel >= OptionLevel.OptionAll => Wrap.WrapOption(call)
            case _ => Wrap.NoWrap(call)
        };
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        Def(funcName, params, fieldType, eff, impl)
    }

    def mkSetter(o: Options, c: Class, f: Field): Ast.Def = {
        import java.lang.reflect.Field.getType(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        let context = if (isStaticField(f)) Context.Static else Context.Instance;
        let eff = match o {
            case Options(opts) if opts.pureLevel >= PureLevel.PureAll => Effect.Pure_
            case _ => Effect.Impure_
        };
        let name = getFieldName(f);
        let importClazz = getFieldDeclaringClass(f);
        let importClazzName = getCanonicalName(importClazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => fieldType :: Nil
            case Context.Instance => visitType(c) :: fieldType :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let isInherited = importClazzName != getCanonicalName(c);
        let args = match context {
            case Context.Static => List.map(Arg.NoCast, paramNames)
            case Context.Instance if isInherited => match paramNames {
                case hd :: tl => Arg.Cast(hd, visitType(importClazz)) :: List.map(Arg.NoCast, tl)
                case Nil => bug!("unexpected empty parameter list")
            }
        };
        let params = List.zip(paramNames, paramTypes);
        let funcName = setterName(name);
        let imp = Import.SetField(context, importClazzName + "." + name, eff, funcName);
        let call = Call(funcName, args);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
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