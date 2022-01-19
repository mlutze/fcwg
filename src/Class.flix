namespace Class {
    pub def getName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getName(): & Pure;
        getName(x0)
    }
    
    
    /// pub def forName(x0: ##java.lang.Module, x1: String): ##java.lang.Class & Pure = {
    ///     import static java.lang.Class.forName(##java.lang.Module, String): & Pure;
    ///     forName(x0, x1)
    /// }
    
    
    /// pub def forName(x0: String, x1: Bool, x2: ##java.lang.ClassLoader): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
    ///     import static java.lang.Class.forName(String, Bool, ##java.lang.ClassLoader): & Pure;
    ///     try {
    ///         Ok(forName(x0, x1, x2))
    ///     } catch {
    ///         case e: ##java.lang.Exception => Err(e)
    ///     }
    /// }
    
    
    pub def forName(x0: String): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import static java.lang.Class.forName(String): & Pure;
        try {
            Ok(forName(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toString(): & Pure;
        toString(x0)
    }
    
    
    pub def getModule(x0: ##java.lang.Class): ##java.lang.Module & Pure = {
        import java.lang.Class.getModule(): & Pure;
        getModule(x0)
    }
    
    
    pub def getProtectionDomain(x0: ##java.lang.Class): ##java.security.ProtectionDomain & Pure = {
        import java.lang.Class.getProtectionDomain(): & Pure;
        getProtectionDomain(x0)
    }
    
    
    pub def isAssignableFrom(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAssignableFrom(##java.lang.Class): & Pure;
        isAssignableFrom(x0, x1)
    }
    
    
    pub def isInstance(x0: ##java.lang.Class, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.Class.isInstance(##java.lang.Object): & Pure;
        isInstance(x0, x1)
    }
    
    
    pub def getModifiers(x0: ##java.lang.Class): Int32 & Pure = {
        import java.lang.Class.getModifiers(): & Pure;
        getModifiers(x0)
    }
    
    
    pub def isInterface(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isInterface(): & Pure;
        isInterface(x0)
    }
    
    
    pub def isArray(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isArray(): & Pure;
        isArray(x0)
    }
    
    
    pub def isPrimitive(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isPrimitive(): & Pure;
        isPrimitive(x0)
    }
    
    
    pub def getSuperclass(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getSuperclass(): & Pure;
        getSuperclass(x0)
    }
    
    
    pub def cast(x0: ##java.lang.Class, x1: ##java.lang.Object): ##java.lang.Object & Pure = {
        import java.lang.Class.cast(##java.lang.Object): & Pure;
        cast(x0, x1)
    }
    
    
    pub def componentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.componentType(): & Pure;
        componentType(x0)
    }
    
    
    pub def describeConstable(x0: ##java.lang.Class): ##java.util.Optional & Pure = {
        import java.lang.Class.describeConstable(): & Pure;
        describeConstable(x0)
    }
    
    
    pub def getComponentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getComponentType(): & Pure;
        getComponentType(x0)
    }
    
    
    pub def isAnnotation(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotation(): & Pure;
        isAnnotation(x0)
    }
    
    
    pub def isEnum(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isEnum(): & Pure;
        isEnum(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.Class): Array[##java.lang.reflect.TypeVariable] & Pure = {
        import java.lang.Class.getTypeParameters(): & Pure;
        getTypeParameters(x0)
    }
    
    
    pub def getClassLoader(x0: ##java.lang.Class): ##java.lang.ClassLoader & Pure = {
        import java.lang.Class.getClassLoader(): & Pure;
        getClassLoader(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.Class): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.Class.newInstance(): & Pure;
        try {
            Ok(newInstance(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getInterfaces(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getInterfaces(): & Pure;
        getInterfaces(x0)
    }
    
    
    pub def getEnclosingClass(x0: ##java.lang.Class): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingClass(): & Pure;
        try {
            Ok(getEnclosingClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getSimpleName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getSimpleName(): & Pure;
        getSimpleName(x0)
    }
    
    
    pub def getCanonicalName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getCanonicalName(): & Pure;
        getCanonicalName(x0)
    }
    
    
    pub def getResourceAsStream(x0: ##java.lang.Class, x1: String): ##java.io.InputStream & Pure = {
        import java.lang.Class.getResourceAsStream(String): & Pure;
        getResourceAsStream(x0, x1)
    }
    
    
    pub def getResource(x0: ##java.lang.Class, x1: String): ##java.net.URL & Pure = {
        import java.lang.Class.getResource(String): & Pure;
        getResource(x0, x1)
    }
    
    
    pub def getPackageName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getPackageName(): & Pure;
        getPackageName(x0)
    }
    
    
    pub def desiredAssertionStatus(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.desiredAssertionStatus(): & Pure;
        desiredAssertionStatus(x0)
    }
    
    
    pub def getMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class]): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getMethod(String, Array[##java.lang.Class]): & Pure;
        try {
            Ok(getMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def isAnnotationPresent(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotationPresent(##java.lang.Class): & Pure;
        isAnnotationPresent(x0, x1)
    }
    
    
    pub def descriptorString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.descriptorString(): & Pure;
        descriptorString(x0)
    }
    
    
    pub def arrayType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.arrayType(): & Pure;
        arrayType(x0)
    }
    
    
    pub def toGenericString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toGenericString(): & Pure;
        toGenericString(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isSynthetic(): & Pure;
        isSynthetic(x0)
    }
    
    
    pub def getGenericSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.Type & Pure = {
        import java.lang.Class.getGenericSuperclass(): & Pure;
        getGenericSuperclass(x0)
    }
    
    
    pub def getPackage(x0: ##java.lang.Class): ##java.lang.Package & Pure = {
        import java.lang.Class.getPackage(): & Pure;
        getPackage(x0)
    }
    
    
    pub def getGenericInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.Type] & Pure = {
        import java.lang.Class.getGenericInterfaces(): & Pure;
        getGenericInterfaces(x0)
    }
    
    
    pub def getSigners(x0: ##java.lang.Class): Array[##java.lang.Object] & Pure = {
        import java.lang.Class.getSigners(): & Pure;
        getSigners(x0)
    }
    
    
    pub def getEnclosingMethod(x0: ##java.lang.Class): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingMethod(): & Pure;
        try {
            Ok(getEnclosingMethod(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingConstructor(x0: ##java.lang.Class): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getEnclosingConstructor(): & Pure;
        try {
            Ok(getEnclosingConstructor(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.Class): Result[##java.lang.Class, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaringClass(): & Pure;
        try {
            Ok(getDeclaringClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getTypeName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getTypeName(): & Pure;
        getTypeName(x0)
    }
    
    
    pub def isAnonymousClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnonymousClass(): & Pure;
        isAnonymousClass(x0)
    }
    
    
    pub def isLocalClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isLocalClass(): & Pure;
        isLocalClass(x0)
    }
    
    
    pub def isMemberClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isMemberClass(): & Pure;
        isMemberClass(x0)
    }
    
    
    pub def getClasses(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getClasses(): & Pure;
        getClasses(x0)
    }
    
    
    pub def getFields(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Field], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getFields(): & Pure;
        try {
            Ok(getFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getMethods(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Method], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getMethods(): & Pure;
        try {
            Ok(getMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getConstructors(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Constructor], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getConstructors(): & Pure;
        try {
            Ok(getConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getField(x0: ##java.lang.Class, x1: String): Result[##java.lang.reflect.Field, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getField(String): & Pure;
        try {
            Ok(getField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class]): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getConstructor(Array[##java.lang.Class]): & Pure;
        try {
            Ok(getConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredClasses(x0: ##java.lang.Class): Result[Array[##java.lang.Class], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredClasses(): & Pure;
        try {
            Ok(getDeclaredClasses(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredFields(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Field], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredFields(): & Pure;
        try {
            Ok(getDeclaredFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethods(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Method], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredMethods(): & Pure;
        try {
            Ok(getDeclaredMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructors(x0: ##java.lang.Class): Result[Array[##java.lang.reflect.Constructor], ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredConstructors(): & Pure;
        try {
            Ok(getDeclaredConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredField(x0: ##java.lang.Class, x1: String): Result[##java.lang.reflect.Field, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredField(String): & Pure;
        try {
            Ok(getDeclaredField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class]): Result[##java.lang.reflect.Method, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredMethod(String, Array[##java.lang.Class]): & Pure;
        try {
            Ok(getDeclaredMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class]): Result[##java.lang.reflect.Constructor, ##java.lang.Exception] & Pure = {
        import java.lang.Class.getDeclaredConstructor(Array[##java.lang.Class]): & Pure;
        try {
            Ok(getDeclaredConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnumConstants(x0: ##java.lang.Class): Array[##java.lang.Object] & Pure = {
        import java.lang.Class.getEnumConstants(): & Pure;
        getEnumConstants(x0)
    }
    
    
    pub def asSubclass(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.asSubclass(##java.lang.Class): & Pure;
        asSubclass(x0, x1)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getAnnotation(##java.lang.Class): & Pure;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getAnnotationsByType(##java.lang.Class): & Pure;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getAnnotations(): & Pure;
        getAnnotations(x0)
    }
    
    
    pub def getDeclaredAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getDeclaredAnnotation(##java.lang.Class): & Pure;
        getDeclaredAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getDeclaredAnnotationsByType(##java.lang.Class): & Pure;
        getDeclaredAnnotationsByType(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.Class.getDeclaredAnnotations(): & Pure;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getAnnotatedSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.Class.getAnnotatedSuperclass(): & Pure;
        getAnnotatedSuperclass(x0)
    }
    
    
    pub def getAnnotatedInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.AnnotatedType] & Pure = {
        import java.lang.Class.getAnnotatedInterfaces(): & Pure;
        getAnnotatedInterfaces(x0)
    }
    
    
    pub def getNestHost(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getNestHost(): & Pure;
        getNestHost(x0)
    }
    
    
    pub def isNestmateOf(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isNestmateOf(##java.lang.Class): & Pure;
        isNestmateOf(x0, x1)
    }
    
    
    pub def getNestMembers(x0: ##java.lang.Class): Array[##java.lang.Class] & Pure = {
        import java.lang.Class.getNestMembers(): & Pure;
        getNestMembers(x0)
    }
}
