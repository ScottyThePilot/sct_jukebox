class RGVAR(play) {
  displayName = RCSTRING(interaction_play);
  condition = QUOTE(alive _target);
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(play),GET_SPEAKER(_target),_player));
  insertChildren = QUOTE(CALL2(FUNC(createPlayActions),_target,_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_play_ca.paa);
};

class RGVAR(stop) {
  displayName = RCSTRING(interaction_stop);
  condition = QUOTE(alive _target && IS_PLAYING(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(stop),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_pause_ca.paa);
};

class RGVAR(skip) {
  displayName = RCSTRING(interaction_skip);
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(skip),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_skip_ca.paa);
};

class RGVAR(queue_show) {
  displayName = RCSTRING(interaction_queue_show);
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  insertChildren = QUOTE(CALL2(FUNC(createQueueShowActions),_target,_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_show_ca.paa);
};

class RGVAR(queue_shuffle) {
  displayName = RCSTRING(interaction_queue_shuffle);
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(queueShuffle),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_shuffle_ca.paa);
};

class RGVAR(queue_clear) {
  displayName = RCSTRING(interaction_queue_clear);
  condition = QUOTE(alive _target && GET_QUEUE_LIST_IS_NOT_EMPTY(GET_SPEAKER(_target)));
  statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(queueClear),GET_SPEAKER(_target),_player));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_clear_ca.paa);
};

class RGVAR(repeat_enable) {
  displayName = RCSTRING(interaction_repeat_enable);
  condition = QUOTE(alive _target && !IS_REPEATING(GET_SPEAKER(_target)));
  statement = QUOTE(CALL3(FUNC(actionSetRepeat),GET_SPEAKER(_target),_player,true));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_repeat_ca.paa);
};

class RGVAR(repeat_disable) {
  displayName = RCSTRING(interaction_repeat_disable);
  condition = QUOTE(alive _target && IS_REPEATING(GET_SPEAKER(_target)));
  statement = QUOTE(CALL3(FUNC(actionSetRepeat),GET_SPEAKER(_target),_player,false));
  exceptions[] = { "isNotInside", "isNotSitting" };
  icon = QPATHTO(data\ui\icon_jukebox_queue_repeat_ca.paa);
};
