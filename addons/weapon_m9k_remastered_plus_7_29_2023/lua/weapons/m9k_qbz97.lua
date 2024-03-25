if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "QBZ-97"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/qbz/v_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_tct_famas.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/qbz/Cloth.wav",
		iDelay = 0.05
	},
	{
		sSound = "Weapons/qbz/Clipout.wav",
		iDelay = 0.05 + 0.60
	},
	{
		sSound = "Weapons/qbz/Clipout.wav",
		iDelay = 0.05 + 0.60 + 0.70
	},
	{
		sSound = "weapons/qbz/Magtap.wav",
		iDelay = 0.05 + 0.60 + 0.70 + 0.40
	},
	{
		sSound = "weapons/qbz/Pull.wav",
		iDelay = 0.05 + 0.60 + 0.70 + 0.40 + 0.65
	},
	{
		sSound = "weapons/qbz/Handle.wav",
		iDelay = 0.05 + 0.60 + 0.70 + 0.40 + 0.65 + 0.55
	}
}

SWEP.DrawSound = "weapons/qbz/Draw.wav"

SWEP.Primary.Sound = "weapons/qbz/1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 350
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 3.5 * recoilMulti
SWEP.Primary.KickDown = 2.1 * recoilMulti
SWEP.Primary.KickHorizontal = 2.1 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 36
SWEP.Primary.Spread = .035
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-2.165,0,0)
SWEP.IronSightsAng = Vector(1.1,-1,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 800,
		ClipSize = 30,
		KickUp = 1,
		KickDown = 0.5,
		KickHorizontal = 0.4,
		Automatic = true,
		NumShots = 1,
		Damage = 24,
		Spread = 0.005
	}
}