wotmud_wayfinder = wotmud_wayfinder or {}
wotmud_wayfinder.door_management = wotmud_wayfinder.door_management or {}

local triggerIds = {}

function wotmud_wayfinder.door_management.start()
  table.insert(triggerIds, tempTrigger("seems to be closed.", wotmud_wayfinder.door_management.openAndResume))
  table.insert(triggerIds, tempTrigger("Alas, you cannot go that way...", wotmud_wayfinder.door_management.openAndResume))
end

function wotmud_wayfinder.door_management.stop()
  for _, id in pairs(triggerIds) do
    killTrigger(id)
  end
  triggerIds = {}
end

function wotmud_wayfinder.door_management.openAndResume()
  if wotmud_wayfinder.settings.manage_doors then
    local currentRoom = wotmudmapper.currentID[1]
    local nextDirection = speedWalkDir[1]
    local nextRoom = speedWalkPath[1]
    local shortDirections = { north = "n", east = "e", south = "s", west = "w", up = "up", down = "down" }
    local nextShortDirection = shortDirections[nextDirection]

    if getRoomChar(currentRoom) == "G" or getRoomChar(nextRoom) == "G" then
      send("call")
    else
      send("open door " .. nextShortDirection)
    end
    wotmud_wayfinder.doSpeedWalkNextStep()
  end
end
