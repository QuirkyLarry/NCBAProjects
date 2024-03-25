if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "Guardian Mini"

SWEP.Slot = 1
SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/guardian/v_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fokkususp.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/p228/p228_clipout.wav",
		iDelay = 0.40
	},
	{
		sSound = "weapons/p228/p228_clipin.wav",
		iDelay = 0.40 + 1.00
	},
	{
		sSound = "weapons/p228/p228_sliderelease.wav",
		iDelay = 0.40 + 1.00 + 0.95
	}
}

SWEP.Primary.Sound = "weapons/guardianmini/p228-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 500
SWEP.Primary.ClipSize = 7
SWEP.Primary.KickUp = 1.3 * recoilMulti
SWEP.Primary.KickDown = 1 * recoilMulti
SWEP.Primary.KickHorizontal = 1 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 17
SWEP.Primary.Spread = .015
SWEP.Primary.Ammo = "pistol"

SWEP.IronSightsPos = Vector(1.9,0,1.57)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 500,
		ClipSize = 5,
		KickUp = 0.2,
		KickDown = 0.2,
		KickHorizontal = 0.2,
		Automatic = false,
		NumShots = 1,
		Damage = 5,
		Spread = .025
	}
}