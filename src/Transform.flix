namespace Transform {

    use Ast.Call.Call;
    use Ast.Call;
    use Ast.Context;
    use Ast.Def.Def;
    use Ast.Def;
    use Ast.Impl.Impl;
    use Ast.Impl;
    use Ast.Import;
    use Ast.Namespace.Namespace;
    use Ast.Namespace;
    use Ast.Type_;

    type alias Class = ##java.lang.Class
    type alias Method = ##java.lang.reflect.Method

    pub def visitClass(c: Class): Namespace = {
        import java.lang.Class.getMethods(): & Pure;
        import java.lang.Class.getSimpleName(): & Pure;
        let defs = { getMethods(c) |> Array.toList |> List.map(visitMethod) } as & Pure;
        Namespace(getSimpleName(c), defs)
    }

    pub def visitMethod(m: Method): Ast.Def = {
        import java.lang.reflect.Method.getName(): & Pure;
        import java.lang.reflect.Method.getParameterTypes(): & Pure;
        import java.lang.reflect.Method.getReturnType(): & Pure;
        import java.lang.reflect.Method.getDeclaringClass(): & Pure;
        import java.lang.Class.getCanonicalName(): & Pure;
        let name = getName(m);
        let return = getReturnType(m) |> visitType;
        let clazz = getDeclaringClass(m);
        let clazzName = getCanonicalName(clazz);
        let context = if (isStatic(m)) Context.Static else Context.Instance;
        let importParamTypes = { getParameterTypes(m) |> Array.toList |> List.map(visitType) } as & Pure;
        let outerParamTypes = match context {
            case Context.Static => importParamTypes
            case Context.Instance => visitType(clazz) :: importParamTypes
        };
        let paramNames = List.range(0, List.length(outerParamTypes)) |> List.map(i -> "x${i}");
        let params = List.zip(paramNames, outerParamTypes);
        let imp = Import.Method(context, clazzName + "." + name, importParamTypes);
        let call = Call(name, paramNames);
        let impl = Impl(imp, call);
        Def(name, params, return, impl)
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

    def isStatic(m: Method): Bool = {
        import java.lang.reflect.Method.getModifiers(): & Pure;
        import static java.lang.reflect.Modifier.isStatic(Int): & Pure;
        getModifiers(m) |> isStatic
    }
}