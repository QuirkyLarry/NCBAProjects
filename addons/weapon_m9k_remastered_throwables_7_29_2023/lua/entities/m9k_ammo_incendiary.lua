if not MMM_M9k_IsBaseInstalled then return end -- Make sure the base is installed!

if not IsMounted("csgo") then -- Make sure csgo is mounted.
	function ENT:Initialize()
		if SERVER then
			self:Remove()
		end
	end

	return
end

AddCSLuaFile()

ENT.Base = "m9kr_base_ammo"
ENT.Category = "M9kR: Ammunition"
ENT.PrintName = "[T] Incendiary Grenades"
ENT.Spawnable = true

ENT.AmmoClass		= "m9k_mmm_incendiary"
ENT.AmmoWeapon		= "m9k_mmm_incendiary"
ENT.AmmoModel		= "models/items/item_item_crate.mdl"
ENT.AmmoCount		= 8
ENT.ImpactSound		= "Default.ImpactSoft"

ENT.bDrawText		= true
ENT.bDropOnDestroy	= true
ENT.DropClass		= "m9k_mmm_incendiary"

ENT.Text 			= "Incendiary Grenades"
ENT.TextPos			= Vector(0,90,90)
ENT.TextColor		= Color(230,45,45)
ENT.TextScale		= 0.125

ENT.OffsetUp		= 12
ENT.OffsetRight		= 1
ENT.OffsetForward	= 18