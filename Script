-- ON MODFLY --
-- if you want to harvest a tree just exchange the for loop where x should be at the bottom and y at the top (don't forget the numbers too) --
block = 928 -- tree you want to harvest --
EditToggle("ModFly",true)
var ={}
var.v1 = "OnTextOverlay"
var.v2 = "Free Auto Science Script by Jmvidad"
SendVariant(var)
function hit()

packet = {}

packet.type = 3

packet.value = 18

packet.x = GetLocal().posX

packet.y = GetLocal().posY

packet.px = math.floor(GetLocal().posX//32)

packet.py = math.floor(GetLocal().posY//32)

sendPacketRaw(false,packet)

end

function Ready(id)
for _, tile in pairs(GetTiles()) do
if tile.id == block then
return tile.readyharvest
end
end
end

for x = 0, 100 do

for y = 0, 54 do

if GetTile(x,y).fg == block and GetTile(x,y).readyharvest then
Sleep(300)
FindPath(x,y)
Sleep(300)
hit()
Sleep(300)

end

end

end
