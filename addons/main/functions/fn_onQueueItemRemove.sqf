#include "..\script_component.hpp"

params ["_object", "_player", "_trackIndex"];

if (_trackIndex isEqualTo 0) then {
  [_object, _player] call FUNC(onSkip);
} else {
  private _queueList = GET_QUEUE_LIST(_object);
  if (_trackIndex >= count _queueList) exitWith {};

  private _track = _queueList deleteAt _trackIndex;

  SET_QUEUE_LIST(_object,_queueList);

  [[
    RCSTRING(message_removed),
    _track call FUNC(getSoundNameRaw)
  ], _object, _player] call FUNC(notifyRemote);
};
