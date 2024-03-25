local l_ie = include
local l_CT = CurTime
local l_Cr = Color
local l_mA = math.Approach
local l_Vr = Vector
local l_FT = FrameTime
local l_LP = LocalPlayer

l_ie("shared.lua")

local matBeam = Material( "cable/cable" )

function ENT:Initialize()
	self.Size = 0
	self.MainStart = self:GetPos()
	self.MainEnd = self:GetEndPos()
	self.dAng = (self.MainEnd - self.MainStart):Angle()
	self.speed = 10000
	self.startTime = l_CT()
	self.endTime = l_CT() + self.speed
	self.dt = -1
end

function ENT:Think()
	self:SetRenderBoundsWS( self:GetEndPos(), self:GetPos(), l_Vr() * 8 )
	self.Size = l_mA( self.Size, 1, 10 * l_FT() )
end

function ENT:DrawMainBeam( StartPos, EndPos, dt, dist )
	local TexOffset = 0
	local ca = l_Cr(255,255,255,255)
	EndPos = StartPos + (self.dAng * ((1 - dt) * dist))
	local sqEndPos = EndPos * EndPos
	-- Beam effect
	render.SetMaterial( matBeam )
	render.DrawBeam( EndPos, StartPos,2,TexOffset * -0.4, TexOffset * -0.4 + StartPos:DistToSqr(sqEndPos) / 256, ca )
end

function ENT:Draw()
	local Owner = self:GetOwner()
	if (!Owner || Owner == NULL) then return end
	local StartPos = self:GetPos()
	local EndPos = self:GetEndPos()
	local ViewModel	= Owner == l_LP()
	if (EndPos == l_Vr(0,0,0)) then return end
	if ( ViewModel ) then
		local vm = Owner:GetViewModel()
		if (!vm || vm == NULL) then return end
		local attachment = vm:GetAttachment( 1 )
		if attachment then
			StartPos = attachment.Pos
		end
	else
		local vm = Owner:GetActiveWeapon()
		if (!vm || vm == NULL) then return end
		local attachment = vm:GetAttachment( 1 )
		if attachment then
			StartPos = attachment.Pos
		end
	end
	local TexOffset = l_CT() * -2
	local drawDistanceSqr = EndPos:DistToSqr( StartPos ) * self.Size
	local et = (self.startTime + (drawDistanceSqr / self.speed))
	if	(self.dt != 0) then
		self.dt = (et - l_CT()) / (et - self.startTime)
	end
	if	(self.dt < 0) then
		self.dt = 0
	end
	self.dAng = (EndPos - StartPos):Angle():Forward()

	gbAngle = (EndPos - StartPos):Angle()

	local Normal 	= gbAngle:Forward()

	self:DrawMainBeam( StartPos, StartPos + Normal * drawDistanceSqr, self.dt, drawDistanceSqr )
end

/*---------------------------------------------------------
   Name: IsTranslucent
---------------------------------------------------------*/
function ENT:IsTranslucent()
	return true
end