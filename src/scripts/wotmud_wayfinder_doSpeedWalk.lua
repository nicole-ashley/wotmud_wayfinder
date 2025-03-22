wotmud_wayfinder = wotmud_wayfinder or {}

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
  disableTrigger("wotmud_wayfinder_inprogress_triggers")
  disableTimer("wotmud_wayfinder detect wotmudmapper room change")
end

function wotmud_wayfinder.doSpeedWalkNextStep()
  local nextDirection = speedWalkDir[1]

  if nextDirection == nil then
    wotmud_wayfinder.endSpeedWalk()
    return
  end

  send(nextDirection:sub(1, 1))
  wotmud_wayfinder.last_current_room_id = wotmudmapper.currentID[1]

  enableTimer("wotmud_wayfinder detect wotmudmapper room change")
  enableTrigger("wotmud_wayfinder_inprogress_triggers")
end

function doSpeedWalk()
  wotmud_wayfinder.endSpeedWalk()
  if table.size(wotmudmapper.currentID) == 1 then
    speedWalkPath, speedWalkDir = wotmud_wayfinder.gotoRoom(wotmudmapper.currentID[1], speedWalkTo)
    if speedWalkPath ~= nil then
      highlightPath(speedWalkPath)
      wotmud_wayfinder.doSpeedWalkNextStep()
    else
      echo(
      "Unable to find a way to your destination. Check that you're not avoiding an unavoidable room type between there and where you are currently.\n")
    end
  else
    echo("Current room not known.\n")
  end
end
