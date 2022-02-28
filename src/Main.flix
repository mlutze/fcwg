use Options.Command;
use Options.parse;
use Options.usage;
use Transform.visitClass;
use Version.version;

use Wrapped/Class.forName;
use Wrapped/Exception.getMessage;

// The main entry point.
def main(args: Array[String]): Int32 & Impure =
    use Result.flatMap;
    match parse(args) {
        case Success(Command.Go(name, options)) =>
            match {
                let* clazz = forName(name);
                visitClass(options, clazz)
            } {
                case Ok(ns) =>
                    println(ns);
                    0
                case Err(err) =>
                    System/StdErr.println(getMessage(err));
                    1
            }
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
            errs |> Nec.foreach(System/StdErr.print);
            System/StdErr.print(usage());
            2
    }
