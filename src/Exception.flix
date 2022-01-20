namespace Exception {
    pub def printStackTrace(x0: ##java.lang.Throwable): Unit & Pure = {
        import java.lang.Throwable.printStackTrace(): & Pure;
        printStackTrace(x0)
    }
    
    
    /// pub def printStackTrace(x0: ##java.lang.Throwable, x1: ##java.io.PrintStream): Unit & Pure = {
    ///     import java.lang.Throwable.printStackTrace(##java.io.PrintStream): & Pure;
    ///     printStackTrace(x0, x1)
    /// }
    
    
    /// pub def printStackTrace(x0: ##java.lang.Throwable, x1: ##java.io.PrintWriter): Unit & Pure = {
    ///     import java.lang.Throwable.printStackTrace(##java.io.PrintWriter): & Pure;
    ///     printStackTrace(x0, x1)
    /// }
    
    
    pub def fillInStackTrace(x0: ##java.lang.Throwable): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.fillInStackTrace(): & Pure;
        fillInStackTrace(x0)
    }
    
    
    pub def getCause(x0: ##java.lang.Throwable): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.getCause(): & Pure;
        getCause(x0)
    }
    
    
    pub def initCause(x0: ##java.lang.Throwable, x1: ##java.lang.Throwable): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.initCause(##java.lang.Throwable): & Pure;
        initCause(x0, x1)
    }
    
    
    pub def toString(x0: ##java.lang.Throwable): String & Pure = {
        import java.lang.Throwable.toString(): & Pure;
        toString(x0)
    }
    
    
    pub def getMessage(x0: ##java.lang.Throwable): String & Pure = {
        import java.lang.Throwable.getMessage(): & Pure;
        getMessage(x0)
    }
    
    
    pub def getSuppressed(x0: ##java.lang.Throwable): Array[##java.lang.Throwable] & Pure = {
        import java.lang.Throwable.getSuppressed(): & Pure;
        getSuppressed(x0)
    }
    
    
    pub def getLocalizedMessage(x0: ##java.lang.Throwable): String & Pure = {
        import java.lang.Throwable.getLocalizedMessage(): & Pure;
        getLocalizedMessage(x0)
    }
    
    
    pub def getStackTrace(x0: ##java.lang.Throwable): Array[##java.lang.StackTraceElement] & Pure = {
        import java.lang.Throwable.getStackTrace(): & Pure;
        getStackTrace(x0)
    }
    
    
    pub def setStackTrace(x0: ##java.lang.Throwable, x1: Array[##java.lang.StackTraceElement]): Unit & Pure = {
        import java.lang.Throwable.setStackTrace(Array[##java.lang.StackTraceElement]): & Pure;
        setStackTrace(x0, x1)
    }
    
    
    pub def addSuppressed(x0: ##java.lang.Throwable, x1: ##java.lang.Throwable): Unit & Pure = {
        import java.lang.Throwable.addSuppressed(##java.lang.Throwable): & Pure;
        addSuppressed(x0, x1)
    }
}
