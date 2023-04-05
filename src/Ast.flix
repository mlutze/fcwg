mod Ast {
    use Arg.{Cast, NoCast}
    use Body.{NoTry, TryCatch}
    use Call.Call
    use Def.Def;
    use Effect.{Pure_, Impure_}
    use Impl.Impl;
    use Import.{Constructor, Method, GetField, SetField}
    use Namespace.Namespace;
    use Type_.{Int8_, Int16_, Int32_, Int64_, Float32_, Float64_, Bool_, Char_, String_, BigInt_, Unit_, Ref_, Array_, Result_, Option_}
    use Wrap.{NoWrap, WrapOption}
    use Context.{Instance, Static}

    ///  Def(name, params, return type, effect, impl)
    pub enum Def(String, List[(String, Type_)], Type_, Effect, Impl) with Eq, Order

    pub enum Impl(Import, Body) with Eq, Order 

    pub enum Import with Eq, Order {

        // Constructor(name, params, return, effect, alias)
        case Constructor(String, List[Type_], Type_, Effect, String)

        // Method(context, name, params, return, effect, alias)
        case Method(Context, String, List[Type_], Type_, Effect, String)

        // GetField(context, field, return, effect, alias)
        case GetField(Context, String, Type_, Effect, String)

        // SetField(context, field, return, effect, alias)
        case SetField(Context, String, Type_, Effect, String)
    }

    pub enum Body with Eq, Order {
        case TryCatch(Wrap)
        case NoTry(Wrap)
    }

    pub enum Wrap with Eq, Order {
        case WrapOption(Call)
        case NoWrap(Call)
    }

    pub enum Arg with Eq, Order {
        case Cast(String, Type_)
        case NoCast(String)
    }

    // Call(name, params)
    pub enum Call(String, List[Arg]) with Eq, Order

    // Namespace(name, defs)
    pub enum Namespace(String, List[Def]) with Eq, Order

    pub enum Type_ with Eq, Order {
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
        case Ref_(String)
        case Array_(Type_)
        case Result_(Type_, Type_)
        case Option_(Type_)
    }

    pub enum Context with Eq, Order {
        case Static
        case Instance
    }

    pub enum Effect with Eq, Order {
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
            "mod ${name} {\n" +
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
            case Constructor(name, params, return, eff, alias_) =>
                let paramString = params |> List.map(ToString.toString) |> String.intercalate(", ");
                "import new ${name}(${paramString}): ${return} & ${eff} as ${alias_};\n"
            case Method(context, name, params, return, eff, alias_) =>
                let paramString = params |> List.map(ToString.toString) |> String.intercalate(", ");
                "import ${context}${name}(${paramString}): ${return} & ${eff} as ${alias_};\n"
            case GetField(context, name, return, eff, func) =>
                "import ${context} get ${name}: ${return} & ${eff} as ${func};\n"
            case SetField(context, name, return, eff, func) =>
                "import ${context} set ${name}: ${return} & ${eff} as ${func};\n"
        }
    }

    instance ToString[Wrap] {
        pub def toString(x: Wrap): String = match x {
            case NoWrap(call) => "${call}"
            case WrapOption(call) => "Object.toOption(${call})"
        }
    }

    instance ToString[Arg] {
        pub def toString(x: Arg): String = match x {
            case Cast(name, tpe) => "unchecked_cast(${name} as ${tpe})"
            case NoCast(name) => "${name}"
        }
    }
    

    instance ToString[Call] {
        pub def toString(x: Call): String =
            let Call(name, params) = x;
            let paramString = params |> List.map(ToString.toString) |> String.intercalate(", ");
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
            case Ref_(name) => "##${name}"
            case Array_(ct) => "Array[${ct}, Static]" // TODO use regions properly
            case Result_(t, e) => "Result[${t}, ${e}]"
            case Option_(t) => "Option[${t}]"
        }
    }
}