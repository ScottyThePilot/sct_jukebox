class Static;
class CLASS_SPEAKER_PROXY: Static {
  displayName = "";
  scope = 1;
};

class LandVehicle;
class Air;
class Ship;

class Car: LandVehicle {
  #include "ace_actions_jukebox_vehicle.hpp"
};

class Tank: LandVehicle {
  #include "ace_actions_jukebox_vehicle.hpp"
};

class Helicopter: Air {
  #include "ace_actions_jukebox_vehicle.hpp"
};

class Plane: Air {
  #include "ace_actions_jukebox_vehicle.hpp"
};

class Ship_F: Ship {
  #include "ace_actions_jukebox_vehicle.hpp"
};

class Man;

class CAManBase: Man {
  class ACE_SelfActions {
    class ACE_Equipment {
      class RGVAR(place) {
        displayName = RCSTRING(interaction_place);
        condition = QUOTE(HAS_JUKEBOX_ITEM(_player));
        statement = QUOTE(CALL1(FUNC(actionPlace),_player));
        icon = QPATHTO(data\ui\icon_jukebox_ca.paa);
      };

      class RGVAR(personal) {
        displayName = RCSTRING(displayName);
        condition = QUOTE(HAS_SPEAKER(_target));
        exceptions[] = { "isNotInside", "isNotSitting" };
        icon = QPATHTO(data\ui\icon_jukebox_ca.paa);

        #include "ace_actions_jukebox.hpp"
      };
    };
  };
};

class Land_FMradio_F;

class CLASS_JUKEBOX_OBJECT: Land_FMradio_F {
  displayName = RCSTRING(displayName);
  author = "ScottyThePilot";
  editorCategory = "EdCat_Things";
  editorSubcategory = "sct_jukeboxes";

  ace_dragging_canDrag = 1;
  ace_dragging_dragPosition[] = { 0, 1.2, 0 };
  ace_dragging_dragDirection = 0;

  ace_dragging_canCarry = 1;
  ace_dragging_carryPosition[] = { 0, 1.2, 0 };
  ace_dragging_carryDirection = 0;

  class ACE_Actions {
    class ACE_MainActions {
      displayName = "$STR_ace_interaction_MainAction";
      distance = 4;
      condition = "true";
      statement = "";
      selection = "pelvis";

      class RGVAR(pickup) {
        displayName = RCSTRING(interaction_pickup);
        condition = QUOTE(alive _target);
        statement = QUOTE(CALL2(FUNC(actionPickup),_target,_player));
        icon = QPATHTO(data\ui\icon_jukebox_ca.paa);
      };

      #include "ace_actions_jukebox.hpp"
    };
  };

  scope = 2;
  scopeCurator = 2;
};
