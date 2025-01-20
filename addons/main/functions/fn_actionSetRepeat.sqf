#include "..\script_component.hpp"

systemChat format ["actionSetRepeat: %1", [_this] call FUNC(inspect)];

params ["_object", "_player", "_state"];

SET_REPEATING(_target,_state);

[[
  "$STR_sct_jukebox_message_repeat_disabled",
  "$STR_sct_jukebox_message_repeat_enabled"
] select _state] call FUNC(notify);
