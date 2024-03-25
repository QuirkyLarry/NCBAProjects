if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "Glock 18 Drum Mag."

SWEP.Slot = 1
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/glock_18_ext/v_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/w_dmg_glock.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/glock18extclip/m249_slideback.wav",
		iDelay = 0.00
	},
	{
		sSound = "weapons/glock18extclip/m249_magout.wav",
		iDelay = 0.00 + 1.10
	},
	{
		sSound = "weapons/glock18extclip/m249_magin.wav",
		iDelay = 0.00 + 1.10 + 1.85
	},
	{
		sSound = "weapons/glock18extclip/m249_sliderelease.wav",
		iDelay = 0.00 + 1.10 + 1.85 + 0.75
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/glock18extclip/m249_slideback.wav",
		iDelay = 0.35
	},
	{
		sSound = "weapons/glock18extclip/m249_slideforward.wav",
		iDelay = 0.35 + 0.10
	}
}

SWEP.Primary.Sound = "weapons/glock18extclip/M249-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 650
SWEP.Primary.ClipSize = 100
SWEP.Primary.KickUp = 1.9 * recoilMulti
SWEP.Primary.KickDown = 1.3 * recoilMulti
SWEP.Primary.KickHorizontal = 1.1 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 11
SWEP.Primary.Spread = .036
SWEP.Primary.Ammo = "pistol"

SWEP.IronSightsPos = Vector(-3.8525,0,2.695)
SWEP.IronSightsAng = Vector(0.1,0,-1)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 900,
		ClipSize = 100,
		KickUp = 2,
		KickDown = 0.1,
		KickHorizontal = 1,
		Automatic = true,
		NumShots = 1,
		Damage = 4,
		Spread = .03
	}
}