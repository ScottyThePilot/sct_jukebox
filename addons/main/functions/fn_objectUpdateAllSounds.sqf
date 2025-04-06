#include "..\script_component.hpp"

// Sounds are never actually muted (mainly because sound sources don't appear to have
// any way to mute them while they are playing...) they are instead just moved very far away
// This function updates the attach offsets to reflect the user's current muted state

{
  private _speaker = _x;
  private _target = attachedTo _speaker;
  if (isNull _target) then {
    deleteVehicle _speaker;
  } else {
    _speaker attachTo [_target, SPEAKER_PROXY_OFFSET];
  };
} forEach allMissionObjects QCLASS_SPEAKER_PROXY;
