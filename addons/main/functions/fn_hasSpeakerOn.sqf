#include "..\script_component.hpp"

params ["_target"];

IS_INSTALLED(_target) || {
  (attachedObjects _target) findIf {
    typeOf _x isEqualTo QCLASS_JUKEBOX_OBJECT
  } isNotEqualTo -1
}
