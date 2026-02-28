id = 2  -- id block
delay = 180 -- delay to break & place
hits = 4  -- hit count your block (example hitcount dirt is 4)
breaktile = 5 -- tile to break only can 1-5!!!

function place(x, y, id)
  SendPacketRaw(false, {
    xspeed = 0, yspeed = 0, state = 0, type = 3,
    y = GetLocal().posY, px = x, netid = 0, py = y,
    value = id, x = GetLocal().posX
  })
end

function punch(x, y)
  SendPacketRaw(false, {
    xspeed = 0, yspeed = 0, state = 0, type = 3,
    y = GetLocal().posY, px = x, netid = 0, py = y,
    value = 18, x = GetLocal().posX
  })
end

while true do
for i = 1, breaktile do
place(GetLocal().posX // 32 -3 + i, GetLocal().posY // 32-1, id)
sleep(delay)
end
for i = 1, hits do
for j = 1, breaktile do
punch(GetLocal().posX // 32 - 3 + j, GetLocal().posY // 32-1)
sleep(delay)
end
end
end