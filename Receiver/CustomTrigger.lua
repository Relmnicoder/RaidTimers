function(event, prefix, message)
    C_ChatInfo.RegisterAddonMessagePrefix("HEALINGCDS")
    C_ChatInfo.RegisterAddonMessagePrefix("OOCHEALINGCDS")
    
    --If encounter ended
    if event == "ENCOUNTER_END" or (not aura_env.bossesOnly and event == "PLAYER_REGEN_ENABLED") then
        print("sender untrigger")
        local combatTime = aura_env.startTime and GetTimeStringFromSeconds(GetTime() - aura_env.startTime, false, true)
        or 0
        aura_env.encounterName = nil
        aura_env.inEnc = false
        
        
    end
    
    --If in encounter
    if event == "ENCOUNTER_START" or (not aura_env.bossesOnly and event == "PLAYER_REGEN_DISABLED") then
        --print("RecTrigEncStart")
        --print(message)
        aura_env.startTime = GetTime()
        aura_env.inEnc = true
        if prefix == "HEALINGCDS" then
            -- print("prefix")
            if message == "END" or message =="START" then
                --   print("end or start")
                if message == "END" then
                    aura_env.hRec = 1
                    --     print("EnchRec=1")
                    
                    return true
                else
                    
                    if message == "START" then
                        aura_env.hRec = 0
                        aura_env.hAssign = {}
                        
                        --       print("Encrensat")
                        --aura_env.strOutput = ""
                    end
                end
            else
                
                
                local myTable = {strsplit(" ", message)}
                aura_env.hAssign[#aura_env.hAssign+1]=myTable
                
                
            end
            
        end 
        return true
        
        
    end
    
    --If out of encounter update.
    if prefix == "OOCHEALINGCDS" then
        --    print("ooochealingcds")
        if message == "END" or message == "START" then
            if message == "END" then
                aura_env.oochRec = 1
                --print("OOC_hRec=1")
                --print(aura_env.hAssign[1][2])
                return true
            else
                if message == "START" then
                    aura_env.oochRec = 0
                    aura_env.hAssign = {}
                    --  print("rensat")
                    --aura_env.strOutput = ""
                end
            end
            
        else
            
            
            -- print(message)
            local myTable = {strsplit(" ", message)}
            aura_env.hAssign[#aura_env.hAssign+1]=myTable
            --  print("inte end")
        end
    end
    return true
    
    
    
    
    
    
end

