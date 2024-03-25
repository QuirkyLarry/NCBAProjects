if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "SPAS 12 Silenced"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModel = "models/weapons/spas12silenced/v_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_spas_12.mdl"

SWEP.ReloadSound = "weapons/m3/m3_insertshell.wav"
SWEP.ReloadSoundFinish = "weapons/m3/m3_pump.wav"

SWEP.DrawSound = "weapons/m3/m3_pump.wav"
SWEP.DrawCantHear = true

SWEP.Primary.Sound = "weapons/silencedspas/m3-2.wav"
SWEP.Primary.SoundVolume = 70 -- Silenced!

SWEP.Primary.SoundPump = "weapons/m3/m3_pump.wav"
SWEP.Primary.SoundPumpDelay = 0.35

local recoilMulti = 0.1

SWEP.Primary.RPM = 70
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 5 * recoilMulti
SWEP.Primary.KickDown = 2 * recoilMulti
SWEP.Primary.KickHorizontal = 3 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 27
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .19
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(2.63,-3.79,2.4)
SWEP.IronSightsAng = Vector(0.35,0.3,-6)
SWEP.bShotgunNoIron = true

SWEP.bNoTracers = true

SWEP.LegacyBalance = {
	Primary = {
		RPM = 70,
		ClipSize = 8,
		KickUp = 0.5,
		KickDown = 0.2,
		KickHorizontal = 2,
		Automatic = false,
		NumShots = 8,
		Damage = 3,
		Spread = 0.1
	}
}