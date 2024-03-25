local actualMax = {
    ["props"] = 75,
    ["textscreens"] = 5,
    ["ledscreens"] = 8,
    ["buttons"] = 10,
    ["cameras"] = 3,
    ["ropes"] = 10,
    ["keypads"] = 20,
}
local actualMin = {
    ["props"] = 40,
    ["textscreens"] = 1,
    ["ledscreens"] = 1,
    ["buttons"] = 2,
    ["cameras"] = 1,
    ["ropes"] = 2,
    ["keypads"] = 2,
}
hook.Add("PlayerCheckLimit", "NCBA_Change_Limits_Levels", function(ply, limitname, curspawned,maxdefault)
    --if ply:IsSuperAdmin() then return true end
    local level = GlorifiedLeveling.GetPlayerLevel(ply)
    local levelAdj = math.floor(level / 2)

    maxdefault = actualMin[limitname]
    maxdefault = maxdefault + levelAdj

    if curspawned >= maxdefault or curspawned >= actualMax[limitname] then
        return false
    else
        return true
    end
end)