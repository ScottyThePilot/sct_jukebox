class GVAR_CORE(play) {
  displayName = "$STR_sct_jukebox_interaction_play";
  condition = QUOTE(alive _target);
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(play),GET_SPEAKER(_target),_player));
  insertChildren = QUOTE(CALL2(FUNC(createPlayActions),_target,_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_play.paa);
};

class GVAR_CORE(stop) {
  displayName = "$STR_sct_jukebox_interaction_stop";
  condition = QUOTE(alive _target && IS_PLAYING(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(stop),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_pause.paa);
};

class GVAR_CORE(skip) {
  displayName = "$STR_sct_jukebox_interaction_skip";
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(skip),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_skip.paa);
};

class GVAR_CORE(queue_show) {
  displayName = "$STR_sct_jukebox_interaction_queue_show";
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  insertChildren = QUOTE(CALL2(FUNC(createQueueShowActions),_target,_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_show.paa);
};

class GVAR_CORE(queue_shuffle) {
  displayName = "$STR_sct_jukebox_interaction_queue_shuffle";
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(queueShuffle),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_shuffle.paa);
};

class GVAR_CORE(queue_clear) {
  displayName = "$STR_sct_jukebox_interaction_queue_clear";
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(queueClear),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_clear.paa);
};

class GVAR_CORE(repeat_enable) {
  displayName = "$STR_sct_jukebox_interaction_repeat_enable";
  condition = QUOTE(alive _target && !IS_REPEATING(GET_SPEAKER(_target)));
  statement = QUOTE(CALL3(FUNC(actionSetRepeat),GET_SPEAKER(_target),_player,true));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_repeat.paa);
};

class GVAR_CORE(repeat_disable) {
  displayName = "$STR_sct_jukebox_interaction_repeat_disable";
  condition = QUOTE(alive _target && IS_REPEATING(GET_SPEAKER(_target)));
  statement = QUOTE(CALL3(FUNC(actionSetRepeat),GET_SPEAKER(_target),_player,false));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_repeat.paa);
};
