wotmud_wayfinder = wotmud_wayfinder or {}

function wotmud_wayfinder.gotoRoom(a, b)
  if b == nil then
    b = a
    a = mmp.currentroom
    if a == nil or b == nil then
      print("NIL source or destination")
      return
    end
  end

  local rooms, ways

  local function chk(d, room, irooms, iway)
    if getRoomAreaName(getRoomArea(room)) == "Blodfest" then return false end

    local roomEnv = wotmud_wayfinder.environments[getRoomEnv(room)]
    if not table.is_empty(table.matches(roomEnv.types, unpack(wotmud_wayfinder.settings.avoid))) then
      return false
    end

    if room == b then
      rooms = irooms; ways = iway
      return true
    end

    return roomEnv.weight
  end

  if not findWayToRoom(a, chk) then return end
  return rooms, ways
end

function wotmud_wayfinder.endSpeedWalk()
  disableTrigger("wotmud_wayfinder_inprogress_triggers")
  disableTimer("wotmud_wayfinder detect wotmudmapper room change")
end

function wotmud_wayfinder.doSpeedWalkNextStep()
  if next(speedWalkDir) == nil then
    wotmud_wayfinder.endSpeedWalk()
    return
  end

  local currentRoom = wotmudmapper.currentID[1]
  local nextDirection = speedWalkDir[1]
  local nextRoom = speedWalkPath[1]
  local roomInNextDirection = getRoomExits(currentRoom)[nextDirection]

  if tostring(roomInNextDirection) == tostring(nextRoom) then
    send(nextDirection:sub(1, 1))
    wotmud_wayfinder.last_current_room_id = currentRoom

    enableTimer("wotmud_wayfinder detect wotmudmapper room change")
    enableTrigger("wotmud_wayfinder_inprogress_triggers")
  end
end

function doSpeedWalk()
  --if you are not allowed to speedwalk, just return
  if not wotmudmapper.configs.speedwalk then
    wotmudmapper:echo(
    "Speedwalking by double clicking on rooms is currently disabled. \"map speedwalk\" to enable it.\n", false, true)
    return
  end

  if table.size(wotmudmapper.currentID) == 1 then
    local rooms
    local ways
    rooms, ways = wotmud_wayfinder.gotoRoom(wotmudmapper.currentID[1], speedWalkTo)
    if rooms ~= nil then
      speedWalkDir = ways
      speedWalkPath = rooms
      wotmud_wayfinder.doSpeedWalkNextStep()
    else
      echo("Unable to find a way to your destination. Check that you're not avoiding an unavoidable room type between there and where you are currently.\n")
    end
  else
    wotmudmapper:echo("Current room not known.\n", false, true)
  end
end
