#include "..\script_component.hpp"

params ["_target", "_executionTarget"];

if (isNil "_executionTarget") then {
  [QGVAR(objectStopSoundRemote), [_target]] call CBA_fnc_globalEvent;
} else {
  [QGVAR(objectStopSoundRemote), [_target], _executionTarget] call CBA_fnc_targetEvent;
};
