if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_scoped_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "G36 Assault"

SWEP.DynamicLightScale = 1 -- Set to Default

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/asg36/v_rif_aug.mdl"
SWEP.WorldModel = "models/weapons/w_hk_g36c.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/G36/Cloth.mp3",
		iDelay = 0.05
	},
	{
		sSound = "weapons/G36/MagOut.mp3",
		iDelay = 0.05 + 0.35
	},
	{
		sSound = "weapons/G36/MagFiddle.mp3",
		iDelay = 0.05 + 0.35 + 0.90
	},
	{
		sSound = "weapons/G36/MagSlap.mp3",
		iDelay = 0.05 + 0.35 + 0.90 + 0.45
	},
	{
		sSound = "weapons/G36/BoltPull.mp3",
		iDelay = 0.05 + 0.35 + 0.90 + 0.45 + 1.00
	},
	{
		sSound = "weapons/G36/Boltback.mp3",
		iDelay = 0.05 + 0.35 + 0.90 + 0.45 + 1.00 + 0.35
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/asg36/foldback.wav",
		iDelay = 0.35
	}
}

SWEP.Primary.Sound = "weapons/asg36/aug-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 400
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 1.1 * recoilMulti
SWEP.Primary.KickDown = 1.1 * recoilMulti
SWEP.Primary.KickHorizontal = 1.1 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 31
SWEP.Primary.Spread = .031
SWEP.Primary.Ammo = "ar2"

SWEP.Primary.SpreadBefore = SWEP.Primary.Spread

SWEP.ScopeType = "gdcw_acog"
SWEP.ScopeStages = 1
SWEP.ScopeScale = 0.5
SWEP.ReticleScale = 0.6

SWEP.LegacyBalance = {
	Primary = {
		RPM = 700,
		ClipSize = 35,
		KickUp = 0.7,
		KickDown = 0.9,
		KickHorizontal = 0.8,
		Automatic = true,
		NumShots = 1,
		Damage = 25,
		Spread = 0.05
	}
}