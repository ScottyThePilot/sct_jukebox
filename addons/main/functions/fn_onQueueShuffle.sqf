#include "..\script_component.hpp"

params ["_object", "_player"];

private _queueList = GET_QUEUE_LIST(_object);
if (_queueList isEqualTo []) exitWith {};

if (IS_PLAYING(_object)) then {
  // shuffle everything except for the first track if the jukebox is currently playing
  private _queueListNew = [_queueList select 0] + ((_queueList select [1]) call BIS_fnc_arrayShuffle);
  SET_QUEUE_LIST(_object,_queueListNew);
} else {
  private _queueListNew = _queueList call BIS_fnc_arrayShuffle;
  SET_QUEUE_LIST(_object,_queueListNew);
};

["$STR_sct_jukebox_message_queue_shuffled", _object, _player] call FUNC(notifyRemote);
