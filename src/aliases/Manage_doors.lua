wotmud_wayfinder.settings.manage_doors = not wotmud_wayfinder.settings.manage_doors
wotmud_wayfinder.saveSettings()
cecho(
    "WoTMUD Wayfinder door management is now " ..
    (wotmud_wayfinder.settings.manage_doors and "<green>on" or "<red>off") ..
    "<reset>.\n"
)
