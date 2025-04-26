#include "..\script_component.hpp"

params ["_target"];

typeOf _target isEqualTo QCLASS_JUKEBOX_OBJECT || HAS_SPEAKER_ON(_target)
