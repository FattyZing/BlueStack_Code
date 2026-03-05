-------------------------------------
--Proxy Config
-------------------------------------

mode = "rgt" -- rgt / cps
fastdrop = false
realfake = false --bugged
stax = 16
betwl = 500
savew = "WorldName" --World Save
autocsn = true

-------------------------------------
--Don't Edit
-------------------------------------

Aount2 = 0
cgcek = 0
cgset = 25
systemlog = "`7[ `4Bchola-Proxy `7]`o "

-------------------------------------
--End of Define Section
-------------------------------------

logd = {}
conte = 0
x1 = 58
y1 = 24
x2 = 64
y2 = 24
earned = 0
Aount = betwl
modflai = "`4Disabled"
nmove = 1

if GetWorldName() == "EXIT" then
table.insert(logd,"\nadd_label_with_icon|small|`wScript runned while not in a world|left|13806|\n")
else
table.insert(logd,"\nadd_label_with_icon|small|`wScript runned while in `2"..GetWorldName().."|left|13804|\n")
end
nameset = false
timer = os.date("%H:%M")
function inv(id)
for _, item in pairs(GetInventory()) do
if (item.id == id) then
return item.amount
end
end
return 0
end

-------------------------------------
--Start the Proxy
-------------------------------------

drop = 0
function on_sendpacket(str, packet)

inpuc0o1 = "action|input\n|text|"

function cmd(str)
if packet:find(inpuc0o1 .. str) then
match = packet:match(inpuc0o1 .. str)
return true
end
end

function ont(teks)
v = {}
v.v1 = "OnTextOverlay"
v.v2 = teks
SendVariant(v)
end

function dialog(tkss)
va = {}
va.v1 = "OnDialogRequest"
va.v2 = tkss
SendVariant(va)
end

function wear(ids)
pkt = {}
pkt.type = 10
pkt.value = ids
SendPacketRaw(false, pkt)
end

function path(x,y)
SendPacketRaw(false, {state = 32,
x = x*32,
y = y*32})
end

function log(aa)
LogToConsole(systemlog .. aa)
end

function rdrop(id, amount)
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..amount)
end

function cdrop(id, amount)
SendPacket(2,"action|dialog_return\ndialog_name|drop\nitem_drop|"..id.."|\nitem_count|"..amount)
end

-------------------------------------
--Create Command
-------------------------------------

