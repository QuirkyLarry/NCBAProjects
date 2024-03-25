AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

if SERVER then
resource.AddFile("materials/ncba_content/logo/ncbalogorecyclingplant.png")
end
if !file.Find("materials/ncba_content/logo/ncbalogorecyclingplant.png", "LUA") and CLIENT then
resource.AddFile("materials/ncba_content/logo/ncbalogorecyclingplant.png")
end
function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:DrawShadow(false)
	self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
	self:SetMaterial("models/effects/vol_light001")
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self.heldby = 0
	self:SetMoveType(MOVETYPE_NONE)
	self:SetAngles(Angle(0, 0, 0))
	self:DrawShadow(false)
end
local function CreateRecycle()
	local recyclingplant = ents.Create( "ncba_recyclingplant" )
	recyclingplant:SetModel( "models/hunter/blocks/cube025x025x025.mdl" )
	recyclingplant:SetMaterial("models/effects/vol_light001")
	recyclingplant:SetPos( Vector(-1728.935547, -6167.622070, 89.430649) )
	recyclingplant:Spawn()
	recyclingplant:SetMoveType(MOVETYPE_NONE)
	recyclingplant:SetSolid(SOLID_VPHYSICS)
	recyclingplant:SetCollisionGroup(COLLISION_GROUP_WORLD)
end
hook.Add("InitPostEntity", "NCBA_Create_Recycling", function()
	CreateRecycle()
end)
function ENT:PhysicsUpdate(phys)
	if self.heldby <= 0 then
		phys:Sleep()
	end
end