use Options.Command
use Options.parse
use Options.usage
use Transform.visitClass
use Version.version

use Wrapped/Class.forNameString
use Wrapped/Exception.getMessage
use Wrapped/System.exit

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
                    System/StdErr.println(getMessage(err));
                    exitProcessError()
            }
        case Success(Command.GetVersion) =>
            println(version())
        case Success(Command.GetHelp) =>
            print(usage())
        case Success(_) =>
            System/StdErr.println("Unsupported operation.");
            exitUnsupported()
        case Failure(errs) =>
            errs |> Nec.forEach(System/StdErr.print);
            System/StdErr.print(usage());
            exitParseError()
    }

def exitProcessError(): Unit & Impure = exit(1)

def exitParseError(): Unit & Impure = exit(2)

def exitUnsupported(): Unit & Impure = exit(3)