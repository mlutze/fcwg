mod Transform {

    use Ast.Arg
    use Ast.Body
    use Ast.Call.Call
    use Ast.Call
    use Ast.Context
    use Ast.Def.Def
    use Ast.Def
    use Ast.Effect
    use Ast.Impl.Impl
    use Ast.Impl
    use Ast.Import
    use Ast.Namespace.Namespace
    use Ast.Namespace
    use Ast.Type_
    use Ast.Wrap

    use Options.OptionLevel
    use Options.Options.Options
    use Options.Options
    use Options.PureLevel
    use Options.ResultLevel
    use Options.SuperLevel

    use Wrapped.Class.getComponentType
    use Wrapped.Class.getConstructors
    use Wrapped.Class.getFields
    use Wrapped.Class.getMethods
    use Wrapped.Class.getSimpleName
    use Wrapped.Class.isArray
    use Wrapped.Class.isPrimitive
    use Wrapped.Class.{getName => getClassName}

    use Wrapped.Constructor.{getExceptionTypes => getConstructorExceptionTypes}
    use Wrapped.Constructor.{getParameterTypes => getConstructorParameterTypes}

    use Wrapped.Field.getType
    use Wrapped.Field.{getDeclaringClass => getFieldDeclaringClass}
    use Wrapped.Field.{getModifiers => getFieldModifiers}
    use Wrapped.Field.{getName => getFieldName}

    use Wrapped.Method.{getExceptionTypes => getMethodExceptionTypes}
    use Wrapped.Method.{getParameterTypes => getMethodParameterTypes}
    use Wrapped.Method.getReturnType
    use Wrapped.Method.{getDeclaringClass => getMethodDeclaringClass}
    use Wrapped.Method.{getModifiers => getMethodModifiers}
    use Wrapped.Method.{getName => getMethodName}

    use Wrapped.Modifier.isStatic
    use Wrapped.Modifier.isFinal

    type alias Class = ##java.lang.Class
    type alias Constructor = ##java.lang.reflect.Constructor
    type alias Field = ##java.lang.reflect.Field
    type alias Method = ##java.lang.reflect.Method
    type alias Exception = ##java.lang.Exception

    /// Transforms the Java class into a Flix namespace.
    pub def visitClass(o: Options, c: Class): Result[Exception, Namespace] = {
        use Result.flatMap;
        for (
            methods <- getMethodsFor(o, c);
            defs1 <- methods
                |> List.filter(isBlackMagicMethod >> Bool.not)
                |> List.map(visitMethod(o, c))
                |> Ok;
            fields <- getFieldsFor(o, c);
            defs2 <- fields
                |> List.flatMap(visitField(o, c))
                |> Ok;
            constructors <- getConstructorsFor(o, c);
            defs3 <- constructors
                |> List.map(visitConstructor(o, c))
                |> Ok
        ) yield {
            let Options(opts) = o;
            let name = opts.namespace_ |> Option.getWithDefault(getSimpleName(c));
            let defs = disambiguateDefs(defs1 ::: defs2 ::: defs3)
                |> List.sort;
            Namespace(name, defs)
        }
    }

    /// Modifies the names of definitions to disambiguate them.
    def disambiguateDefs(defs: List[Def]): List[Def] = {
        def disambiguateGroup(group) = {
            if (List.length(group) == 1) {
                group
            } else {
                group |> List.map(
                    match Def(name, params, ret, eff, impl) ->
                        let tpes = params |> List.map(snd) |> List.map(typeToIdentifierString);
                        let newName = name ++ String.intercalate("", tpes);
                        Def(newName, params, ret, eff, impl)
                )
            }
        };
        def sameName(d1, d2) = {
            let Def(name1, _, _, _, _) = d1;
            let Def(name2, _, _, _, _) = d2;
            name1 == name2
        };
        List.groupBy(sameName, defs) |> List.map(disambiguateGroup) |> List.flatten
    }

    /// Gets the methods relevant to the class.
    def getMethodsFor(o: Options, c: Class): Result[Exception, List[Method]] = {
        use Result.flatMap;
        let Options(opts) = o;
        let clazzName = getClassName(c);
        for (
            methods <- getMethods(c)
        ) yield {
            unchecked_cast(match opts.superLevel {
                case SuperLevel.SuperNone => methods |> Array.toList |> List.filter(m -> getClassName(getMethodDeclaringClass(m)) == clazzName)
                case SuperLevel.SuperButObject => methods |> Array.toList |> List.filter(m -> getClassName(getMethodDeclaringClass(m)) != "java.lang.Object")
                case SuperLevel.SuperAll => methods |> Array.toList
            } as _ \ {})
        }
    }

    /// Gets the fields relevant to the class.
    def getFieldsFor(o: Options, c: Class): Result[Exception, List[Field]] = {
        use Result.flatMap;
        let Options(opts) = o;
        let clazzName = getClassName(c);
        for (
            fields <- getFields(c)
        ) yield {
            unchecked_cast(match opts.superLevel {
                case SuperLevel.SuperNone => fields |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) == clazzName)
                case SuperLevel.SuperButObject => fields |> Array.toList |> List.filter(m -> getClassName(getFieldDeclaringClass(m)) != "java.lang.Object")
                case SuperLevel.SuperAll => fields |> Array.toList
            } as _ \ {})
        }
    }

    def getConstructorsFor(_o: Options, c: Class): Result[Exception, List[Constructor]] = {
        use Result.flatMap;
        for (
            csts <- getConstructors(c)
        ) yield {
            unchecked_cast({ csts |> Array.toList } as _ \ {})
        }
    }

    def getMethodContext(m: Method): Context = if (isStaticMethod(m)) Context.Static else Context.Instance

    def isInheritedMethod(c: Class, m: Method): Bool = {
        let importClazzName = getClassName(c);
        let methodClazz = getMethodDeclaringClass(m);
        let methodClazzName = getClassName(methodClazz);
        importClazzName != methodClazzName
    }

    /// Creates the effect for the imported return type [tpe].
    def mkEffect(o: Options, tpe: Type_): Effect = match o {
        case Options(opts) if opts.pureLevel >= PureLevel.PureButUnit and tpe != Type_.Unit_ => Effect.Pure_
        case Options(opts) if opts.pureLevel >= PureLevel.PureAll => Effect.Pure_
        case _ => Effect.Impure_
    }

    /// Creates a list of [n] standard parameter names (x0, x1, ..., xn)
    def mkParamNames(n: Int32): List[String] = List.range(0, n) |> List.map(i -> "x${i}")

    /// Returns true iff the function should return a Result.
    def shouldResultMethod(o: Options, m: Method): Bool = {
        let canFail = getMethodExceptionTypes(m) |> Array.isEmpty |> Bool.not;
        match (o, canFail) {
            case (Options(opts), true) if opts.resultLevel >= ResultLevel.ResultChecked => true
            case (Options(opts), _) if opts.resultLevel >= ResultLevel.ResultAll => true
            case _ => false
        }
    }

    def shouldResultConstructor(o: Options, c: Constructor): Bool = {
        let canFail = getConstructorExceptionTypes(c) |> Array.isEmpty |> Bool.not;
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
            case _ => false
        }
    }

    /// Creates the return type for the function.
    def mkOuterReturnType(doResult: { doResult = Bool }, doOption: { doOption = Bool }, importReturnType: Type_): Type_ = {
        match (doResult.doResult, doOption.doOption) {
            case (false, false) => importReturnType
            case (true, false) => Type_.Result_(Type_.Ref_("java.lang.Exception"), importReturnType)
            case (false, true) => Type_.Option_(importReturnType)
            case (true, true) => Type_.Result_(Type_.Option_(importReturnType), Type_.Ref_("java.lang.Exception"))
            case _ => unreachable!()
        }
    }

    /// Creates the arguments to be used for the internal call.
    def mkCallArgs(c: Class, m: Method): List[Arg] = {
        match getMethodContext(m) {
            case Context.Instance if isInheritedMethod(c, m) =>
                let paramNames = mkParamNames(getMethodParameterTypes(m) |> Array.length + 1);
                let tpe = getMethodDeclaringClass(m) |> visitType;
                match paramNames {
                    case hd :: tl => Arg.Cast(hd, tpe) :: List.map(Arg.NoCast, tl)
                    case Nil => unreachable!()
                }
            case Context.Instance =>
                let paramNames = mkParamNames(getMethodParameterTypes(m) |> Array.length + 1);
                List.map(Arg.NoCast, paramNames)
            case Context.Static =>
                let paramNames = mkParamNames(getMethodParameterTypes(m) |> Array.length);
                List.map(Arg.NoCast, paramNames)
        }
    }

    /// Creates the parameters for the interface to the function.
    def mkOuterParams(c: Class, m: Method, importParamTypes: List[Type_]): List[(String, Type_)] = {
        match getMethodContext(m) {
            case Context.Instance =>
                let paramNames = mkParamNames(getMethodParameterTypes(m) |> Array.length + 1);
                let paramTypes = visitType(c) :: importParamTypes;
                List.zip(paramNames, paramTypes)
            case Context.Static =>
                let paramNames = mkParamNames(getMethodParameterTypes(m) |> Array.length + 1);
                let paramTypes = importParamTypes;
                List.zip(paramNames, paramTypes)
        }
    }

    /// Transforms the Java method into a Flix function.
    pub def visitMethod(o: Options, c: Class, m: Method): Ast.Def = {
        let methodName = getMethodName(m);
        let alias_ = cleanName(methodName);

        // build the import statement
        let importClazz = getMethodDeclaringClass(m);
        let importClazzName = getClassName(importClazz);
        let importReturnType = getReturnType(m) |> visitType;
        let context = getMethodContext(m);
        let importParamTypes = unchecked_cast({ getMethodParameterTypes(m) |> Array.toList |> List.map(visitType) } as _ \ {});
        let eff = mkEffect(o, importReturnType);
        let importName = importClazzName + "." + methodName;
        let import_ = Import.Method(context, importName, importParamTypes, importReturnType, eff, alias_);

        // build the call expression
        let doResult = shouldResultMethod(o, m);
        let doOption = shouldOption(o, m);
        let args = mkCallArgs(c, m);
        let call = Call(alias_, args);
        let wrap = if (doOption) Wrap.WrapOption(call) else Wrap.NoWrap(call);
        let body = if (doResult) Body.TryCatch(wrap) else Body.NoTry(wrap);

        let impl = Impl(import_, body);

        let outerReturnType = mkOuterReturnType(doResult = doResult, doOption = doOption, importReturnType);
        let outerParams = mkOuterParams(c, m, importParamTypes);
        Def(alias_, outerParams, outerReturnType, eff, impl)
    }

    pub def visitConstructor(o: Options, c: Class, cst: Constructor): Ast.Def = {
        let alias_ = getSimpleName(c) |> constructorName;

        // build the import statement
        let importParamTypes = unchecked_cast({ getConstructorParameterTypes(cst) |> Array.toList |> List.map(visitType) } as _ \ {});
        let importReturnType = c |> visitType;
        let eff = mkEffect(o, importReturnType);
        let importName = getClassName(c);
        let import_ = Import.Constructor(importName, importParamTypes, importReturnType, eff, alias_);

        // build the call expression
        let doResult = shouldResultConstructor(o, cst);
        let paramNames = mkParamNames(List.length(importParamTypes));
        let args = paramNames |> List.map(Arg.NoCast);
        let call = Call(alias_, args);
        // a constructor will never return null, so never wrap
        let wrap = Wrap.NoWrap(call);
        let body = if (doResult) Body.TryCatch(wrap) else Body.NoTry(wrap);

        let impl = Impl(import_, body);
        let outerReturnType = mkOuterReturnType(doResult = doResult, doOption = false, importReturnType);
        let outerParams = List.zip(paramNames, importParamTypes);
        Def(alias_, outerParams, outerReturnType, eff, impl)
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
        let importClazzName = getClassName(importClazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => Nil
            case Context.Instance => visitType(c) :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let isInherited = importClazzName != getClassName(c);
        let args = match context {
            case Context.Static => List.map(Arg.NoCast, paramNames)
            case Context.Instance if isInherited => match paramNames {
                case hd :: tl => Arg.Cast(hd, visitType(importClazz)) :: List.map(Arg.NoCast, tl)
                case Nil => bug!("unexpected empty parameter list")
            }
            case Context.Instance => List.map(Arg.NoCast, paramNames)
        };
        let params = List.zip(paramNames, paramTypes);
        let funcName = getterName(name);
        let imp = Import.GetField(context, importClazzName + "." + name, fieldType, eff, funcName);
        let call = Call(funcName, args);
        let doWrap = match (o, isPrimitive(getType(f))) {
            case (Options(opts), false) if opts.optionLevel >= OptionLevel.OptionRef => true
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
        let importClazzName = getClassName(importClazz);
        let fieldType = visitType(getType(f));
        let paramTypes = match context {
            case Context.Static => fieldType :: Nil
            case Context.Instance => visitType(c) :: fieldType :: Nil
        };
        let paramNames = List.range(0, List.length(paramTypes)) |> List.map(i -> "x${i}");
        let isInherited = importClazzName != getClassName(c);
        let args = match context {
            case Context.Static => List.map(Arg.NoCast, paramNames)
            case Context.Instance if isInherited => match paramNames {
                case hd :: tl => Arg.Cast(hd, visitType(importClazz)) :: List.map(Arg.NoCast, tl)
                case Nil => bug!("unexpected empty parameter list")
            }
            case Context.Instance => List.map(Arg.NoCast, paramNames)
        };
        let params = List.zip(paramNames, paramTypes);
        let funcName = setterName(name);
        let imp = Import.SetField(context, importClazzName + "." + name, Type_.Unit_, eff, funcName);
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
            match getClassName(t) {
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
                case name => Type_.Ref_(name)
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
        (getMethodModifiers(m) `Int32.bitwiseAnd` 4096) != 0
    }

    /// Creates a valid Flix getter name from the field name.
    def getterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(start = 1, fieldName);
        "get" + "${Char.toUpperCase(head)}" + tail
    }

    /// Creates a valid Flix setter name from the field name.
    def setterName(fieldName: String): String = {
        // safe because field names are never empty
        let head = String.charAt(0, fieldName);
        let tail = String.sliceRight(start = 1, fieldName);
        "set" + "${Char.toUpperCase(head)}" + tail
    }

    /// Creates a valid Flix constructor name from the field name.
    def constructorName(className: String): String = {
        // safe because class names are never empty
        let head = String.charAt(0, className);
        let tail = String.sliceRight(start = 1, className);
        "new" + "${Char.toUpperCase(head)}" + tail
    }

    /// Cleans a name, slightly mangling it
    /// in case it conflicts with a Flix keyword.
    def cleanName(name: String): String = {
        if (Set.memberOf(name, flixKeywords())) {
            name + "_"
        } else {
            name
        }
    }

    // Returns a string idenitifying the type,
    // suitable for use in an identifier.
    def typeToIdentifierString(t: Type_): String = match t {
        case Type_.Int8_ => "Int8"
        case Type_.Int16_ => "Int16"
        case Type_.Int32_ => "Int32"
        case Type_.Int64_ => "Int64"
        case Type_.Float32_ => "Float32"
        case Type_.Float64_ => "Float64"
        case Type_.Bool_ => "Bool"
        case Type_.Char_ => "Char"
        case Type_.String_ => "String"
        case Type_.BigInt_ => "BigInt"
        case Type_.Array_(_) => "Array"

        // print nothing for unit
        case Type_.Unit_ => ""

        // take the simple name for Java types
        case Type_.Ref_(clazz) =>
            let (_, name) = String.breakOnRight(substr = ".", clazz);
            name

        // Flix types should never occur
        case Type_.Result_(_, _) => "Result"
        case Type_.Option_(_) => "Option"
    }

    def flixKeywords(): Set[String] = Set#{
        "!=", "$DEFAULT$", "&&&", "*", "**", "+", "-", "..", "/", ":", "::", ":::", ":=", "<", "<+>", "<-", "<<<", "<=",
        "<=>", "==", "=>", ">", ">=", ">>>", "???", "@", "Absent", "Bool", "Impure", "Nil", "Predicate", "Present", "Pure",
        "RecordRow", "SchemaRow", "Type", "^^^", "alias", "case", "catch", "chan",
        "class", "def", "deref", "else", "enum", "false", "fix", "force", "if", "import",
        "inline", "instance", "into", "lat", "law", "lawless", "lazy", "let", "let*", "match", "mut", "namespace",
        "null", "opaque", "override", "pub", "ref", "reify", "reifyBool",
        "reifyEff", "reifyType", "rel", "rigid", "scoped", "sealed", "set", "spawn",
        "static", "true", "type", "unlawful", "use", "where", "with", "|||", "~~~"
    }
}