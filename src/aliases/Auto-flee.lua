wotmud_wayfinder.settings.auto_flee = not wotmud_wayfinder.settings.auto_flee
wotmud_wayfinder.saveSettings()

cecho(
  "WoTMUD Wayfinder auto-fleeing is now " ..
  (wotmud_wayfinder.settings.auto_flee and "<green>on" or "<red>off") ..
  "<reset>.\n"
)
