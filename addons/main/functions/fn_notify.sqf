#include "..\script_component.hpp"

params ["_messageArgs", ["_source", objNull]];

// setting `sct_jukebox_notificationDistance` to 0 causes all notifications to be hidden
private _inRange = (VAR_NOTIFICATION_DISTANCE > 0) && {
  if (!isNull _source) then {
    // the source is in range if:
    // - the player is the source
    // - the player's vehicle is the source
    // - the source is attached to the player
    // - the source is within `sct_jukebox_notificationDistance` meters of the player
    ace_player isEqualTo _source || (vehicle ace_player) isEqualTo _source || {
      (attachedObjects ace_player) findIf { _x isEqualTo _source } isNotEqualTo -1
    } || {
      (ace_player distanceSqr _source) <= (VAR_NOTIFICATION_DISTANCE ^ 2)
    }
  } else {
    true
  }
};

if (_inRange) then {
  // if messageArgs is an array, localize the first element
  if !(_messageArgs isEqualType []) then {
    _messageArgs = [_messageArgs];
  };

  private _message = format (_messageArgs apply {
    if (_x isEqualType "") then {
      if ((_x select [0, 1]) isEqualTo "$") then {
        localize (_x select [1])
      } else {
        _x
      }
    } else {
      str _x
    }
  });

  _message call CBA_fnc_notify;
};
