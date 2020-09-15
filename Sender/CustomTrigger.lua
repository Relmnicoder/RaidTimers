function(event)
    
    --If engaged with boss
    if event == "ENCOUNTER_START" or (not aura_env.bossesOnly and event == "PLAYER_REGEN_DISABLED") then
        
        -- Send updated table
        
        C_ChatInfo.SendAddonMessage("HEALINGCDS", "START", "RAID")
        --print("skickatstart")
        
        for _, myTable in pairs(aura_env.healingAssign) do 
            
            C_ChatInfo.SendAddonMessage("HEALINGCDS", table.concat(myTable, " "), "RAID")           
        end
        
        C_ChatInfo.SendAddonMessage("HEALINGCDS", "END", "RAID")
        --print("skickatend")
        
        return true
    end
end


























