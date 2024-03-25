if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "AK-47 SD"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/ak47sd/v_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_ak47_m9k.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/ak47/ak47_clipout.wav",
		iDelay = 0.35
	},
	{
		sSound = "weapons/ak47/ak47_clipin.wav",
		iDelay = 0.35 + 1.15
	},
	{
		sSound = "weapons/ak47sd/boltback.wav",
		iDelay = 0.35 + 1.15 + 0.80
	},
	{
		sSound = "weapons/ak47sd/boltforward.wav",
		iDelay = 0.35 + 1.15 + 0.80 + 0.25
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/ak47sd/boltpull.wav",
		iDelay = 0.45
	}
}

SWEP.Primary.Sound = "weapons/ak47sd/firesil.wav"
SWEP.Primary.SoundVolume = 65 -- Silenced!

local recoilMulti = 0.1

SWEP.Primary.RPM = 450
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 1 * recoilMulti
SWEP.Primary.KickDown = 1.2 * recoilMulti
SWEP.Primary.KickHorizontal = 1.2 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 35
SWEP.Primary.Spread = .035
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(2.051,-3.182,0.875)
SWEP.IronSightsAng = Vector(-0.798,0,0)

SWEP.bNoTracers = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 800,
		ClipSize = 30,
		KickUp = 0.8,
		KickDown = 0.2,
		KickHorizontal = 0.4,
		Automatic = true,
		NumShots = 1,
		Damage = 15,
		Spread = 0.007
	}
}