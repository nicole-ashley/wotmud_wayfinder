local avoid = (table.concat(wotmud_wayfinder.settings.avoid, ", ") or "none")
local flee = (wotmud_wayfinder.settings.auto_flee and "on" or "off")
local doors = (wotmud_wayfinder.settings.manage_doors and "on" or "off")
local exhaustion = (wotmud_wayfinder.settings.manage_exhaustion and "on" or "off")
local horse = (wotmud_wayfinder.settings.manage_horse and "on" or "off")
local kills = (wotmud_wayfinder.settings.resume_after_kill and "on" or "off")

local help = {
  "",
  "<cyan>WoTMUD Wayfinder Help",
  "",
  "WoTMUD Wayfinder implements auto-walk (step by step speedwalk) using the Wayfinder algorithm. This allows smart weighting based on room type, and persistent, non-blocking navigation that responds to things that might get in your way along your journey.",
  "",
  "<red>Note:<reset> WotMUD Wayfinder must be installed after its dependencies. If you did not install wotpack Mapper and Wayfinder before WoTMUD Wayfinder, you will need to restart Mudlet after all three packages are installed for it to start working.",
  "",
  "Commands are as follows:",
  "",
  "<yellow>wotmud_wayfinder help",
  "Display this help text.",
  "",
  "<yellow>stopwalk",
  "Stop the current navigation.",
  "",
  "<yellow>wotmud_wayfinder avoid [type]<reset> (" .. avoid .. ")",
  "Automatically avoid rooms of specific types. Avoiding a type already avoided will turn that type off. Use without a type to get a list of available types.",
  "",
  "<yellow>wotmud_wayfinder flee<reset> (" .. flee .. ")",
  "Automatically flee when navigation is blocked by fighting.",
  "",
  "<yellow>wotmud_wayfinder doors<reset> (" .. doors .. ")",
  "Automatically open doors and call for gates.",
  "",
  "<yellow>wotmud_wayfinder exhaustion<reset> (" .. exhaustion .. ")",
  "Automatically resume on tic after exhaustion (requires wotpack tic_timer to be installed and active).",
  "",
  "<yellow>wotmud_wayfinder horse<reset> (" .. horse .. ")",
  "Automatically dismount when navigation is blocked by riding, and re-mount when outdoors again.",
  "",
  "<yellow>wotmud_wayfinder kills<reset> (" .. kills .. ")",
  "Automatically resume after you kill whatever you're fighting with.",
  "",
}

for _, line in pairs(help) do
  cecho(line .. "\n")
end
