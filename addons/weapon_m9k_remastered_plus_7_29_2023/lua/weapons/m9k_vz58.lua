if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

SWEP.Base = "bobs_gun_base"
SWEP.Category = "M9kR+ Assault Rifles"
SWEP.PrintName = "VZOR 58"

SWEP.Slot = 3
SWEP.HoldType = "ar2"
SWEP.Spawnable = true

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/vzor58/v_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_ak47_m9k.mdl"

SWEP.tReloadDynamic = {
	{
		sSound = "weapons/vz58/ak47_cloth.wav",
		iDelay = 0.05
	},
	{
		sSound = "weapons/vz58/ak47_clipout.wav",
		iDelay = 0.05 + 1.05
	},
	{
		sSound = "weapons/vz58/ak47_clipin.wav",
		iDelay = 0.05 + 1.05 + 0.60
	},
	{
		sSound = "weapons/vz58/ak47_boltback.wav",
		iDelay = 0.05 + 1.05 + 0.60 + 0.85
	},
	{
		sSound = "weapons/vz58/ak47_boltforward.wav",
		iDelay = 0.05 + 1.05 + 0.60 + 0.85 + 0.15
	},
	{
		sSound = "weapons/vz58/ak47_cloth.wav",
		iDelay = 0.05 + 1.05 + 0.60 + 0.85 + 0.15 + 0.30
	}
}

SWEP.DrawSound = "weapons/vz58/ak47_deploy.wav"

SWEP.Primary.Sound = "weapons/vz58/AK47-1.wav"
SWEP.Primary.SoundVolume = 85 -- This gun is.. LOUD!

local recoilMulti = 0.1

SWEP.Primary.RPM = 450
SWEP.Primary.ClipSize = 30
SWEP.Primary.KickUp = 3 * recoilMulti
SWEP.Primary.KickDown = 1.7 * recoilMulti
SWEP.Primary.KickHorizontal = 1.8 * recoilMulti
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 41
SWEP.Primary.Spread = .037
SWEP.Primary.Ammo = "ar2"

SWEP.IronSightsPos = Vector(-1.096,-5.625,0.444)
SWEP.IronSightsAng = Vector(0.658,0.137,0)

SWEP.LegacyBalance = {
	Primary = {
		RPM = 600,
		ClipSize = 30,
		KickUp = 0.7,
		KickDown = 0.1,
		KickHorizontal = 0.9,
		Automatic = true,
		NumShots = 1,
		Damage = 30,
		Spread = 0.05
	}
}