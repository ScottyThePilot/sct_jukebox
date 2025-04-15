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
      "A3_Structures_F_Items_Electronics",
      "cba_common",
      "ace_common",
      "ace_interaction"
    };
    units[] = {
      QCLASS_JUKEBOX_OBJECT
    };
    weapons[] = {
      QCLASS_JUKEBOX_ITEM
    };
  };
};

class CfgSettings {
  class CBA {
    class Versioning {
      class ADDON {
        main_addon = QADDON_MAIN;

        class dependencies {
          CBA[] = { "cba_main", { 3, 18, 0 }, "(true)" };
          ACE[] = { "ace_main", { 3, 18, 0 }, "(true)" };
        };
      };
    };
  };
};

class CfgFunctions {
  class ADDON {
    class functions {
      file = QPATHTO_FUNCS;
      class actionPickup {};
      class actionPlace {};
      class actionSetRepeat {};
      class createPlayActions {};
      class createQueueShowActions {};
      class debugObjectState {};
      class getCached {};
      class getSoundName {};
      class getSoundNameRaw {};
      class getSpeaker {};
      class getTrackCategories {};
      class getTracksMap {};
      class hasSpeaker {};
      class initPost {};
      class initPostClient {};
      class initPostServer {};
      class initSettings {};
      class inspect {};
      class notify {};
      class notifyRemote {};
      class objectStartSound {};
      class objectStartSoundRemote {};
      class objectStopSound {};
      class objectStopSoundRemote {};
      class objectUpdateAllSounds {};
      class onPlay {};
      class onQueueClear {};
      class onQueueItemPlay {};
      class onQueueItemRemove {};
      class onQueueShuffle {};
      class onSkip {};
      class onStop {};
      class onVehicleInstall {};
      class onVehicleUninstall {};
    };
  };
};

class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE(call FUNC(initSettings));
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    init = QUOTE(call FUNC(initPost));
    clientInit = QUOTE(call FUNC(initPostClient));
    serverInit = QUOTE(call FUNC(initPostServer));
  };
};

class CfgWeapons {
  #include "CfgWeapons.hpp"
};

class CfgVehicles {
  #include "CfgVehicles.hpp"
};

class CfgEditorSubcategories {
  class sct_jukeboxes {
    displayName = RCSTRING(editorCategory_jukeboxes);
  };
};

class CLASS_JUKEBOX_CATEGORIES {};
