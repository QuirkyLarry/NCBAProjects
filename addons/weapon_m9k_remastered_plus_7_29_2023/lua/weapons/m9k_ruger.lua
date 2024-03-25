if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Pistols"
SWEP.PrintName = "Ruger MK3"

SWEP.Slot = 1
SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/ruger/v_pist_fiveseven.mdl"
SWEP.WorldModel = "models/weapons/w_luger_p08.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/glock/glock_clipout.wav",
		iDelay = 0.45
	},
	{
		sSound = "weapons/deagle/de_clipout.wav",
		iDelay = 0.45 + 0.95
	},
	{
		sSound = "weapons/fiveseven/fiveseven_sliderelease.wav",
		iDelay = 0.45 + 0.95 + 0.75
	}
}

SWEP.tDrawSoundSequence = {
	{
		sSound = "weapons/fiveseven/fiveseven_slidepull.wav",
		iDelay = 0.35
	},
	{
		sSound = "weapons/fiveseven/fiveseven_sliderelease.wav",
		iDelay = 0.35 + 0.15
	}
}

SWEP.Primary.Sound = "weapons/usp/usp1.wav"
SWEP.Primary.SoundVolume = 65 -- Silenced!

local recoilMulti = 0.1

SWEP.Primary.RPM = 250
SWEP.Primary.ClipSize = 10
SWEP.Primary.KickUp = 1.85 * recoilMulti
SWEP.Primary.KickDown = 0.95 * recoilMulti
SWEP.Primary.KickHorizontal = 1.65 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 25
SWEP.Primary.Spread = .017
SWEP.Primary.Ammo = "pistol"

SWEP.IronSightsPos = Vector(2.82,-0.301,1.78)
SWEP.IronSightsAng = Vector(0,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 450,
		ClipSize = 10,
		KickUp = 1,
		KickDown = 0,
		KickHorizontal = 0.9,
		Automatic = false,
		NumShots = 1,
		Damage = 15,
		Spread = .025
	}
}