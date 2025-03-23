wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.horse_management = wotmud_wayfinder.horse_management or {}

local triggerIds = {}
local roomChangeEventHandler = nil

function wotmud_wayfinder.horse_management.start()
  table.insert(triggerIds, tempTrigger("You can't ride in there", wotmud_wayfinder.horse_management.dismount, 1))
end

function wotmud_wayfinder.horse_management.stop()
  wotmud_wayfinder.horse_management.clearEventHandler()
  wotmud_wayfinder.horse_management.clearTriggers()
  wotmud_wayfinder.ride_on_next_outdoor_room = false
end

function wotmud_wayfinder.horse_management.clearTriggers()
  for _, id in pairs(triggerIds) do
    killTrigger(id)
  end
  triggerIds = {}
end

function wotmud_wayfinder.horse_management.clearEventHandler()
  if roomChangeEventHandler then
    killAnonymousEventHandler(roomChangeEventHandler)
    roomChangeEventHandler = nil
  end
end

function wotmud_wayfinder.horse_management.dismount()
  if wotmud_wayfinder.settings.manage_horse then
    send("dismount")

    table.insert(triggerIds, tempTrigger("has an indifferent look.", wotmud_wayfinder.horse_management.lead))
    table.insert(triggerIds, tempTrigger("starts following you.", wotmud_wayfinder.horse_management.resumeNavigation))

    wotmud_wayfinder.horse_management.lead()
  end
end

function wotmud_wayfinder.horse_management.lead()
  send("lead")
end

function wotmud_wayfinder.horse_management.resumeNavigation()
  wotmud_wayfinder.horse_management.clearTriggers()
  wotmud_wayfinder.ride_on_next_outdoor_room = true

  roomChangeEventHandler = registerAnonymousEventHandler("wotmud_wayfinder_room_change", wotmud_wayfinder.horse_management.rideIfPossiblyOutdoors)
  table.insert(triggerIds, tempTrigger("You start riding", wotmud_wayfinder.horse_management.stopTryingToRide))
  table.insert(triggerIds, tempTrigger("You're already riding", wotmud_wayfinder.horse_management.stopTryingToRide))

  wotmud_wayfinder.doSpeedWalkNextStep()
end

function wotmud_wayfinder.horse_management.rideIfPossiblyOutdoors()
  if wotmud_wayfinder.settings.manage_horse and
        wotmud_wayfinder.ride_on_next_outdoor_room and
        wotmud_wayfinder.environments[getRoomEnv(wotmudmapper.currentID[1])].rideable
    then
      send("ride")
    end
end

function wotmud_wayfinder.horse_management.stopTryingToRide()
  wotmud_wayfinder.horse_management.stop()
  wotmud_wayfinder.horse_management.start()
end
