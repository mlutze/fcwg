namespace TestOptions {
    use Options.Command
    use Options.OptionLevel
    use Options.Options.Options
    use Options.Options
    use Options.PureLevel
    use Options.ResultLevel
    use Options.SuperLevel
    use Options.defaultOptions
    use Options.parse

    @test
    def testParse01(): Bool  = {
        let args = "-h" :: Nil;
        parse(args) == Success(Command.GetHelp)
    }

    @test
    def testParse02(): Bool  = {
        let args = "-v" :: Nil;
        parse(args) == Success(Command.GetVersion)
    }

    @test
    def testParse03(): Bool  = {
        let args = "-ppp" :: Nil;
        match parse(args) {
            case Success(_) => false
            case Failure(_) => true
        }
    }

    @test
    def testParse04(): Bool  = {
        let args = "-ppp" :: "java.lang.String" :: Nil;
        let Options(default) = defaultOptions();
        let opts = Options({ pureLevel = PureLevel.PureAll | default });
        let cmd = Command.Go("java.lang.String", opts);
        parse(args) == Success(cmd)
    }

    @test
    def testParse05(): Bool  = {
        let args = "-pprs" :: "java.lang.Exception" :: Nil;
        let Options(default) = defaultOptions();
        let opts = Options({ pureLevel = PureLevel.PureButUnit, superLevel = SuperLevel.SuperButObject, resultLevel = ResultLevel.ResultChecked | default });
        let cmd = Command.Go("java.lang.Exception", opts);
        parse(args) == Success(cmd)
    }
}