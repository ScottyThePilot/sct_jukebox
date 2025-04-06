#include "..\script_component.hpp"

params ["_object"];

hint parseText (([
  ["this", [_object] call FUNC(inspect)],
  ["isInstalled", [_object getVariable QVAR_IS_INSTALLED] call FUNC(inspect)],
  ["isRepeating", [_object getVariable QVAR_IS_REPEATING] call FUNC(inspect)],
  ["isPlaying", [_object getVariable QVAR_IS_PLAYING] call FUNC(inspect)],
  ["queueList", [_object getVariable QVAR_QUEUE_LIST] call FUNC(inspect)],
  ["soundSource", [GET_SPEAKER_PROXY(_object)] call FUNC(inspect)],
  ["speakerProxy", [GET_SOUND_SOURCE(GET_SPEAKER_PROXY(_object))] call FUNC(inspect)]
] apply {
  (_x apply {
    _x regexReplace ["&", "&amp;"] regexReplace ["<", "&lt;"] regexReplace [">", "&gt;"]
  }) params ["_varName", "_var"];

  format ["<t align='left'>%1: %2</t>", _varName, _var]
}) joinString "<br/>");
