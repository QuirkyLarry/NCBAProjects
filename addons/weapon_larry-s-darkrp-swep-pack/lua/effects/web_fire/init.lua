local l_M = Material
local l_mR = math.Rand
local l_CT = CurTime
local l_mM = math.Max
local l_Cr = Color
local l_rSM = render.SetMaterial
local l_rDB = render.DrawBeam
EFFECT.Mat = l_M( "cable/xbeam" )

function EFFECT:Init( data )
	self.StartPos = data:GetStart()
	self.EndPos = data:GetOrigin()
	self.Dir = self.EndPos - self.StartPos
	self.fDelta = 3
	self.Entity:SetRenderBoundsWS(self.StartPos,self.EndPos)
	local effectdata = EffectData()
	effectdata:SetOrigin( self.EndPos + self.Dir:GetNormalized() * -2 )
	self.TracerTime = l_mR( 0.2, 0.3 )
	self.Length = l_mR( 0.1, 0.15 )
	self.DieTime = l_CT() + self.TracerTime
end

function EFFECT:Think( )
	if ( l_CT() > self.DieTime ) then
		return false
	end
	return true
end

function EFFECT:Render( )
	self.fDelta = l_mM( self.fDelta - 0.5, 0)
	l_rSM( self.Mat )
	l_rDB( self.EndPos,self.StartPos,2 + self.fDelta * 16,0,0,l_Cr( 0, 255, 255))
end