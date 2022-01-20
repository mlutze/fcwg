namespace Wrapped/Method {
    pub def invoke(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object, x2: Array[##java.lang.Object]): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Method.invoke(##java.lang.Object, Array[##java.lang.Object]): & Pure;
        try {
            Ok(invoke(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.getName(): & Pure;
        getName(x0)
    }
    
    
    pub def equals(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Method.equals(##java.lang.Object): & Pure;
        equals(x0, x1)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.toString(): & Pure;
        toString(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.hashCode(): & Pure;
        hashCode(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.getModifiers(): & Pure;
        getModifiers(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.TypeVariable] & Pure = {
        import java.lang.reflect.Method.getTypeParameters(): & Pure;
        getTypeParameters(x0)
    }
    
    
    pub def getReturnType(x0: ##java.lang.reflect.Method): ##java.lang.Class & Pure = {
        import java.lang.reflect.Method.getReturnType(): & Pure;
        getReturnType(x0)
    }
    
    
    pub def getParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class] & Pure = {
        import java.lang.reflect.Method.getParameterTypes(): & Pure;
        getParameterTypes(x0)
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.toGenericString(): & Pure;
        toGenericString(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isSynthetic(): & Pure;
        isSynthetic(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Method): ##java.lang.Class & Pure = {
        import java.lang.reflect.Method.getDeclaringClass(): & Pure;
        getDeclaringClass(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Method, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Method.getAnnotation(##java.lang.Class): & Pure;
        getAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Method): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.reflect.Method.getDeclaredAnnotations(): & Pure;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Method, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Method.setAccessible(Bool): & Impure;
        setAccessible(x0, x1)
    }
    
    
    pub def isVarArgs(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isVarArgs(): & Pure;
        isVarArgs(x0)
    }
    
    
    pub def getParameterCount(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.getParameterCount(): & Pure;
        getParameterCount(x0)
    }
    
    
    pub def getParameterAnnotations(x0: ##java.lang.reflect.Method): Array[Array[##java.lang.annotation.Annotation]] & Pure = {
        import java.lang.reflect.Method.getParameterAnnotations(): & Pure;
        getParameterAnnotations(x0)
    }
    
    
    pub def getGenericParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.reflect.Method.getGenericParameterTypes(): & Pure;
        getGenericParameterTypes(x0)
    }
    
    
    pub def getGenericExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.reflect.Method.getGenericExceptionTypes(): & Pure;
        getGenericExceptionTypes(x0)
    }
    
    
    pub def isDefault(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isDefault(): & Pure;
        isDefault(x0)
    }
    
    
    pub def getGenericReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.Type & Pure = {
        import java.lang.reflect.Method.getGenericReturnType(): & Pure;
        getGenericReturnType(x0)
    }
    
    
    pub def getExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class] & Pure = {
        import java.lang.reflect.Method.getExceptionTypes(): & Pure;
        getExceptionTypes(x0)
    }
    
    
    pub def isBridge(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isBridge(): & Pure;
        isBridge(x0)
    }
    
    
    pub def getDefaultValue(x0: ##java.lang.reflect.Method): ##java.lang.Object & Pure = {
        import java.lang.reflect.Method.getDefaultValue(): & Pure;
        getDefaultValue(x0)
    }
    
    
    pub def getAnnotatedReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Method.getAnnotatedReturnType(): & Pure;
        getAnnotatedReturnType(x0)
    }
}
