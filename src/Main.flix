use Options.Command;
use Options.parse;
use Options.usage;
use Transform.visitClass;
use Version.version;

use Wrapped/Class.forNameString;
use Wrapped/Exception.getMessage;

// The main entry point.
def main(): Unit & Impure =
    use Result.flatMap;
    let args = Environment.getArgs();
    match parse(args) {
        case Success(Command.Go(name, options)) =>
            match {
                let* clazz = forNameString(name);
                visitClass(options, clazz)
            } {
                case Ok(ns) =>
                    println(ns)
                case Err(err) =>
                    System/StdErr.println(getMessage(err))
            }
        case Success(Command.GetVersion) =>
            println(version())
        case Success(Command.GetHelp) =>
            print(usage())
        case Success(_) =>
            System/StdErr.println("Unsupported operation.")
        case Failure(errs) =>
            errs |> Nec.foreach(System/StdErr.print);
            System/StdErr.print(usage())
    }