#include "..\script_component.hpp"

// Given an object being interacted with, returns the 'speaker' object for it, i.e. the object that will use say3D
// If the object is a vehicle with the 'installed' flag, or a jukebox object, this will return the object itself
// If the object has a jukebox object attached to it, it will return the jukebox object
// Otherwise, returns `objNull`
params ["_target"];

if (_target isKindOf QCLASS_JUKEBOX_OBJECT) exitWith { _target };
if (IS_INSTALLED(_target)) exitWith { _target };

private _attachedObjects = attachedObjects _target;
private _i = _attachedObjects findIf {
  typeOf _x isEqualTo QCLASS_JUKEBOX_OBJECT
};

if (_i isNotEqualTo -1) then {
  _attachedObjects select _i
} else {
  objNull
}
