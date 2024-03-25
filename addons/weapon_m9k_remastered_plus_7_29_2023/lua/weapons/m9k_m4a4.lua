if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "M4A4"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/m4a4a/v_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_m4a1_iron.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/m4a4a/Magout.wav",
		iDelay = 0.40
	},
	{
		sSound = "weapons/m4a4a/Cloth.wav",
		iDelay = 0.40 + 0.60
	},
	{
		sSound = "weapons/m4a4a/Magin.wav",
		iDelay = 0.40 + 0.60 + 0.35
	},
	{
		sSound = "weapons/m4a4a/BoltBack.wav",
		iDelay = 0.40 + 0.60 + 0.35 + 0.55
	},
	{
		sSound = "weapons/m4a4a/BoltForward.wav",
		iDelay = 0.40 + 0.60 + 0.35 + 0.55 + 0.15
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/m4a4a/Deploy.wav",
		iDelay = 0.15
	},
	{
		sSound = "weapons/m4a4a/BoltBack.wav",
		iDelay = 0.15 + 0.30
	},
	{
		sSound = "weapons/m4a4a/BoltForward.wav",
		iDelay = 0.15 + 0.30 + 0.15
	}
}

SWEP.Primary.Sound = "weapons/m4a4a/shoot.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 450
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 2.8 * recoilMulti
SWEP.Primary.KickDown = 1.5 * recoilMulti
SWEP.Primary.KickHorizontal = 1.6 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 34
SWEP.Primary.Spread = .036
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-1.65,0,0.349)
SWEP.IronSightsAng = Vector(-0.4,0.14,1.75)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 600,
		ClipSize = 30,
		KickUp = 0.9,
		KickDown = 0.1,
		KickHorizontal = 0.5,
		Automatic = true,
		NumShots = 1,
		Damage = 40,
		Spread = 0.05
	}
}