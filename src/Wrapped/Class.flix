mod Wrapped.Class {
    pub def arrayType(x0: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.arrayType(): ##java.lang.Class \ {} as arrayType;
        arrayType(x0)
    }
    
    
    pub def asSubclass(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.asSubclass(##java.lang.Class): ##java.lang.Class \ {} as asSubclass;
        asSubclass(x0, x1)
    }
    
    
    pub def cast(x0: ##java.lang.Class, x1: ##java.lang.Object): ##java.lang.Object \ {} = {
        import java.lang.Class.cast(##java.lang.Object): ##java.lang.Object \ {} as cast;
        cast(x0, x1)
    }
    
    
    pub def componentType(x0: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.componentType(): ##java.lang.Class \ {} as componentType;
        componentType(x0)
    }
    
    
    pub def describeConstable(x0: ##java.lang.Class): ##java.util.Optional \ {} = {
        import java.lang.Class.describeConstable(): ##java.util.Optional \ {} as describeConstable;
        describeConstable(x0)
    }
    
    
    pub def descriptorString(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.descriptorString(): String \ {} as descriptorString;
        descriptorString(x0)
    }
    
    
    pub def desiredAssertionStatus(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.desiredAssertionStatus(): Bool \ {} as desiredAssertionStatus;
        desiredAssertionStatus(x0)
    }
    
    
    pub def forNameModuleString(x0: ##java.lang.Module, x1: String): ##java.lang.Class \ {} = {
        import static java.lang.Class.forName(##java.lang.Module, String): ##java.lang.Class \ {} as forName;
        forName(x0, x1)
    }
    
    
    pub def forNameString(x0: String): Result[##java.lang.Exception, ##java.lang.Class] \ {} = {
        import static java.lang.Class.forName(String): ##java.lang.Class \ {} as forName;
        try {
            Ok(forName(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def forNameStringBoolClassLoader(x0: String, x1: Bool, x2: ##java.lang.ClassLoader): Result[##java.lang.Exception, ##java.lang.Class] \ {} = {
        import static java.lang.Class.forName(String, Bool, ##java.lang.ClassLoader): ##java.lang.Class \ {} as forName;
        try {
            Ok(forName(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getAnnotatedInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.AnnotatedType, Static] \ {} = {
        import java.lang.Class.getAnnotatedInterfaces(): Array[##java.lang.reflect.AnnotatedType, Static] \ {} as getAnnotatedInterfaces;
        getAnnotatedInterfaces(x0)
    }
    
    
    pub def getAnnotatedSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.AnnotatedType \ {} = {
        import java.lang.Class.getAnnotatedSuperclass(): ##java.lang.reflect.AnnotatedType \ {} as getAnnotatedSuperclass;
        getAnnotatedSuperclass(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation \ {} = {
        import java.lang.Class.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation \ {} as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} = {
        import java.lang.Class.getAnnotations(): Array[##java.lang.annotation.Annotation, Static] \ {} as getAnnotations;
        getAnnotations(x0)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} = {
        import java.lang.Class.getAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} as getAnnotationsByType;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getCanonicalName(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.getCanonicalName(): String \ {} as getCanonicalName;
        getCanonicalName(x0)
    }
    
    
    pub def getClassLoader(x0: ##java.lang.Class): ##java.lang.ClassLoader \ {} = {
        import java.lang.Class.getClassLoader(): ##java.lang.ClassLoader \ {} as getClassLoader;
        getClassLoader(x0)
    }
    
    
    pub def getClasses(x0: ##java.lang.Class): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.Class.getClasses(): Array[##java.lang.Class, Static] \ {} as getClasses;
        getClasses(x0)
    }
    
    
    pub def getComponentType(x0: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.getComponentType(): ##java.lang.Class \ {} as getComponentType;
        getComponentType(x0)
    }
    
    
    pub def getConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] \ {} = {
        import java.lang.Class.getConstructor(Array[##java.lang.Class, Static]): ##java.lang.reflect.Constructor \ {} as getConstructor;
        try {
            Ok(getConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getConstructors(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Constructor, Static]] \ {} = {
        import java.lang.Class.getConstructors(): Array[##java.lang.reflect.Constructor, Static] \ {} as getConstructors;
        try {
            Ok(getConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation \ {} = {
        import java.lang.Class.getDeclaredAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation \ {} as getDeclaredAnnotation;
        getDeclaredAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} = {
        import java.lang.Class.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] \ {} as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaredAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} = {
        import java.lang.Class.getDeclaredAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] \ {} as getDeclaredAnnotationsByType;
        getDeclaredAnnotationsByType(x0, x1)
    }
    
    
    pub def getDeclaredClasses(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.Class, Static]] \ {} = {
        import java.lang.Class.getDeclaredClasses(): Array[##java.lang.Class, Static] \ {} as getDeclaredClasses;
        try {
            Ok(getDeclaredClasses(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] \ {} = {
        import java.lang.Class.getDeclaredConstructor(Array[##java.lang.Class, Static]): ##java.lang.reflect.Constructor \ {} as getDeclaredConstructor;
        try {
            Ok(getDeclaredConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructors(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Constructor, Static]] \ {} = {
        import java.lang.Class.getDeclaredConstructors(): Array[##java.lang.reflect.Constructor, Static] \ {} as getDeclaredConstructors;
        try {
            Ok(getDeclaredConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredField(x0: ##java.lang.Class, x1: String): Result[##java.lang.Exception, ##java.lang.reflect.Field] \ {} = {
        import java.lang.Class.getDeclaredField(String): ##java.lang.reflect.Field \ {} as getDeclaredField;
        try {
            Ok(getDeclaredField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredFields(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Field, Static]] \ {} = {
        import java.lang.Class.getDeclaredFields(): Array[##java.lang.reflect.Field, Static] \ {} as getDeclaredFields;
        try {
            Ok(getDeclaredFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Method] \ {} = {
        import java.lang.Class.getDeclaredMethod(String, Array[##java.lang.Class, Static]): ##java.lang.reflect.Method \ {} as getDeclaredMethod;
        try {
            Ok(getDeclaredMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethods(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Method, Static]] \ {} = {
        import java.lang.Class.getDeclaredMethods(): Array[##java.lang.reflect.Method, Static] \ {} as getDeclaredMethods;
        try {
            Ok(getDeclaredMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Class] \ {} = {
        import java.lang.Class.getDeclaringClass(): ##java.lang.Class \ {} as getDeclaringClass;
        try {
            Ok(getDeclaringClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingClass(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Class] \ {} = {
        import java.lang.Class.getEnclosingClass(): ##java.lang.Class \ {} as getEnclosingClass;
        try {
            Ok(getEnclosingClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingConstructor(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] \ {} = {
        import java.lang.Class.getEnclosingConstructor(): ##java.lang.reflect.Constructor \ {} as getEnclosingConstructor;
        try {
            Ok(getEnclosingConstructor(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingMethod(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.reflect.Method] \ {} = {
        import java.lang.Class.getEnclosingMethod(): ##java.lang.reflect.Method \ {} as getEnclosingMethod;
        try {
            Ok(getEnclosingMethod(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnumConstants(x0: ##java.lang.Class): Array[##java.lang.Object, Static] \ {} = {
        import java.lang.Class.getEnumConstants(): Array[##java.lang.Object, Static] \ {} as getEnumConstants;
        getEnumConstants(x0)
    }
    
    
    pub def getField(x0: ##java.lang.Class, x1: String): Result[##java.lang.Exception, ##java.lang.reflect.Field] \ {} = {
        import java.lang.Class.getField(String): ##java.lang.reflect.Field \ {} as getField;
        try {
            Ok(getField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getFields(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Field, Static]] \ {} = {
        import java.lang.Class.getFields(): Array[##java.lang.reflect.Field, Static] \ {} as getFields;
        try {
            Ok(getFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getGenericInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.Type, Static] \ {} = {
        import java.lang.Class.getGenericInterfaces(): Array[##java.lang.reflect.Type, Static] \ {} as getGenericInterfaces;
        getGenericInterfaces(x0)
    }
    
    
    pub def getGenericSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.Type \ {} = {
        import java.lang.Class.getGenericSuperclass(): ##java.lang.reflect.Type \ {} as getGenericSuperclass;
        getGenericSuperclass(x0)
    }
    
    
    pub def getInterfaces(x0: ##java.lang.Class): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.Class.getInterfaces(): Array[##java.lang.Class, Static] \ {} as getInterfaces;
        getInterfaces(x0)
    }
    
    
    pub def getMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Method] \ {} = {
        import java.lang.Class.getMethod(String, Array[##java.lang.Class, Static]): ##java.lang.reflect.Method \ {} as getMethod;
        try {
            Ok(getMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getMethods(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Method, Static]] \ {} = {
        import java.lang.Class.getMethods(): Array[##java.lang.reflect.Method, Static] \ {} as getMethods;
        try {
            Ok(getMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getModifiers(x0: ##java.lang.Class): Int32 \ {} = {
        import java.lang.Class.getModifiers(): Int32 \ {} as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getModule(x0: ##java.lang.Class): ##java.lang.Module \ {} = {
        import java.lang.Class.getModule(): ##java.lang.Module \ {} as getModule;
        getModule(x0)
    }
    
    
    pub def getName(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.getName(): String \ {} as getName;
        getName(x0)
    }
    
    
    pub def getNestHost(x0: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.getNestHost(): ##java.lang.Class \ {} as getNestHost;
        getNestHost(x0)
    }
    
    
    pub def getNestMembers(x0: ##java.lang.Class): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.Class.getNestMembers(): Array[##java.lang.Class, Static] \ {} as getNestMembers;
        getNestMembers(x0)
    }
    
    
    pub def getPackage(x0: ##java.lang.Class): ##java.lang.Package \ {} = {
        import java.lang.Class.getPackage(): ##java.lang.Package \ {} as getPackage;
        getPackage(x0)
    }
    
    
    pub def getPackageName(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.getPackageName(): String \ {} as getPackageName;
        getPackageName(x0)
    }
    
    
    pub def getPermittedSubclasses(x0: ##java.lang.Class): Array[##java.lang.Class, Static] \ {} = {
        import java.lang.Class.getPermittedSubclasses(): Array[##java.lang.Class, Static] \ {} as getPermittedSubclasses;
        getPermittedSubclasses(x0)
    }
    
    
    pub def getProtectionDomain(x0: ##java.lang.Class): ##java.security.ProtectionDomain \ {} = {
        import java.lang.Class.getProtectionDomain(): ##java.security.ProtectionDomain \ {} as getProtectionDomain;
        getProtectionDomain(x0)
    }
    
    
    pub def getRecordComponents(x0: ##java.lang.Class): Array[##java.lang.reflect.RecordComponent, Static] \ {} = {
        import java.lang.Class.getRecordComponents(): Array[##java.lang.reflect.RecordComponent, Static] \ {} as getRecordComponents;
        getRecordComponents(x0)
    }
    
    
    pub def getResource(x0: ##java.lang.Class, x1: String): ##java.net.URL \ {} = {
        import java.lang.Class.getResource(String): ##java.net.URL \ {} as getResource;
        getResource(x0, x1)
    }
    
    
    pub def getResourceAsStream(x0: ##java.lang.Class, x1: String): ##java.io.InputStream \ {} = {
        import java.lang.Class.getResourceAsStream(String): ##java.io.InputStream \ {} as getResourceAsStream;
        getResourceAsStream(x0, x1)
    }
    
    
    pub def getSigners(x0: ##java.lang.Class): Array[##java.lang.Object, Static] \ {} = {
        import java.lang.Class.getSigners(): Array[##java.lang.Object, Static] \ {} as getSigners;
        getSigners(x0)
    }
    
    
    pub def getSimpleName(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.getSimpleName(): String \ {} as getSimpleName;
        getSimpleName(x0)
    }
    
    
    pub def getSuperclass(x0: ##java.lang.Class): ##java.lang.Class \ {} = {
        import java.lang.Class.getSuperclass(): ##java.lang.Class \ {} as getSuperclass;
        getSuperclass(x0)
    }
    
    
    pub def getTypeName(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.getTypeName(): String \ {} as getTypeName;
        getTypeName(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.Class): Array[##java.lang.reflect.TypeVariable, Static] \ {} = {
        import java.lang.Class.getTypeParameters(): Array[##java.lang.reflect.TypeVariable, Static] \ {} as getTypeParameters;
        getTypeParameters(x0)
    }
    
    
    pub def isAnnotation(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isAnnotation(): Bool \ {} as isAnnotation;
        isAnnotation(x0)
    }
    
    
    pub def isAnnotationPresent(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isAnnotationPresent(##java.lang.Class): Bool \ {} as isAnnotationPresent;
        isAnnotationPresent(x0, x1)
    }
    
    
    pub def isAnonymousClass(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isAnonymousClass(): Bool \ {} as isAnonymousClass;
        isAnonymousClass(x0)
    }
    
    
    pub def isArray(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isArray(): Bool \ {} as isArray;
        isArray(x0)
    }
    
    
    pub def isAssignableFrom(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isAssignableFrom(##java.lang.Class): Bool \ {} as isAssignableFrom;
        isAssignableFrom(x0, x1)
    }
    
    
    pub def isEnum(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isEnum(): Bool \ {} as isEnum;
        isEnum(x0)
    }
    
    
    pub def isHidden(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isHidden(): Bool \ {} as isHidden;
        isHidden(x0)
    }
    
    
    pub def isInstance(x0: ##java.lang.Class, x1: ##java.lang.Object): Bool \ {} = {
        import java.lang.Class.isInstance(##java.lang.Object): Bool \ {} as isInstance;
        isInstance(x0, x1)
    }
    
    
    pub def isInterface(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isInterface(): Bool \ {} as isInterface;
        isInterface(x0)
    }
    
    
    pub def isLocalClass(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isLocalClass(): Bool \ {} as isLocalClass;
        isLocalClass(x0)
    }
    
    
    pub def isMemberClass(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isMemberClass(): Bool \ {} as isMemberClass;
        isMemberClass(x0)
    }
    
    
    pub def isNestmateOf(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isNestmateOf(##java.lang.Class): Bool \ {} as isNestmateOf;
        isNestmateOf(x0, x1)
    }
    
    
    pub def isPrimitive(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isPrimitive(): Bool \ {} as isPrimitive;
        isPrimitive(x0)
    }
    
    
    pub def isRecord(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isRecord(): Bool \ {} as isRecord;
        isRecord(x0)
    }
    
    
    pub def isSealed(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isSealed(): Bool \ {} as isSealed;
        isSealed(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.Class): Bool \ {} = {
        import java.lang.Class.isSynthetic(): Bool \ {} as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Object] \ {} = {
        import java.lang.Class.newInstance(): ##java.lang.Object \ {} as newInstance;
        try {
            Ok(newInstance(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toGenericString(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.toGenericString(): String \ {} as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.Class): String \ {} = {
        import java.lang.Class.toString(): String \ {} as toString;
        toString(x0)
    }
}
