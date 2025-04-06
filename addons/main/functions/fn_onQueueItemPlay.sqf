#include "..\script_component.hpp"

params ["_object", "_player", "_trackIndex"];

if (_trackIndex isEqualTo 0) exitWith {};

private _queueList = GET_QUEUE_LIST(_object);
if (_trackIndex >= count _queueList) exitWith {};

private _previousTrack = _queueList deleteAt 0;
private _nextTrack = _queueList deleteAt _trackIndex;

_queueList = [_nextTrack] + _queueList;

if (IS_REPEATING(_object)) then {
  _queueList pushBack _previousTrack;
};

SET_QUEUE_LIST(_object,_queueList);

[_object, _nextTrack] call FUNC(objectStartSoundRemote);
SET_PLAYING(_object,true);

[[
  "$STR_sct_jukebox_message_playing",
  _nextTrack call FUNC(getSoundNameRaw)
], _object] call FUNC(notifyRemote);
