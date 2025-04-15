#include "..\script_component.hpp"

params ["_object", "_player", "_state"];

SET_REPEATING(_target,_state);

[[
  RCSTRING(message_repeat_disabled),
  RCSTRING(message_repeat_enabled)
] select _state] call FUNC(notify);
