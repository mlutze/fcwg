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

    use Wrapped/Class.getCanonicalName;
    use Wrapped/Class.getComponentType;
    use Wrapped/Class.getFields;
    use Wrapped/Class.getMethods;
    use Wrapped/Class.getSimpleName;
    use Wrapped/Class.isArray;
    use Wrapped/Class.isPrimitive;
    use Wrapped/Class.{getName => getClassName};

    use Wrapped/Field.getType;
    use Wrapped/Field.{getDeclaringClass => getFieldDeclaringClass};
    use Wrapped/Field.{getModifiers => getFieldModifiers};
    use Wrapped/Field.{getName => getFieldName};

    use Wrapped/Method.getExceptionTypes;
    use Wrapped/Method.getParameterTypes;
    use Wrapped/Method.getReturnType;
    use Wrapped/Method.{getDeclaringClass => getMethodDeclaringClass};
    use Wrapped/Method.{getModifiers => getMethodModifiers};
    use Wrapped/Method.{getName => getMethodName};

    use Wrapped/Modifier.isStatic;
    use Wrapped/Modifier.isFinal;

    type alias Class = ##java.lang.Class
    type alias Field = ##java.lang.reflect.Field
    type alias Method = ##java.lang.reflect.Method
    type alias Exception = ##java.lang.Exception

    /// Transforms the Java class into a Flix namespace.
    pub def visitClass(o: Options, c: Class): Result[Namespace, Exception] = {
        use Result.flatMap;
        let* methods = getMethodsFor(o, c);
        let defs1 = methods
            |> List.filter(isBlackMagicMethod >> Bool.not)
            |> List.map(visitMethod(o, c));
        let* fields = getFieldsFor(o, c);
        let defs2 = fields
            |> List.flatMap(visitField(o, c));
        let Options(opts) = o;
        let name = opts.namespace_ |> Option.getWithDefault(getSimpleName(c));
        let defs = List.sort(defs1 ::: defs2);
        Namespace(name, defs) |> Ok
    }

    /// Gets the methods relevant to the class.
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

    /// Gets the fields relevant to the class.
    def getFieldsFor(o: Options, c: Class): Result[List[Field], Exception] = {
        use Result.flatMap;
        let Options(opts) = o;
        let clazzName = getClassName(c);
        let* fields = getFields(c);
        match opts.superLevel {
            case SuperLevel.SuperNone => fields |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) == clazzName)
            case SuperLevel.SuperButObject => fields |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) != "java.lang.Object")
            case SuperLevel.SuperAll => fields |> Array.toList
        } as & Pure |> Ok
    }

    def getMethodContext(m: Method): Context = if (isStaticMethod(m)) Context.Static else Context.Instance

    def isInheritedMethod(c: Class, m: Method): Bool = {
        let importClazzName = getCanonicalName(c);
        let methodClazz = getMethodDeclaringClass(m);
        let methodClazzName = getCanonicalName(methodClazz);
        importClazzName != methodClazzName
    }

    /// Creates the effect for the imported return type [tpe].
    def mkEffect(o: Options, tpe: Type_): Effect = match o {
        case Options(opts) if opts.pureLevel >= PureLevel.PureButUnit and tpe != Type_.Unit_ => Effect.Pure_
        case Options(opts) if opts.pureLevel >= PureLevel.PureAll => Effect.Pure_
        case _ => Effect.Impure_
    }

    /// Creates a list of [n] standard parameter names (x0, x1, ..., xn)
    def mkParamNames(n: Int): List[String] = List.range(0, n) |> List.map(i -> "x${i}")

    /// Returns true iff the function should return a Result.
    def shouldResult(o: Options, m: Method): Bool = {
        let canFail = getExceptionTypes(m) |> Array.isEmpty |> Bool.not;
        match (o, canFail) {
            case (Options(opts), true) if opts.resultLevel >= ResultLevel.ResultChecked => true
            case (Options(opts), _) if opts.resultLevel >= ResultLevel.ResultAll => true
            case _ => false
        }
    }

    /// Returns true iff the function should return an Option.
    def shouldOption(o: Options, m: Method): Bool = {
        match (o, isPrimitive(getReturnType(m))) {
            case (Options(opts), false) if opts.optionLevel >= OptionLevel.OptionRef => true
            case (Options(opts), _) if opts.optionLevel >= OptionLevel.OptionAll => true
            case _ => false
        }
    }

    /// Creates the return type for the function.
    def mkOuterReturnType(doResult: { doResult :: Bool }, doOption: { doOption :: Bool }, importReturnType: Type_): Type_ = {
        match (doResult.doResult, doOption.doOption) {
            case (false, false) => importReturnType
            case (true, false) => Type_.Result_(importReturnType, Type_.Ref("java.lang.Exception"))
            case (false, true) => Type_.Option_(importReturnType)
            case (true, true) => Type_.Result_(Type_.Option_(importReturnType), Type_.Ref("java.lang.Exception"))
            case _ => unreachable!()
        }
    }

    /// Creates the arguments to be used for the internal call.
    def mkCallArgs(c: Class, m: Method): List[Arg] = {
        match getMethodContext(m) {
            case Context.Instance if isInheritedMethod(c, m) =>
                let paramNames = mkParamNames(getParameterTypes(m) |> Array.length + 1);
                let tpe = getMethodDeclaringClass(m) |> visitType;
                match paramNames {
                    case hd :: tl => Arg.Cast(hd, tpe) :: List.map(Arg.NoCast, tl)
                    case Nil => unreachable!()
                }
            case Context.Instance =>
                let paramNames = mkParamNames(getParameterTypes(m) |> Array.length + 1);
                List.map(Arg.NoCast, paramNames)
            case Context.Static =>
                let paramNames = mkParamNames(getParameterTypes(m) |> Array.length);
                List.map(Arg.NoCast, paramNames)
        }
    }

    /// Creates the parameters for the interface to the function.
    def mkOuterParams(c: Class, m: Method, importParamTypes: List[Type_]): List[(String, Type_)] = {
        match getMethodContext(m) {
            case Context.Instance =>
                let paramNames = mkParamNames(getParameterTypes(m) |> Array.length + 1);
                let paramTypes = visitType(c) :: importParamTypes;
                List.zip(paramNames, paramTypes)
            case Context.Static =>
                let paramNames = mkParamNames(getParameterTypes(m) |> Array.length + 1);
                let paramTypes = importParamTypes;
                List.zip(paramNames, paramTypes)
        }
    }

    /// Transforms the Java method into a Flix function.
    pub def visitMethod(o: Options, c: Class, m: Method): Ast.Def = {
        let name = getMethodName(m);

        // build the import statement
        let importClazz = getMethodDeclaringClass(m);
        let importClazzName = getCanonicalName(importClazz);
        let importReturnType = getReturnType(m) |> visitType;
        let context = getMethodContext(m);
        let importParamTypes = { getParameterTypes(m) |> Array.toList |> List.map(visitType) } as & Pure;
        let eff = mkEffect(o, importReturnType);
        let importName = importClazzName + "." + name;
        let import_ = Import.Method(context, importName, importParamTypes, eff);

        // build the call expression
        let doResult = shouldResult(o, m);
        let doOption = shouldOption(o, m);
        let args = mkCallArgs(c, m);
        let call = Call(name, args);
        let wrap = if (doOption) Wrap.WrapOption(call) else Wrap.NoWrap(call);
        let body = if (doResult) Body.TryCatch(wrap) else Body.NoTry(wrap);

        let impl = Impl(import_, body);

        let outerReturnType = mkOuterReturnType(doResult = doResult, doOption = doOption, importReturnType);
        let outerParams = mkOuterParams(c, m, importParamTypes);
        Def(name, outerParams, outerReturnType, eff, impl)
    }


    /// Transforms the Java field into a Flix getter and setter.
    pub def visitField(o: Options, c: Class, f: Field): List[Ast.Def] = {
        if (isFinalField(f)) {
            mkGetter(o, c, f) :: Nil
        } else {
            mkGetter(o, c, f) :: mkSetter(o, c, f) :: Nil
        }
    }

    /// Creates a getter for the given field.
    def mkGetter(o: Options, c: Class, f: Field): Ast.Def = {
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
        let doWrap = match (o, isPrimitive(getType(f))) {
            case (Options(opts), false) if opts.optionLevel >= OptionLevel.OptionRef => true
            case (Options(opts), _) if opts.optionLevel >= OptionLevel.OptionAll => true
            case _ => false
        };
        let outerReturnType = if (doWrap) Type_.Option_(fieldType) else fieldType;
        let wrap = if (doWrap) Wrap.WrapOption(call) else Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        Def(funcName, params, outerReturnType, eff, impl)
    }

    /// Creates a setter for the given field.
    def mkSetter(o: Options, c: Class, f: Field): Ast.Def = {
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

    /// Converts the Java class into a Flix type.
    pub def visitType(t: Class): Ast.Type_ = {
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
        getFieldModifiers(f) |> isStatic
    }

    def isFinalField(f: Field): Bool = {
        getFieldModifiers(f) |> isFinal
    }

    def isStaticMethod(m: Method): Bool = {
        getMethodModifiers(m) |> isStatic
    }

    /// A method with an undocumented modifier.
    /// Causes issues as it may have signature overlap.
    def isBlackMagicMethod(m: Method): Bool = {
        getMethodModifiers(m) &&& 4096 != 0
    }

    /// Creates a valid Flix getter name from the field name.
    def getterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(1, fieldName);
        "get" + "${Char.toUpperCase(head)}" + tail
    }

    /// Creates a valid Flix setter name from the field name.
    def setterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(1, fieldName);
        "set" + "${Char.toUpperCase(head)}" + tail
    }
}