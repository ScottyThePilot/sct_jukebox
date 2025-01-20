#include "..\script_component.hpp"

if !(_this isEqualType [] && { count _this == 1 }) then {
  throw "invalid arguments";
};

private _value = _this select 0;

if (isNil "_value") exitWith { "nil" };

switch (typeName _value) do {
  case "STRING": {
    '"' + _value + '"'
  };
  case "ARRAY": {
    "[" + ((_value apply {
      ([_x] call FUNC(inspect))
    }) joinString ", ") + "]"
  };
  case "HASHMAP": {
    "{" + ((_value apply {
      ([_x] call FUNC(inspect)) + ": " +
      ([_y] call FUNC(inspect))
    }) joinString ", ") + "}"
  };
  default {
    str _value
  };
}
