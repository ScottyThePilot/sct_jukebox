#include "..\script_component.hpp"

// Helper function that can be used to setup a music player at init,
// useful for making a player start playing on repeat at mission

params [
  ["_target", objNull],
  ["_startPlaying", false, [true]],
  ["_startRepeating", false, [true]],
  ["_startQueueList", [], [[]]]
];

if (!isServer) exitWith {};

if (!HAS_SPEAKER(_target)) exitWith {
  throw "target object is not a valid speaker";
};

private _object = GET_SPEAKER(_target);

SET_REPEATING(_object,_startRepeating);

private _startQueueList = _startQueueList select {
  [
    missionConfigFile >> "CfgSounds" >> _x,
    campaignConfigFile >> "CfgSounds" >> _x,
    configFile >> "CfgSounds" >> _x
  ] findIf { isClass _x } isNotEqualTo -1
};

if (_startQueueList isNotEqualTo []) then {
  SET_QUEUE_LIST(_object,_startQueueList);
  if (_startPlaying) then {
    EMIT_SERVER_EVENT_ARGS2(GVAR(play),_object,objNull);
  };
};
