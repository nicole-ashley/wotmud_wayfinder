wotmud_wayfinder.settings.manage_horse = not wotmud_wayfinder.settings.manage_horse
wotmud_wayfinder.saveSettings()

cecho(
  "WoTMUD Wayfinder horse management is now " ..
  (wotmud_wayfinder.settings.manage_horse and "<green>on" or "<red>off") ..
  "<reset>.\n"
)
