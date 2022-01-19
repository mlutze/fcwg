namespace Ast {
    // Def(name, params, type, impl)
    pub opaque type Def with Eq = (String, List[(String, Type_)], Type_, Effect, Impl)

    pub opaque type Impl with Eq = (Import, Body)

    pub enum Import with Eq {
        // Method(context, name, params)
        case Method(Context, String, List[Type_], Effect)

        // GetField(context, field, alias)
        case GetField(Context, String, Effect, String)

        // SetField(context, field, alias)
        case SetField(Context, String, Effect, String)
    }

    pub enum Body with Eq {
        case TryCatch(Wrap)
        case NoTry(Wrap)
    }

    pub enum Wrap with Eq {
        case WrapOption(Call)
        case NoWrap(Call)
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
        case Result_(Type_, Type_)
    }

    pub enum Context with Eq {
        case Static
        case Instance
    }

    pub enum Effect with Eq {
        case Pure_
        case Impure_
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
            let Def(name, params, tpe, eff, impl) = d;
            let paramString = params |> List.map(match (n, t) -> "${n}: ${t}") |> String.intercalate(", ");
            "pub def ${name}(${paramString}): ${tpe} & ${eff} = {\n" +
            "${impl}" |> String.indent(4) +
            "}\n"
    }

    instance ToString[Effect] {
        pub def toString(x: Effect): String = match x {
            case Pure_ => "Pure"
            case Impure_ => "Impure"
        }
    }
    

    instance ToString[Impl] {
        pub def toString(x: Impl): String =
            let Impl(imp, call) = x;
            "${imp}${call}"
    }

    instance ToString[Body] {
        pub def toString(x: Body): String = match x {
            case NoTry(call) => "${call}"
            case TryCatch(call) =>
                "try {\n" +
                "    Ok(${call})\n" +
                "} catch {\n" +
                "    case e: ##java.lang.Exception => Err(e)\n" +
                "}"

        }
    }

    instance ToString[Import] {
        pub def toString(x: Import): String = match x {
            case Method(context, name, params, eff) =>
                let paramString = params |> List.map(ToString.toString) |> String.intercalate(", ");
                "import ${context}${name}(${paramString}): & ${eff};\n"
            case GetField(context, name, eff, func) =>
                "import ${context} get ${name}: & ${eff} as ${func};\n"
            case SetField(context, name, eff, func) =>
                "import ${context} set ${name}: & ${eff} as ${func};\n"
        }
    }

    instance ToString[Wrap] {
    
        pub def toString(x: Wrap): String = match x {
            case NoWrap(call) => "${call}"
            case WrapOption(call) => "Object.toOption(${call})"
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
            case Result_(t, e) => "Result[${t}, ${e}]"
        }
    }
}