if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "FN FNC Police"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/fnc/v_rif_galil.mdl"
SWEP.WorldModel = "models/weapons/w_fn_fal.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/fnc/Cloth.wav",
		iDelay = 0.00
	},
	{
		sSound = "weapons/fnc/Magout.wav",
		iDelay = 0.00 + 0.50
	},
	{
		sSound = "weapons/fnc/Magin.wav",
		iDelay = 0.00 + 0.50 + 1.05
	},
	{
		sSound = "weapons/fnc/Boltback.wav",
		iDelay = 0.00 + 0.50 + 1.05 + 0.95
	},
	{
		sSound = "weapons/fnc/Boltforward.wav",
		iDelay = 0.00 + 0.50 + 1.05 + 0.95 + 0.25
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/fnc/Draw.wav",
		iDelay = 0.00
	},
	{
		sSound = "weapons/fnc/Boltback.wav",
		iDelay = 0.00 + 0.60
	},
	{
		sSound = "weapons/fnc/Boltforward.wav",
		iDelay = 0.00 + 0.60 + 0.30
	}
}

SWEP.Primary.Sound = "weapons/fnc/galil-1.wav"
SWEP.Primary.SoundVolume = 80 -- This thing is LOUD

local recoilMulti = 0.1

SWEP.Primary.RPM = 400
SWEP.Primary.ClipSize = 25
SWEP.Primary.KickUp = 2 * recoilMulti
SWEP.Primary.KickDown = 1.7 * recoilMulti
SWEP.Primary.KickHorizontal = 1.8 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 27
SWEP.Primary.Spread = .035
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-1.135,0.5,0.31)
SWEP.IronSightsAng = Vector(5.5,2.68,-1.5)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 400,
		ClipSize = 25,
		KickUp = 0.5,
		KickDown = 0.2,
		KickHorizontal = 0.4,
		Automatic = true,
		NumShots = 1,
		Damage = 40,
		Spread = 0.05
	}
}