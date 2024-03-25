if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "FN TPS"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/tps/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_ithaca_m37.mdl"

SWEP.ReloadSound = "weapons/m3/m3_insertshell.wav"
SWEP.ReloadSoundFinish = "weapons/m3/m3_pump.wav"

SWEP.DrawSound = "weapons/m3/m3_pump.wav"
SWEP.DrawCantHear = true

SWEP.Primary.Sound = "weapons/tps/m3-1.wav"

SWEP.Primary.SoundPump = "weapons/m3/m3_pump.wav"
SWEP.Primary.SoundPumpDelay = 0.35

local recoilMulti = 0.1

SWEP.Primary.RPM = 55
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 22 * recoilMulti
SWEP.Primary.KickDown = 3 * recoilMulti
SWEP.Primary.KickHorizontal = 7 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 35
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .16
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(-7.225,-7.37,2.12)
SWEP.IronSightsAng = Vector(-0.579,0,0)
SWEP.bShotgunNoIron = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 70,
		ClipSize = 8,
		KickUp = 2,
		KickDown = 0.2,
		KickHorizontal = 0.9,
		Automatic = false,
		NumShots = 8,
		Damage = 6,
		Spread = 0.1
	}
}