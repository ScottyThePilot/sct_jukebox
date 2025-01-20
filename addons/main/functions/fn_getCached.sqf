#include "..\script_component.hpp"

params ["_namespace", "_variable", "_code", ["_args", []]];

private _value = _namespace getVariable _variable;
if (isNil "_value") then {
  _value = _args call _code;
  _namespace setVariable [_variable, _value];
};

_value
