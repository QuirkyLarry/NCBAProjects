if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "M3 Tactical"

SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/tacticalm3/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_benelli_m3.mdl"

SWEP.ReloadSound = "weapons/m3/m3_insertshell.wav"
SWEP.ReloadSoundFinish = "weapons/m3/m3_pump.wav"

SWEP.DrawSound = "weapons/m3/m3_pump.wav"
SWEP.DrawCantHear = true

SWEP.Primary.Sound = "weapons/m3/m3-1.wav"

SWEP.Primary.SoundPump = "weapons/m3/m3_pump.wav"
SWEP.Primary.SoundPumpDelay = 0.35

local recoilMulti = 0.1

SWEP.Primary.RPM = 60
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 6 * recoilMulti
SWEP.Primary.KickDown = 3 * recoilMulti
SWEP.Primary.KickHorizontal = 7 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 35
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .16
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(2.935,0,2)
SWEP.IronSightsAng = Vector(1,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 70,
		ClipSize = 8,
		KickUp = 0.4,
		KickDown = 0.2,
		KickHorizontal = 0.5,
		Automatic = false,
		NumShots = 8,
		Damage = 7,
		Spread = 0.11111111
	}
}