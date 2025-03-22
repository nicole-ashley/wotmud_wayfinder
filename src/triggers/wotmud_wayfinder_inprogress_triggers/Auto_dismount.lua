if wotmud_wayfinder.settings.manage_horse then
  enableTrigger("wotmud_wayfinder_ensure_horse_follow")
  send("dismount;;lead")
  enableTrigger("wotmud_wayfinder_ensure_horse_ride")
  wotmud_wayfinder.ride_on_next_outdoor_room = true
end
