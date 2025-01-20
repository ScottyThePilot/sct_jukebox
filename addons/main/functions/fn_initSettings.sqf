#include "..\script_component.hpp"

[
  QVAR_SOUND_DISTANCE,
  "SLIDER",
  [
    "STR_sct_jukebox_settings_soundDistance_name",
    "STR_sct_jukebox_settings_soundDistance_description"
  ],
  "STR_sct_jukebox_settings_category",
  [0, 500, 100, 2, false],
  1
] call CBA_fnc_addSetting;

[
  QVAR_NOTIFICATION_DISTANCE,
  "SLIDER",
  [
    "STR_sct_jukebox_settings_notificationDistance_name",
    "STR_sct_jukebox_settings_notificationDistance_description"
  ],
  "STR_sct_jukebox_settings_category",
  [0, 100, 5, 2, false],
  2
] call CBA_fnc_addSetting;
