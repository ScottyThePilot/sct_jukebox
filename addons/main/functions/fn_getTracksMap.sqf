#include "..\script_component.hpp"

private _tracksMap = createHashMap;

{
  {
    private _categoryName = configName _x;
    if (!isText (_x >> "displayName")) then { continue };
    if (!isArray (_x >> "tracks")) then { continue };
    if (isText (_x >> "condition") && {
      !([] call compileFinal getTextRaw (_x >> "condition"))
    }) then { continue };

    private _entry = _tracksMap getOrDefaultCall [_categoryName, { [nil, []] }, true];

    private _displayName = getText (_x >> "displayName");
    _entry set [0, _displayName];

    private _tracks = getArray (_x >> "tracks");
    if (getNumber (_x >> "replace") == 1) then {
      _entry set [1, _tracks arrayIntersect _tracks];
    } else {
      (_entry select 1) insert [-1, _tracks, true];
    };
  } forEach ("true" configClasses _x);
} forEach [
  configFile >> QCLASS_JUKEBOX_CATEGORIES,
  campaignConfigFile >> QCLASS_JUKEBOX_CATEGORIES,
  missionConfigFile >> QCLASS_JUKEBOX_CATEGORIES
];

_tracksMap
