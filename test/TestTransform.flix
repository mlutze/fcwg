mod TestTransform {
    
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
    use Options.defaultOptions

    use Result.flatMap

    use Transform.visitClass
    use Transform.visitField
    use Transform.visitMethod
    use Transform.visitType

    use Wrapped.Class.arrayType
    use Wrapped.Class.forNameString
    use Wrapped.Class.getField
    use Wrapped.Class.getMethod

    type alias Class = ##java.lang.Class
    type alias Method = ##java.lang.reflect.Method

    def mkArgs(args: List[String]): List[Arg] = List.map(Arg.NoCast, args)

    def unsafeGet(r: Result[_, a]): a = {
        match r {
            case Ok(x) => x
            case Err(_) => bug!("unexpected error")
        }
    }

    @test
    def testVisitType(): Bool = {
        let tpe = forNameString("java.lang.String") |> unsafeGet;
        visitType(tpe) == Type_.String_
    }

    @test
    def testVisitTypeArray(): Bool = {
        let tpe = forNameString("java.lang.StringBuilder") |> unsafeGet |> arrayType;
        visitType(tpe) == Type_.Array_(Type_.Ref_("java.lang.StringBuilder"))
    }

    @test
    def testVisitMethod(): Bool = {
        let string = forNameString("java.lang.String") |> unsafeGet;
        let method = getMethod(string, "concat", unchecked_cast(Array#{string} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.String.concat", Type_.String_ :: Nil, Type_.String_, Effect.IO_, "concat");
        let call = Call("concat", mkArgs("x0" :: "x1" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitMethod(defaultOptions(), string, method) == Def("concat", ("x0", Type_.String_) :: ("x1", Type_.String_) :: Nil, Type_.String_, Effect.IO_, impl)
    }

    @test
    def testVisitMethodExceptionNoResult(): Bool = {
        let clazz = forNameString("java.lang.Class") |> unsafeGet;
        let string = forNameString("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", unchecked_cast(Array#{string} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Static_, "java.lang.Class.forName", Type_.String_ :: Nil, Type_.Ref_("java.lang.Class"), Effect.IO_, "forName");
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitMethod(defaultOptions(), string, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Ref_("java.lang.Class"), Effect.IO_, impl)
    }

    @test
    def testVisitMethodException(): Bool = {
        let clazz = forNameString("java.lang.Class") |> unsafeGet;
        let string = forNameString("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", unchecked_cast(Array#{string} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Static_, "java.lang.Class.forName", Type_.String_ :: Nil, Type_.Ref_("java.lang.Class"), Effect.IO_, "forName");
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.TryCatch(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ resultLevel = ResultLevel.ResultChecked | opts });
        visitMethod(o, clazz, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Result_(Type_.Ref_("java.lang.Exception"), Type_.Ref_("java.lang.Class")), Effect.IO_, impl)
    }

    @test
    def testVisitMethodOptionResult(): Bool = {
        let clazz = forNameString("java.lang.Class") |> unsafeGet;
        let string = forNameString("java.lang.String") |> unsafeGet;
        let method = getMethod(clazz, "forName", unchecked_cast(Array#{string} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Static_, "java.lang.Class.forName", Type_.String_ :: Nil, Type_.Ref_("java.lang.Class"), Effect.IO_, "forName");
        let call = Call("forName", mkArgs("x0" :: Nil));
        let wrap = Wrap.WrapOption(call);
        let body = Body.TryCatch(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ resultLevel = ResultLevel.ResultChecked, optionLevel = OptionLevel.OptionRef | opts });
        visitMethod(o, clazz, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Result_(Type_.Option_(Type_.Ref_("java.lang.Class")), Type_.Ref_("java.lang.Exception")), Effect.IO_, impl)
    }

    @test
    def testVisitMethodUnit(): Bool = {
        let throwable = forNameString("java.lang.Throwable") |> unsafeGet;
        let method = getMethod(throwable, "printStackTrace", unchecked_cast(Array#{} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.Throwable.printStackTrace", Nil, Type_.Unit_, Effect.IO_, "printStackTrace");
        let call = Call("printStackTrace", mkArgs("x0" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        let Options(default) = defaultOptions();
        let o = Options({ pureLevel = PureLevel.PureButUnit | default });
        visitMethod(o, throwable, method) == Def("printStackTrace", ("x0", Type_.Ref_("java.lang.Throwable")) :: Nil, Type_.Unit_, Effect.IO_, impl)
    }

    @test
    def testVisitField(): Bool = {
        let string = forNameString("java.lang.String") |> unsafeGet;
        let field = getField(string, "CASE_INSENSITIVE_ORDER") |> unsafeGet;
        let imp = Import.GetField(Context.Static_, "java.lang.String.CASE_INSENSITIVE_ORDER", Type_.Ref_("java.util.Comparator"), Effect.IO_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        visitField(defaultOptions(), string, field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref_("java.util.Comparator"), Effect.IO_, impl) :: Nil
    }

    @test
    def testVisitFieldPure(): Bool = {
        let string = forNameString("java.lang.String") |> unsafeGet;
        let field = getField(string, "CASE_INSENSITIVE_ORDER") |> unsafeGet;
        let imp = Import.GetField(Context.Static_, "java.lang.String.CASE_INSENSITIVE_ORDER", Type_.Ref_("java.util.Comparator"), Effect.Pure_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ pureLevel = PureLevel.PureFinal | opts });
        visitField(o, string, field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref_("java.util.Comparator"), Effect.Pure_, impl) :: Nil
    }

    @test
    def testVisitClassSetNamespace(): Bool = {
        let clazz = forNameString("java.lang.String") |> unsafeGet;
        let Options(opts) = defaultOptions();
        let o = Options({ namespace_ = Some("MyString") | opts });
        {
            for (
                Namespace(name, _) <- visitClass(o, clazz)
            ) yield {
                name == "MyString"
            }
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitClassIgnoreInherited(): Bool = {
        let clazz = forNameString("java.lang.String") |> unsafeGet;
        {
            for (
                Namespace(_, defs) <- visitClass(defaultOptions(), clazz)
            ) yield {
                List.count(match Def(name, _, _, _, _) -> name == "wait", defs) == 0
            }
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitClassIncludeInherited(): Bool = {
        let clazz = forNameString("java.lang.Exception") |> unsafeGet;
        let Options(default) = defaultOptions();
        let opts = Options({ superLevel = SuperLevel.SuperButObject | default });
        {
            for (
                Namespace(_, defs) <- visitClass(opts, clazz)
            ) yield {
                List.count(match Def(name, _, _, _, _) -> name == "getMessage", defs) > 0
            }
        } |> Result.getWithDefault(false)
    }

    @test
    def testVisitMethodCastInherited(): Bool = {
        let throwable = forNameString("java.lang.Throwable") |> unsafeGet;
        let exception = forNameString("java.lang.Exception") |> unsafeGet;
        let method = getMethod(throwable, "getMessage", unchecked_cast(Array#{} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.Throwable.getMessage", Nil, Type_.String_, Effect.IO_, "getMessage");
        let call = Call("getMessage", Arg.Cast("x0", Type_.Ref_("java.lang.Throwable")) :: Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);

        let Options(default) = defaultOptions();
        let opts = Options({ superLevel = SuperLevel.SuperButObject | default });

        visitMethod(opts, exception, method) == Def("getMessage", ("x0", Type_.Ref_("java.lang.Exception")) :: Nil, Type_.String_, Effect.IO_, impl) 
    }

    @test
    def testVisitMethodAvoidKeywords(): Bool = {
        let field = forNameString("java.lang.reflect.Field") |> unsafeGet;
        let object = forNameString("java.lang.Object") |> unsafeGet;
        let method = getMethod(field, "set", unchecked_cast(Array#{object, object} @ Static as _ \ {})) |> unsafeGet;
        let imp = Import.Method(Context.Instance, "java.lang.reflect.Field.set", Type_.Ref_("java.lang.Object") :: Type_.Ref_("java.lang.Object") :: Nil, Type_.Unit_, Effect.IO_, "set_");
        let call = Call("set_", mkArgs("x0" :: "x1" :: "x2" :: Nil));
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);

        visitMethod(defaultOptions(), field, method) == 
            Def(
                "set_",
                ("x0", Type_.Ref_("java.lang.reflect.Field")) :: ("x1", Type_.Ref_("java.lang.Object")) :: ("x2", Type_.Ref_("java.lang.Object")) :: Nil,
                Type_.Unit_,
                Effect.IO_,
                impl
            )
    }

    @test
    def testReturnNestedClass(): Bool = {
        let character = forNameString("java.lang.Character$UnicodeBlock") |> unsafeGet;
        let field = getField(character, "CUNEIFORM") |> unsafeGet;
        let imp = Import.GetField(Context.Static_, "java.lang.Character$UnicodeBlock.CUNEIFORM", Type_.Ref_("java.lang.Character$UnicodeBlock"), Effect.IO_, "getCUNEIFORM");
        let call = Call("getCUNEIFORM", Nil);
        let wrap = Wrap.NoWrap(call);
        let body = Body.NoTry(wrap);
        let impl = Impl(imp, body);

        visitField(defaultOptions(), character, field) == Def("getCUNEIFORM", Nil, Type_.Ref_("java.lang.Character$UnicodeBlock"), Effect.IO_, impl) :: Nil
    }
}