if cmd("/proxy") or packet:find("buttonClicked|cmd") then
gazette = [[add_label_with_icon|big|`9PROXY Commands    ````       |left|32|
add_spacer|small|
add_smalltext|`9Welcome, to the `5#1 Best OPEN SOURCE Proxy `9script.|left|
add_smalltext|`9What will you do today?, ]]..GetLocal().name..[[|left|
add_spacer|small|
add_label_with_icon|small|`5Information:|left|3524|
add_spacer|small|
add_textbox|`9/proxy `2- Show proxy command|left|
add_textbox|`9/pstats `2- Show proxy stats|left|
add_spacer|small|
add_label_with_icon|small|`5Lock Command:|left|1422|
add_spacer|small|
add_textbox|`9/daw `2- Drop All Locks|left|
add_textbox|`9/cd `1[AMOUNT] `2- Custom Drop Lock|left|
add_textbox|`9/wd `1[AMOUNT] `2- Drop WL only|left|
add_textbox|`9/dd `1[AMOUNT] `2- Drop DL only|left|
add_textbox|`9/bd `1[AMOUNT] `2- Drop BGL only|left|
add_textbox|`9/bal `2- Show WL Balance|left|
add_textbox|`9/rafter `1[1-9] `2- Reset gems counter|left|
add_spacer|small|
add_label_with_icon|small|`5World Command:|left|242|
add_spacer|small|
add_textbox|`9/rejoin `2- Rejoin world|left|
add_textbox|`9/save `1[TEXT] `2- Save world to save wl|left|
add_textbox|`9/gsave `2- Go to save world|left|
add_textbox|`9/res `2- Fast respawn|left|
add_spacer|small|
add_label_with_icon|small|`5CSN Helper Command:|left|758|
add_spacer|small|
add_textbox|`9/pos1 `2- Set Pos 1 (Left)|left|
add_textbox|`9/pos2 `2- Set Pos 2 (Right)|left|
add_textbox|`9/auto `2- Auto take when /w1, /w2|left|
add_textbox|`9/tax `1[AMOUNT] `2- Set tax, don't add "%"|left|
add_textbox|`9/bet `1[AMOUNT] `2- Set Bet WL, DL, BGL|left|
add_textbox|`9/take `2- Take WL, DL, BGL|left|
add_textbox|`9/w1 `2- Drop WL to winner (Room 1)|left|
add_textbox|`9/w2 `2 Drop WL to winner (Room 2)|left|
add_spacer|small|
add_label_with_icon|small|`5More Command:|left|2376|
add_spacer|small|
add_textbox|`9/psc `2- Security Camera (`1only show u`2)|left|
add_textbox|`9/drop `1[ITEMID] [AMOUNT] `2- Drop item with command|left|
add_textbox|`9/name `1[TEXT] `2- Visual Name|left|
add_textbox|`9/relog `2- Fast Relog game|left|
add_textbox|`9/skin `1[SKIN ID] `2- Change Skin Colour (gtps)|left|
add_textbox|`9/fd `2- Fast Drop Toggle|left|
add_spacer|small|
add_quick_exit||
end_dialog|gazz|Cancel|Okay|
]]

dialog(gazette)
return true
end

if cmd("/psc") then
sekurc = [[
set_default_color|`o
add_label_with_icon|big|`wPrivate Security Camera|left|1436|
add_spacer|small|
add_label_with_icon|small|`wScript runned at ]]..timer..[[|left|3524|
]]..table.concat(logd)..[[
add_spacer|small|
add_quick_exit|
add_button|clearl|`4Clear Log|noflags|0|0|
end_dialog|priv_cam||OK|
]]
dialog(sekurc)
return true
end

if cmd("/wd (%d+)") then

if (inv(242) == 0 or inv(242) < tonumber(match)) then
ont("`4You don't have enough World Lock to drop.")
elseif inv(242) >= 1 then
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..match.." `wWorld Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
log("`2Dropped `9"..match.."`2 World Lock.")
if mode == "rgt" then
rdrop(242, match)
else
cdrop(242, match)
end
end

return true
end

if cmd("/dd (%d+)") then
if inv(1796) == 0 or inv(1796) < tonumber(match) then
ont("`4You don't have enough Diamond Lock to drop.")
else
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..match.." `wDiamond Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
log("`2Dropped `9"..match.."`2 Diamond Lock.")

if mode == "rgt" then
rdrop(1796, match)
else
cdrop(1796, match)
end
end
return true
end

if cmd("/bd (%d+)") then
if inv(7188) == 0 or inv(7188) < tonumber(match) then
ont("`4You don't have enough Blue Gem Lock to drop.")
else
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..match.." `wBlue Gem Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
log("`2Dropped `9"..match.."`2 Blue Gem Lock.")
if mode == "rgt" then
rdrop(7188, match)
else
cdrop(7188, match)
end
end
return true
end

if cmd("/daw") then
if inv(242) == 0 then
else
log("`2Dropped `9"..inv(242).." `2World Lock.")
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..inv(242).." `wWorld Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
if mode == "rgt" then
rdrop(242, inv(242))
else
cdrop(242, inv(242))
end
end

if inv(1796) == 0 then
else
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..inv(1796).." `wDiamond Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
log("`2Dropped `9"..inv(1796).." `2Diamond Lock.")
if mode == "rgt" then
rdrop(1796, inv(1796))
else
cdrop(1796, inv(1796))
end
end

if inv(7188) == 0 then
else
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..inv(7188).." `wBlue Gem Lock at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
log("`2Dropped `9"..inv(7188).." `2Blue Gem Lock.")
if mode == "rgt" then
rdrop(7188, inv(7188))
else
cdrop(7188, inv(7188))
end
end

return true
end

if cmd("/cd (%d+)") then
if mode == "rgt" then
Amount = packet:match("/cd (%d+)")
bgl =math.floor(Amount/10000)
Amount = Amount - bgl*10000
dl = math.floor(Amount/100)
wl = Amount % 100
LogToConsole("`6/cd "..packet:match("/cd (%d+)").."")
LogToConsole("`2Dropped `9"..bgl.." `2BGL, `9"..dl.." `2DL, `9"..wl.." `2WL.")
if inv(7188) < bgl then
ont("`4You don't have enough BGL.")
elseif bgl == 0 then
else
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..bgl.." `wBlue Gem Lock at "..os.date("%H:%M").."|left|13810|\n")
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|"..bgl.."")
end

if inv(1796) < dl and inv(7188) <= 0 then
ont("`4You don't have enough DL.")
elseif dl == 0 then
else
if inv(1796) < dl and inv(7188) >= 0 then wear(7188) end
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..dl.." `wDiamond Lock at "..os.date("%H:%M").."|left|13810|\n")
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|"..dl.."")
end
if inv(242) < wl and inv(1796) <= 0 then
ont("`4You don't have enough WL.")
elseif wl == 0 then
else
if inv(242) < wl and inv(1796) >= 0 then wear(1796) end
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..wl.." `wWorld Lock at "..os.date("%H:%M").."|left|13810|\n")
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|"..wl.."")
end
else
LogToConsole("`7[ `2Custom Drop `7] `$CreativePS `odoes not support `$/cdrop `o(`$Custom Drop`o)")
end
return true
end

