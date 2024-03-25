SWEP.Author = "GamerTech13, Modified by Larry"
SWEP.Category = "Larry's DarkRP Sweps"
SWEP.Contact = "thenuclearbadasses@gmail.com"
SWEP.Purpose = "Allows you to be Spider-Man"
SWEP.Instructions = "Left click to web swing \n Right Click to shoot webs"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
--SWEP.HoldType = "normal"
SWEP.PrintName = "Spiderman Swep"
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
local l_IV = IsValid
local l_uTL = util.TraceLine
local l_eC = ents.Create
local l_CT = CurTime
local l_uE = util.Effect
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
	local owner = self:GetOwner()
	if not owner:IsOnGround() then
		owner:SetAllowFullRotation(true)
	elseif owner:IsOnGround() then
		owner:SetAllowFullRotation(false)
	end

	if (not owner or owner == NULL) then
		return
	end

	if (owner:KeyPressed(IN_ATTACK)) then
		if CLIENT then
			self:SetHoldType("pistol")
		end
		self:StartAttack()
	elseif (owner:KeyDown(IN_ATTACK) and inRange) then
		self:UpdateAttack()
	elseif (owner:KeyReleased(IN_ATTACK) and inRange) then
		if CLIENT then
			self:SetHoldType("normal")
		end
		self:EndAttack(true)
	end

	if owner:IsOnGround() and owner:KeyPressed(IN_JUMP) then
			owner:SetVelocity(owner:GetUp() * 500)
	end

	if owner:KeyPressed(IN_ATTACK2) then
		if CLIENT then
			self:SetHoldType("pistol")
		end

		self:Attack2()
	end

	if (owner:KeyReleased(IN_ATTACK2)) and CLIENT then
		l_tS(0.31, function()
			if l_IV(self) and self.SetHoldType then
				self:SetHoldType("normal")
			end
		end)
	end
end

function SWEP:DoTrace(endpos)
	local owner = self:GetOwner()
	local trace = {}
	trace.start = owner:GetShootPos()
	trace.endpos = trace.start + (owner:GetAimVector() * 14096)
	if (endpos) then
		trace.endpos = (endpos - self.Tr.HitNormal * 7)
	end
	trace.filter = {owner, self}
	self.Tr = nil
	self.Tr = l_uTL(trace)
end

function SWEP:StartAttack()
	local owner = self:GetOwner()
	local gunPos = owner:GetShootPos()
	local disTrace = owner:GetEyeTrace()
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
				self.Beam:SetPos(owner:GetShootPos())
				self.Beam:Spawn()
			end
			self.Beam:SetParent(owner)
			self.Beam:SetOwner(owner)
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
	local owner = self:GetOwner()
	owner:LagCompensation(true)
	disTrace = owner:GetEyeTrace()
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

	local vVel = (endpos - owner:GetPos())
	local localDistance = endpos:DistToSqr(owner:GetPos())
	local et = (self.startTime + (l_mSt(localDistance) / self.speed))

	if (self.dt ~= 0) then
		self.dt = (et - l_CT()) / (et - self.startTime)
	end

	if (self.dt < 0) then
		self.dt = 0
	end

	if (self.dt == 0) then
		zVel = owner:GetVelocity().z
		vVel = vVel:GetNormalized() * (l_mCp(localDistance, 0, 7))

		if (SERVER) then
			local gravity = l_GC("sv_Gravity"):GetInt()
			vVel:Add(l_Vr(0, 0, (gravity / 100) * 1.5))

			if (zVel < 0) then
				vVel:Sub(l_Vr(0, 0, zVel / 100))
			end

			owner:SetVelocity(vVel * ((l_CT() - self.lastUpdate) / (1 / 66)))
			self.lastUpdate = l_CT()
		end
	end

	endpos = nil
	owner:LagCompensation(false)
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
	local owner = self:GetOwner()
	local CF = owner:GetFOV()

	if CF == 90 then
		owner:SetFOV(30, .3)
	elseif CF == 30 then
		owner:SetFOV(90, .3)
	end
end

if SERVER then
	function SWEP:Deploy()
		self:GetOwner().ShouldReduceFallDamage = true

		return true
	end

	function SWEP:Holster()
		self:EndAttack(false)
		self:GetOwner().ShouldReduceFallDamage = false

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
	local owner = self:GetOwner()
	if l_IV(self) then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end

	if l_IV(owner) then
		owner:EmitSound("web/webfire.wav")

		l_tS(0.31, function()
			if not l_IV(self) then return end
			local trace = owner:GetEyeTrace()
			local effectdata = EffectData()
			local Hand1 = owner:LookupBone("ValveBiped.Bip01_R_Hand")
			local Hand1Pos = owner:GetBonePosition(Hand1)
			effectdata:SetStart(Hand1Pos)
			effectdata:SetOrigin(trace.HitPos)
			effectdata:SetScale(100)
			l_uE("web_fire", effectdata)
			bullet = {}
			bullet.Num = 1
			bullet.Src = owner:GetShootPos()
			bullet.Dir = owner:GetAimVector()
			bullet.Spread = l_Vr(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force = 5000
			bullet.Damage = 50
			owner:FireBullets(bullet)
		end)

		l_tS(0.5, function()
			self:SendWeaponAnim(ACT_GESTURE_RANGE_ATTACK1)
		end)

		if CLIENT then
			self:SetHoldType("none")
		end

		self:SetNextSecondaryFire(l_CT() + 0.8)
	end
end