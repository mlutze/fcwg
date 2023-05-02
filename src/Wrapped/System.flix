mod Wrapped.System {
    pub def arraycopy(x0: ##java.lang.Object, x1: Int32, x2: ##java.lang.Object, x3: Int32, x4: Int32): Unit \ IO = {
        import static java.lang.System.arraycopy(##java.lang.Object, Int32, ##java.lang.Object, Int32, Int32): Unit \ IO as arraycopy;
        arraycopy(x0, x1, x2, x3, x4)
    }
    
    
    pub def clearProperty(x0: String): String \ IO = {
        import static java.lang.System.clearProperty(String): String \ IO as clearProperty;
        clearProperty(x0)
    }
    
    
    pub def console(): ##java.io.Console \ IO = {
        import static java.lang.System.console(): ##java.io.Console \ IO as console;
        console()
    }
    
    
    pub def currentTimeMillis(): Int64 \ IO = {
        import static java.lang.System.currentTimeMillis(): Int64 \ IO as currentTimeMillis;
        currentTimeMillis()
    }
    
    
    pub def exit(x0: Int32): Unit \ IO = {
        import static java.lang.System.exit(Int32): Unit \ IO as exit;
        exit(x0)
    }
    
    
    pub def gc(): Unit \ IO = {
        import static java.lang.System.gc(): Unit \ IO as gc;
        gc()
    }
    
    
    pub def getErr(): ##java.io.PrintStream \ {} = {
        import static  get java.lang.System.err: ##java.io.PrintStream \ {} as getErr;
        getErr()
    }
    
    
    pub def getIn(): ##java.io.InputStream \ {} = {
        import static  get java.lang.System.in: ##java.io.InputStream \ {} as getIn;
        getIn()
    }
    
    
    pub def getLoggerString(x0: String): ##java.lang.System$Logger \ IO = {
        import static java.lang.System.getLogger(String): ##java.lang.System$Logger \ IO as getLogger;
        getLogger(x0)
    }
    
    
    pub def getLoggerStringResourceBundle(x0: String, x1: ##java.util.ResourceBundle): ##java.lang.System$Logger \ IO = {
        import static java.lang.System.getLogger(String, ##java.util.ResourceBundle): ##java.lang.System$Logger \ IO as getLogger;
        getLogger(x0, x1)
    }
    
    
    pub def getOut(): ##java.io.PrintStream \ {} = {
        import static  get java.lang.System.out: ##java.io.PrintStream \ {} as getOut;
        getOut()
    }
    
    
    pub def getProperties(): ##java.util.Properties \ IO = {
        import static java.lang.System.getProperties(): ##java.util.Properties \ IO as getProperties;
        getProperties()
    }
    
    
    pub def getPropertyString(x0: String): String \ IO = {
        import static java.lang.System.getProperty(String): String \ IO as getProperty;
        getProperty(x0)
    }
    
    
    pub def getPropertyStringString(x0: String, x1: String): String \ IO = {
        import static java.lang.System.getProperty(String, String): String \ IO as getProperty;
        getProperty(x0, x1)
    }
    
    
    pub def getSecurityManager(): ##java.lang.SecurityManager \ IO = {
        import static java.lang.System.getSecurityManager(): ##java.lang.SecurityManager \ IO as getSecurityManager;
        getSecurityManager()
    }
    
    
    pub def getenv(): ##java.util.Map \ IO = {
        import static java.lang.System.getenv(): ##java.util.Map \ IO as getenv;
        getenv()
    }
    
    
    pub def getenvString(x0: String): String \ IO = {
        import static java.lang.System.getenv(String): String \ IO as getenv;
        getenv(x0)
    }
    
    
    pub def identityHashCode(x0: ##java.lang.Object): Int32 \ IO = {
        import static java.lang.System.identityHashCode(##java.lang.Object): Int32 \ IO as identityHashCode;
        identityHashCode(x0)
    }
    
    
    pub def inheritedChannel(): Result[##java.lang.Exception, ##java.nio.channels.Channel] \ IO = {
        import static java.lang.System.inheritedChannel(): ##java.nio.channels.Channel \ IO as inheritedChannel;
        try {
            Ok(inheritedChannel())
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def lineSeparator(): String \ IO = {
        import static java.lang.System.lineSeparator(): String \ IO as lineSeparator;
        lineSeparator()
    }
    
    
    pub def load(x0: String): Unit \ IO = {
        import static java.lang.System.load(String): Unit \ IO as load;
        load(x0)
    }
    
    
    pub def loadLibrary(x0: String): Unit \ IO = {
        import static java.lang.System.loadLibrary(String): Unit \ IO as loadLibrary;
        loadLibrary(x0)
    }
    
    
    pub def mapLibraryName(x0: String): String \ IO = {
        import static java.lang.System.mapLibraryName(String): String \ IO as mapLibraryName;
        mapLibraryName(x0)
    }
    
    
    pub def nanoTime(): Int64 \ IO = {
        import static java.lang.System.nanoTime(): Int64 \ IO as nanoTime;
        nanoTime()
    }
    
    
    pub def runFinalization(): Unit \ IO = {
        import static java.lang.System.runFinalization(): Unit \ IO as runFinalization;
        runFinalization()
    }
    
    
    pub def setErr(x0: ##java.io.PrintStream): Unit \ IO = {
        import static java.lang.System.setErr(##java.io.PrintStream): Unit \ IO as setErr;
        setErr(x0)
    }
    
    
    pub def setIn(x0: ##java.io.InputStream): Unit \ IO = {
        import static java.lang.System.setIn(##java.io.InputStream): Unit \ IO as setIn;
        setIn(x0)
    }
    
    
    pub def setOut(x0: ##java.io.PrintStream): Unit \ IO = {
        import static java.lang.System.setOut(##java.io.PrintStream): Unit \ IO as setOut;
        setOut(x0)
    }
    
    
    pub def setProperties(x0: ##java.util.Properties): Unit \ IO = {
        import static java.lang.System.setProperties(##java.util.Properties): Unit \ IO as setProperties;
        setProperties(x0)
    }
    
    
    pub def setProperty(x0: String, x1: String): String \ IO = {
        import static java.lang.System.setProperty(String, String): String \ IO as setProperty;
        setProperty(x0, x1)
    }
    
    
    pub def setSecurityManager(x0: ##java.lang.SecurityManager): Unit \ IO = {
        import static java.lang.System.setSecurityManager(##java.lang.SecurityManager): Unit \ IO as setSecurityManager;
        setSecurityManager(x0)
    }
}