if cmd("/bal") then
dll = inv(1796) * 100
bgll = inv(7188) * 10000
hailto = inv(242) + dll + bgll
log("`2You have total: `9"..hailto.."`2 World Lock (`9"..inv(7188).." `2BGL, `9"..inv(1796).." `2DL, `9"..inv(242).." `2WL).")
return true
end

if cmd("/pos1") then
x1 = math.floor(GetLocal().posX / 32)
y1 = math.floor(GetLocal().posY / 32)
ont("Pos 1 Saved.")
return true
end

if cmd("/pos2") then
x2 = math.floor(GetLocal().posX / 32)
y2 = math.floor(GetLocal().posY / 32)
ont("Pos 2 Saved.")
return true
end

if cmd("/tax (%d+)") then
if tonumber(match) > 100 then
log("`4Maximum Tax is `2100%`4.")
else
stax = match
log("`2Tax set to `9"..stax.."%`2.")
end
return true
end

if cmd("/bet (%d+)") then
Aount = match
log("`2Setted bet to `9"..Aount.."`2 World Lock.")
return true
end

if cmd("/take") then

function tp1()
for _, obj in pairs(GetObjectList()) do
        if x1 == math.floor(obj.posX / 32) and y1 == math.floor(obj.posY / 32) then
        if obj.itemid == 242 then
        wear(242)
        end
        pkt = {}
        pkt.px = x1 .. y1
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
    end
end
end

function tp2()
for _, obj in pairs(GetObjectList()) do
        if x2 == math.floor(obj.posX / 32) and y2 == math.floor(obj.posY / 32) then
        pkt = {}
        pkt.px = x2 .. y2
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
        if obj.itemid == 242 and obj.amount >= 100 then
        wear(242)
        end
    end
  end
end

tp1()
tp2()
ont("Collecting Pos1 And Pos2")
return true
end

if cmd("/w1") then
if autocsn == true then
function tp1()
for _, obj in pairs(GetObjectList()) do
        if x1 == math.floor(obj.posX / 32) and y1 == math.floor(obj.posY / 32) then
        if obj.itemid == 242 then
        wear(242)
        end
        pkt = {}
        pkt.px = x1 .. y1
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
    end
end
end

function tp2()
for _, obj in pairs(GetObjectList()) do
        if x2 == math.floor(obj.posX / 32) and y2 == math.floor(obj.posY / 32) then
        pkt = {}
        pkt.px = x2 .. y2
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
        if obj.itemid == 242 and obj.amount >= 100 then
        wear(242)
        end
    end
  end
end

tp1()
tp2()
ont("Collecting Pos1 And Pos2")
end
log("`6/w1")
tax = stax
jl = math.floor(tax / 100 * Aount * 2)
jumlah = math.floor(Aount * 2 - jl)
earnedwls = Aount * 2 - jumlah
earned = earned + earnedwls
bgl =math.floor(jumlah/10000)
jumlah = jumlah - bgl*10000
dl = math.floor(jumlah/100)
wl = jumlah % 100
log("`2Current Tax: `9"..tax.."%`2 (Bet: `9"..Aount.."`2), Dropped `9"..wl.." `2WL, `9"..dl.." `2DL, `9"..bgl.." `2BGL.")
earnedwl = ("`2Earned `9+"..earnedwls.." `2World Lock.")
if inv(242) <= wl then
wear(1796)
end
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = earnedwl
v.v5 = 1
log(earnedwl)
SendVariant(v)
path(x1 - 2, y1)
if wl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|"..wl)
end
if dl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|"..dl)
end
if bgl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|"..bgl)
end
return true
end

