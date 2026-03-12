--Source by Lezai#1616



EditToggle("ModFly", true)


local ui =
    [[
{
"sub_name": "Auto Clear GUI",
"icon": "Rocket",
"menu": [
{
 "type": "labelapp",
"icon": Bolt,
 "text": "Script by Lezai"
},
{
 "type": "label",
 "text": "Auto Clear"
},
{
 "type": "toggle",
 "text": "Enable Auto Clear",
  "alias": "Lezai_enable",
 "default": false
},
{
 "type": "slider",
 "text": "Delay Break",
  "alias": "Lezai2_delay",
  "max": 1000,
 "default": 180
},
{
 "type": "slider",
 "text": "Delay Move",
  "alias": "Lezai3_delay",
  "max": 1000,
 "default": 400
},
{
 "type": "tooltip",
 "text": "Note!",
 "icon": tips_icon,
 "support_text": "BETA TEST Masih Ngebug ."
}
]
}
]]
setMinimum("6.1.2")
addIntoModule(ui)

open = 0
source =  400
by = 180
memek = true

function punch(x,y)
    SendPacketRaw(false, {
        x = GetLocal().posX,
        y = GetLocal().posY,
        px = x,
        py = y,
        type = 3,
        value = 18
    })
end
function anjing()
for _, tile in pairs(GetTiles()) do
if memek == true then
    if tile.bg == 14 then
sleep(100)
        FindPath(tile.x,tile.y-1)
        Sleep(by)
        if tile.fg ~= 8 then
           while GetTile(tile.x,tile.y).bg == 14 do 
                punch(tile.x,tile.y)
                Sleep(source)
end
end
end
end
end
end
runThread(function()
while true do
if memek == true then
anjing()
end
if memek == false then
end
end
end)

function onValue(type, name, value)
    if type == 0 and name == "Lezai_enable" then
        memek = value
    end

    if type == 1 and name == "Lezai2_delay" then
        source = value
    end

if type == 1 and name == "Lezai3_delay" then
        by = value
    end
end
applyHook()
log("`#Script By `bLezai#1616")