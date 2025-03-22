wotmud_wayfinder.settings.manage_horse = not wotmud_wayfinder.settings.manage_horse
cecho(
    "WoTMUD Wayfinder horse management is now " ..
    (wotmud_wayfinder.settings.manage_horse and "<green>on" or "<red>off") ..
    "<reset>.\n"
)
