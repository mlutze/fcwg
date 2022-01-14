namespace Ast {
    // Def(name, params, type, impl)
    pub opaque type Def = (String, List[(String, Type_)], Type_, Impl)

    // Impl(context, class, method, types, args)
    pub opaque type Impl = (Context, String, String, List[Type_], List[String])

    // Namespace(name, defs)
    pub opaque type Namespace = (String, List[Def])

    pub enum Type_ {
        case Int8_
        case Int16_
        case Int32_
        case Int64_
        case Float32_
        case Float64_
        case Bool_
        case Char_
        case String_
        case BigInt_
        case Unit_
        case Ref(String)
    }

    pub enum Context {
        case Static
        case Instance
    }

    instance ToString[Namespace] {
    
        pub def toString(x: Namespace): String =
            let Namespace(name, defs) = x;
            let contents = defs
                |> List.map(ToString.toString)
                |> String.intercalate("\n\n")
                |> String.indent(4);
            "namespace ${name} {\n" +
            "${contents}" +
            "}"
    
    }
    


    instance ToString[Def] {
        pub def toString(d: Def): String =
            let Def(name, params, tpe, impl) = d;
            let paramString = params |> List.map(match (n, t) -> "${n}: ${t}") |> String.intercalate(", ");
            "pub def ${name}(${paramString}): ${tpe} & Impure = {\n" +
            "${impl}" |> String.indent(4) +
            "}\n"
    }

    instance ToString[Impl] {
        pub def toString(x: Impl): String = let
            Impl(context, clazz, method, tpes, args) = x;
            let tpeString = tpes |> List.map(ToString.toString) |> String.intercalate(", ");
            let argString = args |> String.intercalate(", ");
            let mod = match context {
                case Static => "static " // extra space for formatting
                case Instance => ""
            };
            "import ${mod}${clazz}.${method}(${tpeString});\n" +
            "${method}(${argString})\n"
    }

    instance ToString[Type_] {
        pub def toString(x: Type_): String = match x {
            case Int8_ => "Int8"
            case Int16_ => "Int16"
            case Int32_ => "Int32"
            case Int64_ => "Int64"
            case Float32_ => "Float32"
            case Float64_ => "Float64"
            case Bool_ => "Bool"
            case Char_ => "Char"
            case String_ => "String"
            case BigInt_ => "BigInt"
            case Unit_ => "Unit"
            case Ref(name) => "##${name}"
        }
    }
    
    
}