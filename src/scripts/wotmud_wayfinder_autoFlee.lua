wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.auto_flee = wotmud_wayfinder.auto_flee or {}

local triggerIds = {}

function wotmud_wayfinder.auto_flee.start()
  table.insert(triggerIds, tempTrigger("You're fighting for your life!", wotmud_wayfinder.auto_flee.flee))
  table.insert(triggerIds, tempTrigger("You couldn't escape!", wotmud_wayfinder.auto_flee.flee))
end

function wotmud_wayfinder.auto_flee.stop()
  for _, id in pairs(triggerIds) do
    killTrigger(id)
  end
  triggerIds = {}
end

function wotmud_wayfinder.auto_flee.flee()
  if wotmud_wayfinder.settings.auto_flee then
    send("flee")
  end
end
