if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "M16A4"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/m16a4/v_rif_sg552.mdl"
SWEP.WorldModel = "models/weapons/w_dmg_m16ag.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/twink_m16a4/magout.wav",
		iDelay = 0.25
	},
	{
		sSound = "weapons/twink_m16a4/magin1.wav",
		iDelay = 0.25 + 0.85
	},
	{
		sSound = "weapons/twink_m16a4/magin2.wav",
		iDelay = 0.25 + 0.85 + 0.15
	},
	{
		sSound = "weapons/twink_m16a4/chargeback.wav",
		iDelay = 0.25 + 0.85 + 0.15 + 0.80
	},
	{
		sSound = "weapons/twink_m16a4/chargefor.wav",
		iDelay = 0.25 + 0.85 + 0.15 + 0.80 + 0.35
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/twink_m16a4/chargeback.wav",
		iDelay = 0.25
	},
	{
		sSound = "weapons/twink_m16a4/chargefor.wav",
		iDelay = 0.25 + 0.25
	}
}

SWEP.Primary.Sound = "weapons/dmg_m16a4/shoot.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 360
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 2.3 * recoilMulti
SWEP.Primary.KickDown = 1.3 * recoilMulti
SWEP.Primary.KickHorizontal = 1.8 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 31
SWEP.Primary.Spread = .02
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-2.665,0,0.647)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 700,
		ClipSize = 20,
		KickUp = 0.8,
		KickDown = 0.1,
		KickHorizontal = 0.1,
		Automatic = false,
		NumShots = 1,
		Damage = 15,
		Spread = 0.005
	}
}