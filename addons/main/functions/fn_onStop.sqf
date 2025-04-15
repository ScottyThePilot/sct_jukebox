#include "..\script_component.hpp"

params ["_object", "_player"];

[_object] call FUNC(objectStopSoundRemote);
SET_PLAYING(_object,false);

[RCSTRING(message_stopped), _object, _player] call FUNC(notifyRemote);
