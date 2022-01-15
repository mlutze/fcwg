namespace Ast {
    // Def(name, params, type, impl)
    pub opaque type Def with Eq = (String, List[(String, Type_)], Type_, Impl)

    // Impl(context, class, method, types, args)
    pub opaque type Impl with Eq = (Import, Call)

    pub enum Import with Eq {
        // Method(context, name, params)
        case Method(Context, String, List[Type_])

        // GetField(context, field, alias)
        case GetField(Context, String, String)

        // SetField(context, field, alias)
        case SetField(Context, String, String)
    }

    // Call(name, params)
    pub opaque type Call with Eq = (String, List[String])

    // Namespace(name, defs)
    pub opaque type Namespace with Eq = (String, List[Def])

    pub enum Type_ with Eq {
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
        case Array_(Type_)
    }

    pub enum Context with Eq {
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
        pub def toString(x: Impl): String =
            let Impl(imp, call) = x;
            "${imp}${call}"
    }

    instance ToString[Import] {
        pub def toString(x: Import): String = match x {
            case Method(context, name, params) =>
                let mod = match context {
                    case Static => "static " // extra space for formatting
                    case Instance => ""
                };
                let paramString = params |> List.map(ToString.toString) |> String.intercalate(", ");
                "import ${context}${name}(${paramString});\n"
            case GetField(_, _, _) => ???
            case SetField(_, _, _) => ???
        }
    }

    instance ToString[Call] {
        pub def toString(x: Call): String =
            let Call(name, params) = x;
            let paramString = params |> String.intercalate(", ");
            "${name}(${paramString})"
    }
    

    instance ToString[Context] {
        pub def toString(x: Context): String = match x {
            case Static => "static " // kind of hacky to put this in an instance
            case Instance => ""
        }
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
            case Array_(ct) => "Array[${ct}]"
        }
    }
}