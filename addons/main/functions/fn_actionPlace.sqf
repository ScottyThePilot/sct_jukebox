#include "..\script_component.hpp"

params ["_player"];

_player removeItem QCLASS_JUKEBOX_ITEM;

if ((_player call CBA_fnc_getUnitAnim) select 0 == "stand") then {
  _player playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
  params ["_player"];

  // prevent collision damage
  ["ace_common_fixCollision", _player] call CBA_fnc_localEvent;

  private _direction = getDir _player;
  private _position = (getPosASL _player) vectorAdd [0.8 * sin(_direction), 0.8 * cos(_direction), 0];
  private _vectorUp = [0, 0, 1];
  private _intersections = lineIntersectsSurfaces [
    _position vectorAdd [0, 0, 1.5],
    _position vectorDiff [0, 0, 1.5],
    _player, objNull, true, 1, "GEOM", "FIRE"
  ];

  if (_intersections isNotEqualTo []) then {
    (_intersections select 0) params ["_touchingPoint", "_surfaceNormal"];
    _position = _touchingPoint vectorAdd [0, 0, 0.05];
    _vectorUp = _surfaceNormal;
  };

  private _object = QCLASS_JUKEBOX_OBJECT createVehicle [0, 0, 0];
  _object setDir _direction;
  _object setPosASL _position;
  _object setVectorUp _vectorUp;
  ["ace_common_fixPosition", _object, _object] call CBA_fnc_targetEvent;
  ["ace_common_fixFloating", _object, _object] call CBA_fnc_targetEvent;
}, [_player], 1, 0] call CBA_fnc_waitAndExecute;
