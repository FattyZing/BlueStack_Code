function punch(x, y)
    local packet = {}
    packet.type = 3
    packet.state = 2592
    packet.value = 18
    packet.px = x
    packet.py = y
    packet.x = (GetLocal().posX)
    packet.y = (GetLocal().posY)
    SendPacketRaw(false, packet)
end

function place(blockId)
    local player = GetLocal()
    if not player then return false end
    
    local placed = false
    for _, tile in pairs(GetTiles()) do
        if tile.fg == 6 or tile.bg == 6 then  -- Tetap mencari tile dengan ID 6
            SendPacketRaw(false, {
                type = 3,
                state = 2592,
                value = blockId,  -- Menggunakan parameter blockId
                px = (tile.x + 1) ,  -- Offset tetap +2 pada X
                py = (tile.y - 1),  -- Offset tetap -2 pada Y
                x = player.posX,
                y = player.posY
            })
            placed = true
            Sleep(100)
        end
    end
    return placed
end

runThread(function()
    while true do
        local world = GetWorldName()
        local player = GetLocal()
        if player then
            local x, y = math.floor(player.posX / 32), math.floor(player.posY / 32)

            -- WOLFWORLD_1 Pathfinding
            if world == "WOLFWORLD_1" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 17 and y == 49 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(78, 34)
                    Sleep(500)
                elseif x == 78 and y == 34 then
                    growtopia.enter(78, 34)
                    Sleep(1000)
                elseif x == 75 and y == 33 then
                    FindPath(80, 27)
                    Sleep(500)
                elseif x == 80 and y == 27 then
                    growtopia.enter(80, 27)
                    Sleep(1000)
                elseif x == 83 and y == 28 then
                    FindPath(69, 15)
                    Sleep(500)
                elseif x == 69 and y == 15 then
                    growtopia.enter(69, 15)
                    Sleep(1000)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
            
            -- WOLFWORLD_2 Pathfinding
            elseif world == "WOLFWORLD_2" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 2 and y == 51 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(41, 51)
                    Sleep(500)
                elseif x == 94 and y == 49 then
                    FindPath(71, 30)
                    Sleep(500)
                elseif x == 71 and y == 30 then
                    growtopia.enter(71, 30)
                    Sleep(1000)
                elseif x == 58 and y == 33 then
                    FindPath(82, 31)
                    Sleep(500)
                elseif x == 82 and y == 31 then
                    growtopia.enterGateway(82, 31, 0)
                    Sleep(1000)
                 elseif x == 99 and y == 47 then
                    FindPath(53, 5)
                    Sleep(500)
                 elseif x == 53 and y == 5 then
                    growtopia.enter(53, 5)
                    Sleep(1000)
                 elseif x == 50 and y == 5 then
                    FindPath(10, 12)
                    Sleep(500)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
                 
            elseif world == "WOLFWORLD_3" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 56 and y == 26 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(72, 25)
                    Sleep(500)
                elseif x == 96 and y == 26 then
                    FindPath(32, 4)
                    Sleep(500)
                elseif x == 33 and y == 17 then
                    FindPath(8, 49)
                    Sleep(500)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
                elseif world == "WOLFWORLD_4" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 1 and y == 6 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(6, 3)
                    Sleep(500)
                    punch(6, 3)
                    Sleep(1000)  
                elseif x == 6 and y == 3 then
                    punch(6, 3)
                    Sleep(1000)
                    FindPath(25, 4)
                    Sleep(500)
                elseif x == 25 and y == 4 then
                    growtopia.enterGateway(25, 4, 1)
                    Sleep(1000)
                elseif x == 38 and y == 1 then
                    FindPath(26, 2)
                    Sleep(500)
                elseif x == 26 and y == 2 then
                    growtopia.enter(26, 2)
                    Sleep(1000)
                elseif x == 28 and y == 4 then
                    FindPath(51, 11)
                    Sleep(500)
                    punch(51,11)
                    Sleep(1000)
                elseif x == 51 and y == 11 then
                    punch(51,11)
                    Sleep(1000)
                    FindPath(54, 3)
                    Sleep(500)
                elseif x == 54 and y == 3 then
                    growtopia.enterGateway(54, 3, 0)
                    Sleep(1000)
                elseif x == 56 and y == 3 then
                    FindPath(86, 2)
                    Sleep(500)
                    punch(86, 2)
                    Sleep(1000)
                elseif x == 86 and y == 2 then
                    punch(86, 2)
                    Sleep(1000)
                    FindPath(57, 3)
                    Sleep(500)
                elseif x == 57 and y == 3 then
                    growtopia.enterGateway(57, 3, 0)
                    Sleep(1000)
                elseif x == 57 and y == 10 then
                    FindPath(42, 50)
                    Sleep(500)
                elseif x == 42 and y == 50 then
                    growtopia.enter(42, 50)
                    Sleep(1000)
                elseif x == 58 and y == 47 then
                    FindPath(42, 47)
                    Sleep(500)
                elseif x == 42 and y == 47 then
                    growtopia.enter(42, 47)
                    Sleep(1000)
                elseif x == 42 and y == 44 then
                    FindPath(66, 27)
                    Sleep(500)
                elseif x == 66 and y == 27 then
                    growtopia.enter(66, 27)
                    Sleep(1000)
                elseif x == 80 and y == 36 then
                    FindPath(74, 36)
                    Sleep(500)
                    punch(74, 36)
                    Sleep(1000)
                elseif x == 74 and y == 36 then
                    punch(74, 36)
                    Sleep(1000)
                    FindPath(42, 44)
                    Sleep(3000)
                    growtopia.enter(42, 44)
                    Sleep(3000)
                    FindPath(58, 47)
                    Sleep(3000)
                    growtopia.enter(58, 47)
                    Sleep(3000)
                elseif x == 58 and y == 50 then
                    FindPath(36, 49)
                    Sleep(500)
                elseif x == 36 and y == 49 then
                    growtopia.enterGateway(36, 49, 1)
                    Sleep(1000)
                elseif x == 32 and y == 46 then
                    FindPath(50, 30)
                    Sleep(3000)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
            -- WOLFWORLD_5 Pathfinding
            elseif world == "WOLFWORLD_5" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 97 and y == 47 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(6, 2)
                    Sleep(500)
                elseif x == 98 and y == 52 then
                    FindPath(1, 1)
                    Sleep(500)
                elseif x == 1 and y == 1 then
                    growtopia.enter(1, 1)
                    Sleep(1000)
                elseif x == 91 and y == 25 then
                    FindPath(38, 24)
                    Sleep(500)
                elseif x == 84 and y == 5 then
                    FindPath(43, 5)
                    Sleep(500)
                elseif x == 53 and y == 9 then
                    FindPath(63, 11)
                    Sleep(3000)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
                
                elseif world == "WOLFWORLD_6" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 98 and y == 51 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(15, 41)
                    Sleep(500)
                elseif x == 53 and y == 42 then
                    FindPath(77, 42)
                    Sleep(3000)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
            elseif world == "WOLFWORLD_7" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 3 and y == 5 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(31, 2)
                    Sleep(500)
                    punch(31, 2)
                    Sleep(1000)
                elseif x == 31 and y == 2 then
                    punch(31, 2)
                    Sleep(1000)
                    FindPath(42, 42)
                    Sleep(500)
                elseif x == 42 and y == 42 then
                    growtopia.enter(42, 42)
                    Sleep(1000)
                elseif x == 3 and y == 46 then
                    FindPath(93, 17)
                    Sleep(500)
                    punch(93, 17)
                    Sleep(1000)
                elseif x == 93 and y == 17 then
                    punch(93, 17)
                    Sleep(1000)
                    FindPath(62, 11)
                    Sleep(500)
                elseif x == 62 and y == 11 then
                    FindPath(64, 46)
                    Sleep(500)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
            
            -- WOLFWORLD_8 Pathfinding
            elseif world == "WOLFWORLD_8" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 50 and y == 57 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(54, 57)
                    Sleep(500)
                elseif x == 80 and y == 47 then
                    FindPath(79, 44)
                    Sleep(500)
                elseif x == 79 and y == 44 then
                    growtopia.enter(79, 44)
                    Sleep(1000)
                elseif x == 94 and y == 35 then
                    FindPath(91, 32)
                    Sleep(500)
                    punch(91, 32)
                    Sleep(1000)
                elseif x == 91 and y == 32 then
                    punch(91, 32)
                    Sleep(1000)
                    FindPath(95, 35)
                    Sleep(500)
                 elseif x == 95 and y == 37 then
                    FindPath(5, 22)
                    Sleep(500)
                    FindPath(1,51)
                    Sleep(3000)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
                
                
            elseif world == "WOLFWORLD_9" then
                growtopia.notify("`4Don't Move")
                Sleep(1000)
                if x == 12 and y == 28 then
                    Sleep(2500)
                    place(2992)
                    Sleep(2500)
                    FindPath(64, 46)
                    Sleep(500)
                elseif x == 64 and y == 46 then
                    punch(64, 46, 18)
                    Sleep(1000)
                    FindPath(51, 49)
                    Sleep(500)
                elseif x == 51 and y == 49 then
                    growtopia.enterGateway(51, 49, 0)
                    Sleep(1000)
                elseif x == 7 and y == 45 then
                    FindPath(0, 18)
                    Sleep(500)
                elseif x == 0 and y == 18 then
                    punch(0, 18)
                    Sleep(1000)
                    FindPath(6, 13)
                    Sleep(500)
                elseif x == 6 and y == 13 then
                    FindPath(18, 7)
                    Sleep(500)
                    growtopia.notify("`0[`2CraftID.GT`0]`4World Wolf is Done : Trying To Back`c")
                    SendPacket(3, "action|join_request\nname|uinjx")
                    Sleep(10000)
                    place(2992)
                    Sleep(2500)
                end
            end
        end
        Sleep(1000)
    end
end)
