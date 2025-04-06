#include "..\script_component.hpp"

params ["_target", "_sound", ["_args", []], "_executionTarget"];

if (isNil "_executionTarget") then {
  [QGVAR(objectStartSoundRemote), [_target, _sound, _args]] call CBA_fnc_globalEvent;
} else {
  [QGVAR(objectStartSoundRemote), [_target, _sound, _args], _executionTarget] call CBA_fnc_targetEvent;
};
