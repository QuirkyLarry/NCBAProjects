include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH


function ENT:Draw()
	self:DrawModel()
	self:SetMaterial( "models/effects/vol_light001" )
	self:DrawShadow(false)
end

local logo = Material( "materials/ncba_content/logo/ncbalogorecyclingplant.png", "smooth" )
local width = logo:Width() * 3
local height = logo:Height() * 3

local cutOff = 1000000000000
function ENT:DrawTranslucent()
	local dis = (LocalPlayer():GetPos():DistToSqr(self:GetPos()))

	if dis < cutOff then

		local Pos = self:GetPos() + Vector(0,0,15) --  + math.sin(CurTime()*2)*25
		local Ang = self:GetAngles()
			
		Ang:RotateAroundAxis(Ang:Right(), 270)
		Ang:RotateAroundAxis(Ang:Up(), 90)
		Ang:RotateAroundAxis(Ang:Right(), CurTime() * 30)

		cam.Start3D2D(Pos, Ang, 0.090)
			surface.SetMaterial( logo )
			surface.SetDrawColor( Color(255,255,255,255*math.Clamp(1-dis/800000,0,1)*1.5 ))
			surface.DrawTexturedRect( 0 - (width/2), -100 - height, width, height )	
		cam.End3D2D()

		Ang:RotateAroundAxis(Ang:Right(), 180)
		Ang:RotateAroundAxis(Ang:Up(), 0)
		
		cam.Start3D2D(Pos - Vector(-0.4,0,0), Ang, 0.090)
			surface.SetMaterial( logo )
			surface.SetDrawColor( Color(255,255,255,255*math.Clamp(1-dis/800000,0,1)*1.5 ))
			surface.DrawTexturedRect( 0 - (width/2), -100 - height, width, height )		
		cam.End3D2D()
	end
end