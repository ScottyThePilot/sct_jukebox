#include "..\script_component.hpp"

params ["_object", "_player"];

[_object] call FUNC(objectStopSoundRemote);
SET_PLAYING(_object,false);

["$STR_sct_jukebox_message_stopped", _object, _player] call FUNC(notifyRemote);
