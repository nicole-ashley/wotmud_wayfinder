local availableTypes = {}
for _, environment in pairs(wotmud_wayfinder.environments) do
  for _, type in pairs(environment.types) do
    if not table.contains(availableTypes, type) then
      table.insert(availableTypes, type)
    end
  end
end
table.sort(availableTypes)

if matches[2] then
  local type = matches[2]:lower()
  local displayType = "<yellow>" .. type:sub(1, 1):upper() .. type:sub(2) .. "<reset>"
  local existingPosition = table.index_of(wotmud_wayfinder.settings.avoid, type)

  if existingPosition then
    table.remove(wotmud_wayfinder.settings.avoid, existingPosition)
    cecho(displayType .. " rooms will no longer be avoided.\n")
  else
    if table.contains(availableTypes, type) then
      table.insert(wotmud_wayfinder.settings.avoid, type)
      table.sort(wotmud_wayfinder.settings.avoid)
      cecho(displayType .. " rooms will now be avoided.\n")
      wotmud_wayfinder.saveSettings()
    else
      cecho(displayType .. " is not a type of room that can be avoided.\n")
    end
  end
else
  echo("Currently avoiding: " .. table.concat(wotmud_wayfinder.settings.avoid, ", ") .. "\n")
  echo("Available types: " .. table.concat(availableTypes, ", ") .. "\n")
end
