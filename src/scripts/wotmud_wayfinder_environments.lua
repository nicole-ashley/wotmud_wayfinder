wotmud_wayfinder = wotmud_wayfinder or {}

wotmud_wayfinder.environments = {
  [20] = {
    types = { "indoor" },
    weight = 1,
    rideable = false
  },
  [21] = {
    types = { "outdoor" },
    weight = 3,
    rideable = true
  },
  [22] = {
    types = { "outdoor", "road" },
    weight = 2,
    rideable = true
  },
  [23] = {
    types = { "outdoor", "horseload" },
    weight = 3,
    rideable = true
  },
  [24] = {
    types = { "outdoor", "swamp" },
    weight = 3,
    rideable = true
  },
  [25] = {
    types = { "outdoor", "water" },
    weight = 5,
    rideable = false
  },
  [26] = {
    types = { "drinkable" },
    weight = 2,
    rideable = true
  },
  [27] = {
    types = { "weapons", "shop", "indoor" },
    weight = 1,
    rideable = false
  },
  [28] = {
    types = { "armory", "shop", "indoor" },
    weight = 1,
    rideable = false
  },
  [29] = {
    types = { "blacksmith", "indoor" },
    weight = 1,
    rideable = false
  },
  [30] = {
    types = { "bank", "indoor" },
    weight = 1,
    rideable = false
  },
  [31] = {
    types = { "stable", "outdoor" },
    weight = 2,
    rideable = true
  },
  [32] = {
    types = { "inn", "indoor" },
    weight = 1,
    rideable = false
  },
  [33] = {
    types = { "generalstore", "shop", "indoor" },
    weight = 1,
    rideable = false
  },
  [34] = {
    types = { "warriorprac", "indoor" },
    weight = 1,
    rideable = false
  },
  [35] = {
    types = { "rogueprac", "indoor" },
    weight = 1,
    rideable = false
  },
  [36] = {
    types = { "hunterprac", "indoor" },
    weight = 1,
    rideable = false
  },
  [38] = {
    types = { "city", "outdoor" },
    weight = 2,
    rideable = true
  },
  [39] = {
    types = { "herbs", "outdoor" },
    weight = 3,
    rideable = true
  },
  [40] = {
    types = { "tailor", "shop", "indoor" },
    weight = 1,
    rideable = false
  },
  [41] = {
    types = { "unknown" },
    weight = 5,
    rideable = true
  },
  [42] = {
    types = { "portalstone", "outdoor" },
    weight = 3,
    rideable = true
  },
  [43] = {
    types = { "ancient", "outdoor" },
    weight = 3,
    rideable = true
  },
  [44] = {
    types = { "smob" },
    weight = false,
    rideable = true
  },
  [45] = {
    types = { "herbs", "shop", "indoor" },
    weight = 1,
    rideable = false
  }
}
