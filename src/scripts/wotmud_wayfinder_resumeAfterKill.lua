wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.resume_after_kill = wotmud_wayfinder.resume_after_kill or {}

local triggerIds = {}

function wotmud_wayfinder.resume_after_kill.start()
  table.insert(triggerIds, tempTrigger("Your blood freezes as you hear", wotmud_wayfinder.resume_after_kill.resume))
end

function wotmud_wayfinder.resume_after_kill.stop()
  for _, id in pairs(triggerIds) do
    killTrigger(id)
  end
  triggerIds = {}
end

function wotmud_wayfinder.resume_after_kill.resume()
  if wotmud_wayfinder.settings.resume_after_kill then
    wotmud_wayfinder.doSpeedWalkNextStep()
  end
end
