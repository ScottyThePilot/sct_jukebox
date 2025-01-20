#include "..\script_component.hpp"

private _trackCategories = [];

{
  {
    private _categoryName = configName _x;
    if (!isText (_x >> "displayName")) then { continue };
    if (!isArray (_x >> "tracks")) then { continue };
    _trackCategories pushBackUnique _categoryName;
  } forEach ("true" configClasses _x);
} forEach [
  configFile >> QCLASS_JUKEBOX_CATEGORIES,
  campaignConfigFile >> QCLASS_JUKEBOX_CATEGORIES,
  missionConfigFile >> QCLASS_JUKEBOX_CATEGORIES
];

_trackCategories sort true;
_trackCategories
