namespace TestTransform {
    
    use Ast.Type_;
    use Ast.Def;
    use Ast.Def.Def;
    use Ast.Context;
    use Ast.Impl;
    use Ast.Impl.Impl;

    use Transform.visitClass;
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
    def testVisitMethod01(): Bool = {
        import static java.lang.Class.forName(String): & Pure;
        import java.lang.Class.getMethod(String, Array[Class]): & Pure;
        let string = forName("java.lang.String");
        let method = getMethod(string, "concat", [string] as & Pure);
        let impl = Impl(Context.Instance, "java.lang.String", "concat", Type_.String_ :: Nil, "x0" :: "x1" :: Nil);
        visitMethod(method) == Def("concat", ("x0", Type_.String_) :: ("x1", Type_.String_) :: Nil, Type_.String_, impl)
    }
}