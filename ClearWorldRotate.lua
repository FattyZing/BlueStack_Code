--------------------------------------------------
-- AUTO CLEAR WORLD + WORLD LIST
-- Script by YaviF
--------------------------------------------------

-------------------------
-- CONFIG
-------------------------
local DELAY_BREAK = 180 -- delay break (ms)

-- LIST WORLD YANG AKAN DI CLEAR (URUT)
local WORLD_LIST = {
    "WORLD1",
    "WORLD2",
    "WORLD3"
}

-------------------------
-- SHORT FUNCTION
-------------------------
local function pos()
    return {
        x = GetLocal().posX // 32,
        y = GetLocal().posY // 32
    }
end

local function log(...)
    LogToConsole("`c[`9YaviF Script``]`9>> `0" .. table.concat({...}, " : "))
end

local function punch(x, y)
    SendPacketRaw(false, {
        type = 3,
        value = 18,
        px = x,
        py = y,
        x = GetLocal().posX,
        y = GetLocal().posY
    })
end

local function randomSleep(base)
    local t = math.random(base, base + 50)
    Sleep(t)
end

local function safePath(x, y)
    local dx = math.abs(pos().x - x)
    local dy = math.abs(pos().y - y)
    if dx > 2 or dy > 2 then
        FindPath(x, y)
        Sleep(math.random(55, 70))
    end
end

-------------------------
-- CLEAR WORLD FUNCTION
-------------------------
local function clearWorld()
    for y = 0, 53 do
        for x = 0, 99 do
            local tile = GetTile(x, y)

            if not tile.extra
            and (tile.bg ~= 0 or tile.fg % 2 == 1)
            and tile.fg ~= 8 then

                safePath(x, y - 1)

                while GetTile(x, y).fg ~= 0
                   or GetTile(x, y).bg ~= 0 do
                    punch(x, y)
                    randomSleep(DELAY_BREAK)
                end
            end
        end
    end
end

-------------------------
-- MAIN LOOP WORLD LIST
-------------------------
log("Script Started")

for i, world in ipairs(WORLD_LIST) do
    log("Warping to", world)
    SendPacket(3, "action|join_request\nname|" .. world)
    Sleep(4000)

    log("Clearing world", world)
    clearWorld()

    log("Finished clearing", world)
    Sleep(2000)
end

log("All world cleared")