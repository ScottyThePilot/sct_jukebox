#include "..\script_component.hpp"

[QGVAR(objectStartSoundRemote), FUNC(objectStartSound)] call CBA_fnc_addEventHandler;
[QGVAR(objectStopSoundRemote), FUNC(objectStopSound)] call CBA_fnc_addEventHandler;
