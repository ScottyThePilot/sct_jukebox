#define VERSION MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH
#define VERSION_AR MAJOR,MINOR,PATCH

#define VERSION_CONFIG version = VERSION; versionStr = QUOTE(VERSION_STR); versionAr[] = {VERSION_AR}

#ifndef PREFIX_BEAUTIFIED
  #define PREFIX_BEAUTIFIED PREFIX
#endif

#ifndef COMPONENT_BEAUTIFIED
  #define COMPONENT_BEAUTIFIED COMPONENT
#endif

#ifndef COMPONENT
  #define COMPONENT SUPCOMPONENT##_##SUBCOMPONENT
  #define COMPONENT_PATH SUPCOMPONENT\SUBCOMPONENT
#else
  #define COMPONENT_PATH COMPONENT
#endif

#define ADDONOF(var1) DOUBLES(PREFIX,var1)
#define ADDON ADDONOF(COMPONENT)
#define ADDON_MAIN ADDONOF(main)

#define QADDONOF(var1) QUOTE(ADDONOF(var1))
#define QADDON QUOTE(ADDON)
#define QADDON_MAIN QUOTE(ADDON_MAIN)

#ifdef SUPCOMPONENT
  #define ADDONP ADDONOF(SUPCOMPONENT)
  #define QADDONP QUOTE(ADDONP)
#endif

#define ADDON_NAME QUOTE(PREFIX_BEAUTIFIED - COMPONENT_BEAUTIFIED)

#define DOUBLES(var1,var2) var1##_##var2
#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define QUOTE(var1) #var1

#define PATHTO(var1) \x\PREFIX\addons\COMPONENT_PATH\var1
#define QPATHTO(var1) QUOTE(PATHTO(var1))

#define PATHTOE(var1,var2) \x\PREFIX\addons\var1\var2
#define QPATHTOE(var1,var2) QUOTE(PATHTOE(var1,var2))

#ifdef SUPCOMPONENT
  #define PATHTOP(var1) PATHTOE(SUPCOMPONENT,var1)
  #define QPATHTOP(var1) QUOTE(PATHTOP(var1))
#endif

#define QPATHTO_FUNCS QUOTE(PATHTO(functions))
#define QPATHTO_FUNC(var1) QUOTE(PATHTO(functions\DOUBLES(fn,var1).sqf))

// global var - PREFIX_COMPONENT_{var1}
#define GVAR(var1) DOUBLES(ADDON,var1)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QQGVAR(var1) QUOTE(QGVAR(var1))

// root (prefix) global var - PREFIX_{var1}
#define RGVAR(var1) DOUBLES(PREFIX,var1)
#define QRGVAR(var1) QUOTE(RGVAR(var1))
#define QQRGVAR(var1) QUOTE(QRGVAR(var1))

// parent global var - PREFIX_SUPCOMPONENT_{var1}
#ifdef SUPCOMPONENT
  #define PGVAR(var1) EGVAR(SUPCOMPONENT,var1)
  #define QPGVAR(var1) QEGVAR(SUPCOMPONENT,var1)
  #define QQPGVAR(var1) QQEGVAR(SUPCOMPONENT,var1)
#endif

// external global var - PREFIX_{var1}_{var2}
#define EGVAR(var1,var2) DOUBLES(ADDONOF(var1),var2)
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

// function - PREFIX_COMPONENT_fnc_{var1}
#define FUNC(var1) TRIPLES(ADDON,fnc,var1)
#define QFUNC(var1) QUOTE(FUNC(var1))
#define QQFUNC(var1) QUOTE(QFUNC(var1))

// root (prefix) function - PREFIX_fnc_{var1}
#define RFUNC(var1) TRIPLES(PREFIX,fnc,var1)
#define QRFUNC(var1) QUOTE(RFUNC(var1))
#define QQRFUNC(var1) QUOTE(QRFUNC(var1))

