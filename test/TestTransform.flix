namespace TestTransform {
    
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

    use Options.Options.Options;
    use Options.Options;
    use Options.PureLevel;
    use Options.ResultLevel;
    use Options.defaultOptions;

    use Transform.visitClass;
    use Transform.visitField;
    use Transform.visitMethod;
    use Transform.visitType;

    type alias Class = ##java.lang.Class
    type alias Method = ##java.lang.reflect.Method

    @test
    def testVisitType(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        let tpe = forName("java.lang.String");
        visitType(tpe) == Type_.String_
    }

    @test
    def testVisitTypeArray(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.arrayType(): & Pure;
        let tpe = forName("java.lang.StringBuilder") |> arrayType;
        visitType(tpe) == Type_.Array_(Type_.Ref("java.lang.StringBuilder"))
    }

    @test
    def testVisitMethod(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getMethod(String, Array[Class]): & Pure;
        let string = forName("java.lang.String");
        let method = getMethod(string, "concat", [string] as & Pure);
        let imp = Import.Method(Context.Instance, "java.lang.String.concat", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("concat", "x0" :: "x1" :: Nil);
        let body = Body.NoTry(call);
        let impl = Impl(imp, body);
        visitMethod(defaultOptions(), method) == Def("concat", ("x0", Type_.String_) :: ("x1", Type_.String_) :: Nil, Type_.String_, Effect.Impure_, impl)
    }

    @test
    def testVisitMethodException(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getMethod(String, Array[Class]): & Pure;
        let clazz = forName("java.lang.Class");
        let string = forName("java.lang.String");
        let method = getMethod(clazz, "forName", [string] as & Pure);
        let imp = Import.Method(Context.Static, "java.lang.Class.forName", Type_.String_ :: Nil, Effect.Impure_);
        let call = Call("forName", "x0" :: Nil);
        let body = Body.TryCatch(call);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ resultLevel = ResultLevel.ResultChecked | opts });
        visitMethod(o, method) == Def("forName", ("x0", Type_.String_) :: Nil, Type_.Result_(Type_.Ref("java.lang.Class"), Type_.Ref("java.lang.Exception")), Effect.Impure_, impl)
    }

    @test
    def testVisitField(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getField(String): & Pure;
        let string = forName("java.lang.String");
        let field = getField(string, "CASE_INSENSITIVE_ORDER");
        let imp = Import.GetField(Context.Static, "java.lang.String.CASE_INSENSITIVE_ORDER", Effect.Impure_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let body = Body.NoTry(call);
        let impl = Impl(imp, body);
        visitField(defaultOptions(), field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref("java.util.Comparator"), Effect.Impure_, impl) :: Nil
    }

    @test
    def testVisitFieldPure(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getField(String): & Pure;
        let string = forName("java.lang.String");
        let field = getField(string, "CASE_INSENSITIVE_ORDER");
        let imp = Import.GetField(Context.Static, "java.lang.String.CASE_INSENSITIVE_ORDER", Effect.Pure_, "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let body = Body.NoTry(call);
        let impl = Impl(imp, body);
        let Options(opts) = defaultOptions();
        let o = Options({ pureLevel = PureLevel.PureFinal | opts });
        visitField(o, field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref("java.util.Comparator"), Effect.Pure_, impl) :: Nil
    }

    @test
    def testVisitClassSetNamespace(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        let clazz = forName("java.lang.String");
        let Options(opts) = defaultOptions();
        let o = Options({ namespace_ = Some("MyString") | opts });
        let Namespace(name, _) = visitClass(o, clazz);
        name == "MyString"
    }

    @test
    def testVisitClassIgnoreInherited(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        let clazz = forName("java.lang.String");
        let Namespace(_, defs) = visitClass(defaultOptions(), clazz);
        List.count(match Def(name, _, _, _, _) -> name == "wait", defs) == 0
    }
}