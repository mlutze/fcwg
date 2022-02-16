namespace Wrapped/Class {
    pub def arrayType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.arrayType(): ##java.lang.Class & Pure;
        arrayType(x0)
    }
    
    
    pub def asSubclass(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.asSubclass(##java.lang.Class): ##java.lang.Class & Pure;
        asSubclass(x0, x1)
    }
    
    
    pub def cast(x0: ##java.lang.Class, x1: ##java.lang.Object): ##java.lang.Object & Pure = {
        import java.lang.Class.cast(##java.lang.Object): ##java.lang.Object & Pure;
        cast(x0, x1)
    }
    
    
    pub def componentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.componentType(): ##java.lang.Class & Pure;
        componentType(x0)
    }
    
    
    pub def describeConstable(x0: ##java.lang.Class): ##java.util.Optional & Pure = {
        import java.lang.Class.describeConstable(): ##java.util.Optional & Pure;
        describeConstable(x0)
    }
    
    
    pub def descriptorString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.descriptorString(): String & Pure;
        descriptorString(x0)
    }
    
    
    pub def desiredAssertionStatus(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.desiredAssertionStatus(): Bool & Pure;
        desiredAssertionStatus(x0)
    }
    
    
    pub def forName(x0: String): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import static java.lang.Class.forName(String): ##java.lang.Class & Pure;
        try {
            Ok(forName(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    /// pub def forName(x0: String, x1: Bool, x2: ##java.lang.ClassLoader): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
    ///     import static java.lang.Class.forName(String, Bool, ##java.lang.ClassLoader): ##java.lang.Class & Pure;
    ///     try {
    ///         Ok(forName(x0, x1, x2))
    ///     } catch {
    ///         case e: ##java.lang.Exception => Err(e)
    ///     }
    /// }
    
    
    /// pub def forName(x0: ##java.lang.Module, x1: String): ##java.lang.Class & Pure = {
    ///     import static java.lang.Class.forName(##java.lang.Module, String): ##java.lang.Class & Pure;
    ///     forName(x0, x1)
    /// }
    
    
    pub def getAnnotatedInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.AnnotatedType] & Pure = {
        import java.lang.Class.getAnnotatedInterfaces(): Array[##java.lang.reflect.AnnotatedType] & Pure;
        getAnnotatedInterfaces(x0)
    }
    
    
    pub def getAnnotatedSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.Class.getAnnotatedSuperclass(): ##java.lang.reflect.AnnotatedType & Pure;
        getAnnotatedSuperclass(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getAnnotations(): Array[##java.lang.annotation.Annotation] & Pure;
        getAnnotations(x0)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getCanonicalName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getCanonicalName(): String & Pure;
        getCanonicalName(x0)
    }
    
    
    pub def getClassLoader(x0: ##java.lang.Class): ##java.lang.ClassLoader & Pure = {
        import java.lang.Class.getClassLoader(): ##java.lang.ClassLoader & Pure;
        getClassLoader(x0)
    }
    
    
    pub def getClasses(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getClasses(): Array[##java.lang.Class] & Pure;
        getClasses(x0)
    }
    
    
    pub def getComponentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getComponentType(): ##java.lang.Class & Pure;
        getComponentType(x0)
    }
    
    
    pub def getConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class]): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getConstructor(Array[##java.lang.Class]): ##java.lang.reflect.Constructor & Pure;
        try {
            Ok(getConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getConstructors(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Constructor], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getConstructors(): Array[##java.lang.reflect.Constructor] & Pure;
        try {
            Ok(getConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getDeclaredAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure;
        getDeclaredAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation] & Pure;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaredAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getDeclaredAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure;
        getDeclaredAnnotationsByType(x0, x1)
    }
    
    
    pub def getDeclaredClasses(x0: ##java.lang.Class): Result[Array[##java.lang.Class], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredClasses(): Array[##java.lang.Class] & Pure;
        try {
            Ok(getDeclaredClasses(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class]): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredConstructor(Array[##java.lang.Class]): ##java.lang.reflect.Constructor & Pure;
        try {
            Ok(getDeclaredConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructors(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Constructor], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredConstructors(): Array[##java.lang.reflect.Constructor] & Pure;
        try {
            Ok(getDeclaredConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredField(x0: ##java.lang.Class, x1: String): Result[##java.lang.reflect.Field, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredField(String): ##java.lang.reflect.Field & Pure;
        try {
            Ok(getDeclaredField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredFields(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Field], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredFields(): Array[##java.lang.reflect.Field] & Pure;
        try {
            Ok(getDeclaredFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class]): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredMethod(String, Array[##java.lang.Class]): ##java.lang.reflect.Method & Pure;
        try {
            Ok(getDeclaredMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethods(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Method], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredMethods(): Array[##java.lang.reflect.Method] & Pure;
        try {
            Ok(getDeclaredMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.Class): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaringClass(): ##java.lang.Class & Pure;
        try {
            Ok(getDeclaringClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingClass(x0: ##java.lang.Class): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingClass(): ##java.lang.Class & Pure;
        try {
            Ok(getEnclosingClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingConstructor(x0: ##java.lang.Class): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingConstructor(): ##java.lang.reflect.Constructor & Pure;
        try {
            Ok(getEnclosingConstructor(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingMethod(x0: ##java.lang.Class): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingMethod(): ##java.lang.reflect.Method & Pure;
        try {
            Ok(getEnclosingMethod(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnumConstants(x0: ##java.lang.Class): Array[##java.lang.Object] & Pure = {
        import java.lang.Class.getEnumConstants(): Array[##java.lang.Object] & Pure;
        getEnumConstants(x0)
    }
    
    
    pub def getField(x0: ##java.lang.Class, x1: String): Result[##java.lang.reflect.Field, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getField(String): ##java.lang.reflect.Field & Pure;
        try {
            Ok(getField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getFields(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Field], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getFields(): Array[##java.lang.reflect.Field] & Pure;
        try {
            Ok(getFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getGenericInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.Class.getGenericInterfaces(): Array[##java.lang.reflect.Type] & Pure;
        getGenericInterfaces(x0)
    }
    
    
    pub def getGenericSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.Type & Pure = {
        import java.lang.Class.getGenericSuperclass(): ##java.lang.reflect.Type & Pure;
        getGenericSuperclass(x0)
    }
    
    
    pub def getInterfaces(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getInterfaces(): Array[##java.lang.Class] & Pure;
        getInterfaces(x0)
    }
    
    
    pub def getMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class]): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getMethod(String, Array[##java.lang.Class]): ##java.lang.reflect.Method & Pure;
        try {
            Ok(getMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getMethods(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Method], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getMethods(): Array[##java.lang.reflect.Method] & Pure;
        try {
            Ok(getMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getModifiers(x0: ##java.lang.Class): Int32 & Pure = {
        import java.lang.Class.getModifiers(): Int32 & Pure;
        getModifiers(x0)
    }
    
    
    pub def getModule(x0: ##java.lang.Class): ##java.lang.Module & Pure = {
        import java.lang.Class.getModule(): ##java.lang.Module & Pure;
        getModule(x0)
    }
    
    
    pub def getName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getName(): String & Pure;
        getName(x0)
    }
    
    
    pub def getNestHost(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getNestHost(): ##java.lang.Class & Pure;
        getNestHost(x0)
    }
    
    
    pub def getNestMembers(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getNestMembers(): Array[##java.lang.Class] & Pure;
        getNestMembers(x0)
    }
    
    
    pub def getPackage(x0: ##java.lang.Class): ##java.lang.Package & Pure = {
        import java.lang.Class.getPackage(): ##java.lang.Package & Pure;
        getPackage(x0)
    }
    
    
    pub def getPackageName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getPackageName(): String & Pure;
        getPackageName(x0)
    }
    
    
    pub def getProtectionDomain(x0: ##java.lang.Class): ##java.security.ProtectionDomain & Pure = {
        import java.lang.Class.getProtectionDomain(): ##java.security.ProtectionDomain & Pure;
        getProtectionDomain(x0)
    }
    
    
    pub def getResource(x0: ##java.lang.Class, x1: String): ##java.net.URL & Pure = {
        import java.lang.Class.getResource(String): ##java.net.URL & Pure;
        getResource(x0, x1)
    }
    
    
    pub def getResourceAsStream(x0: ##java.lang.Class, x1: String): ##java.io.InputStream & Pure = {
        import java.lang.Class.getResourceAsStream(String): ##java.io.InputStream & Pure;
        getResourceAsStream(x0, x1)
    }
    
    
    pub def getSigners(x0: ##java.lang.Class): Array[##java.lang.Object] & Pure = {
        import java.lang.Class.getSigners(): Array[##java.lang.Object] & Pure;
        getSigners(x0)
    }
    
    
    pub def getSimpleName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getSimpleName(): String & Pure;
        getSimpleName(x0)
    }
    
    
    pub def getSuperclass(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getSuperclass(): ##java.lang.Class & Pure;
        getSuperclass(x0)
    }
    
    
    pub def getTypeName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getTypeName(): String & Pure;
        getTypeName(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.Class): Array[##java.lang.reflect.TypeVariable] & Pure = {
        import java.lang.Class.getTypeParameters(): Array[##java.lang.reflect.TypeVariable] & Pure;
        getTypeParameters(x0)
    }
    
    
    pub def isAnnotation(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotation(): Bool & Pure;
        isAnnotation(x0)
    }
    
    
    pub def isAnnotationPresent(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotationPresent(##java.lang.Class): Bool & Pure;
        isAnnotationPresent(x0, x1)
    }
    
    
    pub def isAnonymousClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnonymousClass(): Bool & Pure;
        isAnonymousClass(x0)
    }
    
    
    pub def isArray(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isArray(): Bool & Pure;
        isArray(x0)
    }
    
    
    pub def isAssignableFrom(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAssignableFrom(##java.lang.Class): Bool & Pure;
        isAssignableFrom(x0, x1)
    }
    
    
    pub def isEnum(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isEnum(): Bool & Pure;
        isEnum(x0)
    }
    
    
    pub def isInstance(x0: ##java.lang.Class, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.Class.isInstance(##java.lang.Object): Bool & Pure;
        isInstance(x0, x1)
    }
    
    
    pub def isInterface(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isInterface(): Bool & Pure;
        isInterface(x0)
    }
    
    
    pub def isLocalClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isLocalClass(): Bool & Pure;
        isLocalClass(x0)
    }
    
    
    pub def isMemberClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isMemberClass(): Bool & Pure;
        isMemberClass(x0)
    }
    
    
    pub def isNestmateOf(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isNestmateOf(##java.lang.Class): Bool & Pure;
        isNestmateOf(x0, x1)
    }
    
    
    pub def isPrimitive(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isPrimitive(): Bool & Pure;
        isPrimitive(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isSynthetic(): Bool & Pure;
        isSynthetic(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.Class): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.Class.newInstance(): ##java.lang.Object & Pure;
        try {
            Ok(newInstance(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toGenericString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toGenericString(): String & Pure;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toString(): String & Pure;
        toString(x0)
    }
}
