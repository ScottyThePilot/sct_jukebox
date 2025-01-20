#include "..\script_component.hpp"

systemChat format ["objectStopSoundRemote: %1", [_this] call FUNC(inspect)];

params ["_target", "_executionTarget"];

if (isNil "_executionTarget") then {
  [QGVAR(objectStopSoundRemote), [_target]] call CBA_fnc_globalEvent;
} else {
  [QGVAR(objectStopSoundRemote), [_target], _executionTarget] call CBA_fnc_targetEvent;
};
