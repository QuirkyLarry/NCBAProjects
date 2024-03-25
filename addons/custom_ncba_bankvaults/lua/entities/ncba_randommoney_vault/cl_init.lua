include("shared.lua")

surface.CreateFont("bankFontCity", {
	font = "Arial",
	size = 60,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont("bankFontName", {
	font = "Arial",
	size = 50,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont("bankFont", {
	font = "Arial",
	size = 30,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

function ENT:Initialize()

end

function ENT:Draw()
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) > 580000 then return end
	self:DrawModel()
	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) > 80000 then return end
	local pos = self:GetPos()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)
	if self:GetModel() == "models/props_lab/partsbin01.mdl" and self:GetModelScale() == 2.5 then
		pos = pos + Vector(0,15,-45)
		cam.Start3D2D(pos , ang, 0.15)
			local moneyW, moneyH = surface.GetTextSize( DarkRP.formatMoney(self:GetNWFloat("moneyStored")))
			--draw.RoundedBox( 0, -70, -320, 150, 100,Color(40,40,40,200) )
			draw.SimpleTextOutlined(DarkRP.formatMoney(self:GetNWFloat("moneyStored")), "bankFont", (moneyW -moneyW ) + -50, -305, Color(0, 200, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		cam.End3D2D()
	elseif self:GetModel() == "models/player/spike/briefcase.mdl" then
		pos = pos + Vector(0,0,-30)
		cam.Start3D2D(pos , ang, 0.15)
			local moneyW, moneyH = surface.GetTextSize( DarkRP.formatMoney(self:GetNWFloat("moneyStored")))
			--draw.RoundedBox( 0, -70, -320, 150, 100,Color(40,40,40,200) )
			draw.SimpleTextOutlined(DarkRP.formatMoney(self:GetNWFloat("moneyStored")), "bankFont", (moneyW -moneyW ) + -50, -305, Color(0, 200, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		cam.End3D2D()
	elseif self:GetModel() == "models/player/spike/pile.mdl" then
		pos = pos + Vector(0,0,-20)
		cam.Start3D2D(pos , ang, 0.15)
			local moneyW, moneyH = surface.GetTextSize( DarkRP.formatMoney(self:GetNWFloat("moneyStored")))
			--draw.RoundedBox( 0, -70, -320, 150, 100,Color(40,40,40,200) )
			draw.SimpleTextOutlined(DarkRP.formatMoney(self:GetNWFloat("moneyStored")), "bankFont", (moneyW -moneyW ) + -50, -305, Color(0, 200, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		cam.End3D2D()
	end
end