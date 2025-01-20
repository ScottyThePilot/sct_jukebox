#include "..\script_component.hpp"

systemChat format ["objectStartSound: %1", [_this] call FUNC(inspect)];
[FUNC(debugObjectState), _object] call CBA_fnc_execNextFrame;

// Starts playing a sound from the given object on the local machine.
// If the object is already playing a sound, it will cancel the current one.
// Raises CBA event `sct_jukebox_main_objectSoundEnd` when the sound ends.
// - Args: [_target: Object, _sound: String, _args?: Anything]
params ["_target", "_sound", ["_args", []]];

if (!isNull GET_SOUND_SOURCE(_target)) then {
  [_target] call FUNC(objectStopSound);
};

private _soundDistance = GETVAR(_target,VAR_SOUND_DISTANCE,VAR_SOUND_DISTANCE);
private _soundSource = _target say3D [_sound, _soundDistance, 1, 2, 0, true];
SET_SOUND_SOURCE(_target,_soundSource);

[{
  params ["_target", "_soundSource"];
  !alive _target || !alive _soundSource ||
  isNull _target || isNull _soundSource
}, {
  params ["_target", "_soundSource", "_args"];
  systemChat "sound source disposed";
  // if the sound source was 'damaged' but still exists, this is the cancel signal
  private _cancelled = !isNull _soundSource;
  deleteVehicle _soundSource;
  [QGVAR(objectSoundEnd), [_target, _cancelled, _args]] call CBA_fnc_localEvent;
  // don't set sct_jukebox_soundSource to nil in this function
  // it will race with the above code when skipping the currently playing sound
  // i had to debug this once, i don't want to debug it again
}, [_target, _soundSource, _args]] call CBA_fnc_waitUntilAndExecute;
