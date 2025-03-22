wotmud_wayfinder.settings.manage_exhaustion = not wotmud_wayfinder.settings.manage_exhaustion
wotmud_wayfinder.saveSettings()
cecho(
    "WoTMUD Wayfinder exhaustion management is now " ..
    (wotmud_wayfinder.settings.manage_exhaustion and "<green>on" or "<red>off") ..
    "<reset>.\n"
)