// parent function - PREFIX_SUPCOMPONENT_fnc_{var1}
#ifdef SUPCOMPONENT
  #define PFUNC(var1) EFUNC(SUPCOMPONENT,var1)
  #define QPFUNC(var1) QEFUNC(SUPCOMPONENT,var1)
  #define QQPFUNC(var1) QQEFUNC(SUPCOMPONENT,var1)
#endif

// external function - PREFIX_{var1}_fnc_{var2}
#define EFUNC(var1,var2) TRIPLES(ADDONOF(var1),fnc,var2)
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))
#define QQEFUNC(var1,var2) QUOTE(QEFUNC(var1,var2))

// lang string
#define LSTRING(var1) QUOTE(TRIPLES(STR,ADDON,var1))
#define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))

// root (prefix) lang string
#define RLSTRING(var1) QUOTE(TRIPLES(STR,PREFIX,var1))
#define RCSTRING(var1) QUOTE(TRIPLES($STR,PREFIX,var1))

// external lang string
#define ELSTRING(var1,var2) QUOTE(TRIPLES(STR,ADDONOF(var1),var2))
#define ECSTRING(var1,var2) QUOTE(TRIPLES($STR,ADDONOF(var1),var2))

#define CALL1(FUNCTION,var1) ([var1] call FUNCTION)
#define CALL2(FUNCTION,var1,var2) ([var1,var2] call FUNCTION)
#define CALL3(FUNCTION,var1,var2,var3) ([var1,var2,var3] call FUNCTION)
#define CALL4(FUNCTION,var1,var2,var3,var4) ([var1,var2,var3,var4] call FUNCTION)
#define CALL5(FUNCTION,var1,var2,var3,var4,var5) ([var1,var2,var3,var4,var5] call FUNCTION)
#define CALL6(FUNCTION,var1,var2,var3,var4,var5,var6) ([var1,var2,var3,var4,var5,var6] call FUNCTION)
#define CALL7(FUNCTION,var1,var2,var3,var4,var5,var6,var7) ([var1,var2,var3,var4,var5,var6,var7] call FUNCTION)
#define CALL8(FUNCTION,var1,var2,var3,var4,var5,var6,var7,var8) ([var1,var2,var3,var4,var5,var6,var7,var8] call FUNCTION)

#define ISNIL(VARIABLE,DEFAULT_VALUE) if (isNil 'VARIABLE') then { VARIABLE = DEFAULT_VALUE }

#define RETDEF(VARIABLE,DEFAULT_VALUE) (if (isNil {VARIABLE}) then [{DEFAULT_VALUE}, {VARIABLE}])
#define RETNIL(VARIABLE) RETDEF(VARIABLE,nil)

#define GETVAR(NAMESPACE,VARIABLE,DEFAULT_VALUE) (NAMESPACE getVariable ['VARIABLE', DEFAULT_VALUE])
#define SETVAR(NAMESPACE,VARIABLE,VALUE,PUBLIC) NAMESPACE setVariable ['VARIABLE', VALUE, PUBLIC]
#define SETVARLOCAL(NAMESPACE,VARIABLE,VALUE) SETVAR(NAMESPACE,VARIABLE,VALUE,false)
#define SETVARGLOBAL(NAMESPACE,VARIABLE,VALUE) SETVAR(NAMESPACE,VARIABLE,VALUE,true)
#define GETSETVAR(NAMESPACE,VARIABLE,DEFAULT_VALUE) RETDEF(NAMESPACE getVariable 'VARIABLE',SETVARLOCAL(NAMESPACE,VARIABLE,DEFAULT_VALUE); NAMESPACE getVariable 'VARIABLE')

#define LIST2(var1) var1,var1
#define LIST3(var1) var1,var1,var1
#define LIST4(var1) var1,var1,var1,var1
#define LIST5(var1) var1,var1,var1,var1,var1
#define LIST6(var1) var1,var1,var1,var1,var1,var1
#define LIST7(var1) var1,var1,var1,var1,var1,var1,var1
#define LIST8(var1) var1,var1,var1,var1,var1,var1,var1,var1
#define LIST9(var1) var1,var1,var1,var1,var1,var1,var1,var1,var1
