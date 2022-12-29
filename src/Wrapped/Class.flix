namespace Wrapped/Class {
    pub def arrayType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.arrayType(): ##java.lang.Class & Pure as arrayType;
        arrayType(x0)
    }
    
    
    pub def asSubclass(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.asSubclass(##java.lang.Class): ##java.lang.Class & Pure as asSubclass;
        asSubclass(x0, x1)
    }
    
    
    pub def cast(x0: ##java.lang.Class, x1: ##java.lang.Object): ##java.lang.Object & Pure = {
        import java.lang.Class.cast(##java.lang.Object): ##java.lang.Object & Pure as cast;
        cast(x0, x1)
    }
    
    
    pub def componentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.componentType(): ##java.lang.Class & Pure as componentType;
        componentType(x0)
    }
    
    
    pub def describeConstable(x0: ##java.lang.Class): ##java.util.Optional & Pure = {
        import java.lang.Class.describeConstable(): ##java.util.Optional & Pure as describeConstable;
        describeConstable(x0)
    }
    
    
    pub def descriptorString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.descriptorString(): String & Pure as descriptorString;
        descriptorString(x0)
    }
    
    
    pub def desiredAssertionStatus(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.desiredAssertionStatus(): Bool & Pure as desiredAssertionStatus;
        desiredAssertionStatus(x0)
    }
    
    
    pub def forNameModuleString(x0: ##java.lang.Module, x1: String): ##java.lang.Class & Pure = {
        import static java.lang.Class.forName(##java.lang.Module, String): ##java.lang.Class & Pure as forName;
        forName(x0, x1)
    }
    
    
    pub def forNameString(x0: String): Result[##java.lang.Exception, ##java.lang.Class] & Pure = {
        import static java.lang.Class.forName(String): ##java.lang.Class & Pure as forName;
        try {
            Ok(forName(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def forNameStringBoolClassLoader(x0: String, x1: Bool, x2: ##java.lang.ClassLoader): Result[##java.lang.Exception, ##java.lang.Class] & Pure = {
        import static java.lang.Class.forName(String, Bool, ##java.lang.ClassLoader): ##java.lang.Class & Pure as forName;
        try {
            Ok(forName(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getAnnotatedInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.AnnotatedType, Static] & Pure = {
        import java.lang.Class.getAnnotatedInterfaces(): Array[##java.lang.reflect.AnnotatedType, Static] & Pure as getAnnotatedInterfaces;
        getAnnotatedInterfaces(x0)
    }
    
    
    pub def getAnnotatedSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.Class.getAnnotatedSuperclass(): ##java.lang.reflect.AnnotatedType & Pure as getAnnotatedSuperclass;
        getAnnotatedSuperclass(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.Class.getAnnotations(): Array[##java.lang.annotation.Annotation, Static] & Pure as getAnnotations;
        getAnnotations(x0)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.Class.getAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure as getAnnotationsByType;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getCanonicalName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getCanonicalName(): String & Pure as getCanonicalName;
        getCanonicalName(x0)
    }
    
    
    pub def getClassLoader(x0: ##java.lang.Class): ##java.lang.ClassLoader & Pure = {
        import java.lang.Class.getClassLoader(): ##java.lang.ClassLoader & Pure as getClassLoader;
        getClassLoader(x0)
    }
    
    
    pub def getClasses(x0: ##java.lang.Class): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.Class.getClasses(): Array[##java.lang.Class, Static] & Pure as getClasses;
        getClasses(x0)
    }
    
    
    pub def getComponentType(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getComponentType(): ##java.lang.Class & Pure as getComponentType;
        getComponentType(x0)
    }
    
    
    pub def getConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] & Pure = {
        import java.lang.Class.getConstructor(Array[##java.lang.Class, Static]): ##java.lang.reflect.Constructor & Pure as getConstructor;
        try {
            Ok(getConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getConstructors(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Constructor, Static]] & Pure = {
        import java.lang.Class.getConstructors(): Array[##java.lang.reflect.Constructor, Static] & Pure as getConstructors;
        try {
            Ok(getConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredAnnotation(x0: ##java.lang.Class, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.Class.getDeclaredAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure as getDeclaredAnnotation;
        getDeclaredAnnotation(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.Class.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] & Pure as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaredAnnotationsByType(x0: ##java.lang.Class, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.Class.getDeclaredAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure as getDeclaredAnnotationsByType;
        getDeclaredAnnotationsByType(x0, x1)
    }
    
    
    pub def getDeclaredClasses(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.Class, Static]] & Pure = {
        import java.lang.Class.getDeclaredClasses(): Array[##java.lang.Class, Static] & Pure as getDeclaredClasses;
        try {
            Ok(getDeclaredClasses(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructor(x0: ##java.lang.Class, x1: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] & Pure = {
        import java.lang.Class.getDeclaredConstructor(Array[##java.lang.Class, Static]): ##java.lang.reflect.Constructor & Pure as getDeclaredConstructor;
        try {
            Ok(getDeclaredConstructor(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredConstructors(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Constructor, Static]] & Pure = {
        import java.lang.Class.getDeclaredConstructors(): Array[##java.lang.reflect.Constructor, Static] & Pure as getDeclaredConstructors;
        try {
            Ok(getDeclaredConstructors(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredField(x0: ##java.lang.Class, x1: String): Result[##java.lang.Exception, ##java.lang.reflect.Field] & Pure = {
        import java.lang.Class.getDeclaredField(String): ##java.lang.reflect.Field & Pure as getDeclaredField;
        try {
            Ok(getDeclaredField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredFields(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Field, Static]] & Pure = {
        import java.lang.Class.getDeclaredFields(): Array[##java.lang.reflect.Field, Static] & Pure as getDeclaredFields;
        try {
            Ok(getDeclaredFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Method] & Pure = {
        import java.lang.Class.getDeclaredMethod(String, Array[##java.lang.Class, Static]): ##java.lang.reflect.Method & Pure as getDeclaredMethod;
        try {
            Ok(getDeclaredMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredMethods(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Method, Static]] & Pure = {
        import java.lang.Class.getDeclaredMethods(): Array[##java.lang.reflect.Method, Static] & Pure as getDeclaredMethods;
        try {
            Ok(getDeclaredMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Class] & Pure = {
        import java.lang.Class.getDeclaringClass(): ##java.lang.Class & Pure as getDeclaringClass;
        try {
            Ok(getDeclaringClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingClass(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Class] & Pure = {
        import java.lang.Class.getEnclosingClass(): ##java.lang.Class & Pure as getEnclosingClass;
        try {
            Ok(getEnclosingClass(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingConstructor(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.reflect.Constructor] & Pure = {
        import java.lang.Class.getEnclosingConstructor(): ##java.lang.reflect.Constructor & Pure as getEnclosingConstructor;
        try {
            Ok(getEnclosingConstructor(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnclosingMethod(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.reflect.Method] & Pure = {
        import java.lang.Class.getEnclosingMethod(): ##java.lang.reflect.Method & Pure as getEnclosingMethod;
        try {
            Ok(getEnclosingMethod(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getEnumConstants(x0: ##java.lang.Class): Array[##java.lang.Object, Static] & Pure = {
        import java.lang.Class.getEnumConstants(): Array[##java.lang.Object, Static] & Pure as getEnumConstants;
        getEnumConstants(x0)
    }
    
    
    pub def getField(x0: ##java.lang.Class, x1: String): Result[##java.lang.Exception, ##java.lang.reflect.Field] & Pure = {
        import java.lang.Class.getField(String): ##java.lang.reflect.Field & Pure as getField;
        try {
            Ok(getField(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getFields(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Field, Static]] & Pure = {
        import java.lang.Class.getFields(): Array[##java.lang.reflect.Field, Static] & Pure as getFields;
        try {
            Ok(getFields(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getGenericInterfaces(x0: ##java.lang.Class): Array[##java.lang.reflect.Type, Static] & Pure = {
        import java.lang.Class.getGenericInterfaces(): Array[##java.lang.reflect.Type, Static] & Pure as getGenericInterfaces;
        getGenericInterfaces(x0)
    }
    
    
    pub def getGenericSuperclass(x0: ##java.lang.Class): ##java.lang.reflect.Type & Pure = {
        import java.lang.Class.getGenericSuperclass(): ##java.lang.reflect.Type & Pure as getGenericSuperclass;
        getGenericSuperclass(x0)
    }
    
    
    pub def getInterfaces(x0: ##java.lang.Class): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.Class.getInterfaces(): Array[##java.lang.Class, Static] & Pure as getInterfaces;
        getInterfaces(x0)
    }
    
    
    pub def getMethod(x0: ##java.lang.Class, x1: String, x2: Array[##java.lang.Class, Static]): Result[##java.lang.Exception, ##java.lang.reflect.Method] & Pure = {
        import java.lang.Class.getMethod(String, Array[##java.lang.Class, Static]): ##java.lang.reflect.Method & Pure as getMethod;
        try {
            Ok(getMethod(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getMethods(x0: ##java.lang.Class): Result[##java.lang.Exception, Array[##java.lang.reflect.Method, Static]] & Pure = {
        import java.lang.Class.getMethods(): Array[##java.lang.reflect.Method, Static] & Pure as getMethods;
        try {
            Ok(getMethods(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getModifiers(x0: ##java.lang.Class): Int32 & Pure = {
        import java.lang.Class.getModifiers(): Int32 & Pure as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getModule(x0: ##java.lang.Class): ##java.lang.Module & Pure = {
        import java.lang.Class.getModule(): ##java.lang.Module & Pure as getModule;
        getModule(x0)
    }
    
    
    pub def getName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getName(): String & Pure as getName;
        getName(x0)
    }
    
    
    pub def getNestHost(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getNestHost(): ##java.lang.Class & Pure as getNestHost;
        getNestHost(x0)
    }
    
    
    pub def getNestMembers(x0: ##java.lang.Class): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.Class.getNestMembers(): Array[##java.lang.Class, Static] & Pure as getNestMembers;
        getNestMembers(x0)
    }
    
    
    pub def getPackage(x0: ##java.lang.Class): ##java.lang.Package & Pure = {
        import java.lang.Class.getPackage(): ##java.lang.Package & Pure as getPackage;
        getPackage(x0)
    }
    
    
    pub def getPackageName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getPackageName(): String & Pure as getPackageName;
        getPackageName(x0)
    }
    
    
    pub def getPermittedSubclasses(x0: ##java.lang.Class): Array[##java.lang.Class, Static] & Pure = {
        import java.lang.Class.getPermittedSubclasses(): Array[##java.lang.Class, Static] & Pure as getPermittedSubclasses;
        getPermittedSubclasses(x0)
    }
    
    
    pub def getProtectionDomain(x0: ##java.lang.Class): ##java.security.ProtectionDomain & Pure = {
        import java.lang.Class.getProtectionDomain(): ##java.security.ProtectionDomain & Pure as getProtectionDomain;
        getProtectionDomain(x0)
    }
    
    
    pub def getRecordComponents(x0: ##java.lang.Class): Array[##java.lang.reflect.RecordComponent, Static] & Pure = {
        import java.lang.Class.getRecordComponents(): Array[##java.lang.reflect.RecordComponent, Static] & Pure as getRecordComponents;
        getRecordComponents(x0)
    }
    
    
    pub def getResource(x0: ##java.lang.Class, x1: String): ##java.net.URL & Pure = {
        import java.lang.Class.getResource(String): ##java.net.URL & Pure as getResource;
        getResource(x0, x1)
    }
    
    
    pub def getResourceAsStream(x0: ##java.lang.Class, x1: String): ##java.io.InputStream & Pure = {
        import java.lang.Class.getResourceAsStream(String): ##java.io.InputStream & Pure as getResourceAsStream;
        getResourceAsStream(x0, x1)
    }
    
    
    pub def getSigners(x0: ##java.lang.Class): Array[##java.lang.Object, Static] & Pure = {
        import java.lang.Class.getSigners(): Array[##java.lang.Object, Static] & Pure as getSigners;
        getSigners(x0)
    }
    
    
    pub def getSimpleName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getSimpleName(): String & Pure as getSimpleName;
        getSimpleName(x0)
    }
    
    
    pub def getSuperclass(x0: ##java.lang.Class): ##java.lang.Class & Pure = {
        import java.lang.Class.getSuperclass(): ##java.lang.Class & Pure as getSuperclass;
        getSuperclass(x0)
    }
    
    
    pub def getTypeName(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.getTypeName(): String & Pure as getTypeName;
        getTypeName(x0)
    }
    
    
    pub def getTypeParameters(x0: ##java.lang.Class): Array[##java.lang.reflect.TypeVariable, Static] & Pure = {
        import java.lang.Class.getTypeParameters(): Array[##java.lang.reflect.TypeVariable, Static] & Pure as getTypeParameters;
        getTypeParameters(x0)
    }
    
    
    pub def isAnnotation(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotation(): Bool & Pure as isAnnotation;
        isAnnotation(x0)
    }
    
    
    pub def isAnnotationPresent(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnnotationPresent(##java.lang.Class): Bool & Pure as isAnnotationPresent;
        isAnnotationPresent(x0, x1)
    }
    
    
    pub def isAnonymousClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAnonymousClass(): Bool & Pure as isAnonymousClass;
        isAnonymousClass(x0)
    }
    
    
    pub def isArray(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isArray(): Bool & Pure as isArray;
        isArray(x0)
    }
    
    
    pub def isAssignableFrom(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isAssignableFrom(##java.lang.Class): Bool & Pure as isAssignableFrom;
        isAssignableFrom(x0, x1)
    }
    
    
    pub def isEnum(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isEnum(): Bool & Pure as isEnum;
        isEnum(x0)
    }
    
    
    pub def isHidden(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isHidden(): Bool & Pure as isHidden;
        isHidden(x0)
    }
    
    
    pub def isInstance(x0: ##java.lang.Class, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.Class.isInstance(##java.lang.Object): Bool & Pure as isInstance;
        isInstance(x0, x1)
    }
    
    
    pub def isInterface(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isInterface(): Bool & Pure as isInterface;
        isInterface(x0)
    }
    
    
    pub def isLocalClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isLocalClass(): Bool & Pure as isLocalClass;
        isLocalClass(x0)
    }
    
    
    pub def isMemberClass(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isMemberClass(): Bool & Pure as isMemberClass;
        isMemberClass(x0)
    }
    
    
    pub def isNestmateOf(x0: ##java.lang.Class, x1: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isNestmateOf(##java.lang.Class): Bool & Pure as isNestmateOf;
        isNestmateOf(x0, x1)
    }
    
    
    pub def isPrimitive(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isPrimitive(): Bool & Pure as isPrimitive;
        isPrimitive(x0)
    }
    
    
    pub def isRecord(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isRecord(): Bool & Pure as isRecord;
        isRecord(x0)
    }
    
    
    pub def isSealed(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isSealed(): Bool & Pure as isSealed;
        isSealed(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.Class): Bool & Pure = {
        import java.lang.Class.isSynthetic(): Bool & Pure as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def newInstance(x0: ##java.lang.Class): Result[##java.lang.Exception, ##java.lang.Object] & Pure = {
        import java.lang.Class.newInstance(): ##java.lang.Object & Pure as newInstance;
        try {
            Ok(newInstance(x0))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toGenericString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toGenericString(): String & Pure as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.Class): String & Pure = {
        import java.lang.Class.toString(): String & Pure as toString;
        toString(x0)
    }
}
