namespace Wrapped/Modifier {
    pub def classModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.classModifiers(): Int32 & Pure as classModifiers;
        classModifiers()
    }
    
    
    pub def constructorModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.constructorModifiers(): Int32 & Pure as constructorModifiers;
        constructorModifiers()
    }
    
    
    pub def fieldModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.fieldModifiers(): Int32 & Pure as fieldModifiers;
        fieldModifiers()
    }
    
    
    pub def getABSTRACT(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.ABSTRACT: Int32 & Pure as getABSTRACT;
        getABSTRACT()
    }
    
    
    pub def getFINAL(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.FINAL: Int32 & Pure as getFINAL;
        getFINAL()
    }
    
    
    pub def getINTERFACE(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.INTERFACE: Int32 & Pure as getINTERFACE;
        getINTERFACE()
    }
    
    
    pub def getNATIVE(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.NATIVE: Int32 & Pure as getNATIVE;
        getNATIVE()
    }
    
    
    pub def getPRIVATE(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.PRIVATE: Int32 & Pure as getPRIVATE;
        getPRIVATE()
    }
    
    
    pub def getPROTECTED(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.PROTECTED: Int32 & Pure as getPROTECTED;
        getPROTECTED()
    }
    
    
    pub def getPUBLIC(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.PUBLIC: Int32 & Pure as getPUBLIC;
        getPUBLIC()
    }
    
    
    pub def getSTATIC(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.STATIC: Int32 & Pure as getSTATIC;
        getSTATIC()
    }
    
    
    pub def getSTRICT(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.STRICT: Int32 & Pure as getSTRICT;
        getSTRICT()
    }
    
    
    pub def getSYNCHRONIZED(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.SYNCHRONIZED: Int32 & Pure as getSYNCHRONIZED;
        getSYNCHRONIZED()
    }
    
    
    pub def getTRANSIENT(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.TRANSIENT: Int32 & Pure as getTRANSIENT;
        getTRANSIENT()
    }
    
    
    pub def getVOLATILE(): Int32 & Pure = {
        import static  get java.lang.reflect.Modifier.VOLATILE: Int32 & Pure as getVOLATILE;
        getVOLATILE()
    }
    
    
    pub def interfaceModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.interfaceModifiers(): Int32 & Pure as interfaceModifiers;
        interfaceModifiers()
    }
    
    
    pub def isAbstract(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isAbstract(Int32): Bool & Pure as isAbstract;
        isAbstract(x0)
    }
    
    
    pub def isFinal(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isFinal(Int32): Bool & Pure as isFinal;
        isFinal(x0)
    }
    
    
    pub def isInterface(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isInterface(Int32): Bool & Pure as isInterface;
        isInterface(x0)
    }
    
    
    pub def isNative(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isNative(Int32): Bool & Pure as isNative;
        isNative(x0)
    }
    
    
    pub def isPrivate(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isPrivate(Int32): Bool & Pure as isPrivate;
        isPrivate(x0)
    }
    
    
    pub def isProtected(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isProtected(Int32): Bool & Pure as isProtected;
        isProtected(x0)
    }
    
    
    pub def isPublic(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isPublic(Int32): Bool & Pure as isPublic;
        isPublic(x0)
    }
    
    
    pub def isStatic(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isStatic(Int32): Bool & Pure as isStatic;
        isStatic(x0)
    }
    
    
    pub def isStrict(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isStrict(Int32): Bool & Pure as isStrict;
        isStrict(x0)
    }
    
    
    pub def isSynchronized(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isSynchronized(Int32): Bool & Pure as isSynchronized;
        isSynchronized(x0)
    }
    
    
    pub def isTransient(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isTransient(Int32): Bool & Pure as isTransient;
        isTransient(x0)
    }
    
    
    pub def isVolatile(x0: Int32): Bool & Pure = {
        import static java.lang.reflect.Modifier.isVolatile(Int32): Bool & Pure as isVolatile;
        isVolatile(x0)
    }
    
    
    pub def methodModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.methodModifiers(): Int32 & Pure as methodModifiers;
        methodModifiers()
    }
    
    
    pub def newModifier(): ##java.lang.reflect.Modifier & Pure = {
        import new java.lang.reflect.Modifier(): ##java.lang.reflect.Modifier & Pure as newModifier;
        newModifier()
    }
    
    
    pub def parameterModifiers(): Int32 & Pure = {
        import static java.lang.reflect.Modifier.parameterModifiers(): Int32 & Pure as parameterModifiers;
        parameterModifiers()
    }
    
    
    pub def toString(x0: Int32): String & Pure = {
        import static java.lang.reflect.Modifier.toString(Int32): String & Pure as toString;
        toString(x0)
    }
}
