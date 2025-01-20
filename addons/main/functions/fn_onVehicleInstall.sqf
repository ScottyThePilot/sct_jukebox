#include "..\script_component.hpp"

systemChat format ["onVehicleInstall: %1", [_this] call FUNC(inspect)];

params ["_object", "_player"];

_player removeItem QCLASS_JUKEBOX_ITEM;
SET_INSTALLED(_object,true);

["$STR_sct_jukebox_message_vehicle_installed", _object, _player] call FUNC(notifyRemote);
