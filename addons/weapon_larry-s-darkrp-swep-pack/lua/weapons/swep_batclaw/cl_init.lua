local l_ie = include
l_ie("shared.lua")
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw = false
	self.AmmoDisplay.PrimaryClip 	= 1
	self.AmmoDisplay.PrimaryAmmo 	= -1
	self.AmmoDisplay.SecondaryAmmo 	= -1
	return self.AmmoDisplay
end