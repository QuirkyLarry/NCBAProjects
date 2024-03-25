-- Swep config.
-- Allow slapping weapons out of hands. True or False.
local SlapWeapons = false -- Default False
-- How hard the slapper slaps.
local SlapForce = 800

-- Localized Globals
local l_ACSLF = AddCSLuaFile
local l_uANS = util.AddNetworkString
local l_Ml = Model
local l_Sd = Sound
local l_Vr = Vector
local l_CT = CurTime
local l_gSP = game.SinglePlayer
local l_nSt = net.Start
local l_nWEy = net.WriteEntity
local l_nBt = net.Broadcast
local l_tSe = timer.Simple
local l_IVd = IsValid
local l_nRe = net.Receive
local l_nEy = net.ReadEntity
local l_uTHl = util.TraceHull
local l_gGWd = game.GetWorld
local l_tRm = table.Random
local l_Ae = Angle
local l_mRd = math.Rand
local l_CCCVr = CreateClientConVar
local l_eCe = ents.Create
local l_ips = ipairs
if SERVER then
	l_ACSLF( "shared.lua" )
	l_uANS( "SlapAnimation" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true
SWEP.PrintName	= "Slappers"
SWEP.Category 		= "Larry's DarkRP Sweps"
SWEP.Slot		= 1
SWEP.SlotPos	= 0
SWEP.Instructions = "Left click to slap a fucker."
SWEP.ViewModel	= l_Ml("models/weapons/larry_models/slapper/v_watch.mdl")
SWEP.WorldModel	= ""
SWEP.HoldType	= "normal"

SWEP.Primary = {
	ClipSize     = -1,
	Delay = 0.8,
	DefaultClip = -1,
	Automatic = false,
	Ammo = "none"
}

SWEP.Secondary = SWEP.Primary

SWEP.Sounds = {
	Miss = l_Sd("Weapon_Knife.Slash"),
	HitWorld = l_Sd("Default.ImpactSoft"),
	Hurt = {
		l_Sd("npc_citizen.ow01"),
		l_Sd("npc_citizen.ow02")
	},
	Slap = {
		l_Sd("larry_sounds/slapper/slap_hit01.wav"),
		l_Sd("larry_sounds/slapper/slap_hit02.wav"),
		l_Sd("larry_sounds/slapper/slap_hit03.wav"),
		l_Sd("larry_sounds/slapper/slap_hit04.wav"),
		l_Sd("larry_sounds/slapper/slap_hit05.wav"),
		l_Sd("larry_sounds/slapper/slap_hit06.wav"),
		l_Sd("larry_sounds/slapper/slap_hit07.wav"),
		l_Sd("larry_sounds/slapper/slap_hit08.wav"),
		l_Sd("larry_sounds/slapper/slap_hit09.wav")
	}
}

SWEP.NPCFilter = {
	"npc_monk", "npc_alyx", "npc_barney", "npc_citizen",
	"npc_kleiner", "npc_magnusson", "npc_eli", "npc_fisherman",
	"npc_gman", "npc_mossman", "npc_odessa", "npc_breen"
}

SWEP.Mins = l_Vr(-8, -8, -8)
SWEP.Maxs = l_Vr(8, 8, 8)

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self:DrawShadow(false)

	if CLIENT then
		self:SetupHands()
	end
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:CanSecondaryAttack()
	return true
end

function SWEP:ShouldDropOnDie()
	return false
end

if SERVER then
	function SWEP:Think()
		local vm = self.Owner:GetViewModel()
		if self:GetNextPrimaryFire() < l_CT() and vm:GetSequence() ~= 0 then
			vm:ResetSequence(0)
		end
	end
end

function SWEP:SlapAnimation()
	if SERVER and not l_gSP() then
		l_nSt( "SlapAnimation" )
			l_nWEy(self.Owner)
		l_nBt()
	end
	self:SetHoldType("melee")
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	l_tSe(0.3, function()
		if l_IVd(self) then
			self:SetHoldType(self.HoldType)
		end
	end)
end

l_nRe( "SlapAnimation", function()
	local ply = l_nEy()
	if not l_IVd(ply) then return end
	local weapon = ply:GetActiveWeapon()
	if not l_IVd(weapon) or not weapon.SlapAnimation then return end
	weapon:SlapAnimation()
end)

function SWEP:PrimaryAttack()
	if l_gSP() then
		self:CallOnClient("PrimaryAttack", "")
	end
	self.ViewModelFlip = false
	self:Slap()
end

function SWEP:SecondaryAttack()
	if l_gSP() then
		self:CallOnClient("SecondaryAttack", "")
	end
	self.ViewModelFlip = true
	self:Slap()
end

function SWEP:Slap()
	self:SlapAnimation()
	if SERVER then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_2)
		local tr = l_uTHl({
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + (self.Owner:GetAimVector() * 40),
			mins = self.Mins,
			maxs = self.Maxs,
			filter = self.Owner
		})
		local ent = tr.Entity
		if l_IVd(ent) or l_gGWd() == ent then
			if ent:IsPlayer() then
				self:SlapPlayer(ent, tr)
			end
		else
			self.Owner:EmitSound( self.Sounds.Miss, 80, 100 )
		end
	end
	self:SetNextPrimaryFire( l_CT() + self.Primary.Delay )
	self:SetNextSecondaryFire( l_CT() + self.Primary.Delay )
