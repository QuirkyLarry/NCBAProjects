if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "Sturmgewehr 44"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/sturm/v_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_mp40smg.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/stg44/magout.wav",
		iDelay = 0.25
	},
	{
		sSound = "weapons/stg44/magin.wav",
		iDelay = 0.25 + 0.75
	},
	{
		sSound = "weapons/stg44/bolt.wav",
		iDelay = 0.25 + 0.75 + 0.55
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/stg44/cloth.wav",
		iDelay = 0.05
	},
	{
		sSound = "weapons/stg44/bolt.wav",
		iDelay = 0.05 + 0.35
	}
}

SWEP.Primary.Sound = "weapons/galil/galil-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 375
SWEP.Primary.ClipSize = 33
SWEP.Primary.KickUp = 3 * recoilMulti
SWEP.Primary.KickDown = 1.2 * recoilMulti
SWEP.Primary.KickHorizontal = 1.2 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 18
SWEP.Primary.Spread = .025
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-6.717,-10.44,0.685)
SWEP.IronSightsAng = Vector(1.07,0.054,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 500,
		ClipSize = 33,
		KickUp = 0.7,
		KickDown = 0.3,
		KickHorizontal = 0.2,
		Automatic = true,
		NumShots = 1,
		Damage = 20,
		Spread = 0.02
	}
}