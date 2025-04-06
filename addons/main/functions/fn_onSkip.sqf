#include "..\script_component.hpp"

params ["_object", "_player"];

private _queueList = GET_QUEUE_LIST(_object);
if (_queueList isEqualTo []) exitWith {};

private _previousTrack = _queueList deleteAt 0;
if (IS_REPEATING(_object)) then {
  _queueList pushBack _previousTrack;
};

if (_queueList isEqualTo []) then {
  [_object] call FUNC(objectStopSoundRemote);
  SET_PLAYING(_object,false);
} else {
  // if for some reason, sct_jukebox_isPlaying becomes unset, we'd usually assume it to not be playing,
  // but at this point we know sct_jukebox_queueList is non-empty, so we assume it is playing
  if (GETVAR(_object,VAR_IS_PLAYING,true)) then {
    private _nextTrack = _queueList select 0;
    [_object, _nextTrack] call FUNC(objectStartSoundRemote);
  };
};

SET_QUEUE_LIST(_object,_queueList);

// Null player means that the skip was normal queue progression
if (!isNull _player) then {
  [[
    "$STR_sct_jukebox_message_skipped",
    _previousTrack call FUNC(getSoundNameRaw)
  ], _object] call FUNC(notifyRemote);
};
