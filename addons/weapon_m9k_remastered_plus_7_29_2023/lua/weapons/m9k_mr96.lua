if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "MR-96"

SWEP.Slot = 1
SWEP.HoldType = "revolver"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/mr96/v_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_taurus_raging_bull.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/deagle/de_slideback.wav",
		iDelay = 0.25
	},
	{
		sSound = "weapons/deagle/de_clipout.wav",
		iDelay = 0.25 + 0.55
	},
	{
		sSound = "weapons/deagle/de_clipin.wav",
		iDelay = 0.25 + 0.55 + 0.75
	}
}

SWEP.DrawSound = "weapons/deagle/de_deploy.wav"

SWEP.Primary.Sound = "weapons/mr/deagle-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 150
SWEP.Primary.ClipSize = 6
SWEP.Primary.KickUp = 8 * recoilMulti
SWEP.Primary.KickDown = 3.7 * recoilMulti
SWEP.Primary.KickHorizontal = 8.3 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 61
SWEP.Primary.Spread = .021

SWEP.IronSightsPos = Vector(-1.74,0,0.34)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 200,
		ClipSize = 6,
		KickUp = 5,
		KickDown = 0.2,
		KickHorizontal = 0.3,
		Automatic = false,
		NumShots = 1,
		Damage = 10,
		Spread = 0.08
	}
}