if cmd("/w2") then
if autocsn == true then
function tp1()
for _, obj in pairs(GetObjectList()) do
        if x1 == math.floor(obj.posX / 32) and y1 == math.floor(obj.posY / 32) then
        pkt = {}
        pkt.px = x1 .. y1
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
        if obj.itemid == 242 then
        wear(242)
        end
    end
end
end

function tp2()
for _, obj in pairs(GetObjectList()) do
        if x2 == math.floor(obj.posX / 32) and y2 == math.floor(obj.posY / 32) then
        pkt = {}
        pkt.px = x1 .. y1
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
        if obj.itemid == 242 then
        wear(242)
        end
    end
 end
end


tp1()
tp2()
ont("Collecting Pos1 And Pos2")
end

log("`6/w2")
tax = stax
jl = math.floor(tax / 100 * Aount * 2)
jumlah = math.floor(Aount * 2 - jl)
earnedwls = Aount * 2 - jumlah
earned = earned + earnedwls
bgl =math.floor(jumlah/10000)
jumlah = jumlah - bgl*10000
dl = math.floor(jumlah/100)
wl = jumlah % 100
log("`2Current Tax: `9"..tax.."%`2 (Bet: `9"..Aount.."`2), Dropped `9"..wl.." `2WL, `9"..dl.." `2DL, `9"..bgl.." `2BGL.")
earnedwl = ("`2Earned `9+"..earnedwls.." `2World Lock.")
if inv(242) < wl then
wear(1796)
end
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = earnedwl
v.v5 = 1
log(earnedwl)
SendVariant(v)
path(x2 + 1, y2)
if wl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|"..wl)
end
if dl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|"..dl)
end
if bgl == 0 then
else
SendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|"..bgl)
end

Aount2 = 0
return true
end

if cmd("/name (.*)") then
log("`9`2Name set to `9"..match.."`2. Type `1/name`2 (without space) to get default name back.")
if match == "" or match == "`" then
if nameset == false then
oriname = GetLocal().name
end
GetLocal().name = ""
nameset = true
else
if nameset == false then
oriname = GetLocal().name
end
GetLocal().name = ("`w`w`w`w"..match.."")
nameset = true
end
return true
end

if cmd("/rejoin") then
SendPacket(3,"action|join_request\nname|"..GetWorldName())
log("`2Rejoin world successfully.")
return true
end

if cmd("/relog") then
SendPacket(3,"action|quit")
log("`2Relog successfully.")
return true
end

if cmd("/name") then
if nameset == true then
log("`2Name has been reverted.")
GetLocal().name = oriname
nameset = false
else
LogToConsole("`9[ VISUAL NAME ] `4Change name first to do this action.")
end
return true
end

if cmd("/save (.*)") then
savew = match
log("`2Current World Save: `9"..savew)
return true
end

if cmd("/gsave") then
SendPacket(3,"action|join_request\nname|"..savew)
log("`2Going to `9"..savew)
return true
end

if cmd("/res") then
log("`2Respawn Succesful.")
SendPacket(2,"action|respawn")
return true
end

if cmd("/pstats") or packet:find("buttonClicked|inform") then
pstats = [[
set_default_color|`o
add_label_with_icon|big|`wProxy Stats         ````        |left|9474|
add_spacer|small|
add_quick_exit|
add_textbox|Earned from Tax: `w]]..earned..[[ `oWorld Lock|
add_textbox|Current Tax: `w]]..stax..[[%|
add_textbox|Current Bet: `w]]..Aount..[[ World Lock|
add_textbox|Pos 1: `w]]..x1..[[`o,`w ]]..y1..[[|
add_textbox|Pos 2: `w]]..x2..[[`o,`w ]]..y2..[[|
add_textbox|Current World Save: `w]]..savew..[[|
add_textbox|Script runned at: `w]]..timer..[[|
add_spacer|small|
end_dialog|ksis|Cancel|Okay|
]]
dialog(pstats)
return true
end

if cmd("/skin (.*)") then
log("`6/skin "..match)
log("`2Changed Skin ID to `9"..match)
SendPacket(2,"action|setSkin\ncolor|"..match)
return true
end

if cmd("/auto") then
if autocsn == false then
autocsn = true
log("`9Auto Take `2Enabled`9 (Easy got error connecting).")
else
autocsn = false
log("`9Auto Take `4Disabled`9.")
end
return true
end

if cmd("/bet") and not cmd("/bet ") then
log("`6/bet")
log("`2Current bet: `9"..Aount.." `2World Lock.")
return true
end

