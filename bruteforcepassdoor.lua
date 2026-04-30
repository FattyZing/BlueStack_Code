config = {

    main = {
        start = 7000,
        ends = 99999,
        delay = 100, --Miliseconds
    },

    alphabet = {
        active = true,
        text = "0",
        behind = true, --false if infront
    },

    misc = {
        BypassDialog = true,
    },

}

-- =============================== --
-- Script by bchola
-- Dont edit if you dont understand
-- =============================== --

if config.alphabet.active then
    if config.alphabet.behind then
        alphabetInfrontText = ""
        alphabetBehindText =  tostring(config.alphabet.text)
    elseif not config.alphabet.behind then
        alphabetBehindText = ""
        alphabetInfrontText = tostring(config.alphabet.text)
    end
else
    alphabetBehindText = ""
    alphabetInfrontText = ""
end

function enter()
    pkt = {};
    pkt.x = GetLocal().posX;
    pkt.y = GetLocal().posY;
    pkt.px = math.floor(GetLocal().posX//32);
    pkt.py = math.floor(GetLocal().posY//32);
    pkt.type = 7;
    SendPacketRaw(false, pkt)
end

function oto(str)
    v = {}
    v.v1 = "OnTextOverlay"
    v.v2 = str
    SendVariant(v)
end

AddHook(function(v)
    if config.misc.BypassDialog then
        if v.v1:find("OnDialogRequest") and v.v2:find("door requires a password") then
            return true
        end
    end
    if v.v1:find("OnTalkBubble") and v.v3:find("`2The door opens") then
        log("`7[ `4GUESSED `7] `7Door's password is `4"..tonumber(currentPass).."`7, or lower.")
        foundPass = true
    end
    return false
end, "OnVariant")

for i = config.main.start, config.main.ends do
    if foundPass then sleep(2000) removeHook("OnVariant") return end
    currentPass = alphabetBehindText .. i .. alphabetInfrontText

    oto("`7[ Currently guessing `4"..currentPass.."`7 ]")

    enter()
    Sleep(config.main.delay)
    SendPacket(2,"action|dialog_return\ndialog_name|password_reply\ntilex|"..math.floor(GetLocal().posX//32).."|\ntiley|"..math.floor(GetLocal().posY//32).."|\npassword|"..currentPass)
    Sleep(config.main.delay)
end