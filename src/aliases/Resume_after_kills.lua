wotmud_wayfinder.settings.resume_after_kill = not wotmud_wayfinder.settings.resume_after_kill
wotmud_wayfinder.saveSettings()

cecho(
  "WoTMUD Wayfinder resumption after kills is now " ..
  (wotmud_wayfinder.settings.resume_after_kill and "<green>on" or "<red>off") ..
  "<reset>.\n"
)
