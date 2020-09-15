function()
    local colourEmph = "FFFFFFFF"
    --If in encounter and transfer complete
    if aura_env.startTime then
        if aura_env.inEnc then
            
            aura_env.combatTime = GetTime() - aura_env.startTime
        else
            aura_env.combatTime = aura_env.combatTime or 0
        end
        
        aura_env.hOutput=""
        --print("getTimeSuccess")
        if aura_env.hAssign then
            for _, myTable in pairs(aura_env.hAssign) do
                --print("displayloop")
                colourEmph = "FFFFFFFF"
                spacer = ""
                empher = ""
                
                --if type(tonumber(myTable[2])) == number then
                
                if aura_env.combatTime > tonumber(myTable[2])+3 then
                    colourEmph = "FF7f8287"
                    if aura_env.hAssign[_+1] and aura_env.combatTime < tonumber(aura_env.hAssign[_+1][2])+3 then
                        
                        spacer = "|r|n-------"
                    end
                    
                end
                
                
                if aura_env.combatTime > tonumber(myTable[2])-3 and aura_env.combatTime < tonumber(myTable[2])+3 then    
                    colourEmph = "FFFF0000" 
                    empher = ">>"
                end 
                
                
                classColour = myTable[4]
                aura_env.hOutput = aura_env.hOutput.."|c"..colourEmph..empher..SecondsToClock(myTable[2], false).."|r".."   ".."|c"..classColour..myTable[3]..spacer.."|r|n"
                
                --else
                --    classColour = myTable[4]
                --    aura_env.hOutput = aura_env.hOutput.."|c"..colourEmph..empher..myTable[2].."|r".."   ".."|c"..classColour..myTable[3]..spacer.."|r|n"
                -- end
                
            end
            
        end
        
        aura_env.hOutput = aura_env.hOutput.."Tid: "..SecondsToClock(aura_env.combatTime, false).."|r"
        return aura_env.hOutput
    end
    
    --If not in encounter (update)
    if aura_env.oochRec == 1 and not aura_env.startTime then
        aura_env.hOutput=""
        --print("oochRec")
        
        for _, myTable in pairs(aura_env.hAssign) do
            colourEmph = "FFFFFFFF"
            --print("i loop")
            classColour = myTable[4]
            if  type(myTable[2]) == number then
                aura_env.hOutput = aura_env.hOutput.."|c"..colourEmph..SecondsToClock(myTable[2], false).."|r".."   ".."|c"..classColour..myTable[3].."|r|n"   
            else
                aura_env.hOutput = aura_env.hOutput.."|c"..colourEmph..SecondsToClock(myTable[2], false).."|r".."   ".."|c"..classColour..myTable[3].."|r|n"
            end
            
        end
        return aura_env.hOutput
    end
    
end


--[[
Att göra:
   -Send @ pull funkar inte. Nödvändigt?
   -Text istället för tid. Använd index i sender för att avgöra om det ska vara tid eller ej. Assignad mechanic i text?
]]


