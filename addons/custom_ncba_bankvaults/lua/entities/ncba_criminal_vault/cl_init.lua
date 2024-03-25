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
	local pos = self:GetPos() + Vector(5,-5,-45)
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Right(), 0)
	cam.Start3D2D(pos + ang:Up() * 30.35, ang, 0.15)
		draw.RoundedBox( 5, -180, -425, 350, 250,Color(40,40,40,200) )
		draw.SimpleTextOutlined("Criminal", "bankFontCity", -5, -395, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		draw.SimpleTextOutlined("Bank Vault", "bankFontName", -5, -352.5, Color(0, 130, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
	cam.End3D2D()

	cam.Start3D2D(pos + ang:Up() * 30.35, ang, 0.15)
		local moneyW, moneyH = surface.GetTextSize( DarkRP.formatMoney(self:GetNWFloat("criminalmoneyStored")))
		local coolDownW, coolDownH = surface.GetTextSize( self:GetNWFloat("criminalcoolDown") .. "s")
		local robberytimeW, robberytimeH = surface.GetTextSize( self:GetNWFloat("criminalrobberytime") .. "s")
		draw.RoundedBox( 0, -110, -320, 215, 140,Color(40,40,40,200) )
		draw.SimpleTextOutlined("Money Stored ", "bankFont", -85, -300, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		draw.SimpleTextOutlined(DarkRP.formatMoney(self:GetNWFloat("criminalmoneyStored")), "bankFont", (moneyW /2) * -0.70, -275, Color(0, 200, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		if self:GetNWFloat("criminalbeingrobbed") != 0 then
			draw.SimpleTextOutlined("Payout Time", "bankFont", -76, -250, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
			draw.SimpleTextOutlined(self:GetNWFloat("criminalrobberytime") .. "s", "bankFont", (robberytimeW - robberytimeW) -30, -225, Color(0, 200, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		end
		if self:GetNWFloat("criminalcoolDown") != 0 then
			draw.SimpleTextOutlined("Raidable In", "bankFont", -70, -250, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
			draw.SimpleTextOutlined(self:GetNWFloat("criminalcoolDown") .. "s", "bankFont", (coolDownW-coolDownW) -40, -225, Color(212, 64, 64), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
		end
	cam.End3D2D()
end