if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "AK-74U"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/ak74u/v_rif_galil.mdl"
SWEP.WorldModel = "models/weapons/w_ak47_m9k.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/ak74u/foley.wav",
		iDelay = 0.05
	},
	{
		sSound = "weapons/ak74u/magout.wav",
		iDelay = 0.05 + 0.60
	},
	{
		sSound = "weapons/ak74u/foley.wav",
		iDelay = 0.05 + 0.60 + 0.45
	},
	{
		sSound = "weapons/ak74u/magin.wav",
		iDelay = 0.05 + 0.60 + 0.55 + 0.30
	},
	{
		sSound = "weapons/ak74u/foley.wav",
		iDelay = 0.05 + 0.60 + 0.55 + 0.30 + 0.30
	},
	{
		sSound = "weapons/ak74u/boltpull.wav",
		iDelay = 0.05 + 0.60 + 0.55 + 0.30 + 0.30 + 0.65
	},
	{
		sSound = "weapons/ak74u/drawcloth.wav",
		iDelay = 0.05 + 0.60 + 0.55 + 0.30 + 0.30 + 0.65 + 0.40
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/ak74u/foley.wav",
		iDelay = 0.00
	},
	{
		sSound = "weapons/ak74u/safety.wav",
		iDelay = 0.00 + 0.35
	},
	{
		sSound = "weapons/ak74u/drawcloth.wav",
		iDelay = 0.00 + 0.35 + 0.25
	}
}

SWEP.Primary.Sound = "weapons/ak74u/galil-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 550
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 1.2 * recoilMulti
SWEP.Primary.KickDown = 0.7 * recoilMulti
SWEP.Primary.KickHorizontal = 1 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 31
SWEP.Primary.Spread = .033
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-2.685,-3.659,1.634)
SWEP.IronSightsAng = Vector(0.411,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 700,
		ClipSize = 30,
		KickUp = 1,
		KickDown = 0.6,
		KickHorizontal = 0.8,
		Automatic = true,
		NumShots = 1,
		Damage = 25,
		Spread = 0.05
	}
}