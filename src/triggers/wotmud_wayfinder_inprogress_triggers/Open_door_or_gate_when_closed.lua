if wotmud_wayfinder.settings.manage_doors then
    local currentRoom = wotmudmapper.currentID[1]
    local nextDirection = speedWalkDir[1]
    local nextRoom = speedWalkPath[1]
    local shortDirections = { north = "n", east = "e", south = "s", west = "w", up = "up", down = "down" }
    local nextShortDirection = shortDirections[nextDirection]
    local doorInNextDirection = getDoors(currentRoom)[nextShortDirection]

    if doorInNextDirection ~= nil then
        if getRoomChar(currentRoom) == "G" or getRoomChar(nextRoom) == "G" then
            send("call")
        else
            send("open door " .. nextShortDirection)
        end
        wotmud_wayfinder.doSpeedWalkNextStep()
    end
end
