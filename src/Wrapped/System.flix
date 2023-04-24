mod Wrapped.System {
    pub def arraycopy(x0: ##java.lang.Object, x1: Int32, x2: ##java.lang.Object, x3: Int32, x4: Int32): Unit & Impure = {
        import static java.lang.System.arraycopy(##java.lang.Object, Int32, ##java.lang.Object, Int32, Int32): Unit & Impure as arraycopy;
        arraycopy(x0, x1, x2, x3, x4)
    }
    
    
    pub def clearProperty(x0: String): String & Impure = {
        import static java.lang.System.clearProperty(String): String & Impure as clearProperty;
        clearProperty(x0)
    }
    
    
    pub def console(): ##java.io.Console & Impure = {
        import static java.lang.System.console(): ##java.io.Console & Impure as console;
        console()
    }
    
    
    pub def currentTimeMillis(): Int64 & Impure = {
        import static java.lang.System.currentTimeMillis(): Int64 & Impure as currentTimeMillis;
        currentTimeMillis()
    }
    
    
    pub def exit(x0: Int32): Unit & Impure = {
        import static java.lang.System.exit(Int32): Unit & Impure as exit;
        exit(x0)
    }
    
    
    pub def gc(): Unit & Impure = {
        import static java.lang.System.gc(): Unit & Impure as gc;
        gc()
    }
    
    
    pub def getErr(): ##java.io.PrintStream & Pure = {
        import static  get java.lang.System.err: ##java.io.PrintStream & Pure as getErr;
        getErr()
    }
    
    
    pub def getIn(): ##java.io.InputStream & Pure = {
        import static  get java.lang.System.in: ##java.io.InputStream & Pure as getIn;
        getIn()
    }
    
    
    pub def getLoggerString(x0: String): ##java.lang.System$Logger & Impure = {
        import static java.lang.System.getLogger(String): ##java.lang.System$Logger & Impure as getLogger;
        getLogger(x0)
    }
    
    
    pub def getLoggerStringResourceBundle(x0: String, x1: ##java.util.ResourceBundle): ##java.lang.System$Logger & Impure = {
        import static java.lang.System.getLogger(String, ##java.util.ResourceBundle): ##java.lang.System$Logger & Impure as getLogger;
        getLogger(x0, x1)
    }
    
    
    pub def getOut(): ##java.io.PrintStream & Pure = {
        import static  get java.lang.System.out: ##java.io.PrintStream & Pure as getOut;
        getOut()
    }
    
    
    pub def getProperties(): ##java.util.Properties & Impure = {
        import static java.lang.System.getProperties(): ##java.util.Properties & Impure as getProperties;
        getProperties()
    }
    
    
    pub def getPropertyString(x0: String): String & Impure = {
        import static java.lang.System.getProperty(String): String & Impure as getProperty;
        getProperty(x0)
    }
    
    
    pub def getPropertyStringString(x0: String, x1: String): String & Impure = {
        import static java.lang.System.getProperty(String, String): String & Impure as getProperty;
        getProperty(x0, x1)
    }
    
    
    pub def getSecurityManager(): ##java.lang.SecurityManager & Impure = {
        import static java.lang.System.getSecurityManager(): ##java.lang.SecurityManager & Impure as getSecurityManager;
        getSecurityManager()
    }
    
    
    pub def getenv(): ##java.util.Map & Impure = {
        import static java.lang.System.getenv(): ##java.util.Map & Impure as getenv;
        getenv()
    }
    
    
    pub def getenvString(x0: String): String & Impure = {
        import static java.lang.System.getenv(String): String & Impure as getenv;
        getenv(x0)
    }
    
    
    pub def identityHashCode(x0: ##java.lang.Object): Int32 & Impure = {
        import static java.lang.System.identityHashCode(##java.lang.Object): Int32 & Impure as identityHashCode;
        identityHashCode(x0)
    }
    
    
    pub def inheritedChannel(): Result[##java.lang.Exception, ##java.nio.channels.Channel] & Impure = {
        import static java.lang.System.inheritedChannel(): ##java.nio.channels.Channel & Impure as inheritedChannel;
        try {
            Ok(inheritedChannel())
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def lineSeparator(): String & Impure = {
        import static java.lang.System.lineSeparator(): String & Impure as lineSeparator;
        lineSeparator()
    }
    
    
    pub def load(x0: String): Unit & Impure = {
        import static java.lang.System.load(String): Unit & Impure as load;
        load(x0)
    }
    
    
    pub def loadLibrary(x0: String): Unit & Impure = {
        import static java.lang.System.loadLibrary(String): Unit & Impure as loadLibrary;
        loadLibrary(x0)
    }
    
    
    pub def mapLibraryName(x0: String): String & Impure = {
        import static java.lang.System.mapLibraryName(String): String & Impure as mapLibraryName;
        mapLibraryName(x0)
    }
    
    
    pub def nanoTime(): Int64 & Impure = {
        import static java.lang.System.nanoTime(): Int64 & Impure as nanoTime;
        nanoTime()
    }
    
    
    pub def runFinalization(): Unit & Impure = {
        import static java.lang.System.runFinalization(): Unit & Impure as runFinalization;
        runFinalization()
    }
    
    
    pub def setErr(x0: ##java.io.PrintStream): Unit & Impure = {
        import static java.lang.System.setErr(##java.io.PrintStream): Unit & Impure as setErr;
        setErr(x0)
    }
    
    
    pub def setIn(x0: ##java.io.InputStream): Unit & Impure = {
        import static java.lang.System.setIn(##java.io.InputStream): Unit & Impure as setIn;
        setIn(x0)
    }
    
    
    pub def setOut(x0: ##java.io.PrintStream): Unit & Impure = {
        import static java.lang.System.setOut(##java.io.PrintStream): Unit & Impure as setOut;
        setOut(x0)
    }
    
    
    pub def setProperties(x0: ##java.util.Properties): Unit & Impure = {
        import static java.lang.System.setProperties(##java.util.Properties): Unit & Impure as setProperties;
        setProperties(x0)
    }
    
    
    pub def setProperty(x0: String, x1: String): String & Impure = {
        import static java.lang.System.setProperty(String, String): String & Impure as setProperty;
        setProperty(x0, x1)
    }
    
    
    pub def setSecurityManager(x0: ##java.lang.SecurityManager): Unit & Impure = {
        import static java.lang.System.setSecurityManager(##java.lang.SecurityManager): Unit & Impure as setSecurityManager;
        setSecurityManager(x0)
    }
}
