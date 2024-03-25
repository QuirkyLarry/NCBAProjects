-- Localized Globals
local l_ie = include
local l_sGTID = surface.GetTextureID
local l_Vr = Vector
local l_Ae = Angle
local l_VeRd = VectorRand
local l_mRd = math.Rand
local l_IVd = IsValid
local l_nREy = net.ReadEntity
local l_PEr = ParticleEmitter
local l_LTWd = LocalToWorld
local l_nRFt = net.ReadFloat
local l_LPr = LocalPlayer
local l_gSTVr = gui.ScreenToVector
local l_nRe = net.Receive
local l_CTe = CurTime
local l_msn = math.sin
local l_ScrW, l_ScrH = ScrW , ScrH
local l_SDn = SoundDuration
local l_mCp = math.Clamp

l_ie("shared.lua")

SWEP.PrintName          = "Popcorn (Spammable)"
SWEP.Slot               = 1
SWEP.SlotPos            = 1
SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = false

SWEP.WepSelectIcon 		= l_sGTID( "vgui/entities/weapon_popcorn" )

local emitter = l_PEr(l_Vr(0,0,0))

function SWEP:GetViewModelPosition( pos , ang)
	pos,ang = l_LTWd(l_Vr(20,-10,-15),l_Ae(0,0,0),pos,ang)
	return pos, ang
end

local function kernel_init(particle, vel)
	particle:SetColor(255,255,255,255)
	particle:SetVelocity( vel or l_VeRd():GetNormalized() * 15)
	particle:SetGravity( l_Vr(0,0,-200) )
	particle:SetLifeTime(0)
	particle:SetDieTime(l_mRd(5,10))
	particle:SetStartSize(1)
	particle:SetEndSize(0)
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(0)
	particle:SetCollide(true)
	particle:SetBounce(0.25)
	particle:SetRoll(math.pi * l_mRd(0,1))
	particle:SetRollDelta(math.pi * l_mRd(-4,4))
end

function SWEP:Initialize()
end

l_nRe("Popcorn_Eat",function ()
	local ply = l_nREy()
	if not l_IVd(ply) then return end
	local size = l_nRFt()
	local attachid = ply:LookupAttachment("eyes")
	emitter:SetPos(l_LPr():GetPos())
	local angpos = ply:GetAttachment(attachid)
	local fwd
	local pos
	if (ply != l_LPr()) then
		fwd = (angpos.Ang:Forward() - angpos.Ang:Up()):GetNormalized()
		pos = angpos.Pos + fwd * 3
	else
		fwd = ply:GetAimVector():GetNormalized()
		pos = ply:GetShootPos() + l_gSTVr( l_ScrW()/2, l_ScrH()/4*3 )*10
	end
	for i = 1,size do
		if not l_IVd(ply) then return end
		local particle = emitter:Add( "particle/popcorn-kernel", pos )
		if particle then
			local dir = l_VeRd():GetNormalized()
			kernel_init(particle, ((fwd) + dir):GetNormalized() * l_mRd(0,40))
		end
	end
end)

l_nRe("Popcorn_Eat_Start",function ()
	local ply = l_nREy()
	ply.ChewScale = 1
	ply.ChewStart = l_CTe()
	ply.ChewDur = l_SDn("crisps/eat.wav")
end)