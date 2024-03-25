-- Localized Globals
local l_CTe = CurTime
local l_nSt, l_nWEy, l_nWFt, l_nBt = net.Start , net.WriteEntity , net.WriteFloat , net.Broadcast
local l_mRd, l_maRd, l_maCp = math.Round , math.Rand , math.Clamp
local l_uPSd = util.PrecacheSound
local l_SDn = SoundDuration
local l_Ae = Angle
local l_VRd = VectorRand
local l_eCe = ents.Create

SWEP.ViewModel = "models/Teh_Maestro/popcorn.mdl"
SWEP.WorldModel = "models/Teh_Maestro/popcorn.mdl"
SWEP.Spawnable			= true
SWEP.AdminOnly			= false
SWEP.Category = "Larry's DarkRP Sweps"
SWEP.Author = "Antimony51"
SWEP.Instructions	= "Left Click: Eat Popcorn\nRight Click: Throw Bucket"

SWEP.Primary.Clipsize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Clipsize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false
SWEP.Slot				= 1
SWEP.SlotPos			= 1
SWEP.HoldType 			= "shotgun"

function SWEP:Deploy()
end

function SWEP:Think()
	if (self.Owner.ChewScale or 0) > 0 then
		if SERVER then
			if (l_CTe() >= self.Owner.BiteStart+0.625 and self.Owner.BitesRem > 0) then
				self.Owner.BiteStart = l_CTe()
				self.Owner.BitesRem = self.Owner.BitesRem - 1
				l_nSt("Popcorn_Eat")
					l_nWEy(self.Owner)
					l_nWFt(l_mRd(l_maRd(4,8)+self.Owner.BitesRem*8))
				l_nBt()
			end
		end
			self.Owner.ChewScale = l_maCp((self.Owner.ChewStart+self.Owner.ChewDur - l_CTe())/self.Owner.ChewDur,0,1)
	end
end

function SWEP:Initialize()
	l_uPSd("crisps/eat.wav")
end

function SWEP:PrimaryAttack()
	if SERVER then
		self.Owner:EmitSound( "crisps/eat.wav", 60)
		self.Owner.BiteStart = 0
		self.Owner.BitesRem = 3
		l_nSt("Popcorn_Eat_Start")
			l_nWEy(self.Owner)
		l_nBt()
	end
	self.Owner.ChewScale = 1
	self.Owner.ChewStart = l_CTe()
	self.Owner.ChewDur = l_SDn("crisps/eat.wav")
	self:SetNextPrimaryFire(l_CTe())
end

function SWEP:SecondaryAttack()
	local bucket, att, phys, tr
	self:SetNextSecondaryFire(l_CTe())
	if CLIENT then return end
	self.Owner:EmitSound( "weapons/slam/throw.wav" )
	self.Owner:ViewPunch( l_Ae( l_maRd(-8,8), l_maRd(-8,8), 0 ) )

	bucket = l_eCe( "sent_popcorn_thrown" )
	bucket:SetOwner( self.Owner )
	bucket:SetPos( self.Owner:GetShootPos( ) )
	bucket:Spawn()
	bucket:Activate()
	phys = bucket:GetPhysicsObject( )

	if IsValid( phys ) then
		phys:SetVelocity( self.Owner:GetPhysicsObject():GetVelocity() )
		phys:AddVelocity( self.Owner:GetAimVector( ) * 128 * phys:GetMass( ) )
		phys:AddAngleVelocity( l_VRd() * 128 * phys:GetMass( ) )
	end
end
