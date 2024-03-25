ENT.Type = "anim"


/*---------------------------------------------------------
---------------------------------------------------------*/
function ENT:SetEndPos( endpos )
	local ent = self
	ent.Entity:SetNWVector( "batropevector", endpos )
	ent.Entity:SetCollisionBoundsWS( ent.Entity:GetPos(), endpos, Vector() * 0.25 )
end


/*---------------------------------------------------------
---------------------------------------------------------*/
function ENT:GetEndPos()
	local ent = self
	return ent.Entity:GetNWVector( "batropevector" )
end