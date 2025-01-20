#include "..\script_component.hpp"

params ["_target", "_player"];

private _index = 0;
GET_QUEUE_LIST(GET_SPEAKER(_target)) apply {
  private _soundName = _x call FUNC(getSoundName);
  private _id = QGVAR_CORE(queue_item) + "_" + (str _index);

  private _action = [
    _id,
    format [localize "STR_sct_jukebox_interaction_queue_item", _index + 1, _soundName],
    "",
    {}, { true }, {}
  ] call ace_interact_menu_fnc_createAction;

  private _actionChildren = [];

  if (_index isEqualTo 0) then {
    private _actionChildSkip = [
      _id + "_skip",
      localize "STR_sct_jukebox_interaction_queue_item_skip",
      QPATHTO(data\ui\icon_jukebox_skip.paa),
      {
        params ["_target", "_player", "_params"];
        EMIT_SERVER_EVENT_ARGS3(GVAR(skip),GET_SPEAKER(_target),_player,_params);
      },
      { true }, {}, _index
    ] call ace_interact_menu_fnc_createAction;

    _actionChildren pushBack [_actionChildSkip, [], _target];
  } else {
    private _actionChildPlay = [
      _id + "_play",
      localize "STR_sct_jukebox_interaction_queue_item_play",
      QPATHTO(data\ui\icon_jukebox_play.paa),
      {
        params ["_target", "_player", "_params"];
        EMIT_SERVER_EVENT_ARGS3(GVAR(queueItemPlay),GET_SPEAKER(_target),_player,_params);
      },
      { true }, {}, _index
    ] call ace_interact_menu_fnc_createAction;

    private _actionChildRemove = [
      _id + "_remove",
      localize "STR_sct_jukebox_interaction_queue_item_remove",
      QPATHTO(data\ui\icon_jukebox_remove.paa),
      {
        params ["_target", "_player", "_params"];
        EMIT_SERVER_EVENT_ARGS3(GVAR(queueItemRemove),GET_SPEAKER(_target),_player,_params);
      },
      { true }, {}, _index
    ] call ace_interact_menu_fnc_createAction;

    _actionChildren pushBack [_actionChildPlay, [], _target];
    _actionChildren pushBack [_actionChildRemove, [], _target];
  };

  _index = _index + 1;

  [_action, _actionChildren, _target]
}
