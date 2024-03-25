local l_ACSLFe = AddCSLuaFile
local l_ie = include
local l_uANSg = util.AddNetworkString
local l_IVd = IsValid
local l_Sd = Sound
local l_mrm = math.random
local l_tCt = table.Count
local l_nSt, l_nWVr, l_nWFt, l_nBt = net.Start, net.WriteVector , net.WriteFloat , net.Broadcast
local l_ps = pairs
local l_tCe = timer.Create
local l_pGAl = player.GetAll
local l_SREy = SafeRemoveEntity

l_ACSLFe( "cl_init.lua" )
l_ACSLFe( "shared.lua" )
l_ie( "shared.lua" )

l_uANSg( "Popcorn_Explosion" )

function ENT:Initialize()
	self:SetModel( self.Model )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:DrawShadow(false)
	local phys = self:GetPhysicsObject()
	if l_IVd( phys ) then
		phys:Wake()
	end
end

local break_sounds = {
	l_Sd("physics/cardboard/cardboard_box_impact_hard1.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard2.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard3.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard4.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard5.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard6.wav"),
	l_Sd("physics/cardboard/cardboard_box_impact_hard7.wav")
}
function ENT:GravGunPickupAllowed()
	return false
end
function ENT:PhysicsCollide(colData,collider)

	self.exploded = true

	local sound = break_sounds[l_mrm(1,l_tCt(break_sounds))]
	self:EmitSound(sound)
	local entid = self:EntIndex()
	l_nSt("Popcorn_Explosion")
		l_nWVr(self:GetPos())
		l_nWVr(colData.HitNormal)
		l_nWVr(colData.OurOldVelocity)
		l_nWFt(entid)
	l_nBt()
	l_tCe("kill_kt" .. entid,0.25,2,function ()
		for _,v in l_ps(l_pGAl()) do
			v:SendLua("timer.Destroy('kernel_timer" .. entid .. "')")
		end
	end)

	self.toRemove = true
end

function ENT:Think()
	if self.toRemove then
		l_SREy( self )
	end
end
