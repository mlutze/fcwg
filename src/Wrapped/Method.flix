mod Wrapped.Method {
    pub def equals(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object): Bool \ {} = {
        import java.lang.reflect.Method.equals(##java.lang.Object): Bool \ {} as equals;
        equals(x0, x1)
    }
    
    
    pub def getAnnotatedReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.AnnotatedType \ {} = {
        import java.lang.reflect.Method.getAnnotatedReturnType(): ##java.lang.reflect.AnnotatedType \ {} as getAnnotatedReturnType;
        getAnnotatedReturnType(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Method, x1: ##java.lang.Class): ##java.lang.annotation.Annotation \ {} = {
        import java.lang.reflect.Method.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation \ {} as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Method): Array[##java.lang.annotation.Annotation, Static] \ {} = {
        import java.lang.reflect.Method.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] \ {} as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Method): ##java.lang.Class \ {} = {
        import java.lang.reflect.Method.getDeclaringClass(): ##java.lang.Class \ {} as getDeclaringClass;
        getDeclaringClass(x0)
    }
    
    
    pub def getDefaultValue(x0: ##java.lang.reflect.Method): ##java.lang.Object \ {} = {
        import java.lang.reflect.Method.getDefaultValue(): ##java.lang.Object \ {} as getDefaultValue;
        getDefaultValue(x0)
    }
    
    
    pub def getExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.reflect.Method.getExceptionTypes(): Array[##java.lang.Class, Static] \ {} as getExceptionTypes;
        getExceptionTypes(x0)
    }
    
    
    pub def getGenericExceptionTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type, Static] \ {} = {
        import java.lang.reflect.Method.getGenericExceptionTypes(): Array[##java.lang.reflect.Type, Static] \ {} as getGenericExceptionTypes;
        getGenericExceptionTypes(x0)
    }
    
    
    pub def getGenericParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.Type, Static] \ {} = {
        import java.lang.reflect.Method.getGenericParameterTypes(): Array[##java.lang.reflect.Type, Static] \ {} as getGenericParameterTypes;
        getGenericParameterTypes(x0)
    }
    
    
    pub def getGenericReturnType(x0: ##java.lang.reflect.Method): ##java.lang.reflect.Type \ {} = {
        import java.lang.reflect.Method.getGenericReturnType(): ##java.lang.reflect.Type \ {} as getGenericReturnType;
        getGenericReturnType(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Method): Int32 \ {} = {
        import java.lang.reflect.Method.getModifiers(): Int32 \ {} as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Method): String \ {} = {
        import java.lang.reflect.Method.getName(): String \ {} as getName;
        getName(x0)
    }
    
    
    pub def getParameterAnnotations(x0: ##java.lang.reflect.Method): Array[Array[##java.lang.annotation.Annotation, Static], Static] \ {} = {
        import java.lang.reflect.Method.getParameterAnnotations(): Array[Array[##java.lang.annotation.Annotation, Static], Static] \ {} as getParameterAnnotations;
        getParameterAnnotations(x0)
    }
    
    
    pub def getParameterCount(x0: ##java.lang.reflect.Method): Int32 \ {} = {
        import java.lang.reflect.Method.getParameterCount(): Int32 \ {} as getParameterCount;
        getParameterCount(x0)
    }
    
    
    pub def getParameterTypes(x0: ##java.lang.reflect.Method): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.reflect.Method.getParameterTypes(): Array[##java.lang.Class, Static] \ {} as getParameterTypes;
        getParameterTypes(x0)
    }
    
    
    pub def getReturnType(x0: ##java.lang.reflect.Method): ##java.lang.Class \ {} = {
        import java.lang.reflect.Method.getReturnType(): ##java.lang.Class \ {} as getReturnType;
        getReturnType(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.reflect.Method): Array[##java.lang.reflect.TypeVariable, Static] \ {} = {
        import java.lang.reflect.Method.getTypeParameters(): Array[##java.lang.reflect.TypeVariable, Static] \ {} as getTypeParameters;
        getTypeParameters(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Method): Int32 \ {} = {
        import java.lang.reflect.Method.hashCode(): Int32 \ {} as hashCode;
        hashCode(x0)
    }
    
    
    pub def invoke(x0: ##java.lang.reflect.Method, x1: ##java.lang.Object, x2: Array[##java.lang.Object, Static]): Result[##java.lang.Exception, ##java.lang.Object] \ {} = {
        import java.lang.reflect.Method.invoke(##java.lang.Object, Array[##java.lang.Object, Static]): ##java.lang.Object \ {} as invoke;
        try {
            Ok(invoke(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def isBridge(x0: ##java.lang.reflect.Method): Bool \ {} = {
        import java.lang.reflect.Method.isBridge(): Bool \ {} as isBridge;
        isBridge(x0)
    }
    
    
    pub def isDefault(x0: ##java.lang.reflect.Method): Bool \ {} = {
        import java.lang.reflect.Method.isDefault(): Bool \ {} as isDefault;
        isDefault(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Method): Bool \ {} = {
        import java.lang.reflect.Method.isSynthetic(): Bool \ {} as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def isVarArgs(x0: ##java.lang.reflect.Method): Bool \ {} = {
        import java.lang.reflect.Method.isVarArgs(): Bool \ {} as isVarArgs;
        isVarArgs(x0)
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Method, x1: Bool): Unit \ IO = {
        import java.lang.reflect.Method.setAccessible(Bool): Unit \ IO as setAccessible;
        setAccessible(x0, x1)
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Method): String \ {} = {
        import java.lang.reflect.Method.toGenericString(): String \ {} as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Method): String \ {} = {
        import java.lang.reflect.Method.toString(): String \ {} as toString;
        toString(x0)
    }
}
