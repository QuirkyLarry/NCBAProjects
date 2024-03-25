AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

resource.AddFile("materials/ncba_content/logo/ncba_logo_1920x2026.png");
--resource.AddFile("materials/ncba/ncba-logo-2.png");

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
local function CreateLogo()
	local fountainlogo = ents.Create( "ncba_fountain" )
	fountainlogo:SetModel( "models/hunter/blocks/cube025x025x025.mdl" )
	fountainlogo:SetMaterial("models/effects/vol_light001")
	fountainlogo:SetPos( Vector(-1902.678589, -1567.375366, 79.406410) )
	fountainlogo:Spawn()
	fountainlogo:SetMoveType(MOVETYPE_NONE)
	fountainlogo:SetSolid(SOLID_VPHYSICS)
	fountainlogo:SetCollisionGroup(COLLISION_GROUP_WORLD)
end
hook.Add("InitPostEntity", "NCBA_Create_Fountain", function()
	CreateLogo()
end)

function ENT:PhysicsUpdate(phys)
	if self.heldby <= 0 then
		phys:Sleep()
	end
end
--[[
local function textScreenPickup(ply, ent)
	if IsValid(ent) and ent:GetClass() == "spawn_logo" then
		ent.heldby = ent.heldby + 1
	end
end
hook.Add("PhysgunPickup", "text_ScreensPreventTravelPickup", textScreenPickup)

local function textScreenDrop(ply, ent)
	if IsValid(ent) and ent:GetClass() == "spawn_logo" then
		ent.heldby = ent.heldby - 1
	end
end
hook.Add("PhysgunDrop", "text_ScreensPreventTravelDrop", textScreenDrop)

local function textScreenCanTool(ply, trace, tool)
	if IsValid(trace.Entity) and trace.Entity:GetClass() == "spawn_logo" then
		if !(tool == "textscreen" or tool == "remover") then
			return false
		end
	end
end

hook.Add("CanTool", "text_ScreensPreventTools", textScreenCanTool)--]]