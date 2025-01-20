#include "..\script_component.hpp"

systemChat format ["actionPickup: %1", [_this] call FUNC(inspect)];

params ["_object", "_player"];

if ((_player call CBA_fnc_getUnitAnim) select 0 == "stand") then {
  _player playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
  params ["_object", "_player"];

  if (!isNull _object && alive _object) then {
    [_player, QCLASS_JUKEBOX_ITEM] call ace_common_fnc_addToInventory;
    deleteVehicle _object;
  };
}, [_object, _player], 1, 0] call CBA_fnc_waitAndExecute;
