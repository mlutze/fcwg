mod Wrapped/Method {
    pub def equals(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Method.equals(##java.lang.Object): Bool & Pure as equals;
        equals(x0, x1)
    }
    
    
    pub def getAnnotatedReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Method.getAnnotatedReturnType(): ##java.lang.reflect.AnnotatedType & Pure as getAnnotatedReturnType;
        getAnnotatedReturnType(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Method, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Method.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Method): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.reflect.Method.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] & Pure as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Method): ##java.lang.Class & Pure = {
        import java.lang.reflect.Method.getDeclaringClass(): ##java.lang.Class & Pure as getDeclaringClass;
        getDeclaringClass(x0)
    }
    
    
    pub def getDefaultValue(x0: ##java.lang.reflect.Method): ##java.lang.Object & Pure = {
        import java.lang.reflect.Method.getDefaultValue(): ##java.lang.Object & Pure as getDefaultValue;
        getDefaultValue(x0)
    }
    
    
    pub def getExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.reflect.Method.getExceptionTypes(): Array[##java.lang.Class, Static] & Pure as getExceptionTypes;
        getExceptionTypes(x0)
    }
    
    
    pub def getGenericExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type, Static] & Pure = {
        import java.lang.reflect.Method.getGenericExceptionTypes(): Array[##java.lang.reflect.Type, Static] & Pure as getGenericExceptionTypes;
        getGenericExceptionTypes(x0)
    }
    
    
    pub def getGenericParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type, Static] & Pure = {
        import java.lang.reflect.Method.getGenericParameterTypes(): Array[##java.lang.reflect.Type, Static] & Pure as getGenericParameterTypes;
        getGenericParameterTypes(x0)
    }
    
    
    pub def getGenericReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.Type & Pure = {
        import java.lang.reflect.Method.getGenericReturnType(): ##java.lang.reflect.Type & Pure as getGenericReturnType;
        getGenericReturnType(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.getModifiers(): Int32 & Pure as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.getName(): String & Pure as getName;
        getName(x0)
    }
    
    
    pub def getParameterAnnotations(x0: ##java.lang.reflect.Method): Array[Array[##java.lang.annotation.Annotation, Static], Static] & Pure = {
        import java.lang.reflect.Method.getParameterAnnotations(): Array[Array[##java.lang.annotation.Annotation, Static], Static] & Pure as getParameterAnnotations;
        getParameterAnnotations(x0)
    }
    
    
    pub def getParameterCount(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.getParameterCount(): Int32 & Pure as getParameterCount;
        getParameterCount(x0)
    }
    
    
    pub def getParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.reflect.Method.getParameterTypes(): Array[##java.lang.Class, Static] & Pure as getParameterTypes;
        getParameterTypes(x0)
    }
    
    
    pub def getReturnType(x0: ##java.lang.reflect.Method): ##java.lang.Class & Pure = {
        import java.lang.reflect.Method.getReturnType(): ##java.lang.Class & Pure as getReturnType;
        getReturnType(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.TypeVariable, Static] & Pure = {
        import java.lang.reflect.Method.getTypeParameters(): Array[##java.lang.reflect.TypeVariable, Static] & Pure as getTypeParameters;
        getTypeParameters(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Method): Int32 & Pure = {
        import java.lang.reflect.Method.hashCode(): Int32 & Pure as hashCode;
        hashCode(x0)
    }
    
    
    pub def invoke(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object, x2: Array[##java.lang.Object, Static]): Result[##java.lang.Exception, ##java.lang.Object] & Pure = {
        import java.lang.reflect.Method.invoke(##java.lang.Object, Array[##java.lang.Object, Static]): ##java.lang.Object & Pure as invoke;
        try {
            Ok(invoke(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def isBridge(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isBridge(): Bool & Pure as isBridge;
        isBridge(x0)
    }
    
    
    pub def isDefault(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isDefault(): Bool & Pure as isDefault;
        isDefault(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isSynthetic(): Bool & Pure as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def isVarArgs(x0: ##java.lang.reflect.Method): Bool & Pure = {
        import java.lang.reflect.Method.isVarArgs(): Bool & Pure as isVarArgs;
        isVarArgs(x0)
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Method, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Method.setAccessible(Bool): Unit & Impure as setAccessible;
        setAccessible(x0, x1)
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.toGenericString(): String & Pure as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Method): String & Pure = {
        import java.lang.reflect.Method.toString(): String & Pure as toString;
        toString(x0)
    }
}
