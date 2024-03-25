if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "Baikal MP-153"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/baikal/v_shot_xm1014.mdl"
SWEP.WorldModel = "models/weapons/w_double_barrel_shotgun.mdl"

SWEP.ReloadSound = "weapons/baikal/insert.wav"

SWEP.DrawSound = "weapons/baikal/draw.wav"

SWEP.Primary.Sound = "weapons/baikal/xm1014-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 150
SWEP.Primary.ClipSize = 5
SWEP.Primary.KickUp = 5 * recoilMulti
SWEP.Primary.KickDown = 2.5 * recoilMulti
SWEP.Primary.KickHorizontal = 6 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 26
SWEP.Primary.Damage = 3.5
SWEP.Primary.Spread = .18
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(-2.855,1.511,1.006)
SWEP.IronSightsAng = Vector(0.646,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 180,
		ClipSize = 5,
		KickUp = 5,
		KickDown = 0.2,
		KickHorizontal = 3,
		Automatic = false,
		NumShots = 8,
		Damage = 9,
		Spread = 0.05
	}
}


-- These are required for firstperson

sound.Add({
	name = "MP.Foley",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/baikal/foley.wav"}
})

sound.Add({
	name = "MP.Insert",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/baikal/insert.wav"}
})