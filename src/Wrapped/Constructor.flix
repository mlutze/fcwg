namespace Wrapped/Constructor {
    pub def equals(x0: ##java.lang.reflect.Constructor, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Constructor.equals(##java.lang.Object): & Pure;
        equals(x0, x1)
    }
    
    
    pub def getAnnotatedReceiverType(x0: ##java.lang.reflect.Constructor): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Constructor.getAnnotatedReceiverType(): & Pure;
        getAnnotatedReceiverType(x0)
    }
    
    
    pub def getAnnotatedReturnType(x0: ##java.lang.reflect.Constructor): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Constructor.getAnnotatedReturnType(): & Pure;
        getAnnotatedReturnType(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Constructor, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Constructor.getAnnotation(##java.lang.Class): & Pure;
        getAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Constructor): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.reflect.Constructor.getDeclaredAnnotations(): & Pure;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Constructor): ##java.lang.Class & Pure = {
        import java.lang.reflect.Constructor.getDeclaringClass(): & Pure;
        getDeclaringClass(x0)
    }
    
    
    pub def getExceptionTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.Class] & Pure = {
        import java.lang.reflect.Constructor.getExceptionTypes(): & Pure;
        getExceptionTypes(x0)
    }
    
    
    pub def getGenericExceptionTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.reflect.Constructor.getGenericExceptionTypes(): & Pure;
        getGenericExceptionTypes(x0)
    }
    
    
    pub def getGenericParameterTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.reflect.Constructor.getGenericParameterTypes(): & Pure;
        getGenericParameterTypes(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.getModifiers(): & Pure;
        getModifiers(x0)
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.getName(): & Pure;
        getName(x0)
    }
    
    
    pub def getParameterAnnotations(x0: ##java.lang.reflect.Constructor): Array[Array[##java.lang.annotation.Annotation]] & Pure = {
        import java.lang.reflect.Constructor.getParameterAnnotations(): & Pure;
        getParameterAnnotations(x0)
    }
    
    
    pub def getParameterCount(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.getParameterCount(): & Pure;
        getParameterCount(x0)
    }
    
    
    pub def getParameterTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.Class] & Pure = {
        import java.lang.reflect.Constructor.getParameterTypes(): & Pure;
        getParameterTypes(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.TypeVariable] & Pure = {
        import java.lang.reflect.Constructor.getTypeParameters(): & Pure;
        getTypeParameters(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.hashCode(): & Pure;
        hashCode(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Constructor): Bool & Pure = {
        import java.lang.reflect.Constructor.isSynthetic(): & Pure;
        isSynthetic(x0)
    }
    
    
    pub def isVarArgs(x0: ##java.lang.reflect.Constructor): Bool & Pure = {
        import java.lang.reflect.Constructor.isVarArgs(): & Pure;
        isVarArgs(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.reflect.Constructor, x1: Array[##java.lang.Object]): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Constructor.newInstance(Array[##java.lang.Object]): & Pure;
        try {
            Ok(newInstance(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Constructor, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Constructor.setAccessible(Bool): & Impure;
        setAccessible(x0, x1)
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.toGenericString(): & Pure;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.toString(): & Pure;
        toString(x0)
    }
}
