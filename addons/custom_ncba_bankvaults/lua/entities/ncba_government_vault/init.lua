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
local NCBA_Criminal_NoRob = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }
local NCBA_Government_Jobs = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }

function NCBAGovernmentVaultInitialize()
	vault = ents.Create("ncba_government_vault")
	vault:SetPos(Vector(-4085, -1376, -150));
	vault:SetAngles(Angle(90, -90, 0))
	vault:Spawn();
	vault:SetModel("models/props_wasteland/laundry_washer001a.mdl")
	vault:SetMoveType(MOVETYPE_NONE)
	vault:SetSolid(SOLID_VPHYSICS)
	vault:DrawShadow(false)
	vault:SetNWFloat("governmentmoneyStored", 25000)
	vault:SetNWFloat("governmentcoolDown", 0)
	vault:SetNWFloat("governmentrobberytime", 0)
end

hook.Add("InitPostEntity","NCBA_Spawn_Government_Vault", function() NCBAGovernmentVaultInitialize() end)
hook.Add("PostCleanupMap","NCBA_Spawn_Government_VaultPost", function() NCBAGovernmentVaultInitialize() end)

function ENT:Think()
	if (!self.nextSecond or CurTime() >= self.nextSecond) then
	if timer.Exists("NCBA_Update_Government_Bank") then return end
	timer.Create("NCBA_Update_Government_Bank",NCBA_Criminal_CriminalCooldown-1200,0, function()
		local money = 25000
		for i,v in ipairs(player.GetAll()) do
			if NCBA_Government_Jobs[team.GetName(v:Team())] then 
				money = money + v:getDarkRPVar("money") * 0.01
			end
		end
		money = math.Round(money,0)
		self:SetNWFloat("governmentmoneyStored", money)
	end)
	end
	self.nextSecond = CurTime() + 1;
end;

local vaultUseTIme = 0
local function getBankOnline()
	for i,v in ipairs(RPExtraTeams) do
		if v.name == "Bank Manager" then
			index = i
		end
	end
	return #team.GetPlayers(index)
end

local function updateMoneyForPlayers()
	for i,v in ipairs(player.GetAll()) do
		if NCBA_Government_Jobs[team.GetName(v:Team())] then
			loss = v:getDarkRPVar("money") * 0.01
			v:addMoney(-loss)
			notifyPlayer(v,"[Bank Manager] You lost " .. DarkRP.formatMoney(loss) .. " due to the bank being robbed.")
		end
	end
end

function ENT:Use(activator, caller)
	if vaultUseTIme > CurTime() then return end
	vaultUseTIme = CurTime() + 1

	if self:GetNWFloat("beingrobbed") > 0 then notifyPlayer(activator,"You are unable to raid the vault. The vault is currently being robbed.") return end
	if self:GetNWFloat("governmentcoolDown") > 0 then notifyPlayer(activator,"You are unable to raid the vault. The vault is currently on cool down.") return end
	if getBankOnline() <= 0 then notifyPlayer(activator, "You are unable to raid the vault. There is no Bank Manager.") return end
	if NCBA_Government_Jobs[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to raid the vault. You are supposed to protect it.") return end
	if NCBA_Criminal_NoRob[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to raid the vault. You need to be a criminal.") return end
	self:SetNWFloat("beingrobbed", 1)
	self:SetNWFloat("governmentrobberytime", NCBA_Criminal_PayoutCooldown)
	timer.Create("NCBA_Update_Government_governmentrobberytime",1,NCBA_Criminal_PayoutCooldown, function()
		local cooldown = self:GetNWFloat("governmentrobberytime")
		cooldown = cooldown - 1
		self:SetNWFloat("governmentrobberytime", cooldown)
	end)
	timer.Create("NCBA__Government_WaitToGiveMoney",NCBA_Criminal_PayoutCooldown,1, function()
		activator:addMoney(self:GetNWFloat("governmentmoneyStored"))
		DarkRP.notify(activator, 4, 4, "You recieved " .. DarkRP.formatMoney(self:GetNWFloat("governmentmoneyStored")) .. " from the vault.")
		self:SetNWFloat("beingrobbed", 0)
		self:SetNWFloat("governmentcoolDown", NCBA_Criminal_CriminalCooldown)
		self:SetNWFloat("governmentmoneyStored", 25000)
		updateMoneyForPlayers()
		timer.Create("NCBA_Update_Government_BankCooldown",1,NCBA_Criminal_CriminalCooldown, function()
			local cooldown = self:GetNWFloat("governmentcoolDown")
			cooldown = cooldown - 1
			self:SetNWFloat("governmentcoolDown", cooldown)
		end)
	end)
	timer.Create("NCBA__Government_CheckAlive",1,NCBA_Criminal_PayoutCooldown, function()
		if activator:Alive() then return end
		self:SetNWFloat("beingrobbed", 0)
		self:SetNWFloat("governmentcoolDown", NCBA_Criminal_CriminalCooldown)
		self:SetNWFloat("governmentmoneyStored", 25000)
		timer.Create("NCBA_Update_Government_BankCooldown",1,NCBA_Criminal_CriminalCooldown, function()
			local cooldown = self:GetNWFloat("governmentcoolDown")
			cooldown = cooldown - 1
			self:SetNWFloat("governmentcoolDown", cooldown)
		end)
		timer.Remove("NCBA__Government_WaitToGiveMoney")
		timer.Remove("NCBA__Government_CheckAlive")
		DarkRP.notify(activator, 4, 4, "You died therefore you get no payout.")
	end)
end


notuseTime = 0
function notifyPlayer(ply, reason)
	if notuseTime >= CurTime() then return end
	DarkRP.notify(ply, 4, 4, reason)
	notuseTime = CurTime() + 1
end

function ENT:PhysicsCollide(data, phys)
end;

function ENT:VisualEffect()
	local effectData = EffectData();	
	effectData:SetStart(self:GetPos());
	effectData:SetOrigin(self:GetPos());
	effectData:SetScale(8);	
	util.Effect("GlassImpact", effectData, true, true);
	self:Remove();
end;