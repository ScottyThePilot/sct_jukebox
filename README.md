# Music Player

<a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3464242640">
  <img src="https://img.shields.io/endpoint?color=%232a475e%20&url=https%3A%2F%2Fshieldsio-steam-workshop.jross.me%2F3464242640%2Fsubscriptions-text">
</a>

Portable music player for Arma 3, inspired by [Pocket Music Player by Hubix](https://steamcommunity.com/sharedfiles/filedetails/?id=2170268960).

## Usage

Once you have the Portable Music Player item (found under the 'tools' item tab in ACE),
you can place it down by self-interacting and selecting 'Place Portable Music Player'.

You can attach the music player to yourself or vehicles through ACE,
similar to how chemlights are attached to things.
Alternatively, you can install a music player directly in a vehicle.

You can also place down the Portable Music Player in the editor, found
under `Things` > `Jukeboxes`.

By ACE interacting with the music player, the vehicle/unit it is attached to, or
a vehicle with a music player installed, a 'Music Player' interaction will
appear, with controls for manipulating the music player state.

In CBA settings, all music players may be muted for you locally.

## Known Issues

- If a track is started while local mute is enabled, and then subsequently disabled,
  the track will not be un-muted. At this time, I don't know why this happens.
- Currently, sounds are played on the server to know when to advance the Music Player
  for all other players. This means that the Music Player will not work if the
  sounds are not present on the server. I am currently working on a better way to
  do this.

## Adding Custom Tracks

Tracks played through the music player are 'sounds' (as defined in `CfgSounds`) not
'music' (as defined in `CfgMusic`). Any existing sounds can be added to a jukebox category
without defining a new sound.

The below code may be placed in a mod's config (`config.cpp`), campaign
config (campaign `Description.ext`) or mission config (mission `Description.ext`).

```cpp
class sct_jukebox_categories {
  // The category identifier (i.e. `my_custom_category`) can be anything, or it can be the
  // identifier of an existing category, to add additional tracks to it, or replace the tracks in it
  class my_custom_category {
    displayName = "Custom Music";
    tracks[] = {
      // This must match the identifier of the sound as defined in CfgSounds
      "my_custom_sound"
    };
    // Uncomment the below line of code to overwrite the contents of a track list defined in an addon. Optional.
    //replace = 1;
  };
};

// See https://community.bistudio.com/wiki/Description.ext#CfgSounds
// for more information on how to do this.
class CfgSounds {
  // The sound identifier (i.e. `my_custom_sound`) can be anything.
  class my_custom_sound {
    name = "My Custom Sound Name";
    sound[] = { "path_to\my_custom_sound.ogg", 1, 1 };
    titles[] = {};
  };
};
```

## Utilities

If you are a mission maker and would like to make a music player play a track or
tracks on mission start, you can use the `sct_jukebox_main_fnc_setupJukebox` helper
function, and run it from the object's init field.

```sqf
[
  // the music player object, or object with a music player installed/attached
  this,
  // whether the music player should start the mission playing or not
  true,
  // whether the music player should have repeat enabled
  true,
  // the queue list of the music player, must be ids to valid sounds from CfgSounds
  ["sct_jukebox_music_AmbientTrack01_F"]
] call sct_jukebox_main_fnc_setupJukebox;
```
