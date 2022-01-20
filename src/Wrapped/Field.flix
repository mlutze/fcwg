namespace Wrapped/Field {
    pub def getName(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.getName(): & Pure;
        getName(x0)
    }
    
    
    pub def get(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[##java.lang.Object, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.get(##java.lang.Object): & Pure;
        try {
            Ok(get(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def equals(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Bool & Pure = {
        import java.lang.reflect.Field.equals(##java.lang.Object): & Pure;
        equals(x0, x1)
    }
    
    
    pub def toString(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.toString(): & Pure;
        toString(x0)
    }
    
    
    pub def hashCode(x0: ##java.lang.reflect.Field): Int32 & Pure = {
        import java.lang.reflect.Field.hashCode(): & Pure;
        hashCode(x0)
    }
    
    
    pub def getModifiers(x0: ##java.lang.reflect.Field): Int32 & Pure = {
        import java.lang.reflect.Field.getModifiers(): & Pure;
        getModifiers(x0)
    }
    
    
    pub def getBoolean(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Bool, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getBoolean(##java.lang.Object): & Pure;
        try {
            Ok(getBoolean(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getByte(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int8, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getByte(##java.lang.Object): & Pure;
        try {
            Ok(getByte(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getShort(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int16, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getShort(##java.lang.Object): & Pure;
        try {
            Ok(getShort(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getChar(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Char, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getChar(##java.lang.Object): & Pure;
        try {
            Ok(getChar(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getInt(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int32, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getInt(##java.lang.Object): & Pure;
        try {
            Ok(getInt(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getLong(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Int64, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getLong(##java.lang.Object): & Pure;
        try {
            Ok(getLong(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getFloat(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Float32, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getFloat(##java.lang.Object): & Pure;
        try {
            Ok(getFloat(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def getDouble(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object): Result[Float64, ##java.lang.Exception] & Pure = {
        import java.lang.reflect.Field.getDouble(##java.lang.Object): & Pure;
        try {
            Ok(getDouble(x0, x1))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def toGenericString(x0: ##java.lang.reflect.Field): String & Pure = {
        import java.lang.reflect.Field.toGenericString(): & Pure;
        toGenericString(x0)
    }
    
    
    pub def isSynthetic(x0: ##java.lang.reflect.Field): Bool & Pure = {
        import java.lang.reflect.Field.isSynthetic(): & Pure;
        isSynthetic(x0)
    }
    
    
    pub def getDeclaringClass(x0: ##java.lang.reflect.Field): ##java.lang.Class & Pure = {
        import java.lang.reflect.Field.getDeclaringClass(): & Pure;
        getDeclaringClass(x0)
    }
    
    
    pub def getAnnotation(x0: ##java.lang.reflect.Field, x1: ##java.lang.Class): ##java.lang.annotation.Annotation & Pure = {
        import java.lang.reflect.Field.getAnnotation(##java.lang.Class): & Pure;
        getAnnotation(x0, x1)
    }
    
    
    pub def getAnnotationsByType(x0: ##java.lang.reflect.Field, x1: ##java.lang.Class): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.reflect.Field.getAnnotationsByType(##java.lang.Class): & Pure;
        getAnnotationsByType(x0, x1)
    }
    
    
    pub def getDeclaredAnnotations(x0: ##java.lang.reflect.Field): Array[##java.lang.annotation.Annotation] & Pure = {
        import java.lang.reflect.Field.getDeclaredAnnotations(): & Pure;
        getDeclaredAnnotations(x0)
    }
    
    
    pub def set(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: ##java.lang.Object): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.set(##java.lang.Object, ##java.lang.Object): & Impure;
        try {
            Ok(set(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setAccessible(x0: ##java.lang.reflect.Field, x1: Bool): Unit & Impure = {
        import java.lang.reflect.Field.setAccessible(Bool): & Impure;
        setAccessible(x0, x1)
    }
    
    
    pub def getGenericType(x0: ##java.lang.reflect.Field): ##java.lang.reflect.Type & Pure = {
        import java.lang.reflect.Field.getGenericType(): & Pure;
        getGenericType(x0)
    }
    
    
    pub def getType(x0: ##java.lang.reflect.Field): ##java.lang.Class & Pure = {
        import java.lang.reflect.Field.getType(): & Pure;
        getType(x0)
    }
    
    
    pub def setBoolean(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Bool): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setBoolean(##java.lang.Object, Bool): & Impure;
        try {
            Ok(setBoolean(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setByte(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int8): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setByte(##java.lang.Object, Int8): & Impure;
        try {
            Ok(setByte(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setChar(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Char): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setChar(##java.lang.Object, Char): & Impure;
        try {
            Ok(setChar(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setShort(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int16): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setShort(##java.lang.Object, Int16): & Impure;
        try {
            Ok(setShort(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setInt(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int32): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setInt(##java.lang.Object, Int32): & Impure;
        try {
            Ok(setInt(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setLong(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Int64): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setLong(##java.lang.Object, Int64): & Impure;
        try {
            Ok(setLong(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setFloat(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Float32): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setFloat(##java.lang.Object, Float32): & Impure;
        try {
            Ok(setFloat(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def setDouble(x0: ##java.lang.reflect.Field, x1: ##java.lang.Object, x2: Float64): Result[Unit, ##java.lang.Exception] & Impure = {
        import java.lang.reflect.Field.setDouble(##java.lang.Object, Float64): & Impure;
        try {
            Ok(setDouble(x0, x1, x2))
        } catch {
            case e: ##java.lang.Exception => Err(e)
        }
    }
    
    
    pub def isEnumConstant(x0: ##java.lang.reflect.Field): Bool & Pure = {
        import java.lang.reflect.Field.isEnumConstant(): & Pure;
        isEnumConstant(x0)
    }
    
    
    pub def getAnnotatedType(x0: ##java.lang.reflect.Field): ##java.lang.reflect.AnnotatedType & Pure = {
        import java.lang.reflect.Field.getAnnotatedType(): & Pure;
        getAnnotatedType(x0)
    }
}
