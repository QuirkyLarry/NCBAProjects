-- Local Globals
local l_ie = include
local l_Vr = Vector
local l_VRd = VectorRand
local l_mRd = math.Rand
local l_LPr = LocalPlayer
local l_IVd = IsValid
local l_tCe = timer.Create
local l_tRe = timer.Remove
local l_PEr = ParticleEmitter
local l_nRe = net.Receive
local l_nRVr = net.ReadVector
local l_nRFt = net.ReadFloat

l_ie("shared.lua")
local emitter = l_PEr(l_Vr(0,0,0))

local function kernel_init(particle, vel)
	particle:SetColor(255,255,255,255)
	particle:SetVelocity( vel or l_VRd():GetNormalized() * 15)
	particle:SetGravity( l_Vr(0,0,-200) )
	particle:SetLifeTime(0)
	particle:SetDieTime(l_mRd(5,10))
	particle:SetStartSize(2)
	particle:SetEndSize(0)
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(0)
	particle:SetCollide(true)
	particle:SetBounce(0.25)
	particle:SetRoll(math.pi*l_mRd(0,1))
	particle:SetRollDelta(math.pi*l_mRd(-10,10))
end

function ENT:Initialize()
	emitter:SetPos(l_LPr():GetPos())

	if l_IVd(self) then
		local kt = "kernel_timer_" .. self:EntIndex()
		l_tCe(kt,0.01,0,function()
			if !emitter then emitter = l_PEr(l_LPr():GetPos()) end
			if !l_IVd(self) then l_tRe(kt) end
			if l_mRd(0,1) < 0.33 then
				local particle = emitter:Add( "particle/popcorn-kernel", self:GetPos() + l_VRd():GetNormalized() * 4 )
				if particle then
					kernel_init(particle)
				end
			end
		end)
	end

	l_nRe("Popcorn_Explosion",function () 
		if !self or !emitter then return end
		local pos = l_nRVr()
		local norm = l_nRVr()
		local bucketvel = l_nRVr()
		local entid = l_nRFt()
		l_tRe("kernel_timer_" .. entid)
		for i = 1, 150 do
			local particle = emitter:Add( "particle/popcorn-kernel", pos )
			if particle then
				local dir = l_VRd():GetNormalized()
				kernel_init(particle, ((-norm)+dir):GetNormalized() * l_mRd(0,200) + bucketvel * 0.5 )
			end
		end
	end)
end
