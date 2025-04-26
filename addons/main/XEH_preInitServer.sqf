#include ".\script_component.hpp"

[QGVAR(objectSoundEnd), {
  params ["_target", "_cancelled", "_args"];
  if (!_cancelled && { HAS_SPEAKER(_target) }) then {
    [_target, objNull] call FUNC(onSkip);
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(play), FUNC(onPlay)] call CBA_fnc_addEventHandler;
[QGVAR(queueClear), FUNC(onQueueClear)] call CBA_fnc_addEventHandler;
[QGVAR(queueItemPlay), FUNC(onQueueItemPlay)] call CBA_fnc_addEventHandler;
[QGVAR(queueItemRemove), FUNC(onQueueItemRemove)] call CBA_fnc_addEventHandler;
[QGVAR(queueShuffle), FUNC(onQueueShuffle)] call CBA_fnc_addEventHandler;
[QGVAR(skip), FUNC(onSkip)] call CBA_fnc_addEventHandler;
[QGVAR(stop), FUNC(onStop)] call CBA_fnc_addEventHandler;
[QGVAR(vehicleInstall), FUNC(onVehicleInstall)] call CBA_fnc_addEventHandler;
[QGVAR(vehicleUninstall), FUNC(onVehicleUninstall)] call CBA_fnc_addEventHandler;
