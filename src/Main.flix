use Transform.visitClass;

// The main entry point.
def main(_args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    let ns = visitClass(forName("java.lang.Class"));
    println(ns);
    0
