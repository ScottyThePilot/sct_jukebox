class ACE_SelfActions {
  class GVAR_CORE(vehicle) {
    displayName = "$STR_sct_jukebox_displayName";
    condition = QUOTE(alive _target && HAS_SPEAKER(_target));
    exceptions[] = { "isNotInside", "isNotSitting" };
    icon = QPATHTO(data\ui\icon_jukebox.paa);

    #include "ace_actions_jukebox.hpp"
  };
};

class ACE_Actions {
  class ACE_MainActions {
    class GVAR_CORE(vehicle_install) {
      displayName = "$STR_sct_jukebox_interaction_vehicle_install";
      condition = QUOTE(alive _target && !IS_INSTALLED(_target) && HAS_JUKEBOX_ITEM(_player));
      statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(vehicleInstall),_target,_player));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox_vehicle_install.paa);
    };

    class GVAR_CORE(vehicle_uninstall) {
      displayName = "$STR_sct_jukebox_interaction_vehicle_uninstall";
      condition = QUOTE(alive _target && IS_INSTALLED(_target));
      statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(vehicleUninstall),_target,_player));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox_vehicle_uninstall.paa);
    };

    class GVAR_CORE(vehicle) {
      displayName = "$STR_sct_jukebox_displayName";
      condition = QUOTE(alive _target && HAS_SPEAKER(_target));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox.paa);

      #include "ace_actions_jukebox.hpp"
    };
  };
};
