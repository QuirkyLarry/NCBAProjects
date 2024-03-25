AddCSLuaFile()

hook.Add("CreateMove", "ncba_custom_bhop", function(ucmd)
    if LocalPlayer():GetNWBool("ncba_custom_bhop") == true and IsValid(LocalPlayer()) and bit.band(ucmd:GetButtons(), IN_JUMP) > 0 then
        ucmd:SetButtons( ucmd:GetButtons() - IN_JUMP )
        if LocalPlayer():OnGround() then
            ucmd:SetButtons( ucmd:GetButtons() + IN_JUMP )
        end
    end
end)