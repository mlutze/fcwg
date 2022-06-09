namespace Wrapped/Constructor {
    pub def equals(x0: ##java.lang.reflect.Constructor, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Constructor.equals(##java.lang.Object): Bool & Pure as equals;
        equals(x0, x1)
    }
    
    
    pub def getAnnotatedReceiverType(x0: ##java.lang.reflect.Constructor): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Constructor.getAnnotatedReceiverType(): ##java.lang.reflect.AnnotatedType & Pure as getAnnotatedReceiverType;
        getAnnotatedReceiverType(x0)
    }
    
    
    pub def getAnnotatedReturnType(x0: ##java.lang.reflect.Constructor): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Constructor.getAnnotatedReturnType(): ##java.lang.reflect.AnnotatedType & Pure as getAnnotatedReturnType;
        getAnnotatedReturnType(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Constructor, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Constructor.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Constructor): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.reflect.Constructor.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] & Pure as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Constructor): ##java.lang.Class & Pure = {
        import java.lang.reflect.Constructor.getDeclaringClass(): ##java.lang.Class & Pure as getDeclaringClass;
        getDeclaringClass(x0)
    }
    
    
    pub def getExceptionTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.reflect.Constructor.getExceptionTypes(): Array[##java.lang.Class, Static] & Pure as getExceptionTypes;
        getExceptionTypes(x0)
    }
    
    
    pub def getGenericExceptionTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.Type, Static] & Pure = {
        import java.lang.reflect.Constructor.getGenericExceptionTypes(): Array[##java.lang.reflect.Type, Static] & Pure as getGenericExceptionTypes;
        getGenericExceptionTypes(x0)
    }
    
    
    pub def getGenericParameterTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.Type, Static] & Pure = {
        import java.lang.reflect.Constructor.getGenericParameterTypes(): Array[##java.lang.reflect.Type, Static] & Pure as getGenericParameterTypes;
        getGenericParameterTypes(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.getModifiers(): Int32 & Pure as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.getName(): String & Pure as getName;
        getName(x0)
    }
    
    
    pub def getParameterAnnotations(x0: ##java.lang.reflect.Constructor): Array[Array[##java.lang.annotation.Annotation, Static], Static] & Pure = {
        import java.lang.reflect.Constructor.getParameterAnnotations(): Array[Array[##java.lang.annotation.Annotation, Static], Static] & Pure as getParameterAnnotations;
        getParameterAnnotations(x0)
    }
    
    
    pub def getParameterCount(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.getParameterCount(): Int32 & Pure as getParameterCount;
        getParameterCount(x0)
    }
    
    
    pub def getParameterTypes(x0: ##java.lang.reflect.Constructor): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.reflect.Constructor.getParameterTypes(): Array[##java.lang.Class, Static] & Pure as getParameterTypes;
        getParameterTypes(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.reflect.Constructor): Array[##java.lang.reflect.TypeVariable, Static] & Pure = {
        import java.lang.reflect.Constructor.getTypeParameters(): Array[##java.lang.reflect.TypeVariable, Static] & Pure as getTypeParameters;
        getTypeParameters(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Constructor): Int32 & Pure = {
        import java.lang.reflect.Constructor.hashCode(): Int32 & Pure as hashCode;
        hashCode(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Constructor): Bool & Pure = {
        import java.lang.reflect.Constructor.isSynthetic(): Bool & Pure as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def isVarArgs(x0: ##java.lang.reflect.Constructor): Bool & Pure = {
        import java.lang.reflect.Constructor.isVarArgs(): Bool & Pure as isVarArgs;
        isVarArgs(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.reflect.Constructor, x1: Array[##java.lang.Object, Static]): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Constructor.newInstance(Array[##java.lang.Object, Static]): ##java.lang.Object & Pure as newInstance;
        try {
            Ok(newInstance(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Constructor, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Constructor.setAccessible(Bool): Unit & Impure as setAccessible;
        setAccessible(x0, x1)
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.toGenericString(): String & Pure as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Constructor): String & Pure = {
        import java.lang.reflect.Constructor.toString(): String & Pure as toString;
        toString(x0)
    }
}
