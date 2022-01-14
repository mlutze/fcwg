use Transform.visitClass;

// The main entry point.
def main(_args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    println(visitClass(forName("java.lang.String")));
    0
