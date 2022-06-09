namespace Wrapped/Field {
    pub def equals(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Field.equals(##java.lang.Object): Bool & Pure as equals;
        equals(x0, x1)
    }
    
    
    pub def get(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.get(##java.lang.Object): ##java.lang.Object & Pure as get;
        try {
            Ok(get(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getAnnotatedType(x0: ##java.lang.reflect.Field): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Field.getAnnotatedType(): ##java.lang.reflect.AnnotatedType & Pure as getAnnotatedType;
        getAnnotatedType(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Field, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Field.getAnnotation(##java.lang.Class): ##java.lang.annotation.Annotation & Pure as getAnnotation;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.reflect.Field, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.reflect.Field.getAnnotationsByType(##java.lang.Class): Array[##java.lang.annotation.Annotation, Static] & Pure as getAnnotationsByType;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getBoolean(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Bool, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getBoolean(##java.lang.Object): Bool & Pure as getBoolean;
        try {
            Ok(getBoolean(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getByte(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int8, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getByte(##java.lang.Object): Int8 & Pure as getByte;
        try {
            Ok(getByte(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getChar(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Char, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getChar(##java.lang.Object): Char & Pure as getChar;
        try {
            Ok(getChar(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Field): Array[##java.lang.annotation.Annotation, Static] & Pure = {
        import java.lang.reflect.Field.getDeclaredAnnotations(): Array[##java.lang.annotation.Annotation, Static] & Pure as getDeclaredAnnotations;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Field): ##java.lang.Class & Pure = {
        import java.lang.reflect.Field.getDeclaringClass(): ##java.lang.Class & Pure as getDeclaringClass;
        getDeclaringClass(x0)
    }
    
    
    pub def getDouble(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Float64, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getDouble(##java.lang.Object): Float64 & Pure as getDouble;
        try {
            Ok(getDouble(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getFloat(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Float32, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getFloat(##java.lang.Object): Float32 & Pure as getFloat;
        try {
            Ok(getFloat(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getGenericType(x0: ##java.lang.reflect.Field): ##java.lang.reflect.Type & Pure = {
        import java.lang.reflect.Field.getGenericType(): ##java.lang.reflect.Type & Pure as getGenericType;
        getGenericType(x0)
    }
    
    
    pub def getInt(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int32, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getInt(##java.lang.Object): Int32 & Pure as getInt;
        try {
            Ok(getInt(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getLong(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int64, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getLong(##java.lang.Object): Int64 & Pure as getLong;
        try {
            Ok(getLong(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Field): Int32 & Pure = {
        import java.lang.reflect.Field.getModifiers(): Int32 & Pure as getModifiers;
        getModifiers(x0)
    }
    
    
    pub def getName(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.getName(): String & Pure as getName;
        getName(x0)
    }
    
    
    pub def getShort(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int16, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getShort(##java.lang.Object): Int16 & Pure as getShort;
        try {
            Ok(getShort(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getType(x0: ##java.lang.reflect.Field): ##java.lang.Class & Pure = {
        import java.lang.reflect.Field.getType(): ##java.lang.Class & Pure as getType;
        getType(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Field): Int32 & Pure = {
        import java.lang.reflect.Field.hashCode(): Int32 & Pure as hashCode;
        hashCode(x0)
    }
    
    
    pub def isEnumConstant(x0: ##java.lang.reflect.Field): Bool & Pure = {
        import java.lang.reflect.Field.isEnumConstant(): Bool & Pure as isEnumConstant;
        isEnumConstant(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Field): Bool & Pure = {
        import java.lang.reflect.Field.isSynthetic(): Bool & Pure as isSynthetic;
        isSynthetic(x0)
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Field, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Field.setAccessible(Bool): Unit & Impure as setAccessible;
        setAccessible(x0, x1)
    }
    
    
    pub def setBoolean(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Bool): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setBoolean(##java.lang.Object, Bool): Unit & Impure as setBoolean;
        try {
            Ok(setBoolean(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setByte(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int8): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setByte(##java.lang.Object, Int8): Unit & Impure as setByte;
        try {
            Ok(setByte(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setChar(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Char): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setChar(##java.lang.Object, Char): Unit & Impure as setChar;
        try {
            Ok(setChar(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setDouble(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Float64): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setDouble(##java.lang.Object, Float64): Unit & Impure as setDouble;
        try {
            Ok(setDouble(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setFloat(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Float32): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setFloat(##java.lang.Object, Float32): Unit & Impure as setFloat;
        try {
            Ok(setFloat(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setInt(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int32): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setInt(##java.lang.Object, Int32): Unit & Impure as setInt;
        try {
            Ok(setInt(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setLong(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int64): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setLong(##java.lang.Object, Int64): Unit & Impure as setLong;
        try {
            Ok(setLong(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setShort(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int16): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setShort(##java.lang.Object, Int16): Unit & Impure as setShort;
        try {
            Ok(setShort(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def set_(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: ##java.lang.Object): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.set(##java.lang.Object, ##java.lang.Object): Unit & Impure as set_;
        try {
            Ok(set_(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.toGenericString(): String & Pure as toGenericString;
        toGenericString(x0)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.toString(): String & Pure as toString;
        toString(x0)
    }
}
