SWEP.PrintName = "Prostitute SWEP"
SWEP.Purpose = "Charge people for dat ass"
SWEP.Instructions = "Left click to offer your services"
SWEP.Slot = 0
SWEP.SlotPos = 2
SWEP.Spawnable = true
SWEP.WorldModel = ""
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

if SERVER then
	util.AddNetworkString("cl3ptute_menu")
	util.AddNetworkString("cl3ptute_handlerequest")
end

function SWEP:PreDrawViewModel()
	return true
end

if CLIENT then
	SWEP.Category = "Other"
end

function SWEP:Initialize()
		self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
	if CLIENT then return end
	local trace = self:GetOwner():GetEyeTrace()
	if trace.Entity:IsPlayer() then
		if self:GetOwner():GetPos():Distance(trace.Entity:GetPos()) > 100 then return end
		net.Start("cl3ptute_menu")
		net.WriteEntity(trace.Entity)
		net.Send(self:GetOwner())
	end
	self:SetNextPrimaryFire(CurTime() + 0.5)
end