if cmd("/tax") and not cmd("/tax ") then
log("`6/tax")
log("`2Current Tax: `9"..stax.."%`2.")
return true
end

if cmd("/fd") then
if fastdrop == false then
fastdrop = true
log("`9Fast Drop `2Enabled")
else
fastdrop = false
log("`9Fast Drop `4Disabled")
end
return true
end

if cmd("/drop (%d+) (%d+)") then
match1 = packet:match("/drop (%d+)")
match2 = packet:match("/drop "..match1.." (%d+)")
LogToConsole("`6/drop "..match1.." "..match2)
if inv(tonumber(match1)) < tonumber(match2) then
log("`4You don't have enough Item")
ont("`4You don't have enough Item")
else
if mode == "rgt" then
rdrop(match1, match2)
else
cdrop(match1, match2)
end
log("`2Dropped `9"..match2.." `2"..growtopia.getItemName(match1).."")
end
return true
end

if cmd("/rafter (%d+)") then
log("`2Automatically Reset Gems After Doing Packet Type 0 to`9 "..match)
cgset = match
return true
end

-------------------------------------
--Packet
-------------------------------------

if packet:find("buttonClicked|clearl") then
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = "`2Camera log cleared."
SendVariant(v)
log("`2Private Camera Log Cleared.")
logd = {}
end

if packet:find("dialog_name|drop_item\n") then
id = packet:match("temID|(%d+)|\n")
if not packet:match("count|(%d+)") then
else
amon = packet:match("count|(%d+)")
table.insert(logd,"\nadd_label_with_icon|small|`wYou dropped `9"..amon.." `w"..growtopia.getItemName(id).." at "..os.date("%H:%M").."|left|13810|\n")
conte = 0
end
end

if packet:find("quit_to_exit") then
if conte == 0 then
table.insert(logd,"\nadd_label_with_icon|small|`wYou left at "..os.date("%H:%M").."|left|13806|\n")
conte = conte + 1
elseif conte >= 1 then
end
end

if packet:find("join_request") then
nemwo = packet:match("join_request\nname|(.*)\ninv")
table.insert(logd,"\nadd_label_with_icon|small|`wYou entered `2"..nemwo.."`w at "..os.date("%H:%M").."|left|13804|\n")
conte = 0
end

if packet:find("action|friends\ndelay") or packet:find("buttonClicked|bk0") or packet == ("action|dialog_return\ndialog_name|socialportal\n") then
mmenu = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wProxy Menu       ````     |left|758|
add_spacer|small|
add_textbox|Current Tax: `$]]..stax..[[%|
add_textbox|Current Bet: `$]]..Aount..[[ World Lock|
add_spacer|small|
text_scaling_string|SubsToIptxtxD|
add_button_with_icon|cmd|`wCommand|staticYellowFrame|5956|
add_button_with_icon|inform|`wInformation|staticYellowFrame|3524|
add_button_with_icon|control|`wController|staticYellowFrame|482|
add_button_with_icon|orimen|`wSocial|staticYellowFrame|9474|
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|gscanback|`wGrowScan|staticYellowFrame|6016|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
end_dialog|k||Back|
]]

dialog(mmenu)
return true
end

if packet:find("buttonClicked|orimen") then
SendPacket(2,"action|friends\ndelay|0")
return true
end

if packet:find("buttonClicked|control") or packet:find("buttonClicked|bk1") then
cmenu = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wController         ````      |left|482|
add_spacer|small|
add_textbox|Select One:|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|ccsn|`wCasino|staticYellowFrame|758|
add_button_with_icon|cplay|`wPlayer|staticYellowFrame|10864|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk0|`wBack|
]]
dialog(cmenu)
return true
end

