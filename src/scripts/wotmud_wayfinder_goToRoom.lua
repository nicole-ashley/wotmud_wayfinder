wotmud_wayfinder = wotmud_wayfinder or {}

local function shouldAvoidRoom(room)
  local roomEnv = wotmud_wayfinder.environments[getRoomEnv(room)]
  local avoidedEnvironments = table.matches(roomEnv.types, unpack(wotmud_wayfinder.settings.avoid))
  return not table.is_empty(avoidedEnvironments)
end

function wotmud_wayfinder.gotoRoom(destination, beginning)
  if beginning == nil then
    beginning = destination
    a = mmp.currentroom
    if destination == nil or beginning == nil then
      echo("Missing beginning or destination.\n")
      return
    end
  end

  local path, dir

  local function checkRoom(_, room, ipath, idir)
    if getRoomAreaName(getRoomArea(room)) == "Blodfest" then return false end
    if shouldAvoidRoom(room) then return false end

    if room == beginning then
      path = ipath; dir = idir
      return true
    end

    return wotmud_wayfinder.environments[getRoomEnv(room)].weight
  end

  if not findWayToRoom(destination, checkRoom) then return end
  return path, dir
end
