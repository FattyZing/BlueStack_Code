-- Created by NIXEL
-- my github https://github.com/ValdazGT
-- contact me on whatsapp wa.me/6288279119895

addCategory("Nixel", "Verified")
local ui = UserInterface.new("Vend Finder", "Verified")
ui:addTooltip("Vend Finder", "Gunakan Find untuk mendapatkan koordinat x dan y, lalu gunakan FindPath untuk langsung teleport ke lokasi tersebut.", "Verified", true)
ui:addLabel("Pick Item") 
ui:addItemPicker("Select Item", "Dirt", "2", "findid") 
ui:addButton("Find", "finder") 
ui:addButton("FindPath", "fpath")

local jsonui = ui:generateJSON() 
addIntoModule(jsonui, "Nixel") 

function vendfind(item_id)
  for _, tile in pairs(GetTiles()) do
    if tile.fg == 2978 or tile.fg == 9268 then
      local ext = tile.extra
      if ext.owner ~= 0
        and ext.lastupdate ~= 0
        and tonumber(ext.lastupdate) == item_id
      then
        return { x = tile.x, y = tile.y }
      end
    end
  end

  return nil
end

addHook(function(type, name, value)
  if name == "finder" or name == "fpath" then
    local item_id = tonumber(getValue(1, "findid"))
    local vendfinder = vendfind(item_id)

    if not vendfinder then
      growtopia.notify("Not found.")
      return
    end

    if name == "finder" then
      growtopia.notify(
        "Found: x: " .. vendfinder.x .. ", y: " .. vendfinder.y
      )
    elseif name == "fpath" then
      growtopia.notify("Found.")
      FindPath(vendfinder.x, vendfinder.y)
    end
  end
end, "onValue") 