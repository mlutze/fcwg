use Options.parse;
use Transform.visitClass;

// The main entry point.
def main(args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    match parse(args) {
        case Go(clazz, opts) =>
            let ns = visitClass(forName(clazz));
            println(ns);
            0
        case _ =>
            println("Unsupported operation.");
            1
    }
}

