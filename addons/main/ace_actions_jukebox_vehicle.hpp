class ACE_SelfActions {
  class RGVAR(vehicle) {
    displayName = RCSTRING(displayName);
    condition = QUOTE(alive _target && HAS_SPEAKER(_target));
    exceptions[] = { "isNotInside", "isNotSitting" };
    icon = QPATHTO(data\ui\icon_jukebox_ca.paa);

    #include "ace_actions_jukebox.hpp"
  };
};

class ACE_Actions {
  class ACE_MainActions {
    class RGVAR(vehicle_install) {
      displayName = RCSTRING(interaction_vehicle_install);
      condition = QUOTE(alive _target && CAN_INSTALL(_target) && !IS_INSTALLED(_target) && HAS_JUKEBOX_ITEM(_player));
      statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(vehicleInstall),_target,_player));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox_vehicle_install_ca.paa);
    };

    class RGVAR(vehicle_uninstall) {
      displayName = RCSTRING(interaction_vehicle_uninstall);
      condition = QUOTE(alive _target && CAN_INSTALL(_target) && IS_INSTALLED(_target));
      statement = QUOTE(EMIT_SERVER_EVENT_ARGS2(GVAR(vehicleUninstall),_target,_player));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox_vehicle_uninstall_ca.paa);
    };

    class RGVAR(vehicle) {
      displayName = RCSTRING(displayName);
      condition = QUOTE(alive _target && HAS_SPEAKER(_target));
      exceptions[] = { "isNotInside", "isNotSitting" };
      icon = QPATHTO(data\ui\icon_jukebox_ca.paa);

      #include "ace_actions_jukebox.hpp"
    };
  };
};
