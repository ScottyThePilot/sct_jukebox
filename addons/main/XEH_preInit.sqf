#include ".\script_component.hpp"

[] call compileScript [QPATHTO(initSettings.sqf)];

[QGVAR(objectStartSoundRemote), FUNC(objectStartSound)] call CBA_fnc_addEventHandler;
[QGVAR(objectStopSoundRemote), FUNC(objectStopSound)] call CBA_fnc_addEventHandler;
