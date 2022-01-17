use Transform.visitClass;

// The main entry point.
def main(args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    if (Array.length(args) != 1) {
        System/StdErr.println("Specify exactly 1 fully-qualified class.");
        1
    } else {
        try {
            let ns = visitClass(forName(Array.get(0, args)));
            println(ns);
            0
        } catch {
            case _: ##java.lang.Exception => { 
                System/StdErr.println("Cannot load class " + Array.get(0, args));
                1 
            }
        }
    }

