use Options.Command
use Options.parse
use Options.usage
use Transform.visitClass
use Version.version
use Validation.{Success, Failure}

use Wrapped.Class.forNameString
use Wrapped.Exception.getMessage
use Wrapped.System.exit

// The main entry point.
def main(): Unit \ IO =
    use Result.flatMap;
    let args = Environment.getArgs();
    match parse(args) {
        case Success(Command.Go(name, options)) =>
            match {
                forM (
                    clazz <- forNameString(name);
                    res <- visitClass(options, clazz)
                ) yield {
                    res
                }
            } {
                case Ok(ns) =>
                    println(ns)
                case Err(err) =>
                    System.StdErr.println(getMessage(err));
                    exitProcessError()
            }
        case Success(Command.GetVersion) =>
            println(version())
        case Success(Command.GetHelp) =>
            println(usage())
        case Success(_) =>
            System.StdErr.println("Unsupported operation.");
            exitUnsupported()
        case Failure(errs) =>
            errs |> Nec.forEach(System.StdErr.print);
            System.StdErr.print(usage());
            exitParseError()
    }

def exitProcessError(): Unit \ IO = exit(1)

def exitParseError(): Unit \ IO = exit(2)

def exitUnsupported(): Unit \ IO = exit(3)
