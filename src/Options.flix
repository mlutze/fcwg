namespace Options {
    use GetOpt.ArgDescr.{NoArg, ReqArg}
    use GetOpt.ArgOrder.Permute
    use GetOpt.OptionDescr
    use GetOpt.getOpt
    use GetOpt.usageInfo

    enum Flag {
        case Generic
        case Help
        case Interactive
        case Namespace(String)
        case Option
        case Pure_
        case Result
        case Super
        case Version
    }

    pub enum OptionLevel with Eq, Order {
        case OptionNone
        case OptionRef
    }

    pub enum PureLevel with Eq, Order {
        case PureNone
        case PureFinal
        case PureButUnit
        case PureAll
    }

    pub enum ResultLevel with Eq, Order {
        case ResultNone
        case ResultChecked
        case ResultAll
    }

    pub enum SuperLevel with Eq, Order {
        case SuperNone
        case SuperButObject
        case SuperAll
    }

    pub enum Options({
        generic = Bool,
        namespace_ = Option[String],
        optionLevel = OptionLevel,
        pureLevel = PureLevel,
        resultLevel = ResultLevel,
        superLevel = SuperLevel
    })

    instance Eq[Options] {
        pub def eq(x0: Options, y0: Options): Bool =
            let Options(x) = x0;
            let Options(y) = y0;
            x.generic == y.generic and
                x.namespace_ == y.namespace_ and
                x.optionLevel == y.optionLevel and
                x.pureLevel == y.pureLevel and
                x.resultLevel == y.resultLevel and
                x.superLevel == y.superLevel
    }

    pub enum Command with Eq {
        case GetHelp
        case GetVersion
        case GoInteractive(String, Options)
        case Go(String, Options) // MATT what's the opposite of Interactive?
    }


    def options(): List[OptionDescr[Flag]] =
        /// {optionIds = 'g' :: Nil, optionNames = "generic" :: Nil, argDescriptor = NoArg(Generic), explanation = "Wraps generic types in Generic"} ::
        {optionIds = 'h' :: Nil, optionNames = "help" :: Nil, argDescriptor = NoArg(Help), explanation = "Prints this help information and exits."} ::
        /// {optionIds = 'i' :: Nil, optionNames = "interactive" :: Nil, argDescriptor = NoArg(Interactive), explanation = "Launches interactive mode." } ::
        {optionIds = 'n' :: Nil, optionNames = "namespace" :: Nil, argDescriptor = ReqArg(namespace_, "<namespace>"), explanation = "Sets the namespace. Uses the class's namespace by default."} ::
        {optionIds = 'o' :: Nil, optionNames = "option" :: Nil, argDescriptor = NoArg(Option), explanation = "Returns Option for functions returning reference types."} ::
        {optionIds = 'p' :: Nil, optionNames = "pure" :: Nil, argDescriptor = NoArg(Pure_), explanation = "Once: Casts getters for final fields to Pure. Twice: Casts all functions but those returning Unit. Thrice: Casts all functions."} ::
        {optionIds = 'r' :: Nil, optionNames = "result" :: Nil, argDescriptor = NoArg(Result), explanation = "Once: Returns Result for methods with checked exceptions. Twice: Returns Result for all methods."} ::
        {optionIds = 's' :: Nil, optionNames = "super" :: Nil, argDescriptor = NoArg(Super), explanation = "Once: Includes super class declarations, excluding Object. Twice: Includes Object."} ::
        {optionIds = 'v' :: Nil, optionNames = "version" :: Nil, argDescriptor = NoArg(Version), explanation = "Prints the version string and exits."} ::
        Nil
    
    pub def defaultOptions(): Options = Options({
        generic = false,
        namespace_ = None,
        optionLevel = OptionNone,
        pureLevel = PureNone,
        resultLevel = ResultNone,
        superLevel = SuperNone
    })
    
    def namespace_(x: String): Option[Flag] = Some(Namespace(x)) // MATT validate namespace

    def flatMap(f: t1 -> Validation[e, t2] & f, v: Validation[e, t1]): Validation[e, t2] & f = match v {
        case Success(x) => f(x)
        case Failure(e) => Failure(e)
    }

    /// Parses the command line arguments
    pub def parse(args: List[String]): Validation[String, Command] = {
        let* opts = getOpt(Permute, options(), args);
        let command = opts.options |> List.foldLeft(
            (acc, opt0) -> match (acc, opt0) {
                case (GetHelp, _) => GetHelp
                case (GetVersion, _) => GetVersion
                case (_, Help) => GetHelp
                case (_, Version) => GetVersion
                case (Go(clazz, opts1), Interactive) => GoInteractive(clazz, opts1)
                case (GoInteractive(clazz, opts1), Interactive) => GoInteractive(clazz, opts1)
                case (Go(clazz, opts1), opt) => Go(clazz, addOpt(opt, opts1))
                case (GoInteractive(clazz, opts1), opt) => GoInteractive(clazz, addOpt(opt, opts1))
            }
        )(Go("", defaultOptions()));
        match (command, opts.nonOptions) {
            case (GetHelp, _) => Success(GetHelp)
            case (GetVersion, _) => Success(GetVersion)
            case (Go(_, opts1), clazz :: Nil) => Success(Go(clazz, opts1))
            case (GoInteractive(_, opts1), clazz :: Nil) => Success(GoInteractive(clazz, opts1))
            case _ => Failure(Nec.singleton("Exactly one class must be specified."))
        }
    }

    /// Add the given flag to the options, assuming the flag represents some option.
    def addOpt(opt: Flag, opts0: Options): Options = 
        let Options(opts) = opts0;
        let newOpts = match opt {
            case Generic => { generic = true | opts }
            case Help => unreachable!()
            case Interactive => unreachable!()
            case Namespace(name) => { namespace_ = Some(name) | opts }
            case Option =>
                let o = match opts.optionLevel {
                    case OptionNone => OptionRef
                    case OptionRef => OptionRef
                };
                { optionLevel = o | opts }
            case Pure_ =>
                let p = match opts.pureLevel {
                    case PureNone => PureFinal
                    case PureFinal => PureButUnit
                    case PureButUnit => PureAll
                    case PureAll => PureAll
                };
                { pureLevel = p | opts }
            case Result =>
                let r = match opts.resultLevel {
                    case ResultNone => ResultChecked
                    case ResultChecked => ResultAll
                    case ResultAll => ResultAll
                };
                { resultLevel = r | opts }
            case Super =>
                let s = match opts.superLevel {
                    case SuperNone => SuperButObject
                    case SuperButObject => SuperAll
                    case SuperAll => SuperAll
                };
                { superLevel = s | opts }
            case Version => unreachable!()
        };
    Options(newOpts)

    /// Returns the usage string to be printed to the console.
    pub def usage(): String = {
        let header = "Usage: fcwg [OPTIONS] <class file>";
        usageInfo(header, options())
    }
}