mod Wrapped.Modifier {
    pub def classModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.classModifiers(): Int32 \ {} as classModifiers;
        classModifiers()
    }
    
    
    pub def constructorModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.constructorModifiers(): Int32 \ {} as constructorModifiers;
        constructorModifiers()
    }
    
    
    pub def fieldModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.fieldModifiers(): Int32 \ {} as fieldModifiers;
        fieldModifiers()
    }
    
    
    pub def getABSTRACT(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.ABSTRACT: Int32 \ {} as getABSTRACT;
        getABSTRACT()
    }
    
    
    pub def getFINAL(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.FINAL: Int32 \ {} as getFINAL;
        getFINAL()
    }
    
    
    pub def getINTERFACE(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.INTERFACE: Int32 \ {} as getINTERFACE;
        getINTERFACE()
    }
    
    
    pub def getNATIVE(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.NATIVE: Int32 \ {} as getNATIVE;
        getNATIVE()
    }
    
    
    pub def getPRIVATE(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.PRIVATE: Int32 \ {} as getPRIVATE;
        getPRIVATE()
    }
    
    
    pub def getPROTECTED(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.PROTECTED: Int32 \ {} as getPROTECTED;
        getPROTECTED()
    }
    
    
    pub def getPUBLIC(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.PUBLIC: Int32 \ {} as getPUBLIC;
        getPUBLIC()
    }
    
    
    pub def getSTATIC(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.STATIC: Int32 \ {} as getSTATIC;
        getSTATIC()
    }
    
    
    pub def getSTRICT(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.STRICT: Int32 \ {} as getSTRICT;
        getSTRICT()
    }
    
    
    pub def getSYNCHRONIZED(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.SYNCHRONIZED: Int32 \ {} as getSYNCHRONIZED;
        getSYNCHRONIZED()
    }
    
    
    pub def getTRANSIENT(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.TRANSIENT: Int32 \ {} as getTRANSIENT;
        getTRANSIENT()
    }
    
    
    pub def getVOLATILE(): Int32 \ {} = {
        import static java_get_field java.lang.reflect.Modifier.VOLATILE: Int32 \ {} as getVOLATILE;
        getVOLATILE()
    }
    
    
    pub def interfaceModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.interfaceModifiers(): Int32 \ {} as interfaceModifiers;
        interfaceModifiers()
    }
    
    
    pub def isAbstract(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isAbstract(Int32): Bool \ {} as isAbstract;
        isAbstract(x0)
    }
    
    
    pub def isFinal(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isFinal(Int32): Bool \ {} as isFinal;
        isFinal(x0)
    }
    
    
    pub def isInterface(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isInterface(Int32): Bool \ {} as isInterface;
        isInterface(x0)
    }
    
    
    pub def isNative(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isNative(Int32): Bool \ {} as isNative;
        isNative(x0)
    }
    
    
    pub def isPrivate(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isPrivate(Int32): Bool \ {} as isPrivate;
        isPrivate(x0)
    }
    
    
    pub def isProtected(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isProtected(Int32): Bool \ {} as isProtected;
        isProtected(x0)
    }
    
    
    pub def isPublic(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isPublic(Int32): Bool \ {} as isPublic;
        isPublic(x0)
    }
    
    
    pub def isStatic(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isStatic(Int32): Bool \ {} as isStatic;
        isStatic(x0)
    }
    
    
    pub def isStrict(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isStrict(Int32): Bool \ {} as isStrict;
        isStrict(x0)
    }
    
    
    pub def isSynchronized(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isSynchronized(Int32): Bool \ {} as isSynchronized;
        isSynchronized(x0)
    }
    
    
    pub def isTransient(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isTransient(Int32): Bool \ {} as isTransient;
        isTransient(x0)
    }
    
    
    pub def isVolatile(x0: Int32): Bool \ {} = {
        import static java.lang.reflect.Modifier.isVolatile(Int32): Bool \ {} as isVolatile;
        isVolatile(x0)
    }
    
    
    pub def methodModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.methodModifiers(): Int32 \ {} as methodModifiers;
        methodModifiers()
    }
    
    
    pub def parameterModifiers(): Int32 \ {} = {
        import static java.lang.reflect.Modifier.parameterModifiers(): Int32 \ {} as parameterModifiers;
        parameterModifiers()
    }
    
    
    pub def toString(x0: Int32): String \ {} = {
        import static java.lang.reflect.Modifier.toString(Int32): String \ {} as toString;
        toString(x0)
    }
}
