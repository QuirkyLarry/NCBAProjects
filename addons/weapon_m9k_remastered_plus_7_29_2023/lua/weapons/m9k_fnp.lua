if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "FNP 45.Cal Advanced"

SWEP.Slot = 1
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/fnp/v_pist_fiveseven.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fokkususp.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/FNP45/MagOut.wav",
		iDelay = 0.45
	},
	{
		sSound = "weapons/FNP45/MagIn.wav",
		iDelay = 0.45 + 1.15
	},
	{
		sSound = "weapons/FNP45/SlideRelease.wav",
		iDelay = 0.45 + 1.15 + 0.50
	}
}

SWEP.DrawSound = "weapons/FNP45/Draw.wav"

SWEP.Primary.Sound = "weapons/FNP45/FNP45-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 400
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 2.2 * recoilMulti
SWEP.Primary.KickDown = 1.3 * recoilMulti
SWEP.Primary.KickHorizontal = 1.8 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 26
SWEP.Primary.Spread = .017
SWEP.Primary.Ammo = "pistol"

SWEP.IronSightsPos = Vector(-1.55,0,0.075)
SWEP.IronSightsAng = Vector(0,0.2,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 600,
		ClipSize = 8,
		KickUp = 0.9,
		KickDown = 0.1,
		KickHorizontal = 0.6,
		Automatic = false,
		NumShots = 1,
		Damage = 7,
		Spread = .025
	}
}