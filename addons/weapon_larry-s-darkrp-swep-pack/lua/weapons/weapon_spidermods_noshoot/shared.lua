SWEP.Author = "GamerTech13, Modified by Larry"
SWEP.Category = "Larry's DarkRP Sweps"
SWEP.Contact = "thenuclearbadasses@gmail.com"
SWEP.Purpose = "Allows you to be Spider-Man"
SWEP.Instructions = "Left click to web swing \n Right Click to shoot webs"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.HoldType = "normal"
SWEP.PrintName = "Simple Spiderman Swep"
SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.ViewModel = "models/weapons/larry_models/spidermanswep/v_spiderweb.mdl"
SWEP.WorldModel = ""
SWEP.ViewModelFlip = true
-- Locals
local l_sGTID = (CLIENT and surface.GetTextureID or NULL)
local l_tS = timer.Simple
local l_mSt = math.sqrt
local l_uTL = util.TraceLine
local l_eC = ents.Create
local l_CT = CurTime
local l_Vr = Vector
local l_GC = GetConVar
local l_hA = hook.Add
local l_mCp = math.Clamp
-- Code
if CLIENT then
	SWEP.WepSelectIcon = l_sGTID("weapons/spiderman")
	killicon.Add("weapon_spiderman", "killicons/larry_icons/spiderman/weapon_spiderman", color_white)
end

function SWEP:Initialize()
	if CLIENT then
		self:SetHoldType("normal")
	end
end

function SWEP:Think()

	if not self.Owner:IsOnGround() then
		self.Owner:SetAllowFullRotation(true)
	elseif self.Owner:IsOnGround() then
		self.Owner:SetAllowFullRotation(false)
	end

	if (not self.Owner or self.Owner == NULL) then
		return
	end

	if (self.Owner:KeyPressed(IN_ATTACK)) then
		if CLIENT then
			self:SetHoldType("pistol")
		end
		self:StartAttack()
	elseif (self.Owner:KeyDown(IN_ATTACK) and inRange) then
		self:UpdateAttack()
	elseif (self.Owner:KeyReleased(IN_ATTACK) and inRange) then
		if CLIENT then
			self:SetHoldType("normal")
		end
		self:EndAttack(true)
	end

	if self.Owner:IsOnGround() and self.Owner:KeyPressed(IN_JUMP) then
			self.Owner:SetVelocity(self.Owner:GetUp() * 500)
	end

end

function SWEP:DoTrace(endpos)
	local trace = {}
	trace.start = self.Owner:GetShootPos()
	trace.endpos = trace.start + (self.Owner:GetAimVector() * 14096)
	if (endpos) then
		trace.endpos = (endpos - self.Tr.HitNormal * 7)
	end
	trace.filter = {self.Owner, self}
	self.Tr = nil
	self.Tr = l_uTL(trace)
end

function SWEP:StartAttack()
	local gunPos = self.Owner:GetShootPos()
	local disTrace = self.Owner:GetEyeTrace()
	local hitPos = disTrace.HitPos
	local x = (gunPos.x - hitPos.x) ^ 2
	local y = (gunPos.y - hitPos.y) ^ 2
	local z = (gunPos.z - hitPos.z) ^ 2
	local distance = l_mSt(x + y + z)
	local distanceCvar = 3500
	inRange = false

	if distance <= distanceCvar then
		inRange = true
	end

	if inRange then
		if SERVER then
			if (not self.Beam) then
				self.Beam = l_eC("swep_spiderman_rope")
				self.Beam:SetPos(self.Owner:GetShootPos())
				self.Beam:Spawn()
			end
			self.Beam:SetParent(self.Owner)
			self.Beam:SetOwner(self.Owner)
		end

		self:DoTrace()
		self.speed = 10000
		self.startTime = l_CT()
		self.endTime = l_CT() + self.speed
		self.dt = -1
		self.lastUpdate = l_CT()

		if SERVER and self.Beam then
			self.Beam:GetTable():SetEndPos(self.Tr.HitPos)
		end

		self:UpdateAttack()
	end
end

function SWEP:UpdateAttack()
	self.Owner:LagCompensation(true)
	disTrace = self.Owner:GetEyeTrace()
	hitPos = disTrace.HitPos
	endpos = self.Tr.HitPos

	if (SERVER and self.Beam) then
		self.Beam:GetTable():SetEndPos(endpos)
	end

	lastpos = endpos

	if (self.Tr.Entity:IsValid()) then
		endpos = self.Tr.Entity:GetPos()

		if (SERVER) then
			self.Beam:GetTable():SetEndPos(endpos)
		end
	end

	local vVel = (endpos - self.Owner:GetPos())
	local localDistance = endpos:DistToSqr(self.Owner:GetPos())
	local et = (self.startTime + (l_mSt(localDistance) / self.speed))

	if (self.dt ~= 0) then
		self.dt = (et - l_CT()) / (et - self.startTime)
	end

	if (self.dt < 0) then
		self.dt = 0
	end

	if (self.dt == 0) then
		zVel = self.Owner:GetVelocity().z
		vVel = vVel:GetNormalized() * (l_mCp(localDistance, 0, 7))

		if (SERVER) then
			local gravity = l_GC("sv_Gravity"):GetInt()
			vVel:Add(l_Vr(0, 0, (gravity / 100) * 1.5))

			if (zVel < 0) then
				vVel:Sub(l_Vr(0, 0, zVel / 100))
			end

			self.Owner:SetVelocity(vVel * ((l_CT() - self.lastUpdate) / (1 / 66)))
			self.lastUpdate = l_CT()
		end
	end

	endpos = nil
	self.Owner:LagCompensation(false)
end

function SWEP:EndAttack(shutdownsound)
	if (CLIENT) then
		return
	end

	if (not self.Beam) then
		return
	end

	self.Beam:Remove()
	self.Beam = nil
end

function SWEP:Attack2()
	if (CLIENT) then
		return
	end

	local CF = self.Owner:GetFOV()

	if CF == 90 then
		self.Owner:SetFOV(30, .3)
	elseif CF == 30 then
		self.Owner:SetFOV(90, .3)
	end
end

if SERVER then
	function SWEP:Deploy()
		self.Owner.ShouldReduceFallDamage = true

		return true
	end

	function SWEP:Holster()
		self:EndAttack(false)
		self.Owner.ShouldReduceFallDamage = false

		return true
	end

	local function ReduceFallDamage(ent, dmginfo)
		if ent:IsPlayer() and ent.ShouldReduceFallDamage and dmginfo:IsFallDamage() then
			dmginfo:SetDamage(0)
		end
	end

	l_hA("EntityTakeDamage", "ReduceFallDamage", ReduceFallDamage)
end

function SWEP:OnRemove()
	self:EndAttack(false)

	return true
end

function SWEP:PrimaryAttack()
	if not inRange then
		self:SendWeaponAnim(ACT_VM_SWINGMISS)
	elseif inRange then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

		l_tS(0.2, function()
			self:EmitSound("web/webfire.wav")
		end)

		l_tS(0.5, function()
			self:SendWeaponAnim(ACT_VM_IDLE_LOWERED)
		end)
	end
end

function SWEP:SecondaryAttack()
	if ( not self:CanSecondaryAttack() ) then return end
end