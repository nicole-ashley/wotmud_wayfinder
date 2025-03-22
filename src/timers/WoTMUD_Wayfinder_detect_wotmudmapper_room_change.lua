if wotmudmapper.currentID[1] ~= wotmud_wayfinder.last_current_room_id then
  disableTimer("wotmud_wayfinder detect wotmudmapper room change")
  wotmud_wayfinder.last_current_room_id = wotmudmapper.currentID[1]

  if tostring(wotmudmapper.currentID[1]) == tostring(speedWalkPath[1]) then
    if wotmud_wayfinder.settings.manage_horse and
        wotmud_wayfinder.ride_on_next_outdoor_room and
        wotmud_wayfinder.environments[getRoomEnv(wotmudmapper.currentID[1])].rideable
    then
      send("ride")
    end

    table.remove(speedWalkDir, 1)
    table.remove(speedWalkPath, 1)
    wotmud_wayfinder.doSpeedWalkNextStep()
  else
    doSpeedWalk()
  end
end
