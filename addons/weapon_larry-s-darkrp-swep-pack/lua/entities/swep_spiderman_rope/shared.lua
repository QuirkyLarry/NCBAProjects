ENT.Type = "anim"
/*---------------------------------------------------------
---------------------------------------------------------*/
function ENT:SetEndPos( endpos )
	self.Entity:SetNWVector( "ropevector", endpos )
	self.Entity:SetCollisionBoundsWS( self.Entity:GetPos(), endpos, Vector() * 0.25 )
end


/*---------------------------------------------------------
---------------------------------------------------------*/
function ENT:GetEndPos()
	return self.Entity:GetNWVector( "ropevector" )
end