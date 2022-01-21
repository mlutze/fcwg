namespace TestTransform {
    
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
    use Options.defaultOptions;

    use Result.flatMap;

    use Transform.visitClass;
    use Transform.visitField;
    use Transform.visitMethod;
    use Transform.visitType;

    use Wrapped/Class.arrayType;
    use Wrapped/Class.forName;
    use Wrapped/Class.getField;
    use Wrapped/Class.getMethod;

    type alias Class = ##java.lang.Class
    type alias Method = ##java.lang.reflect.Method

    def mkArgs(args: List[String]): List[Arg] = List.map(Arg.NoCast, args)

    def unsafeGet(r: Result[a, _]): a = {
        match r {
            case Ok(x) => x
            case Err(_) => bug!("unexpected error")
        }
    }

    @test
    def testVisitType(): Bool = {
        let tpe = forName("java.lang.String") |> unsafeGet;
        visitType(tpe) == Type_.String_
    }

    @test
    def testVisitTypeArray(): Bool = {
        let tpe = forName("java.lang.StringBuilder") |> unsafeGet |> arrayType;
        visitType(tpe) == Type_.Array_(Type_.Ref("java.lang.StringBuilder"))
    }

    @test
    def testVisitMethod(): Bool = {
        let string = forName("java.lang.String") |> unsafeGet;
        let method = getMethod(string, "concat", [string] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.String.concat", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("concat", mkArgs("x0" :: "x1" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitMethod(defaultOptions(), string, method) == Def("concat", ("x0", Type_.String_) :: ("x1", Type_.String_) :: Nil, Type_.String_, Effect.Impure_, impl)
    }

    @test
    def testVisitMethodExceptionNoResult(): Bool = {
        let clazz = forName("java.lang.Class") |> unsafeGet;
        let string = forName("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", [string] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Static, "java.lang.Class.forName", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitMethod(defaultOptions(), string, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Ref("java.lang.Class"), Effect.Impure_, impl)
    }

    @test
    def testVisitMethodException(): Bool = {
        let clazz = forName("java.lang.Class") |> unsafeGet;
        let string = forName("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", [string] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Static, "java.lang.Class.forName", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.TryCatch(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ resultLevel = ResultLevel.ResultChecked | opts });
        visitMethod(o, clazz, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Result_(Type_.Ref("java.lang.Class"), Type_.Ref("java.lang.Exception")), Effect.Impure_, impl)
    }

    @test
    def testVisitMethodOptionResult(): Bool = {
        let clazz = forName("java.lang.Class") |> unsafeGet;
        let string = forName("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", [string] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Static, "java.lang.Class.forName", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.WrapOption(call);
        let body = Body.TryCatch(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ resultLevel = ResultLevel.ResultChecked, optionLevel = OptionLevel.OptionRef | opts });
        visitMethod(o, clazz, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Result_(Type_.Option_(Type_.Ref("java.lang.Class")), Type_.Ref("java.lang.Exception")), Effect.Impure_, impl)
    }

    @test
    def testVisitMethodUnit(): Bool = {
        let throwable = forName("java.lang.Throwable") |> unsafeGet;
        let method = getMethod(throwable, "printStackTrace", [] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.Throwable.printStackTrace", Nil, Effect.Impure_);
        let call = Call("printStackTrace", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        let Options(default) = defaultOptions();
        let o = Options({ pureLevel = PureLevel.PureButUnit | default });
        visitMethod(o, throwable, method) == Def("printStackTrace", ("x0", Type_.Ref("java.lang.Throwable")) :: Nil, Type_.Unit_, Effect.Impure_, impl)
    }

    @test
    def testVisitField(): Bool = {
        let string = forName("java.lang.String") |> unsafeGet;
        let field = getField(string, "CASE_INSENSITIVE_ORDER") |> unsafeGet;
        let imp = Import.GetField(Context.Static, "java.lang.String.CASE_INSENSITIVE_ORDER", Effect.Impure_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitField(defaultOptions(), string, field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref("java.util.Comparator"), Effect.Impure_, impl) :: Nil
    }

    @test
    def testVisitFieldPure(): Bool = {
        let string = forName("java.lang.String") |> unsafeGet;
        let field = getField(string, "CASE_INSENSITIVE_ORDER") |> unsafeGet;
        let imp = Import.GetField(Context.Static, "java.lang.String.CASE_INSENSITIVE_ORDER", Effect.Pure_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ pureLevel = PureLevel.PureFinal | opts });
        visitField(o, string, field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref("java.util.Comparator"), Effect.Pure_, impl) :: Nil
    }

    @test
    def testVisitClassSetNamespace(): Bool = {
        let clazz = forName("java.lang.String") |> unsafeGet;
        let Options(opts) = defaultOptions();
        let o = Options({ namespace_ = Some("MyString") | opts });
        {
            let* Namespace(name, _) = visitClass(o, clazz);
            Ok(name == "MyString")
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitClassIgnoreInherited(): Bool = {
        let clazz = forName("java.lang.String") |> unsafeGet;
        {
            let* Namespace(_, defs) = visitClass(defaultOptions(), clazz);
            Ok(List.count(match Def(name, _, _, _, _) -> name == "wait", defs) == 0)
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitClassIncludeInherited(): Bool = {
        let clazz = forName("java.lang.Exception") |> unsafeGet;
        let Options(default) = defaultOptions();
        let opts = Options({ superLevel = SuperLevel.SuperButObject | default });
        {
            let* Namespace(_, defs) = visitClass(opts, clazz);
            Ok(List.count(match Def(name, _, _, _, _) -> name == "getMessage", defs) > 0)
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitMethodCastInherited(): Bool = {
        let throwable = forName("java.lang.Throwable") |> unsafeGet;
        let exception = forName("java.lang.Exception") |> unsafeGet;
        let method = getMethod(throwable, "getMessage", [] as & Pure) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.Throwable.getMessage", Nil, Effect.Impure_);
        let call = Call("getMessage", Arg.Cast("x0", Type_.Ref("java.lang.Throwable")) :: Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);

        let Options(default) = defaultOptions();
        let opts = Options({ superLevel = SuperLevel.SuperButObject | default });

        visitMethod(opts, exception, method) == Def("getMessage", ("x0", Type_.Ref("java.lang.Exception")) :: Nil, Type_.String_, Effect.Impure_, impl) 
    }
}