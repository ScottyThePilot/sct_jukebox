#include "..\script_component.hpp"

params ["_sound"];

private _soundConfigs = [
  configFile >> "CfgSounds" >> _sound,
  campaignConfigFile >> "CfgSounds" >> _sound,
  missionConfigFile >> "CfgSounds" >> _sound
];

private _index = _soundConfigs findIf { isClass _x };
if (_index isNotEqualTo -1) then {
  private _soundConfig = _soundConfigs select _index;
  if (isText (_soundConfig >> "name")) then {
    getTextRaw (_soundConfig >> "name")
  } else {
    "$STR_sct_jukebox_interaction_sound_missingDisplayName"
  }
} else {
  "$STR_sct_jukebox_interaction_sound_invalid"
}
