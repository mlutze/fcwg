use Options.Command;
use Options.parse;
use Options.usage;
use Transform.visitClass;
use Version.version;

// The main entry point.
def main(args: Array[String]): Int32 & Impure =
    import static java.lang.Class.forName(String): & Pure;
    match parse(args) {
        case Success(Command.Go(clazz, options)) =>
            let ns = visitClass(options, forName(clazz));
            println(ns);
            0
        case Success(Command.GetVersion) =>
            println(version());
            0
        case Success(Command.GetHelp) =>
            print(usage());
            0
        case Success(_) =>
            System/StdErr.println("Unsupported operation.");
            1
        case Failure(errs) =>
            errs |> Nel.foreach(System/StdErr.print);
            System/StdErr.print(usage());
            2
    }
