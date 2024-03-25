local pets = {
    ["Chicken"] = {
        view = 25,
        duck = 25,
        walk = 100,
        run = 280,
        jump = 240,
        gravity = 0.5,
        friction = 0.5,
    },
    ["Penguin"] = {
        view = 40,
        duck = 25,
        walk = 100,
        run = 280,
        jump = 240,
        gravity = 0.5,
        friction = 0.1,
    },
    ["Elmo"] = {
        view = 35,
        duck = 30,
        walk = 150,
        run = 270,
        jump = 190,
        gravity = 0,
        friction = 1,
    },
    ["Pet Cat"] = {
        view = 18,
        duck = 18,
        walk = 100,
        run = 300,
        jump = 250,
        gravity = 0,
        friction = 0.8,
    },
    ["Pet Dog"] = {
        view = 24,
        duck = 24,
        walk = 170,
        run = 320,
        jump = 260,
        gravity = 0,
        friction = 0.6,
    },
    ["Pet Mouse"] = {
        view = 36,
        duck = 20,
        walk = 180,
        run = 350,
        jump = 300,
        gravity = 0.8,
        friction = 0.3,
    },
    ["Pet Tiger"] = {
        view = 50,
        duck = 40,
        walk = 180,
        run = 380,
        jump = 280,
        gravity = 0,
        friction = 1,
    },
    ["Pet Ugandan-Knuckles"] = {
        view = 15,
        duck = 15,
        walk = 160,
        run = 260,
        jump = 200,
        gravity = 0,
        friction = 0.7,
    },
    ["Pet Baby-Shark"] = {
        view = 35,
        duck = 20,
        walk = 160,
        run = 260,
        jump = 200,
        gravity = 0,
        friction = 1,
    },
    ["Pet Shark"] = {
        view = 64,
        duck = 32,
        walk = 160,
        run = 260,
        jump = 200,
        gravity = 0,
        friction = 1,
    },
}


hook.Add("PlayerSpawn", "NCBA_GG_PlayerSpawn", function( ply, oldTeam, newTeam )
    if not IsValid(ply) then return end
    if oldTeam == newTeam then return end
    local teamName = tostring(team.GetName(ply:Team()))
    local timerName = "NCBA_GG_SetShark_" .. ply:SteamID64()
    if teamName ~= "Pet Baby-Shark" or teamName ~= "Pet Shark" and timer.Exists(timerName) then timer.Remove(timerName) end
    if pets[teamName] == nil then
        return ply:SetViewOffset(Vector(0,0,64)),ply:SetViewOffsetDucked(Vector(0,0,32)),ply:SetRunSpeed(260), ply:SetWalkSpeed(160), ply:SetJumpPower(200), ply:SetGravity(0), ply:SetFriction(1)
    elseif (teamName ~= "Pet Baby-Shark" and teamName ~= "Pet Shark") then
        timer.Create( "NCBA_GG_Team_Changed_Sub_" .. ply:SteamID64(), 1, -1, function()
            if not ply:Alive() then return end
            ply:SetViewOffset(Vector(0,0,pets[teamName].view))
            ply:SetViewOffsetDucked(Vector(0,0,pets[teamName].duck))
            ply:SetRunSpeed(pets[teamName].run)
            ply:SetWalkSpeed(pets[teamName].walk)
            ply:SetJumpPower(pets[teamName].jump)
            ply:SetGravity(pets[teamName].gravity)
            ply:SetFriction(pets[teamName].friction)
            print(ply:Name() .. " - View Height Adjusted")
            timer.Remove("NCBA_GG_Team_Changed_Sub_" .. ply:SteamID64())
        end)
    else
        timer.Create(timerName, 0.5, -1, function()
            if not ply:Alive() then return end
            if ply:WaterLevel() >= 2 then
                ply:SetRunSpeed(pets[teamName].run * 4)
                ply:SetWalkSpeed(pets[teamName].walk * 4)
                ply:SetJumpPower(pets[teamName].jump * 4)
            else
                ply:SetRunSpeed(pets[teamName].run)
                ply:SetWalkSpeed(pets[teamName].walk)
                ply:SetJumpPower(pets[teamName].jump)
            end
        end)
    end
end)