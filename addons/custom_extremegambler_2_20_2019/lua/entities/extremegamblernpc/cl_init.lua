include( "shared.lua" )

local fwidth = 1920
local fheight = 1080
local function scaleW(sw)
	return ScrW() * ((sw or 0) / fwidth)
end
local function scaleH(sh)
	return ScrH() * ((sh or 0) / fheight)
end

surface.CreateFont( "3D2D", {
	font = "Arial",
	extended = false,
	//size = scaleH(70),
	size = ScrH() * 0.065,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Buttons", {
	font = "Trebuchet18",
	extended = false,
	//size = scaleH(45),
	size = ScrH() * 0.04,
	weight = 100,
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
} )

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	local TextVec = pos + ang:Right() * -78 + ang:Up() * 1.5
	local angTable = string.Explode(" ", util.TypeToString(ang))
	if (LocalPlayer():GetPos():Distance( self:GetPos() ) < GetConVar("client_fps_modifier"):GetFloat()) then
	cam.Start3D2D(TextVec, ang, 0.11)
		draw.SimpleTextOutlined("EXTREME", "3D2D", 2, -30, Color(40, 40, 40, 200), 1, 1, 2, Color(0, 0, 0))
		draw.SimpleTextOutlined("Gambler", "3D2D", 2, 30, Color(40, 40, 40, 200), 1, 1, 2, Color(0, 0, 0))
	cam.End3D2D()
	end
--[[
	cam.Start3D2D(TextVec, Angle(tonumber(angTable[1]), 180 + tonumber(angTable[2]), tonumber(angTable[3])), 0.11)
		draw.SimpleTextOutlined("EXTREME", "3D2D", 2, -30, Color(40, 40, 40, 200), 1, 1, 2, Color(0, 0, 0))
		draw.SimpleTextOutlined("Gambler", "3D2D", 2, 30, Color(40, 40, 40, 200), 1, 1, 2, Color(0, 0, 0))
	cam.End3D2D()]]
end

net.Receive("ExtremeGamblerNPCUsed", function()
	local width, height

	local frame = vgui.Create("DFrame")
	frame.btnMaxim:SetVisible(false)
	frame.btnMinim:SetVisible(false)
	frame:ShowCloseButton(false)
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:SetSize(ScrW() * 0.25, ScrH() * 0.14)
	frame:Center()
	frame:MakePopup()
	frame.Paint = function(self, w, h)
		draw.RoundedBox(10, 0, 0, w, h, Color(40, 40, 40, 200)) // Main Frame
	end

	width, height = frame:GetSize()

	local gambleButton = vgui.Create("DButton", frame)
	gambleButton:SetSize(width * 0.8, height * 0.3)
	gambleButton:SetFont("Buttons")
	gambleButton:SetTextColor(Color(40, 40, 40))
	gambleButton:SetText("Gamble")
	gambleButton:SetPos(width * 0.1, height * 0.15)
	gambleButton.Paint = function(self, w, h)
		draw.RoundedBox(5, 0, 0, w, h, Color(255, 0, 130, 200))
	end

	gambleButton.DoClick = function()
		net.Start("GambleButtonClicked") net.SendToServer()
		frame:Close()
	end

	local closeButton = vgui.Create("DButton",frame)
	closeButton:SetSize(width * 0.8, height * 0.3)
	closeButton:SetFont("Buttons")
	closeButton:SetTextColor(Color(40, 40, 40))
	closeButton:SetText("Close")
	closeButton:SetPos(width * 0.1, height * 0.55)
	closeButton.Paint = function(self, w, h)
		draw.RoundedBox(5, 0, 0, w, h, Color(255, 0, 130, 200))
	end
	closeButton.DoClick = function()
		frame:Close()
	end
end)
--[[
net.Receive("GambleCompleteLost", function()
	chat.AddText(Color(255, 0, 130), "Extreme Gambler: ", Color(255, 255, 255), "Looks like you lost.. Try again once you feel your luck is better.", Color(255, 183, 0), "*Yoink*", Color(255, 255, 255), " Thanks for the cash!")
end)
net.Receive("GambleCompleteWon", function()
	--chat.AddText(Color(255, 0, 130), "Extreme Gambler: ", Color(255, 255, 255), "Looks like you lost.. Try again once you feel your luck is better.", Color(255, 183, 0), "*Yoink*", Color(255, 255, 255), " Thanks for the cash!")
	--local name =
	PrintMessage(HUD_PRINTTALK, "I'm new here.")
end)
net.Receive("CantAffordGamble", function()
	chat.AddText(Color(255, 0, 130), "Extreme Gambler: ", Color(255, 255, 255), "Sorry, I don't gamble with people who can barely afford a car.")
end)--]]