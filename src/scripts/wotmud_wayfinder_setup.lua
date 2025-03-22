wotmud_wayfinder = wotmud_wayfinder or {}

function wotmud_wayfinder.packageInstalled(_, name)
  if name == "wayfinder-an-alternate-route-finder-package" or name == "mapper_scripts" then
    cecho("<red>Please restart Mudlet to enable WotMUD Wayfinder navigation.")
  end
end

registerAnonymousEventHandler("sysInstallPackage", wotmud_wayfinder.packageInstalled)
disableScript("doSpeedWalk")
disableScript("gotoRoom example")
