mod Wrapped.Exception {
    pub def addSuppressed(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): Unit \ IO = {
        import java.lang.Throwable.addSuppressed(##java.lang.Throwable): Unit \ IO as addSuppressed;
        addSuppressed(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def fillInStackTrace(x0: ##java.lang.Exception): ##java.lang.Throwable \ {} = {
        import java.lang.Throwable.fillInStackTrace(): ##java.lang.Throwable \ {} as fillInStackTrace;
        fillInStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getCause(x0: ##java.lang.Exception): ##java.lang.Throwable \ {} = {
        import java.lang.Throwable.getCause(): ##java.lang.Throwable \ {} as getCause;
        getCause(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getLocalizedMessage(x0: ##java.lang.Exception): String \ {} = {
        import java.lang.Throwable.getLocalizedMessage(): String \ {} as getLocalizedMessage;
        getLocalizedMessage(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getMessage(x0: ##java.lang.Exception): String \ {} = {
        import java.lang.Throwable.getMessage(): String \ {} as getMessage;
        getMessage(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getStackTrace(x0: ##java.lang.Exception): Array[##java.lang.StackTraceElement, Static] \ {} = {
        import java.lang.Throwable.getStackTrace(): Array[##java.lang.StackTraceElement, Static] \ {} as getStackTrace;
        getStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getSuppressed(x0: ##java.lang.Exception): Array[##java.lang.Throwable, Static] \ {} = {
        import java.lang.Throwable.getSuppressed(): Array[##java.lang.Throwable, Static] \ {} as getSuppressed;
        getSuppressed(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def initCause(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): ##java.lang.Throwable \ {} = {
        import java.lang.Throwable.initCause(##java.lang.Throwable): ##java.lang.Throwable \ {} as initCause;
        initCause(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def newException(): ##java.lang.Exception \ {} = {
        import java_new java.lang.Exception(): ##java.lang.Exception \ {} as newException;
        newException()
    }
    
    
    pub def newExceptionString(x0: String): ##java.lang.Exception \ {} = {
        import java_new java.lang.Exception(String): ##java.lang.Exception \ {} as newException;
        newException(x0)
    }
    
    
    pub def newExceptionStringThrowable(x0: String, x1: ##java.lang.Throwable): ##java.lang.Exception \ {} = {
        import java_new java.lang.Exception(String, ##java.lang.Throwable): ##java.lang.Exception \ {} as newException;
        newException(x0, x1)
    }
    
    
    pub def newExceptionThrowable(x0: ##java.lang.Throwable): ##java.lang.Exception \ {} = {
        import java_new java.lang.Exception(##java.lang.Throwable): ##java.lang.Exception \ {} as newException;
        newException(x0)
    }
    
    
    pub def printStackTraceException(x0: ##java.lang.Exception): Unit \ IO = {
        import java.lang.Throwable.printStackTrace(): Unit \ IO as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def printStackTraceExceptionPrintStream(x0: ##java.lang.Exception, x1: ##java.io.PrintStream): Unit \ IO = {
        import java.lang.Throwable.printStackTrace(##java.io.PrintStream): Unit \ IO as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def printStackTraceExceptionPrintWriter(x0: ##java.lang.Exception, x1: ##java.io.PrintWriter): Unit \ IO = {
        import java.lang.Throwable.printStackTrace(##java.io.PrintWriter): Unit \ IO as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def setStackTrace(x0: ##java.lang.Exception, x1: Array[##java.lang.StackTraceElement, Static]): Unit \ IO = {
        import java.lang.Throwable.setStackTrace(Array[##java.lang.StackTraceElement, Static]): Unit \ IO as setStackTrace;
        setStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def toString(x0: ##java.lang.Exception): String \ {} = {
        import java.lang.Throwable.toString(): String \ {} as toString;
        toString(unchecked_cast(x0 as ##java.lang.Throwable))
    }
}
