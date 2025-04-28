#include ".\script_component.hpp"

[] call COMPILE_SCRIPT(PATHTO(initSettings.sqf));

[QGVAR(objectStartSoundRemote), FUNC(objectStartSound)] call CBA_fnc_addEventHandler;
[QGVAR(objectStopSoundRemote), FUNC(objectStopSound)] call CBA_fnc_addEventHandler;
