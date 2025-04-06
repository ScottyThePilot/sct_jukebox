#include "..\script_component.hpp"

params ["_object", "_player"];

[_player, QCLASS_JUKEBOX_ITEM] call ace_common_fnc_addToInventory;
[_object] call FUNC(objectStopSoundRemote);
SET_INSTALLED(_object,false);
SET_REPEATING(_object,nil);
SET_PLAYING(_object,nil);
SET_QUEUE_LIST(_object,nil);

["$STR_sct_jukebox_message_vehicle_uninstalled", _object, _player] call FUNC(notifyRemote);
