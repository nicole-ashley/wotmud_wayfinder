WoTMUD Wayfinder
================

WoTMUD Wayfinder implements auto-walk (step by step speedwalk) using the Wayfinder algorithm. This allows smart weighting based on room type, and persistent, non-blocking navigation that responds to things that might get in your way along your journey.

Features and limitations
------------------------
What WoTMUD Wayfinder can do:

* Find the optimal route from A to B, favouring paths that expend less MV (where this is known)
* Resume after disruption, including disruption that takes it off the intended path
* Avoid the Moveable Trolloc Camp (the fact that it moves breaks navigation)
* Avoid water (unless you tell it you can swim)
* Avoid SMOBs (where they are marked in the map)
* Open doors and gates when they're in your way (off by default)
* Call for city gates when they're closed (off by default)
* Dismount and lead to go indoors, then mount again when going back outside (off by default)
* Resume on tic after stopping due to exhaustion (off by default, requires wotpack tic timer)
* Resume after kill if stopped due to fighting (off by default)
* Automatically flee when stopped due to fighting (off by default)

What WoTMUD Wayfinder can't do:

* Keep you out of danger (other than some Smobs, danger is not noted in the wotpack map)
* Distinguish between hills and mountains MV cost (this is not noted in the wotpack map)
* Use class-specific shortcuts (Portals, Fades, etc)
* Use non-linear or temporal shortcuts (The Ways, coaches, ships, Moveable Trolloc Camp)
* Unlock or pick doors (though it will wait for you to do this yourself and then resume afterwards)

In any case that movement is blocked and can't automatically be resumed (either because you have the specific strategy turned off, or it is not one that can be handled) navigation will resume once you move to any other room. This allows you to either fix the problem (eg unlock a door, or dismount) and move to the next room in the path (at which point auto-walk will resume), flee (auto-walk will resume from the new starting point on successful flee), or enter directions around the obstacle (best for very small detours).

Installation
------------
WoTMUD Wayfinder relies on two modules:

* The WotMUD mapper from wotpack: [install the wotpack package handler](https://github.com/weisluke/WoTMUD?tab=readme-ov-file#downloading-and-installing-the-package-handler), then [install the map](https://github.com/weisluke/WoTMUD?tab=readme-ov-file#installing-map-scripts-and-a-map-file).
* The Wayfinder algorithm:
```
mpkg install wayfinder-an-alternate-route-finder-package
```

If either of these are installed or updated after WoTMUD Wayfinder, you will need to restart Mudlet for navigation to work.

Then install WotMUD Wayfinder:
```
lua installPackage("https://github.com/nicole-ashley/wotmud_wayfinder/releases/latest/download/wotmud_wayfinder.mpackage")
```

If you want navigation to resume after exhaustion, you should install wotpack's tic timer and activate the exhaustion option:
```
wotpack install tic_timer
wotmud_wayfinder exhaustion
```
Tic timer needs to be running; if you stop it, you won't resume walking on tic.

### Updating
First remove the package, then install it again. Your settings will be retained.
```
lua uninstallPackage("wotmud_wayfinder")
lua installPackage("https://github.com/nicole-ashley/wotmud_wayfinder/releases/latest/download/wotmud_wayfinder.mpackage")
```

Usage
-----
WoTMUD Wayfinder has built-in help:
```
wotmud_wayfinder help
```