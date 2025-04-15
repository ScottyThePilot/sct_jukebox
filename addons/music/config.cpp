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
