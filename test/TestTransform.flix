namespace TestTransform {
    
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

    use Transform.visitClass;
    use Transform.visitField;
    use Transform.visitMethod;
    use Transform.visitType;

    type alias Class = ##java.lang.Class
    type alias Method = ##java.lang.reflect.Method

    @test
    def testVisitType01(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        let tpe = forName("java.lang.String");
        visitType(tpe) == Type_.String_
    }

    @test
    def testVisitType02(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.arrayType(): & Pure;
        let tpe = forName("java.lang.StringBuilder") |> arrayType;
        visitType(tpe) == Type_.Array_(Type_.Ref("java.lang.StringBuilder"))
    }

    @test
    def testVisitMethod01(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getMethod(String, Array[Class]): & Pure;
        let string = forName("java.lang.String");
        let method = getMethod(string, "concat", [string] as & Pure);
        let imp = Import.Method(Context.Instance, "java.lang.String.concat", Type_.String_ :: Nil);
        let call = Call("concat", "x0" :: "x1" :: Nil);
        let impl = Impl(imp, call);
        visitMethod(method) == Def("concat", ("x0", Type_.String_) :: ("x1", Type_.String_) :: Nil, Type_.String_, impl)
    }

    @test
    def testVisitField01(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getField(String): & Pure;
        let string = forName("java.lang.String");
        let field = getField(string, "CASE_INSENSITIVE_ORDER");
        let imp = Import.GetField(Context.Static, "java.lang.String.CASE_INSENSITIVE_ORDER", "getCASE_INSENSITIVE_ORDER");
        let call = Call("getCASE_INSENSITIVE_ORDER", Nil);
        let impl = Impl(imp, call);
        visitField(field) == Def("getCASE_INSENSITIVE_ORDER", Nil, Type_.Ref("java.util.Comparator"), impl) :: Nil
    }

    @test
    def testVisitClassIgnoreInherited(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        let clazz = forName("java.lang.String");
        let Namespace(_, defs) = visitClass(clazz);
        List.count(match Def(name, _, _, _) -> name == "wait", defs) == 0
    }
}