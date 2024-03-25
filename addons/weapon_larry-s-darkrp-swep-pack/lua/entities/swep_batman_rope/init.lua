local l_ACSLF = AddCSLuaFile
local l_ie = include
l_ACSLF( "cl_init.lua" )
l_ACSLF( "shared.lua" )
l_ie("shared.lua")

function ENT:Initialize()
	self:DrawShadow( false )
	self:SetSolid( SOLID_NONE )
end

function ENT:Think()
end