end

function SWEP:SlapPlayer(ply, tr)
	local vec = (tr.HitPos - tr.StartPos):GetNormal()
	ply:EmitSound(l_tRm(self.Sounds.Hurt), 50, 100 )
	ply:SetLocalVelocity( vec * SlapForce )
	self:SlapWeaponOutOfHands(ply)
	self.Owner:EmitSound( l_tRm(self.Sounds.Slap), 80, 100)
end

function SWEP:SlapWeaponOutOfHands( ent )
	if not SlapWeapons then return end

	local weapon = ent:GetActiveWeapon()
	if not l_IVd(weapon) then return end

	local class = weapon:GetClass()
	if class == "slappers" then return end

	local pos = weapon:GetPos()

	if ent:IsPlayer() then
		ent:StripWeapon( class )
	elseif ent:IsNPC() then
		weapon:Remove()
	end

	local wep = l_eCe( class )

	local hand = ent:LookupBone( "ValveBiped.Bip01_R_Hand" )
	if hand then
		pos = ent:GetBonePosition( hand )
	else
		pos = ent:GetPos(), l_Ae(0,0,0)
	end

	wep:SetPos(pos)
	wep:SetOwner(ent)
	wep:Spawn()
	wep.CannotPickup = l_CT() + 3

	local phys = wep:GetPhysicsObject()
	if l_IVd( phys ) then
		l_tSe(0.01, function()
			local ang = self.Owner:EyeAngles()
			phys:ApplyForceCenter( ang:Forward() * 3000 + ang:Right() * 3000 + l_Vr(0,0,l_mRd(1500,3000)) )
		end)
	end
end

hook.Add( "PlayerCanPickupWeapon", "SlapCanPickup", function( ply, weapon )
	if weapon.CannotPickup and weapon.CannotPickup > l_CT() then
		return false
	end
end )

if CLIENT then
	local CvarAnimCam = l_CCCVr("slappers_animated_camera", 0, true, false)
	SWEP.DrawCrosshair = false

	function SWEP:DrawHUD() end
	function SWEP:DrawWorldModel() end

	local function GetViewModelAttachment(attachment)
		local vm = LocalPlayer():GetViewModel()
		local attachID = vm:LookupAttachment(attachment)
		return vm:GetAttachment(attachID)
	end

	function SWEP:CalcView( ply, origin, angles, fov )
		if CvarAnimCam:GetBool() and not l_IVd(self.Owner:GetVehicle()) then -- don't alter calcview when in vehicle
			local attach = GetViewModelAttachment("attach_camera")
			if attach and self:GetNextPrimaryFire() > l_CT() then
				local angdiff = angles - (attach.Ang + l_Ae(0,0,-90))
				-- SUPER HACK
				if (self:GetNextPrimaryFire() > l_CT()) and angdiff.r > 179.9 then -- view is flipped
					angdiff.p = -(89 - angles.p) -- find pitch difference to stop at 89 degrees
				end
				angles = angles - angdiff
			end
		end
		return origin, angles, fov
	end

	local CvarUseHands = l_CCCVr("slappers_vm_hands", 1, true, false)
	local shouldHideVM = false
	local bonesToHide = {
		"ValveBiped.Bip01_L_UpperArm",
		"ValveBiped.Bip01_L_Clavicle",
		"ValveBiped.Bip01_R_UpperArm",
		"ValveBiped.Bip01_R_Clavicle",
	}
	local boneScale = vector_origin

	function SWEP:PreDrawViewModel( vm, ply, weapon )
		if shouldHideVM then
			shouldHideVM = false
			vm:SetMaterial("engine/occlusionproxy")
		end
		for _, bone in l_ips(bonesToHide) do
			local boneId = vm:LookupBone(bone)
			if not boneId then continue end
			vm:ManipulateBoneScale(boneId, boneScale)
		end
	end

	function SWEP:SetupHands()
		local useHands = CvarUseHands:GetBool()
		self.UseHands = useHands
		shouldHideVM = useHands
	end

	function SWEP:Holster()
		self:OnRemove()
		return true
	end

	function SWEP:OnRemove()
		if not l_IVd(self.Owner) then return end
		local vm = self.Owner:GetViewModel()
		if l_IVd(vm) then
			vm:SetMaterial("")
		end
	end
end