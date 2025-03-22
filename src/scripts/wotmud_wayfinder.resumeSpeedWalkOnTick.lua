wotmud_wayfinder = wotmud_wayfinder or {}

function wotmud_wayfinder.resumeSpeedWalkOnTick()
  disableScript("wotmud_wayfinder.resumeSpeedWalkOnTick")
  if wotmud_wayfinder.settings.manage_exhaustion then
    tempTimer(1, "wotmud_wayfinder.doSpeedWalkNextStep()")
  end
end
