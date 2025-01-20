#include "..\script_component.hpp"

params ["_object", "_player", "_trackIndex"];

systemChat format ["onQueueItemRemove: %1", [_this] call FUNC(inspect)];
[FUNC(debugObjectState), _object] call CBA_fnc_execNextFrame;

if (_trackIndex isEqualTo 0) then {
  [_object, _player] call FUNC(onSkip);
} else {
  private _queueList = GET_QUEUE_LIST(_object);
  if (_trackIndex >= count _queueList) exitWith {};

  private _track = _queueList deleteAt _trackIndex;

  SET_QUEUE_LIST(_object,_queueList);

  [[
    "$STR_sct_jukebox_message_removed",
    _track call FUNC(getSoundNameRaw)
  ], _object, _player] call FUNC(notifyRemote);
};
