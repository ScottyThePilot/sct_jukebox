#include "..\script_component.hpp"

params ["_target", "_player"];

private _trackCategories = GET_TRACK_CATEGORIES;
private _tracksMap = GET_TRACKS_MAP;

_trackCategories select {
  (_x in _tracksMap) && {
    private _tracks = (_tracksMap get _x) select 1;
    count _tracks isNotEqualTo 0
  }
} apply {
  private _categoryId = _x;
  (_tracksMap get _x) params ["_categoryName", "_tracks"];

  private _id = QRGVAR(play) + "_" + _categoryId;

  private _action = [
    _id, _categoryName, "",
    {}, { true }, {}, [_x]
  ] call ace_interact_menu_fnc_createAction;

  private _actionChildren = _tracks apply {
    private _trackName = _x call FUNC(getSoundName);

    private _actionChild = [
      _id + "_" + _x, _trackName, "",
      {
        params ["_target", "_player", "_track"];
        EMIT_SERVER_EVENT_ARGS3(GVAR(play),GET_SPEAKER(_target),_player,_track);
      },
      { true }, {}, _x
    ] call ace_interact_menu_fnc_createAction;

    [_actionChild, [], _target]
  };

  [_action, _actionChildren, _target]
}
