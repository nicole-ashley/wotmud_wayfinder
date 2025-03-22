local settingsLocation = getMudletHomeDir() .. "/wotmud_wayfinder_settings.lua"
wotmud_wayfinder.settings = {}
if io.exists(settingsLocation) then
  table.load(settingsLocation, wotmud_wayfinder.settings)
end

wotmud_wayfinder.settings = {
  auto_flee = wotmud_wayfinder.settings.auto_flee or false,
  avoid = wotmud_wayfinder.settings.avoid or (wotmud_wayfinder.settings.swim and { "smob" } or { "smob", "water" }),
  manage_doors = wotmud_wayfinder.settings.manage_doors or false,
  manage_exhaustion = wotmud_wayfinder.settings.manage_exhaustion or true,
  manage_horse = wotmud_wayfinder.settings.manage_horse or false,
  resume_after_kill = wotmud_wayfinder.settings.resume_after_kill or false
}

function wotmud_wayfinder.saveSettings()
  table.save(settingsLocation, wotmud_wayfinder.settings);
end
