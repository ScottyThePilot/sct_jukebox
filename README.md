# Music Player

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

## Adding Custom Tracks

Tracks played through the music player are 'sounds' (as defined in `CfgSounds`) not
'music' (as defined in `CfgMusic`). Any existing sounds can be added to a jukebox category
without defining a new sound.

The below code may be placed in a mod's config (`config.cpp`), campaign
config (campaign `Description.ext`) or mission config (mission `Description.ext`).

```cpp
class sct_jukebox_categories {

};

class CfgSounds {

};
```
