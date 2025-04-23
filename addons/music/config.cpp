#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = ADDON_NAME;
    author = "ScottyThePilot";
    authors[] = { "ScottyThePilot" };
    url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3464242640";
    VERSION_CONFIG;
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {
      "A3_Music_F",
      "A3_Music_F_Bootcamp",
      "A3_Music_F_EPA",
      "A3_Music_F_EPB",
      "A3_Music_F_EPC",
      "A3_Data_F_Curator",
      "A3_Music_F_Heli",
      "A3_Music_F_Mark",
      "A3_Music_F_Exp",
      "A3_Music_F_Jets",
      "A3_Music_F_Argo",
      "A3_Music_F_Orange",
      "A3_Music_F_Tacops",
      "A3_Music_F_Tank",
      "A3_Music_F_Enoch",
      "A3_Missions_F_Oldman",
      QADDONOF(main)
    };
    units[] = {};
    weapons[] = {};
  };
};

class CfgSounds {
  #include ".\CfgSounds.hpp"
};

class CLASS_JUKEBOX_CATEGORIES {
  #include ".\categories.hpp"
};
