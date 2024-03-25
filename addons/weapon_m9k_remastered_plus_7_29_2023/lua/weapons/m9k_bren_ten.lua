if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "Bren Ten 9mm"

SWEP.Slot = 1
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/bren_ten/v_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fokkususp.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/bren/magout.wav",
		iDelay = 0.40
	},
	{
		sSound = "weapons/bren/magin.wav",
		iDelay = 0.40 + 0.60
	},
	{
		sSound = "weapons/bren/maghit.wav",
		iDelay = 0.40 + 0.60 + 0.45
	},
	{
		sSound = "weapons/bren/SlideRelease.wav",
		iDelay = 0.40 + 0.60 + 0.45 + 0.30
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/bren/slideback.wav",
		iDelay = 0.25
	},
	{
		sSound = "weapons/bren/SlideRelease.wav",
		iDelay = 0.25 + 0.25
	}
}

SWEP.Primary.Sound = "weapons/bren/Fire.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 12
SWEP.Primary.KickUp = 2.2 * recoilMulti
SWEP.Primary.KickDown = 1.1 * recoilMulti
SWEP.Primary.KickHorizontal = 1.3 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 24
SWEP.Primary.Spread = .012
SWEP.Primary.Ammo = "pistol"

SWEP.IronSightsPos = Vector(-1.898,-3,0.22)
SWEP.IronSightsAng = Vector(1.304,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 500,
		ClipSize = 12,
		KickUp = 0.4,
		KickDown = 0.3,
		KickHorizontal = 0.3,
		Automatic = false,
		NumShots = 1,
		Damage = 7,
		Spread = .025
	}
}