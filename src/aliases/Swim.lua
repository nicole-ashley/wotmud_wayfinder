wotmud_wayfinder.settings.swim = not wotmud_wayfinder.settings.swim
cecho(
    "WoTMUD Wayfinder swimming is now " ..
    (wotmud_wayfinder.settings.swim and "<green>on" or "<red>off") ..
    "<reset>.\n"
)
