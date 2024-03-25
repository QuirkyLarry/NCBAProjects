hook.Add("InitPostEntity", "NCBA_Remove_Default_Spawns", function()
    for i,v in ipairs(ents.GetAll()) do
        if v:GetClass() == "info_player_start" then
            v:Remove()
        end
    end
    print("[NCBA.gg] - All default spawns have been removed.")
end)

local spawns = {
    spawn1 = {[1] = 3005,[2] =  1300,[3] = -171},
    spawn2 = {[1] = 3005,[2] =  1250,[3] = -171},
    spawn3 = {[1] =  3005,[2] =  1200,[3] = -171},
    spawn4 = {[1] =  3005,[2] =  1150,[3] = -171},
    spawn5 = {[1] =  3005,[2] =  1100,[3] = -171},
    spawn6 = {[1] =  3005,[2] =  1050,[3] = -171},
    spawn7 = {[1] =  3005,[2] =  1000,[3] = -171},
    spawn8 = {[1] =  3005,[2] =  950,[3] = -171},
    spawn9 = {[1] =  3005,[2] =  900,[3] = -171},
    spawn10 = {[1] =  3005,[2] =  850,[3] = -171},
    spawn11 = {[1] =  3005,[2] =  800,[3] = -171},
    spawn12 = {[1] =  3005,[2] =  750,[3] = -171},
    spawn13 = {[1] =  3005,[2] =  700,[3] = -171},
    spawn14 = {[1] =  3005,[2] =  650,[3] = -171},
    spawn15 = {[1] =  3005,[2] =  600,[3] = -171},
    spawn16 = {[1] =  3005,[2] =  550,[3] = -171},
    spawn17 = {[1] =  3120,[2] =  1300,[3] = -131},
    spawn18 = {[1] =  3120,[2] =  1250,[3] = -131},
    spawn19 = {[1] =  3120,[2] =  1200,[3] = -131},
    spawn20 = {[1] =  3120,[2] =  1150,[3] = -131},
    spawn21 = {[1] =  3120,[2] =  1100,[3] = -131},
    spawn22 = {[1] =  3120,[2] =  1050,[3] = -131},
    spawn23 = {[1] =  3120,[2] =  1000,[3] = -131},
    spawn24 = {[1] =  3120,[2] =  950,[3] = -131},
    spawn25 = {[1] =  3120,[2] =  900,[3] = -131},
    spawn26 = {[1] =  3120,[2] =  850,[3] = -131},
    spawn27 = {[1] =  3120,[2] =  800,[3] = -131},
    spawn28 = {[1] =  3120,[2] =  750,[3] = -131},
    spawn29 = {[1] =  3120,[2] =  700,[3] = -131},
    spawn30 = {[1] =  3120,[2] =  650,[3] = -131},
    spawn31 = {[1] =  3120,[2] =  600,[3] = -131},
    spawn32 = {[1] =  3120,[2] =  550,[3] = -131},
    spawn33 = {[1] =  3180,[2] =  1300,[3] = -91},
    spawn34 = {[1] =  3180,[2] =  1250,[3] = -91},
    spawn35 = {[1] =  3180,[2] =  1200,[3] = -91},
    spawn36 = {[1] =  3180,[2] =  1150,[3] = -91},
    spawn37 = {[1] =  3180,[2] =  1100,[3] = -91},
    spawn38 = {[1] =  3180,[2] =  1050,[3] = -91},
    spawn39 = {[1] =  3180,[2] =  1050,[3] = -91},
    spawn40 = {[1] =  3180,[2] =  800,[3] = -91},
    spawn41 = {[1] =  3180,[2] =  750,[3] = -91},
    spawn42 = {[1] =  3180,[2] =  700,[3] = -91},
    spawn43 = {[1] =  3180,[2] =  650,[3] = -91},
    spawn44 = {[1] =  3180,[2] =  600,[3] = -91},
    spawn45 = {[1] =  3180,[2] =  550,[3] =  -91},
    spawn46 = {[1] =  3250,[2] =  1300,[3] = -91},
    spawn47 = {[1] =  3250,[2] =  1250,[3] = -91},
    spawn48 = {[1] =  3250,[2] =  1200,[3] = -91},
    spawn49 = {[1] =  3250,[2] =  1150,[3] = -91},
    spawn50 = {[1] =  3250,[2] =  1100,[3] = -91},
    spawn51 = {[1] =  3250,[2] =  1050,[3] = -91},
    spawn52 = {[1] =  3250,[2] =  1050,[3] = -131},
    spawn53 = {[1] =  3250,[2] =  800,[3] = -131},
    spawn54 = {[1] =  3250,[2] =  750,[3] = -131},
    spawn55 = {[1] =  3250,[2] =  700,[3] = -131},
    spawn56 = {[1] =  3250,[2] =  650,[3] = -131},
    spawn57 = {[1] =  3250,[2] =  600,[3] = -131},
    spawn58 = {[1] =  3250,[2] =  550,[3] = -131}

}

function SpawnFix()
    for i,v in pairs(spawns) do
        local ent = ents.Create("info_player_start")
        ent:SetPos( Vector( v[1], v[2], v[3] ) )
        ent:SetAngles(Angle(0, 175, 0))
    end
    print("[NCBA.gg] - All spawns have been created.")
    hook.Add("PlayerSelectSpawn", "RandomSpawn", function(pl)
        if pl:IsNPC() then return end
        local spawnsEnt = ents.FindByClass("info_player_start")
        local random_entry = math.random(#spawnsEnt)
        return spawnsEnt[random_entry]
    end)
end

hook.Add("InitPostEntity", "NCBA_Replace_Default_Spawns", function()
    timer.Simple(1,function() SpawnFix() end)
end)


local NCBAzombieSpawns = {
    {[1] =  2482.173096 ,[2] =  1543.375854, [3] = -139.968750},
}

local function CreateZombies()
    for i, v in pairs(NCBAzombieSpawns) do
        local NCBAzombie = ents.Create("npc_zombie")
        NCBAzombie:SetPos(Vector(v[1],v[2],v[3]))
        --zombie:DrawShadow(false)
        for ii,vv in pairs(ents.GetAll()) do
            if vv:IsNPC() then
            NCBAzombie:AddEntityRelationship( vv, D_LI, 0 )
            end
        end
        NCBAzombie:SetCondition( 23 )
        NCBAzombie:SetCollisionGroup( COLLISION_GROUP_PLAYER )
        NCBAzombie:Spawn()
    end
end
hook.Remove("PlayerSay","NCBAZombieEvent3")
hook.Add("PlayerSay","NCBAZombieEvent3", function( ply, command)
    if not IsValid(ply) then return end
    if command ~= "!zombiessssss" then return end

    CreateZombies()
end)