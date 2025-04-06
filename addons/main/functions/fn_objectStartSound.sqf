#include "..\script_component.hpp"

// Starts playing a sound from the given object on the local machine.
// If the object is already playing a sound, it will cancel the current one.
// Raises CBA event `sct_jukebox_main_objectSoundEnd` when the sound ends.
// - Args: [_target: Object, _sound: String, _args?: Anything]
params ["_target", "_sound", ["_args", []]];

// If a speaker proxy is ever used as a target, something is wrong
assert (QCLASS_SPEAKER_PROXY isNotEqualTo typeOf _target);

// Ensure that the sound is valid
if ([
  missionConfigFile >> "CfgSounds" >> _sound,
  campaignConfigFile >> "CfgSounds" >> _sound,
  configFile >> "CfgSounds" >> _sound
] findIf { isClass _x } isEqualTo -1) then {
  throw format ["unknown sound '%1'", _sound];
};

if (!isNull GET_SOUND_SOURCE(GET_SPEAKER_PROXY(_target))) then {
  [_target] call FUNC(objectStopSound);
};

// We don't actually play the sound from the target object, instead we create a new simple object
// and attach it to the target, we call this object the 'speaker proxy' and it will play the sound
// This way, when the player wants to mute the sound, we just move the speaker proxy very far away
private _speakerProxy = createSimpleObject [QCLASS_SPEAKER_PROXY, getPosASL _target, true];
_speakerProxy attachTo [_target, SPEAKER_PROXY_OFFSET];
SET_SPEAKER_PROXY(_target,_speakerProxy);

// Add a 'deleted' event handler to the target object, because the
// speaker proxy must be deleted if the target object is ever deleted
private _eventHandlerId = [_target, "Deleted", {
  _thisArgs params ["_speakerProxy"];
  // This will also stop the sound playing from the speaker proxy (not resulting in a cancel)
  deleteVehicle _speakerProxy;
}, [_speakerProxy]] call CBA_fnc_addBISEventHandler;

// Play the sound from the speaker proxy
private _soundDistance = GETVAR(_target,VAR_SOUND_DISTANCE,VAR_SOUND_DISTANCE);
private _soundSource = _speakerProxy say3D [_sound, _soundDistance, 1, 2, 0, true];
SET_SOUND_SOURCE(_speakerProxy,_soundSource);

[{
  params ["_target", "_speakerProxy", "_soundSource"];
  !alive _target || !alive _speakerProxy || !alive _soundSource ||
  isNull _target || isNull _speakerProxy || isNull _soundSource
}, {
  params ["_target", "_speakerProxy", "_soundSource", "_eventHandlerId", "_args"];

  // Remove the deleted event handler we registered earlier
  _target removeEventHandler ["Deleted", _eventHandlerId];

  // If the sound source was 'damaged' but still exists, this is the cancel signal
  private _cancelled = !isNull _soundSource;
  deleteVehicle _soundSource;
  [QGVAR(objectSoundEnd), [_target, _cancelled, _args]] call CBA_fnc_localEvent;

  // Since the sound has ended, this speaker proxy is no longer needed
  deleteVehicle _speakerProxy;

  // Don't set sct_jukebox_soundSource to nil in this function
  // it will race with the above code when skipping the currently playing sound
  // I had to debug this once, I don't want to debug it again
}, [_target, _speakerProxy, _soundSource, _eventHandlerId, _args]] call CBA_fnc_waitUntilAndExecute;
