if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "Serbu Super Shorty"

SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/supershorty/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_benelli_m3.mdl"

SWEP.ReloadSound = "weapons/m3/m3_insertshell.wav"
SWEP.ReloadSoundFinish = "weapons/m3/m3_pump.wav"

SWEP.DrawSound = "weapons/m3/m3_pump.wav"
SWEP.DrawCantHear = true

SWEP.Primary.Sound = "weapons/ksg/shot1.wav"

SWEP.Primary.SoundPump = "weapons/m3/m3_pump.wav"
SWEP.Primary.SoundPumpDelay = 0.35

local recoilMulti = 0.1

SWEP.Primary.RPM = 45
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 9 * recoilMulti
SWEP.Primary.KickDown = 5 * recoilMulti
SWEP.Primary.KickHorizontal = 8 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 29
SWEP.Primary.Damage = 3.7
SWEP.Primary.Spread = .16
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(4.3,0,2.35)
SWEP.IronSightsAng = Vector(1,0,0)
SWEP.bShotgunNoIron = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 50,
		ClipSize = 3,
		KickUp = 0.5,
		KickDown = 0.2,
		KickHorizontal = 1,
		Automatic = false,
		NumShots = 8,
		Damage = 12,
		Spread = 0.1119
	}
}