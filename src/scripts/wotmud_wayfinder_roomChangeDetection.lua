wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.room_change_detection = wotmud_wayfinder.room_change_detection or {}

local timerId = nil

function wotmud_wayfinder.room_change_detection.start()
  timerId = tempTimer(0.001, wotmud_wayfinder.room_change_detection.fireEventIfRoomHasChanged, true)
end

function wotmud_wayfinder.room_change_detection.stop()
  if timerId then
    killTimer(timerId)
  end
end

function wotmud_wayfinder.room_change_detection.fireEventIfRoomHasChanged()
  if wotmudmapper.currentID[1] ~= wotmud_wayfinder.last_current_room_id then
    wotmud_wayfinder.last_current_room_id = wotmudmapper.currentID[1]
    raiseEvent("wotmud_wayfinder_room_change")
  end
end
