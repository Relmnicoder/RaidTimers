--For testing
aura_env.bossesOnly = false

--[[
Format: {ID, TIME, "NAME", "CLASSCOLOUR"}
Alternatively a string  can be used instead of TIME if not applicable. (i.e. mechanics which arent based on timers.)

Class colors:
DRUID:   |c00FF7D0A
MONK:    |c0000FF96
PALADIN: |c00F58CBA
PRIEST:  |c00FFFFFF
SHAMAN:  |c000070DE
DH:      |c00A330C9
Warrior: |c00C79C6E    
]]

aura_env.healingAssign = {  
    --Sivara Mythic
    {1, 30,  "|cfff38bb9Wings|r","00FFFFFF"},
    {1, 45,  "|cfffe7b09NalleTräd|r",   "00FFFFFF"},
    {1, 60,  "Hymn",   "00FFFFFF"},
    {1, 75,  "|cfffe7b09CelenarTranq|r",   "00FFFFFF"},
    {1, 90,  "|cfffe7b09NalleTranq|r",   "00FFFFFF"},
    {1, 105, "|cff006fdcHTT|r",   "00FFFFFF"},
    {1, 120, "|cffc59a6cRally|r",  "00FFFFFF"},
    {1, 135, "|cfff38bb9AM|r",  "00FFFFFF"},
    {1, 150, "|cff006fdcSL|r",  "00FFFFFF"},
    {1, 165, "|cfffe7b09CelenarTräd|r",  "00FFFFFF"},
    {1, 180, "|cfff38bb9Wings|r",  "00FFFFFF"},
    {1, 195, "",  "00FFFFFF"},
    {1, 210, "Salv",  "00FFFFFF"},
    {1, 225, "|cfffe7b09NalleTräd|r",  "00FFFFFF"},
    {1, 240, "Hymn", "00FFFFFF"},
    {1, 255, "|cfffe7b09CelenarTranq|r", "00FFFFFF"},
    {1, 270, "|cfffe7b09NalleTranq|r", "00FFFFFF"},
    {1, 285, "|cffc59a6cRally|r", "00FFFFFF"},
    {1, 300, "|cff006fdcHTT|r", "00FFFFFF"},
    {1, 315, "|cfff38bb9Wings|r", "00FFFFFF"},
    {1, 330, "|cfff38bb9AM|r", "00FFFFFF"},
    {1, 345, "|cff006fdcSL|r+|cfffe7b09CelenarTräd|r", "00FFFFFF"}
}


--Boss Y


--Send updated table

C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", "START", "RAID")
--C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", "START", "WHISPER", "PIST")
for _, myTable in pairs(aura_env.healingAssign) do  
    
    C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", table.concat(myTable, " "), "RAID")
    --C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", table.concat(myTable, " "), "WHISPER", "PIST")       
end

C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", "END", "RAID")
--C_ChatInfo.SendAddonMessage("OOCHEALINGCDS", "END", "WHISPER", "PIST")
print("HealingCDs:init")


