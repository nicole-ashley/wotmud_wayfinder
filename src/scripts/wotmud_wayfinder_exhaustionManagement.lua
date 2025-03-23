wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.exhaustion_management = wotmud_wayfinder.exhaustion_management or {}

local triggerIds = {}
local ticEventHandler = nil

function wotmud_wayfinder.exhaustion_management.start()
  table.insert(triggerIds, tempTrigger("too exhausted.", wotmud_wayfinder.exhaustion_management.resumeOnTic))
end

function wotmud_wayfinder.exhaustion_management.stop()
  for _, id in pairs(triggerIds) do
    killTrigger(id)
  end
  triggerIds = {}
end

function wotmud_wayfinder.exhaustion_management.resumeOnTic()
  if wotmud_wayfinder.settings.manage_exhaustion and not ticEventHandler then
    ticEventHandler = registerAnonymousEventHandler('tic', wotmud_wayfinder.exhaustion_management.resume)
  end
end

function wotmud_wayfinder.exhaustion_management.resume()
  killAnonymousEventHandler(ticEventHandler)
  ticEventHandler = nil
  tempTimer(1, wotmud_wayfinder.doSpeedWalkNextStep)
end
