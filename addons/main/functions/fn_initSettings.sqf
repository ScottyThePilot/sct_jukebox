#include "..\script_component.hpp"

[
  QVAR_SOUND_DISTANCE,
  "SLIDER",
  [
    RLSTRING(settings_soundDistance_name),
    RLSTRING(settings_soundDistance_description)
  ],
  RLSTRING(settings_category),
  [0, 500, 100, 2, false],
  0
] call CBA_fnc_addSetting;

[
  QVAR_NOTIFICATION_DISTANCE,
  "SLIDER",
  [
    RLSTRING(settings_notificationDistance_name),
    RLSTRING(settings_notificationDistance_description)
  ],
  RLSTRING(settings_category),
  [0, 100, 5, 2, false],
  2
] call CBA_fnc_addSetting;

[
  QVAR_LOCAL_MUTE,
  "CHECKBOX",
  [
    RLSTRING(settings_localMute_name),
    RLSTRING(settings_localMute_description)
  ],
  RLSTRING(settings_category),
  false,
  2,
  FUNC(objectUpdateAllSounds)
] call CBA_fnc_addSetting;

if (isClass (configFile >> "CfgPatches" >> QADDONOF(music))) then {
  [
    QVAR_ENABLE_BASEGAME_MUSIC,
    "CHECKBOX",
    [
      RLSTRING(settings_enableBaseGameMusic_name),
      RLSTRING(settings_enableBaseGameMusic_description)
    ],
    RLSTRING(settings_category),
    true,
    1,
    {
      RESET_TRACK_CATEGORIES;
      RESET_TRACKS_MAP;
    }
  ] call CBA_fnc_addSetting;
};
