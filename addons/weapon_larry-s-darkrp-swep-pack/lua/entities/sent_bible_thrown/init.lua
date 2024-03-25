local l_ACSLFe = AddCSLuaFile
local l_ie = include
local l_eCe = ents.Create
local l_Ae = Angle

l_ACSLFe("cl_init.lua")
l_ACSLFe("shared.lua")
l_ie("shared.lua")


function ENT:SpawnFunction( ply, tr )  --Based on easy engine wrench
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 10
	local ent = l_eCe( "sent_bible_thrown")
	ent:SetPos(t.SpawnPos + l_Ae(0,90,0))
	ent:Spawn()
	ent:Activate()
	ent.Owner = ply
	return ent
end

function ENT:Initialize()
	self:SetModel( "models/toybox/bible.mdl" )
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then phys:Wake() end
end

function ENT:PhysicsCollide( data, physobj )
	if (data.Speed > 80 && data.DeltaTime > 0.2 ) then
		self:EmitSound( "Cardboard.ImpactHard" )
		local hitdamage = l_eCe("point_hurt");
		hitdamage:SetKeyValue("Damage",3)
		hitdamage:SetKeyValue("DamageRadius",30)
		hitdamage:SetKeyValue("DamageType","CLUB ")
		hitdamage:SetPos( self:GetPos() )
		hitdamage:Spawn();
		hitdamage:SetParent(self)
		hitdamage:SetOwner(self )
		hitdamage:Fire("hurt","",0);
		hitdamage:Fire("kill","",1.2);
	end
end
