namespace TestOptions {
    use Options.Command;
    use Options.OptionLevel;
    use Options.Options.Options;
    use Options.Options;
    use Options.PureLevel;
    use Options.ResultLevel;
    use Options.SuperLevel;
    use Options.parse;

    def defaultOptions(): Options = Options({
        generic = false,
        namespace_ = None,
        optionLevel = OptionLevel.OptionNone,
        pureLevel = PureLevel.PureNone,
        resultLevel = ResultLevel.ResultNone,
        superLevel = SuperLevel.SuperNone
    })

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