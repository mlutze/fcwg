namespace Wrapped/Exception {
    pub def addSuppressed(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): Unit & Impure = {
        import java.lang.Throwable.addSuppressed(##java.lang.Throwable): Unit & Impure;
        addSuppressed(x0 as ##java.lang.Throwable, x1)
    }
    
    
    pub def fillInStackTrace(x0: ##java.lang.Exception): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.fillInStackTrace(): ##java.lang.Throwable & Pure;
        fillInStackTrace(x0 as ##java.lang.Throwable)
    }
    
    
    pub def getCause(x0: ##java.lang.Exception): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.getCause(): ##java.lang.Throwable & Pure;
        getCause(x0 as ##java.lang.Throwable)
    }
    
    
    pub def getLocalizedMessage(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.getLocalizedMessage(): String & Pure;
        getLocalizedMessage(x0 as ##java.lang.Throwable)
    }
    
    
    pub def getMessage(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.getMessage(): String & Pure;
        getMessage(x0 as ##java.lang.Throwable)
    }
    
    
    pub def getStackTrace(x0: ##java.lang.Exception): Array[##java.lang.StackTraceElement] & Pure = {
        import java.lang.Throwable.getStackTrace(): Array[##java.lang.StackTraceElement] & Pure;
        getStackTrace(x0 as ##java.lang.Throwable)
    }
    
    
    pub def getSuppressed(x0: ##java.lang.Exception): Array[##java.lang.Throwable] & Pure = {
        import java.lang.Throwable.getSuppressed(): Array[##java.lang.Throwable] & Pure;
        getSuppressed(x0 as ##java.lang.Throwable)
    }
    
    
    pub def initCause(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.initCause(##java.lang.Throwable): ##java.lang.Throwable & Pure;
        initCause(x0 as ##java.lang.Throwable, x1)
    }
    
    
    pub def printStackTrace(x0: ##java.lang.Exception): Unit & Impure = {
        import java.lang.Throwable.printStackTrace(): Unit & Impure;
        printStackTrace(x0 as ##java.lang.Throwable)
    }
    
    
    /// pub def printStackTrace(x0: ##java.lang.Exception, x1: ##java.io.PrintStream): Unit & Impure = {
    ///     import java.lang.Throwable.printStackTrace(##java.io.PrintStream): Unit & Impure;
    ///     printStackTrace(x0 as ##java.lang.Throwable, x1)
    /// }
    
    
    /// pub def printStackTrace(x0: ##java.lang.Exception, x1: ##java.io.PrintWriter): Unit & Impure = {
    ///     import java.lang.Throwable.printStackTrace(##java.io.PrintWriter): Unit & Impure;
    ///     printStackTrace(x0 as ##java.lang.Throwable, x1)
    /// }
    
    
    pub def setStackTrace(x0: ##java.lang.Exception, x1: Array[##java.lang.StackTraceElement]): Unit & Impure = {
        import java.lang.Throwable.setStackTrace(Array[##java.lang.StackTraceElement]): Unit & Impure;
        setStackTrace(x0 as ##java.lang.Throwable, x1)
    }
    
    
    pub def toString(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.toString(): String & Pure;
        toString(x0 as ##java.lang.Throwable)
    }
}
