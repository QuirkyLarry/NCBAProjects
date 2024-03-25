if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_shotty_base"
SWEP.Category = "M9kR+ Shotguns"
SWEP.PrintName = "SPAS 12 Closed Stock"

SWEP.Spawnable = true

SWEP.ViewModelFOV = 60
SWEP.ViewModel = "models/weapons/spas12stock/v_shot_xm1014.mdl"
SWEP.WorldModel = "models/weapons/w_spas_12.mdl"

SWEP.ReloadSound = "weapons/spas12/spas12_insertshell.wav"
SWEP.ReloadSoundFinish = "weapons/spas12/spas12_pump.wav"

SWEP.DrawSound = "weapons/spas12/spas12_draw.wav"

SWEP.Primary.Sound = "weapons/spas12/xm1014-1.wav"

local recoilMulti = 0.1

SWEP.Primary.RPM = 165
SWEP.Primary.ClipSize = 8
SWEP.Primary.KickUp = 5 * recoilMulti
SWEP.Primary.KickDown = 2 * recoilMulti
SWEP.Primary.KickHorizontal = 3 * recoilMulti
SWEP.Primary.Automatic = false
SWEP.Primary.NumShots = 27
SWEP.Primary.Damage = 4
SWEP.Primary.Spread = .19
SWEP.Primary.Ammo = "buckshot"

SWEP.IronSightsPos = Vector(0.295,0,1.335)
SWEP.IronSightsAng = Vector(0,0,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 100,
		ClipSize = 8,
		KickUp = 4,
		KickDown = 0.2,
		KickHorizontal = 0.9,
		Automatic = false,
		NumShots = 8,
		Damage = 9,
		Spread = 0.1
	}
}


-- These are required for firstperson

sound.Add({
	name = "Weapon_lol.aft_rel",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/spas12/spas12_pump.wav"}
})

sound.Add({
	name = "Weapon_lol.ins_shell",
	channel = CHAN_USER_BASE + 10,
	volume = 1.0,
	sound = {"weapons/spas12/spas12_insertshell.wav"}
})