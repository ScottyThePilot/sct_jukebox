#include "..\script_component.hpp"

params ["_message", "_source", "_executionTarget"];

if (isNil "_executionTarget") then {
  [QGVAR(notifyRemote), [_message, _source]] call CBA_fnc_globalEvent;
} else {
  [QGVAR(notifyRemote), [_message, _source], _executionTarget] call CBA_fnc_targetEvent;
};
