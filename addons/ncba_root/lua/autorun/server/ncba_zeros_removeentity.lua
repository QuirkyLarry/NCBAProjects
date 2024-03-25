-- Removes Zero's Garbage ass retarded as shit asdjnalsdfhgbasl,.jkdgba.slkdfblakjsdfgblaks.dfhjbalskdhjvbflis
hook.Add("PlayerChangedTeam", "PlayerChangedTeam_FixZero", function(ply, oldTeam, newTeam )
    if oldTeam == newTeam then return end
    local shitEnts = ents.FindByClass("z*"),ents.FindByClass("ch_*")
    if shitEnts == nil then return end
    for i,v in pairs(shitEnts) do
        if CPP.GetOwner(v) == ply then
            SafeRemoveEntity(v)
        end
    end
end)

hook.Add("PlayerDisconnected", "PlayerChangedTeam_FixZero", function(ply)
    print(ply:SteamID())
    RunConsoleCommand("ncba_bhopunwl", ply:SteamID())
    local shitEnts = ents.FindByClass("z*"),ents.FindByClass("ch_*")
    if shitEnts == nil then return end
    for i,v in pairs(shitEnts) do
        if CPP.GetOwner(v) == ply then
            SafeRemoveEntity(v)
        end
    end
end)