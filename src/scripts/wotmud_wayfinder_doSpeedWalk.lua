wotmud_wayfinder = wotmud_wayfinder or {}

local roomChangeEventHandler = nil

local function highlightPath()
  for _, room in pairs(speedWalkPath) do
    highlightRoom(room, 0, 0, 0, 255, 255, 255, 0.75, 255, 255)
  end
end

local function unhighlightPath()
  if speedWalkPath then
    for _, room in pairs(speedWalkPath) do
      unHighlightRoom(room)
    end
  end
end

function wotmud_wayfinder.endSpeedWalk()
  unhighlightPath()
  if roomChangeEventHandler then killAnonymousEventHandler(roomChangeEventHandler) end
  wotmud_wayfinder.auto_flee.stop()
  wotmud_wayfinder.door_management.stop()
  wotmud_wayfinder.exhaustion_management.stop()
  wotmud_wayfinder.horse_management.stop()
  wotmud_wayfinder.resume_after_kill.stop()
  wotmud_wayfinder.room_change_detection.stop()
end

function wotmud_wayfinder.handleRoomChange()
  if tostring(wotmudmapper.currentID[1]) == tostring(speedWalkPath[1]) then
    unHighlightRoom(wotmudmapper.currentID[1])
    table.remove(speedWalkDir, 1)
    table.remove(speedWalkPath, 1)
    wotmud_wayfinder.doSpeedWalkNextStep()
  else
    doSpeedWalk()
  end
end

function wotmud_wayfinder.doSpeedWalkNextStep()
  local nextDirection = speedWalkDir[1]
  if nextDirection == nil then
    wotmud_wayfinder.endSpeedWalk()
    return
  end

  send(nextDirection:sub(1, 1))
  wotmud_wayfinder.last_current_room_id = wotmudmapper.currentID[1]
end

function doSpeedWalk()
  wotmud_wayfinder.endSpeedWalk()
  if table.size(wotmudmapper.currentID) == 1 then
    speedWalkPath, speedWalkDir = wotmud_wayfinder.gotoRoom(wotmudmapper.currentID[1], speedWalkTo)
    if speedWalkPath ~= nil then
      highlightPath(speedWalkPath)
      roomChangeEventHandler = registerAnonymousEventHandler("wotmud_wayfinder_room_change", wotmud_wayfinder.handleRoomChange)
      wotmud_wayfinder.room_change_detection.start()
      wotmud_wayfinder.auto_flee.start()
      wotmud_wayfinder.door_management.start()
      wotmud_wayfinder.exhaustion_management.start()
      wotmud_wayfinder.horse_management.start()
      wotmud_wayfinder.resume_after_kill.start()
      wotmud_wayfinder.doSpeedWalkNextStep()
    else
      echo(
        "Unable to find a way to your destination. Check that you're not avoiding an unavoidable room type between there and where you are currently.\n")
    end
  else
    echo("Current room not known.\n")
  end
end
