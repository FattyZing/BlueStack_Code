-- Created by NIXEL
-- my github https://github.com/ValdazGT
-- contact me on whatsapp wa.me/6288279119895

-- dough, egg, bacon, milk
-- 956, 874, 4586, 868

local delay = 500 -- kontans, jangan di ubah
local oven = 0
-- jumlah oven
-- MIN 1- MAX 25
-- 0 = AUTO DETECT
local loop = true -- loop? true or false
-- true = progam looping sampai bahan habis

function gp() 
local pos = {}
pos.x = GetLocal().posX // 32
pos.y = GetLocal().posY // 32
return pos
end

function c(x, y) 
return GetTile(x, y).fg == 4618
end

-- auto detect
if oven == 0 then
for y = -2, 2 do
    for x = -2, 2 do
        local posx = gp().x + x
        local posy = gp().y + y
        if c(posx, posy) then
        oven = oven + 1
        end
    end
end
log("Detected `2" .. oven .. " oven")
end

function spr(type, value, tileX, tileY)
    SendPacketRaw(false, {
        type = type,
        value = value,
        px = tileX,
        py = tileY,
        x = GetLocal().posX,
        y = GetLocal().posY
    })
end

function letmecook() 

local ovn = oven
for y = -2, 2 do
    for x = -2, 2 do
        local posx = gp().x + x
        local posy = gp().y + y
if c(posx, posy) and ovn > 0 then
ovn = ovn - 1
        spr(3, 956, posx, posy) 
        SendPacket(2, "action|dialog_return\ndialog_name|oven\ntilex|"..posx.."|\ntiley|"..posy.."|\ncookthis|956|\nbuttonClicked|low\n\ndisplay_timer|1") 
        Sleep(delay / 2)
        spr(3, 874, posx, posy) 
        Sleep(delay / 2)
end
    end
end

Sleep(12500 - (delay * oven))

ovn = oven
for y = -2, 2 do
    for x = -2, 2 do
        local posx = gp().x + x
        local posy = gp().y + y
if c(posx, posy) and ovn > 0 then
ovn= ovn - 1
        spr(3, 4586, posx, posy) 
        Sleep(delay)
end
    end
end

Sleep(13500 - (delay * oven))

ovn = oven
for y = -2, 2 do
    for x = -2, 2 do
        local posx = gp().x + x
        local posy = gp().y + y
if c(posx, posy) and ovn > 0 then
ovn = ovn - 1
        spr(3, 868, posx, posy) 
        Sleep(delay)
end
    end
end

Sleep(34000 - (delay * oven))

ovn = oven
for y = -2, 2 do
    for x = -2, 2 do
        local posx = gp().x + x
        local posy = gp().y + y
if c(posx, posy) and ovn > 0 then
ovn = ovn - 1
        spr(3, 18, posx, posy) 
        Sleep(delay)
end
    end
end
end

if loop then
while true do
letmecook() 
end
end

if not loop then
letmecook() 
end
