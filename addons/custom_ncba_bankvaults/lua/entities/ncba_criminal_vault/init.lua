AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

-- The cool down before bank robberies
NCBA_Criminal_CriminalCooldown = 1800
-- Time it takes to rob the bank.
NCBA_Criminal_PayoutCooldown = 180
-- Teams that can rob the bank.
NCBA_Criminal_CriminalJobs = {["Mob Boss"] = true, ["Gangster"] = true, ["Pro Thief"] = true, ["Thief"] = true, ["Hobo Leader"] = true, }
-- Teams that can't rob the bank.
NCBA_Criminal_NoRob = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }
NCBA_Government_Jobs = {["Mayor"] = true,["Civil Protection"] = true, ["Civil Protection Chief"] = true, ["Swat"] = true, ["Swat Chief"] = true, ["Juggernaut"] = true, ["Swat Sniper"] = true, }

function NCBACriminalVaultInitialize()
	vault = ents.Create("ncba_criminal_vault")
	vault:SetPos(Vector(-3961, -1376, -150));
	vault:SetAngles(Angle(90, -90, 0))
	vault:Spawn();
	vault:SetModel("models/props_wasteland/laundry_washer001a.mdl")
	vault:SetMoveType(MOVETYPE_NONE)
	vault:SetSolid(SOLID_VPHYSICS)
	vault:DrawShadow(false)
	vault:SetNWFloat("criminalmoneyStored", 25000)
	vault:SetNWFloat("criminalcoolDown", 0)
	vault:SetNWFloat("criminalrobberytime", 0)
end

hook.Add("InitPostEntity","NCBA_Spawn_Criminal_Vault", function() NCBACriminalVaultInitialize() end)
hook.Add("PostCleanupMap","NCBA_Spawn_Criminal_VaultPost", function() NCBACriminalVaultInitialize() end)

function ENT:Think()
	if (!self.nextSecond or CurTime() >= self.nextSecond) then
	if timer.Exists("NCBA_Update_Criminal_Bank") then return end
	timer.Create("NCBA_Update_Criminal_Bank",NCBA_Criminal_CriminalCooldown-1200,0, function()
		local money = 25000
		for i,v in ipairs(player.GetAll()) do
			if NCBA_Criminal_CriminalJobs[team.GetName(v:Team())] then
				money = money + v:getDarkRPVar("money") * 0.01
			end
		end
		money = math.Round(money,0)
		self:SetNWFloat("criminalmoneyStored", money)
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
		if NCBA_Criminal_CriminalJobs[team.GetName(v:Team())] then
			loss = v:getDarkRPVar("money") * 0.01
			v:addMoney(-loss)
			notifyPlayer(v,"[Bank Manager] You lost " .. DarkRP.formatMoney(loss) .. " due to the bank being robbed.")
		end
	end
end

function ENT:Use(activator, caller)
	if vaultUseTIme > CurTime() then return end
	vaultUseTIme = CurTime() + 1

	if self:GetNWFloat("criminalbeingrobbed") > 0 then notifyPlayer(activator,"You are unable to raid the vault. The vault is currently being robbed.") return end
	if self:GetNWFloat("criminalcoolDown") > 0 then notifyPlayer(activator,"You are unable to raid the vault. The vault is currently on cool down.") return end
	if getBankOnline() <= 0 then notifyPlayer(activator, "You are unable to raid the vault. There is no Bank Manager") return end
	if NCBA_Government_Jobs[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to raid the vault. You are supposed to protect it.") return end
	if NCBA_Criminal_NoRob[team.GetName(activator:Team())] then notifyPlayer(activator, "You are unable to raid the vault. You need to be a criminal.") return end
	self:SetNWFloat("criminalbeingrobbed", 1)
	self:SetNWFloat("criminalrobberytime", NCBA_Criminal_PayoutCooldown)
	timer.Create("NCBA_Update_Criminal_RobberyTime",1,NCBA_Criminal_PayoutCooldown, function()
		local cooldown = self:GetNWFloat("criminalrobberytime")
		cooldown = cooldown - 1
		self:SetNWFloat("criminalrobberytime", cooldown)
	end)
	timer.Create("NCBA_Criminal_WaitToGiveMoney",NCBA_Criminal_PayoutCooldown,1, function()
		activator:addMoney(self:GetNWFloat("criminalmoneyStored"))
		DarkRP.notify(activator, 4, 4, "You recieved " .. DarkRP.formatMoney(self:GetNWFloat("criminalmoneyStored")) .. " from the vault.")
		self:SetNWFloat("criminalbeingrobbed", 0)
		self:SetNWFloat("criminalcoolDown", NCBA_Criminal_CriminalCooldown)
		self:SetNWFloat("criminalmoneyStored", 25000)
		updateMoneyForPlayers()
		timer.Create("NCBA_Update_Criminal_BankCooldown",1,NCBA_Criminal_CriminalCooldown, function()
			local cooldown = self:GetNWFloat("criminalcoolDown")
			cooldown = cooldown - 1
			self:SetNWFloat("criminalcoolDown", cooldown)
		end)
	end)
	timer.Create("NCBA_Criminal_CheckAlive",1,NCBA_Criminal_PayoutCooldown, function()
		if activator:Alive() then return end
		self:SetNWFloat("criminalbeingrobbed", 0)
		self:SetNWFloat("criminalcoolDown", NCBA_Criminal_CriminalCooldown)
		self:SetNWFloat("criminalmoneyStored", 25000)
		timer.Create("NCBA_Update_Criminal_BankCooldown",1,NCBA_Criminal_CriminalCooldown, function()
			local cooldown = self:GetNWFloat("criminalcoolDown")
			cooldown = cooldown - 1
			self:SetNWFloat("criminalcoolDown", cooldown)
		end)
		timer.Remove("NCBA_Criminal_WaitToGiveMoney")
		timer.Remove("NCBA_Criminal_CheckAlive")
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
end