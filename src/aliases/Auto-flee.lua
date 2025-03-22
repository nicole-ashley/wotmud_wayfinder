wotmud_wayfinder.settings.auto_flee = not wotmud_wayfinder.settings.auto_flee
cecho(
    "WoTMUD Wayfinder auto-fleeing is now " ..
    (wotmud_wayfinder.settings.auto_flee and "<green>on" or "<red>off") ..
    "<reset>.\n"
)
