
TOOL.Category = "Construction"
TOOL.Name = "#tool.rope.name"

TOOL.ClientConVar[ "material" ] = "cable/rope"

TOOL.Information = {
	{ name = "left", stage = 0 },
	{ name = "left_1", stage = 1 },
	{ name = "right", stage = 1 },
	{ name = "reload" }
}
if CLIENT then
	language.Add("SBoxLimit_ropes", "You've hit the Rope limit!")
end

cleanup.Register("ropes")

function TOOL:LeftClick( trace )

	if ( IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return end
	-- If there's no physics object then we can't constraint it!
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	if not self:GetOwner():CheckLimit("ropes") then return false end
	local iNum = self:NumObjects()

	local Phys = trace.Entity:GetPhysicsObjectNum( trace.PhysicsBone )
	self:SetObject( iNum + 1, trace.Entity, trace.HitPos, Phys, trace.PhysicsBone, trace.HitNormal )

	if ( iNum > 0 ) then

		if ( CLIENT ) then

			self:ClearObjects()
			return true

		end

		-- Get client's CVars
		local material = self:GetClientInfo( "material" )
		-- Get information we're about to use
		local Ent1, Ent2 = self:GetEnt( 1 ), self:GetEnt( 2 )
		local Bone1, Bone2 = self:GetBone( 1 ), self:GetBone( 2 )
		local WPos1, WPos2 = self:GetPos( 1 ), self:GetPos( 2 )
		local LPos1, LPos2 = self:GetLocalPos( 1 ), self:GetLocalPos( 2 )
		local length = ( WPos1 - WPos2 ):Length()

		local constraint, rope = constraint.Rope( Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, length, addlength, 0, 10, material, 0)

		-- Clear the objects so we're ready to go again
		self:ClearObjects()

		-- Add The constraint to the players undo table

		undo.Create( "Rope" )
			undo.AddEntity( constraint )
			undo.AddEntity( rope )
			undo.SetPlayer( self:GetOwner() )
		undo.Finish()
		self:GetOwner():AddCount("ropes", constraint)
		self:GetOwner():AddCleanup( "ropeconstraints", constraint )
		self:GetOwner():AddCleanup( "ropeconstraints", rope )

	else

		self:SetStage( iNum + 1 )

	end

	return true

end

function TOOL:RightClick( trace )

	if ( IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return end
	local iNum = self:NumObjects()
	if not self:GetOwner():CheckLimit("ropes") then return false end
	local Phys = trace.Entity:GetPhysicsObjectNum( trace.PhysicsBone )
	self:SetObject( iNum + 1, trace.Entity, trace.HitPos, Phys, trace.PhysicsBone, trace.HitNormal )

	if ( iNum > 0 ) then

		if ( CLIENT ) then

			self:ClearObjects()
			return true

		end

		-- Get client's CVars
		local material = self:GetClientInfo( "material" )
		-- Get information we're about to use
		local Ent1, Ent2 = self:GetEnt( 1 ), self:GetEnt( 2 )
		local Bone1, Bone2 = self:GetBone( 1 ), self:GetBone( 2 )
		local WPos1, WPos2 = self:GetPos( 1 ), self:GetPos( 2 )
		local LPos1, LPos2 = self:GetLocalPos( 1 ), self:GetLocalPos( 2 )
		local length = ( WPos1 - WPos2 ):Length()

		local constraint, rope = constraint.Rope( Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, length, addlength, 0, 10, material, 0)
		-- Clear the objects and set the last object as object 1
		self:ClearObjects()

		iNum = self:NumObjects()
		self:SetObject( iNum + 1, Ent2, trace.HitPos, Phys, Bone2, trace.HitNormal )
		self:SetStage( iNum + 1 )

		-- Add The constraint to the players undo table
		undo.Create( "Rope" )
			undo.AddEntity( constraint )
			if ( IsValid( rope ) ) then undo.AddEntity( rope ) end
			undo.SetPlayer( self:GetOwner() )
		undo.Finish()
		self:GetOwner():AddCount("ropes", constraint)
		self:GetOwner():AddCleanup( "ropeconstraints", constraint )
		self:GetOwner():AddCleanup( "ropeconstraints", rope )

	else

		self:SetStage( iNum + 1 )

	end

	return true

end

function TOOL:Reload( trace )

	if ( !IsValid( trace.Entity ) || trace.Entity:IsPlayer() ) then return false end
	if ( CLIENT ) then return true end

	return constraint.RemoveConstraints( trace.Entity, "Rope" )

end

function TOOL:Holster()

	self:ClearObjects()

end

local ConVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel( CPanel )

	CPanel:AddControl( "Header", { Description = "#tool.rope.help" } )
	CPanel:AddControl( "RopeMaterial", { Label = "#tool.rope.material", ConVar = "rope_material" } )

end
