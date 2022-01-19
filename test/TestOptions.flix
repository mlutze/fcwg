namespace TestOptions {
    use Options.Command;
    use Options.OptionLevel;
    use Options.Options.Options;
    use Options.Options;
    use Options.PureLevel;
    use Options.ResultLevel;
    use Options.SuperLevel;
    use Options.defaultOptions;
    use Options.parse;

    @test
    def testParse01(): Bool & Impure = {
        let args = ["-h"];
        parse(args) == Success(Command.GetHelp)
    }

    @test
    def testParse02(): Bool & Impure = {
        let args = ["-v"];
        parse(args) == Success(Command.GetVersion)
    }

    @test
    def testParse03(): Bool & Impure = {
        let args = ["-ppp"];
        match parse(args) {
            case Success(_) => false
            case Failure(_) => true
        }
    }

    @test
    def testParse04(): Bool & Impure = {
        let args = ["-ppp", "java.lang.String"];
        let Options(default) = defaultOptions();
        let opts = Options({ pureLevel = PureLevel.PureAll | default });
        let cmd = Command.Go("java.lang.String", opts);
        parse(args) == Success(cmd)
    }
}