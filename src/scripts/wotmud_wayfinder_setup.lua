wotmud_wayfinder = wotmud_wayfinder or {}

wotmud_wayfinder.environments = {
  [20] = {
    type = "indoor",
    weight = 1,
    rideable = false,
  },
  [21] = {
    type = "outdoor",
    weight = 3,
    rideable = true,
  },
  [22] = {
    type = "road",
    weight = 2,
    rideable = true,
  },
  [23] = {
    type = "horseload",
    weight = 3,
    rideable = true,
  },
  [24] = {
    type = "swamp",
    weight = 3,
    rideable = true,
  },
  [25] = {
    type = "water",
    weight = 5,
    rideable = false,
  },
  [26] = {
    type = "watersource",
    weight = 2,
    rideable = true,
  },
  [27] = {
    type = "weaponshop",
    weight = 1,
    rideable = false,
  },
  [28] = {
    type = "armorshop",
    weight = 1,
    rideable = false,
  },
  [29] = {
    type = "masterblacksmith",
    weight = 1,
    rideable = false,
  },
  [30] = {
    type = "bank",
    weight = 1,
    rideable = false,
  },
  [31] = {
    type = "stable",
    weight = 2,
    rideable = true,
  },
  [32] = {
    type = "inn",
    weight = 1,
    rideable = false,
  },
  [33] = {
    type = "generalstore",
    weight = 1,
    rideable = false,
  },
  [34] = {
    type = "warriorprac",
    weight = 1,
    rideable = false,
  },
  [35] = {
    type = "rogueprac",
    weight = 1,
    rideable = false,
  },
  [36] = {
    type = "hunterprac",
    weight = 1,
    rideable = false
  },
  [38] = {
    type = "city",
    weight = 2,
    rideable = true,
  },
  [39] = {
    type = "herbs",
    weight = 3,
    rideable = true,
  },
  [40] = {
    type = "clothesshop",
    weight = 1,
    rideable = false,
  },
  [41] = {
    type = "unknown",
    weight = 5,
    rideable = true,
  },
  [42] = {
    type = "portalstone",
    weight = 3,
    rideable = true,
  },
  [43] = {
    type = "ancient",
    weight = 3,
    rideable = true,
  },
  [44] = {
    type = "smob",
    weight = false,
    rideable = true,
  },
  [45] = {
    type = "herbshop",
    weight = 1,
    rideable = false,
  },
}

wotmud_wayfinder.settings = wotmud_wayfinder.settings or {}
wotmud_wayfinder.settings = {
  auto_flee = wotmud_wayfinder.settings.auto_flee or false,
  manage_doors = wotmud_wayfinder.settings.manage_doors or true,
  manage_exhaustion = wotmud_wayfinder.settings.manage_exhaustion or true,
  manage_horse = wotmud_wayfinder.settings.manage_horse or false,
  resume_after_kill = wotmud_wayfinder.settings.resume_after_kill or false,
  swim = wotmud_wayfinder.settings.swim or false,
}

function wotmud_wayfinder.packageInstalled(_, name)
  if name == "wayfinder-an-alternate-route-finder-package" or name == "mapper_scripts" then
    cecho("<red>Please restart Mudlet to enable WotMUD Wayfinder navigation.")
  end
end

registerAnonymousEventHandler("sysInstallPackage", wotmud_wayfinder.packageInstalled)
disableScript("doSpeedWalk")
disableScript("gotoRoom example")
