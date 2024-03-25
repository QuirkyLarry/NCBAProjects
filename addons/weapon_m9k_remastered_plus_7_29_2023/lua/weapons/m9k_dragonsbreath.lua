if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "M97 Trench Gun"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/dragonsbreath/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_double_barrel_shotgun.mdl"

SWEP.ReloadSound = "weapons/dragonsbreath/insert1.wav"
SWEP.ReloadSoundFinish = "weapons/dragonsbreath/pump.wav"

SWEP.DrawSound = "weapons/dragonsbreath/draw.wav"

SWEP.Primary.Sound = "weapons/dragonsbreath/fire.wav"

SWEP.Primary.SoundPump = "weapons/dragonsbreath/pump.wav"
SWEP.Primary.SoundPumpDelay = 0.45

local recoilMulti = 0.1

SWEP.Primary.RPM = 60
SWEP.Primary.ClipSize = 6
SWEP.Primary.KickUp = 7 * recoilMulti
SWEP.Primary.KickDown = 5 * recoilMulti
SWEP.Primary.KickHorizontal = 9 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 27
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .18
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(-1.621,-1.096,0.015)
SWEP.IronSightsAng = Vector(2.035,-0.003,0)
SWEP.bShotgunNoIron = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 70,
		ClipSize = 6,
		KickUp = 2,
		KickDown = 0.2,
		KickHorizontal = 0.9,
		Automatic = false,
		NumShots = 8,
		Damage = 6,
		Spread = 0.1112
	}
}


-- These are required for firstperson

sound.Add({
	name = "dragon.Pump",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/dragonsbreath/pump.wav"}
})

sound.Add({
	name = "dragon.Insert",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/dragonsbreath/insert1.wav","weapons/dragonsbreath/insert2.wav"}
})