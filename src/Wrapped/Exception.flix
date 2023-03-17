namespace Wrapped/Exception {
    pub def addSuppressed(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): Unit & Impure = {
        import java.lang.Throwable.addSuppressed(##java.lang.Throwable): Unit & Impure as addSuppressed;
        addSuppressed(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def fillInStackTrace(x0: ##java.lang.Exception): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.fillInStackTrace(): ##java.lang.Throwable & Pure as fillInStackTrace;
        fillInStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getCause(x0: ##java.lang.Exception): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.getCause(): ##java.lang.Throwable & Pure as getCause;
        getCause(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getLocalizedMessage(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.getLocalizedMessage(): String & Pure as getLocalizedMessage;
        getLocalizedMessage(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getMessage(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.getMessage(): String & Pure as getMessage;
        getMessage(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getStackTrace(x0: ##java.lang.Exception): Array[##java.lang.StackTraceElement, Static] & Pure = {
        import java.lang.Throwable.getStackTrace(): Array[##java.lang.StackTraceElement, Static] & Pure as getStackTrace;
        getStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def getSuppressed(x0: ##java.lang.Exception): Array[##java.lang.Throwable, Static] & Pure = {
        import java.lang.Throwable.getSuppressed(): Array[##java.lang.Throwable, Static] & Pure as getSuppressed;
        getSuppressed(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def initCause(x0: ##java.lang.Exception, x1: ##java.lang.Throwable): ##java.lang.Throwable & Pure = {
        import java.lang.Throwable.initCause(##java.lang.Throwable): ##java.lang.Throwable & Pure as initCause;
        initCause(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def newException(): ##java.lang.Exception & Pure = {
        import new java.lang.Exception(): ##java.lang.Exception & Pure as newException;
        newException()
    }
    
    
    pub def newExceptionString(x0: String): ##java.lang.Exception & Pure = {
        import new java.lang.Exception(String): ##java.lang.Exception & Pure as newException;
        newException(x0)
    }
    
    
    pub def newExceptionStringThrowable(x0: String, x1: ##java.lang.Throwable): ##java.lang.Exception & Pure = {
        import new java.lang.Exception(String, ##java.lang.Throwable): ##java.lang.Exception & Pure as newException;
        newException(x0, x1)
    }
    
    
    pub def newExceptionThrowable(x0: ##java.lang.Throwable): ##java.lang.Exception & Pure = {
        import new java.lang.Exception(##java.lang.Throwable): ##java.lang.Exception & Pure as newException;
        newException(x0)
    }
    
    
    pub def printStackTraceException(x0: ##java.lang.Exception): Unit & Impure = {
        import java.lang.Throwable.printStackTrace(): Unit & Impure as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable))
    }
    
    
    pub def printStackTraceExceptionPrintStream(x0: ##java.lang.Exception, x1: ##java.io.PrintStream): Unit & Impure = {
        import java.lang.Throwable.printStackTrace(##java.io.PrintStream): Unit & Impure as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def printStackTraceExceptionPrintWriter(x0: ##java.lang.Exception, x1: ##java.io.PrintWriter): Unit & Impure = {
        import java.lang.Throwable.printStackTrace(##java.io.PrintWriter): Unit & Impure as printStackTrace;
        printStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def setStackTrace(x0: ##java.lang.Exception, x1: Array[##java.lang.StackTraceElement, Static]): Unit & Impure = {
        import java.lang.Throwable.setStackTrace(Array[##java.lang.StackTraceElement, Static]): Unit & Impure as setStackTrace;
        setStackTrace(unchecked_cast(x0 as ##java.lang.Throwable), x1)
    }
    
    
    pub def toString(x0: ##java.lang.Exception): String & Pure = {
        import java.lang.Throwable.toString(): String & Pure as toString;
        toString(unchecked_cast(x0 as ##java.lang.Throwable))
    }
}
