#include "..\script_component.hpp"

params ["_object", "_player"];

private _queueList = GET_QUEUE_LIST(_object);
if (_queueList isEqualTo []) exitWith {};

if (IS_PLAYING(_object)) then {
  SET_QUEUE_LIST(_object,[_queueList select 0]);
} else {
  SET_QUEUE_LIST(_object,[]);
};

["$STR_sct_jukebox_message_queue_cleared", _object, _player] call FUNC(notifyRemote);
