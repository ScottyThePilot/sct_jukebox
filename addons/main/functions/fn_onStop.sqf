#include "..\script_component.hpp"

params ["_object", "_player"];

systemChat format ["onStop: %1", [_this] call FUNC(inspect)];
[FUNC(debugObjectState), _object] call CBA_fnc_execNextFrame;

[_object] call FUNC(objectStopSoundRemote);
SET_PLAYING(_object,false);

["$STR_sct_jukebox_message_stopped", _object, _player] call FUNC(notifyRemote);