if packet:find("buttonClicked|ccsn") then
control = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wCSN Controller     ````      |left|758|
add_spacer|small|
add_textbox|Earned: `$]]..earned..[[ World Lock|
add_textbox|Current Tax: `$]]..stax..[[%|
add_textbox|Current Bet: `$]]..Aount..[[ World Lock|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|tke|`wTake Lock|staticYellowFrame|2814|
add_button_with_icon|win1|`wWin 1|staticYellowFrame|2816|
add_button_with_icon|win2|`wWin 2|staticYellowFrame|2818|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]
dialog(control)
return true
end

if packet:find("buttonClicked|tke") then
function tp1()
for _, obj in pairs(GetObjectList()) do
        if x1 == math.floor(obj.posX / 32) and y1 == math.floor(obj.posY / 32) then
        if obj.itemid == 242 then
        wear(242)
        end
        pkt = {}
        pkt.px = x1 .. y1
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
    end
end
end

function tp2()
for _, obj in pairs(GetObjectList()) do
        if x2 == math.floor(obj.posX / 32) and y2 == math.floor(obj.posY / 32) then
        pkt = {}
        pkt.px = x2 .. y2
        pkt.type = 11
        pkt.value = obj.id
        pkt.x = obj.posX
        pkt.y = obj.posY
        SendPacketRaw(false, pkt)
        if obj.itemid == 242 and obj.amount >= 100 then
        wear(242)
        end
    end
  end
end

tp1()
tp2()
dialog(control)
ont("Collected Pos1 and Pos2")
return true
end

if packet:find("buttonClicked|win1") then
tax = stax
jl = math.floor(tax / 100 * Aount * 2)
jumlah = math.floor(Aount * 2 - jl)
earnedwls = Aount * 2 - jumlah
earned = earned + earnedwls
bgl =math.floor(jumlah/10000)
jumlah = jumlah - bgl*10000
dl = math.floor(jumlah/100)
wl = jumlah % 100
earnedwl = ("`2Earn `9+"..earnedwls.." `2World Lock.")
if inv(242) <= wl then
wear(1796)
end
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = earnedwl
v.v5 = 1
log(earnedwl)
SendVariant(v)
path(x1 - 2, y1)
if wl == 0 then
else
rdrop(242, wl)
end
if dl == 0 then
else
rdrop(1796, dl)
end
if bgl == 0 then
else
rdrop(7188, bgl)
end

control = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wCSN Controller     ````      |left|758|
add_spacer|small|
add_textbox|Earned: `$]]..earned..[[ World Lock|
add_textbox|Current Tax: `$]]..stax..[[%|
add_textbox|Current Bet: `$]]..Aount..[[ World Lock|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|tke|`wTake Lock|staticYellowFrame|2814|
add_button_with_icon|win1|`wWin 1|staticYellowFrame|2816|
add_button_with_icon|win2|`wWin 2|staticYellowFrame|2818|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]
dialog(control)
return true
end

if packet:find("buttonClicked|win2") then
tax = stax
jl = math.floor(tax / 100 * Aount * 2)
jumlah = math.floor(Aount * 2 - jl)
earnedwls = Aount * 2 - jumlah
earned = earned + earnedwls
bgl =math.floor(jumlah/10000)
jumlah = jumlah - bgl*10000
dl = math.floor(jumlah/100)
wl = jumlah % 100
earnedwl = ("`2Earn `9+"..earnedwls.." `2World Lock.")
if inv(242) < wl then
wear(1796)
end
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = earnedwl
v.v5 = 1
log(earnedwl)
SendVariant(v)
path(x2 + 1, y2)
if wl == 0 then
else
rdrop(242, wl)
end
if dl == 0 then
else
rdrop(1796, dl)
end
if bgl == 0 then
else
rdrop(7188, bgl)
end

Aount2 = 0
control = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wCSN Controller     ````      |left|758|
add_spacer|small|
add_textbox|Earned: `$]]..earned..[[ World Lock|
add_textbox|Current Tax: `$]]..stax..[[%|
add_textbox|Current Bet: `$]]..Aount..[[ World Lock|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|tke|`wTake Lock|staticYellowFrame|2814|
add_button_with_icon|win1|`wWin 1|staticYellowFrame|2816|
add_button_with_icon|win2|`wWin 2|staticYellowFrame|2818|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]
dialog(control)
return true
end

if packet:find("buttonClicked|cplay") then
cplay = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wPlayer Controller    ````  |left|10864|
add_smalltext|Recommend to use ModFly|
add_smalltext|ModFly ]]..modflai..[[|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|ml|`wMove Left|staticYellowFrame|5672|
add_button_with_icon|mr|`wMove Right|staticYellowFrame|5674|
add_button_with_icon|mu|`wMove Up|staticYellowFrame|5676|
add_button_with_icon|md|`wMove Down|staticYellowFrame|5678|
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|menter|`wEnter Door|staticYellowFrame|5680|
add_button_with_icon|modflai|`wModFly|staticYellowFrame|1822|
add_button_with_icon|nspeed|`w+ Speed (]]..nmove..[[)|staticYellowFrame|2322|
add_button_with_icon|dspeed|`w- Speed(]]..nmove..[[)|staticYellowFrame|2628|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]

dialog(cplay)
return true
end

if packet:find("buttonClicked|ml") then
x = math.floor(GetLocal().posX / 32)
y = math.floor(GetLocal().posY / 32)
FindPath(x - nmove, y)
dialog(cplay)
ont("Going to `2"..(x - nmove).."`w, `2"..y)
return true
end

if packet:find("buttonClicked|mr") then
x = math.floor(GetLocal().posX / 32)
y = math.floor(GetLocal().posY / 32)
FindPath(x + nmove, y)
dialog(cplay)
ont("Going to `2"..(x + nmove).."`w, `2"..y)
return true
end

if packet:find("buttonClicked|mu") then
x = math.floor(GetLocal().posX / 32)
y = math.floor(GetLocal().posY / 32)
FindPath(x, y - nmove)
dialog(cplay)
ont("Going to `2"..x.."`w, `2"..(y - nmove))
return true
end

if packet:find("buttonClicked|md") then
x = math.floor(GetLocal().posX / 32)
y = math.floor(GetLocal().posY / 32)
FindPath(x, y + nmove)
dialog(cplay)
ont("Going to `2"..x.."`w, `2"..(y + nmove))
return true
end

if packet:find("buttonClicked|menter") then
function enter()
pkt = {}
pkt.type = 7;
pkt.px = math.floor(GetLocal().posX / 32);
pkt.py = math.floor(GetLocal().posY / 32);
SendPacketRaw(false, pkt)
end

enter()
dialog(cplay)
ont("Entering `2Door`w..")
return true
end

if packet:find("buttonClicked|modflai") then
if modflai == "`4Disabled" then
modflai = "`2Enabled"
EditToggle("ModFly", true)
else
modflai = "`4Disabled"
EditToggle("ModFly", false)
end
cplay = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wPlayer Controller    ````  |left|10864|
add_smalltext|Recommend to use ModFly|
add_smalltext|ModFly ]]..modflai..[[|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|ml|`wMove Left|staticYellowFrame|5672|
add_button_with_icon|mr|`wMove Right|staticYellowFrame|5674|
add_button_with_icon|mu|`wMove Up|staticYellowFrame|5676|
add_button_with_icon|md|`wMove Down|staticYellowFrame|5678|
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|menter|`wEnter Door|staticYellowFrame|5680|
add_button_with_icon|modflai|`wModFly|staticYellowFrame|1822|
add_button_with_icon|nspeed|`w+ Speed (]]..nmove..[[)|staticYellowFrame|2322|
add_button_with_icon|dspeed|`w- Speed(]]..nmove..[[)|staticYellowFrame|2628|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]

dialog(cplay)
return true
end

if packet:find("buttonClicked|nspeed") then
nmove = nmove + 1

cplay = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wPlayer Controller    ````  |left|10864|
add_smalltext|Recommend to use ModFly|
add_smalltext|ModFly ]]..modflai..[[|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|ml|`wMove Left|staticYellowFrame|5672|
add_button_with_icon|mr|`wMove Right|staticYellowFrame|5674|
add_button_with_icon|mu|`wMove Up|staticYellowFrame|5676|
add_button_with_icon|md|`wMove Down|staticYellowFrame|5678|
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|menter|`wEnter Door|staticYellowFrame|5680|
add_button_with_icon|modflai|`wModFly|staticYellowFrame|1822|
add_button_with_icon|nspeed|`w+ Speed (]]..nmove..[[)|staticYellowFrame|2322|
add_button_with_icon|dspeed|`w- Speed(]]..nmove..[[)|staticYellowFrame|2628|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]

dialog(cplay)
return true
end

if packet:find("buttonClicked|dspeed") then
if nmove < 2 then
nmove = 1
else
nmove = nmove - 1
end

cplay = [[
set_default_color|`o
add_quick_exit|
add_label_with_icon|big|`wPlayer Controller    ````  |left|10864|
add_smalltext|Recommend to use ModFly|
add_smalltext|ModFly ]]..modflai..[[|
add_spacer|small|
text_scaling_string|SubstoIptxtxD|
add_button_with_icon|ml|`wMove Left|staticYellowFrame|5672|
add_button_with_icon|mr|`wMove Right|staticYellowFrame|5674|
add_button_with_icon|mu|`wMove Up|staticYellowFrame|5676|
add_button_with_icon|md|`wMove Down|staticYellowFrame|5678|
add_button_with_icon||END_LIST|noflags|0||
add_button_with_icon|menter|`wEnter Door|staticYellowFrame|5680|
add_button_with_icon|modflai|`wModFly|staticYellowFrame|1822|
add_button_with_icon|nspeed|`w+ Speed (]]..nmove..[[)|staticYellowFrame|2322|
add_button_with_icon|dspeed|`w- Speed(]]..nmove..[[)|staticYellowFrame|2628|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
add_button|bk1|`wBack|
]]

dialog(cplay)
return true
end

-------------------------------------
--End of Hook
-------------------------------------
return false
end

-------------------------------------
--On Variant
-------------------------------------
function var(var)


if fastdrop == true then
if var.v1:find("OnDialogRequest") and var.v2:find("drop_item") then
fdro1 = var.v2:match("count||(%d+)|")
fdro2 = var.v2:match("itemID|(%d+)")
if mode == "rgt" then
rdrop(fdro2, fdro1)
else
cdrop(fdro2, fdro1)
end
growtopia.notify("`7[ `9Dropped "..fdro2.." `7]")
return true
end
end

if realfake == true then
if var.v1:find("OnTalkBubble") and var.v3:find("spun the whee") then
uidplayer = var.v2
spintext = var.v3
return true
end

if var.v1:find("OnConsoleMessage") and var.v2:find("<") and var.v2:find(">") and var.v2:find("spun the whee") then
v = {}
v.v1 = "OnTalkBubble"
v.v2 = uidplayer
v.v3 = ("`7[`4FAKE`7] `w"..spintext.."")
SendVariant(v)
LogToConsole(""..var.v2.." `7[`4FAKE`7]")
return true
end

if var.v1:find("OnConsoleMessage") and var.v2:find("spun the whee") then
v = {}
v.v1 = "OnTalkBubble"
v.v2 = uidplayer
v.v3 = ("`7[`2REAL`7] `w"..spintext.."")
SendVariant(v)
LogToConsole("`7[`2REAL`7] `$`w"..spintext.."")
return true
end
end --end of fake/real wheel

if var.v1:find("OnConsoleMessage") and var.v2:find("Collected") and not var.v2:find("Rarity") then
log(""..var.v2.." `oin `2"..GetWorldName().."`o.")
coleka = var.v2:match("(%d+) ")
colekl = var.v2:match("Collected (.*).")
coleklog2 = string.gsub(colekl, "(%d+)", "")
table.insert(logd,"\nadd_label_with_icon|small|`wYou took `9"..coleka.."`w"..coleklog2.." `wat "..os.date("%H:%M").."|left|13808|\n")
return true
elseif var.v1:find("OnConsoleMessage") and var.v2:find("Collected") and var.v2:find("Rarity") then
log(""..var.v2.." `oin `2"..GetWorldName().."`o.")
coleka = var.v2:match("(%d+) ")
colekl = var.v2:match("Collected (.*)`w.")
coleklog = string.gsub(colekl, "  ", "")
coleklog2 = string.gsub(coleklog, "(%d+)", "")
coleklog3 = string.gsub(coleklog2, "Rarity:", "")
table.insert(logd,"\nadd_label_with_icon|small|`wYou took `9"..coleka.."`w"..coleklog3.."`wat "..os.date("%H:%M").."|left|13808|\n")
return true
end

if var.v1:find("OnConsoleMessage") then
LogToConsole(""..systemlog.." ".. var.v2)
return true
end


-------------------------------------
--End Of Variant
-------------------------------------
return false
end



function pkt(str)
if str.type == 11 then
for _, obj in pairs(GetObjectList()) do
if obj.id == str.value then
if obj.itemid == 112 then
cg = cg + obj.amount
if cg == 0 then
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = ("`4Error when Check Collected Gems.")
SendVariant(v)
else
v = {}
v.v1 = "OnTalkBubble"
v.v2 = GetLocal().netID
v.v3 = ("`2Collected `9+"..cg.." `2Gems.")
v.v5 = 1
SendVariant(v)
end
end
end
end
end

if str.type == 0 then
if tonumber(cgcek) > tonumber(cgset) then
cg = 0
cgset = cgset
else
cgcek = cgcek + 1
end
end
return false
end

-------------------------------------
--AddHook
-------------------------------------

AddHook(pkt, "OnSendPacketRaw")
AddHook(on_sendpacket, "OnSendPacket")
AddHook(var, "OnVariant")


LogToConsole("`7[ `bRunning `7] Script By `2Bchola.")
LogToConsole("`7[ `bRunning `7] Script is now Successfully Running.")