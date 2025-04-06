#include "..\script_component.hpp"

// Stops the sound being played by an object that was started with `sct_jukebox_main_fnc_objectStartSound`.
// Raises event `sct_jukebox_main_objectSoundEnd` if the sound was successfully cancelled.
// - Args: [_target: Object]
params ["_target"];

// If a speaker proxy is ever used as a target, something is wrong
assert (QCLASS_SPEAKER_PROXY isNotEqualTo typeOf _target);

private _soundSource = GET_SOUND_SOURCE(GET_SPEAKER_PROXY(_target));
if (!isNull _soundSource) then {
  // the damage value of the sound source is used as a signal value
  _soundSource setDamage 1;
};
