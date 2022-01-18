use Options.Command;
use Options.parse;
use Transform.visitClass;
use Version.version;

// The main entry point.
def main(args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    match parse(args) {
        case Success(Command.Go(clazz, _)) =>
            let ns = visitClass(forName(clazz));
            println(ns);
            0
        case Success(Command.GetVersion) =>
            println(version());
            0
        case Success(_) =>
            println("Unsupported operation.");
            1
        case Failure(_) =>
            println("Failure parsing command line arguments.");
            2
    }
