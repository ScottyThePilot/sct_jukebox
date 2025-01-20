#include "..\script_component.hpp"

params ["_object", "_player", "_track"];

systemChat format ["onPlay: %1", [_this] call FUNC(inspect)];
[FUNC(debugObjectState), _object] call CBA_fnc_execNextFrame;

private _queueList = GET_QUEUE_LIST(_object);
if (isNil "_track") then {
  if (_queueList isEqualTo []) exitWith {};
} else {
  _queueList pushBack _track;
  SET_QUEUE_LIST(_object,_queueList);
};

assert (_queueList isNotEqualTo []);

if (!IS_PLAYING(_object)) then {
  private _nextTrack = _queueList select 0;
  [_object, _nextTrack] call FUNC(objectStartSoundRemote);
  SET_PLAYING(_object,true);

  [[
    "$STR_sct_jukebox_message_playing",
    _nextTrack call FUNC(getSoundNameRaw)
  ], _object] call FUNC(notifyRemote);
} else {
  [[
    "$STR_sct_jukebox_message_queued",
    _track call FUNC(getSoundNameRaw)
  ], _object] call FUNC(notifyRemote);
};
