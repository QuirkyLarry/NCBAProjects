AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

-- The cool down before bank robberies
local NCBA_Criminal_CriminalCooldown = 1800
-- Time it takes to rob the bank.
local NCBA_Criminal_PayoutCooldown = 180
-- Teams that can rob the bank.
local NCBA_Criminal_CriminalJobs = {["Mob Boss"] = true, ["Gangster"] = true, ["Pro Thief"] = true, ["Thief"] = true, ["Hobo Leader"] = true, }
-- Teams that can't rob the bank.
local NCBA_Criminal_NoRob = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, ["Bank Manager"] = true,}
local NCBA_Government_Jobs = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }

function NCBARandomVaultInitialize(vector1,vector2,vector3,angle1,angle2,angle3,model,money,scale)
	vault = ents.Create("ncba_randommoney_vault")
	vault:SetPos(Vector(vector1,vector2,vector3));
	vault:SetAngles(Angle(angle1,angle2,angle3))
	vault:SetModel(model)
	vault:DrawShadow(false)
	vault:SetModelScale(scale)
	vault:Spawn()
	vault:SetMoveType(MOVETYPE_NONE)
	vault:SetSolid(SOLID_VPHYSICS)
	vault:SetNWFloat("moneyStored",money)
	vault:CollisionRulesChanged()
end
--[[ Models
models/props_lab/partsbin01.mdl
models/player/spike/pile.mdl
--]]
local entSpawns = {-- 4385.968750 -2135.968750 -85.968750
	-- Large Money Cabinents - 135
	[1] = {vector = {[1] = -3850.000000, [2] = -2139.000000,[3] = -154.000000}, angle = {[1] = 0, [2] = 90,[3] = 0}, model = "models/props_lab/partsbin01.mdl", scale = 2.5},
	[2] = {vector = {[1] = -3975.000000, [2] = -2139.000000,[3] = -154.000000}, angle = {[1] = 0, [2] = 90,[3] = 0}, model = "models/props_lab/partsbin01.mdl", scale = 2.5},
	[3] = {vector = {[1] = -4100.000000, [2] = -2139.000000,[3] = -154.000000}, angle = {[1] = 0, [2] = 90,[3] = 0}, model = "models/props_lab/partsbin01.mdl", scale = 2.5},
	-- Brief Cases
	[4] = {vector = {[1] = -4400.000000, [2] = -2100.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/briefcase.mdl", scale = 1.5},
	[5] = {vector = {[1] = -4400.000000, [2] = -1965.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/briefcase.mdl", scale = 1.5},
	[6] = {vector = {[1] = -4400.000000, [2] = -1830.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/briefcase.mdl", scale = 1.5},
	[7] = {vector = {[1] = -4400.000000, [2] = -1695.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/briefcase.mdl", scale = 1.5},
	[8] = {vector = {[1] = -4400.000000, [2] = -1560.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/briefcase.mdl", scale = 1.5},
	-- Money Stack
	[9] = {vector = {[1] = -4420.000000, [2] = -2025.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/pile.mdl", scale = 1.5},
	[10] = {vector = {[1] = -4420.000000, [2] = -1890.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/pile.mdl", scale = 1.5},
	[11] = {vector = {[1] = -4420.000000, [2] = -1755.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/pile.mdl", scale = 1.5},
	[12] = {vector = {[1] = -4420.000000, [2] = -1620.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/pile.mdl", scale = 1.5},
	[13] = {vector = {[1] = -4420.000000, [2] = -1485.000000,[3] = -148.000000}, angle = {[1] = 0, [2] = 0,[3] = 0}, model = "models/player/spike/pile.mdl", scale = 1.5},
}
local entSpawnsPos = {
	-- Large Money Cabinents - 135
	[1] = Vector(-3850.000000,-2139.000000,-154.000000),
	[2] = Vector(-3975.000000,-2139.000000,-154.000000),
	[3] = Vector(-4100.000000,-2139.000000,-154.000000),
	-- Brief Cases
	[4] = Vector(-4400.000000,-2100.000000,-148.000000),
	[5] = Vector(-4400.000000,-1965.000000,-148.000000),
	[6] = Vector(-4400.000000,-1830.000000,-148.000000),
	[7] = Vector(-4400.000000,-1695.000000,-148.000000),
	[8] = Vector(-4400.000000,-1560.000000,-148.000000),
	-- Money Stack
	[9] = Vector(-4420.000000,-2025.000000,-148.000000),
	[10] = Vector(-4420.000000,-1890.000000,-148.000000),
	[11] = Vector(-4420.000000,-1755.000000,-148.000000),
	[12] = Vector(-4420.000000,-1620.000000,-148.000000),
	[13] = Vector(-4420.000000,-1485.000000,-148.000000),
}
function spawnRandomEnts(iCount)
	if #ents.FindByClass("ncba_randommoney_vault") > 13 then return end
	for i,v in ipairs(entSpawns) do
		if iCount == i then
			money = math.random(100,150000)
			NCBARandomVaultInitialize(v.vector[1],v.vector[2],v.vector[3],v.angle[1],v.angle[2],v.angle[3],v.model, money, v.scale)
		end
	end
end
local iCount = 1
function createRandomTimer()
	timer.Create("NCBA_Spawn_MoneyInts_Vault",120,0, function()
		spawnRandomEnts(iCount)
		iCount = iCount + 1
		if iCount == #entSpawns then
			iCount = 1
		end
	end)
end
hook.Add("InitPostEntity","NCBA_Spawn_Random_Vault", function()
	createRandomTimer()
end)

hook.Add("PostCleanupMap","NCBA_Spawn_Random_VaultPost", function() NCBARandomVaultInitialize() end)

function ENT:Think()
end

local vaultUseTIme = 0
local function getBankOnline()
	for i,v in ipairs(RPExtraTeams) do
		if v.name == "Bank Manager" then
			index = i
		end
	end
	return #team.GetPlayers(index)
end

function ENT:Use(activator, caller)
	if vaultUseTIme > CurTime() then return end
	vaultUseTIme = CurTime() + 1
	if player.GetCount() <= 10 then notifyPlayer(activator, "You are unable to steal this money. There is not enough players online.") return end
	if getBankOnline() <= 0 then notifyPlayer(activator, "You are unable to steal this money. There is no Bank Manager.") return end
	if NCBA_Government_Jobs[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to steal this money. You are supposed to protect it.") return end
	if NCBA_Criminal_NoRob[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to steal this money. You need to be a criminal.") return end
	activator:addMoney(self:GetNWFloat("moneyStored"))
	DarkRP.notify(activator, 4, 4, "You recieved " .. DarkRP.formatMoney(self:GetNWFloat("moneyStored")) .. " from the vault.")
	SafeRemoveEntity(self)
end


notuseTime = 0
function notifyPlayer(ply, reason)
	if notuseTime >= CurTime() then return end
	DarkRP.notify(ply, 4, 4, reason)
	notuseTime = CurTime() + 1
end

function ENT:PhysicsCollide(data, phys)
end