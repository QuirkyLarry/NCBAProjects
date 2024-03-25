if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "KSG-12"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/ksg/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_ithaca_m37.mdl"

SWEP.ReloadSoundStart = "weapons/ksg/reload_start.wav"
SWEP.ReloadSound = "weapons/ksg/shellinsert1.wav"
SWEP.ReloadSoundFinish = "weapons/ksg/pumpback.wav"

SWEP.DrawSound = "weapons/ksg/draw.wav"

SWEP.Primary.Sound = "weapons/ksg/shot1.wav"

SWEP.Primary.SoundPump = "weapons/ksg/pumpback.wav"
SWEP.Primary.SoundPumpDelay = 0.45

local recoilMulti = 0.1

SWEP.Primary.RPM = 70
SWEP.Primary.ClipSize = 12
SWEP.Primary.KickUp = 5 * recoilMulti
SWEP.Primary.KickDown = 2 * recoilMulti
SWEP.Primary.KickHorizontal = 8 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 25
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .15
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(-1.415,0,0.17)
SWEP.IronSightsAng = Vector(0,0,4.5)
SWEP.bShotgunNoIron = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 70,
		ClipSize = 12,
		KickUp = 2,
		KickDown = 0.2,
		KickHorizontal = 0.9,
		Automatic = false,
		NumShots = 8,
		Damage = 5,
		Spread = 0.11171
	}
}


-- These are required for firstperson

sound.Add({
	name = "KSG.StartReload",
	channel = CHAN_ITEM,
	volume = 1.0,
	sound = "weapons/ksg/reload_start.wav"
})

sound.Add({
	name = "KSG.PumpBack",
	channel = CHAN_ITEM,
	volume = 1.0,
	sound = "weapons/ksg/pumpback.wav"
})

sound.Add({
	name = "KSG.PumpForward",
	channel = CHAN_ITEM,
	volume = 1.0,
	sound = "weapons/ksg/pumpforward.wav"
})

sound.Add({
	name = "KSG.ShellInsert",
	channel = CHAN_ITEM,
	volume = 1.0,
	sound = {"weapons/ksg/shellinsert1.wav","weapons/ksg/shellinsert3.wav","weapons/ksg/shellinsert2.wav"}
})