-- Localized Globals
local l_Vr = Vector
local l_Ae = Angle
local l_CTe = CurTime
local l_IVd = IsValid
local l_Cr = Color
local l_ps = pairs
local l_ips = ipairs
local l_ACSLFe = AddCSLuaFile
local l_tit = table.insert
local l_rSELg = (CLIENT and render.SuppressEngineLighting or NULL)
local l_rSCM = (CLIENT and render.SetColorModulation or NULL)
local l_rSBd = (CLIENT and render.SetBlend or NULL)
local l_rSMl = (CLIENT and render.SetMaterial or NULL)
local l_rDSe = (CLIENT and render.DrawSprite or NULL)
local l_Mx = Matrix
local l_cS3D2D = (CLIENT and cam.Start3D2D or NULL)
local l_cE3D2D = (CLIENT and cam.End3D2D or NULL)
local l_tSe = timer.Simple
local l_cAd = (SERVER and cleanup.Add or NULL)
local l_VeRd = VectorRand
local l_eCe = ents.Create
local l_sfd = string.find
local l_uTLe = util.TraceLine
local l_fEs = file.Exists
local l_CMl = ClientsideModel

if SERVER then l_ACSLFe( "shared.lua" ) end

SWEP.DrawCrosshair = true
SWEP.Weight = 5
SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.Slot = 1
SWEP.Purpose = "GIVING THE POWER OF CHRIST TO PEOPLE"
SWEP.AutoSwitchTo = true
SWEP.Contact = ""
SWEP.Author = "ARitz base code, modified by Nazi Raccoon"
SWEP.FiresUnderwater = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.ShowViewModel = true
SWEP.UseHands = true
SWEP.IronSightsPos = l_Vr(4.599, 0, -0.201)
SWEP.IronSightsAng = l_Vr(0, 0, 0)
SWEP.ShowWorldModel = false
SWEP.WElements = {
	["bible"] = { type = "Model", model = "models/toybox/bible.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = l_Vr(4.675, 0.518, 0.518), angle = l_Ae(-8.183, -180, -75.974), size = l_Vr(0.5, 0.5, 0.5), color = l_Cr(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.VElements = {
	["bible"] = { type = "Model", model = "models/toybox/bible.mdl", bone = "ValveBiped.Tip", rel = "", pos = l_Vr(2.596, 8.831, 0), angle = l_Ae(132.078, 80.649, 5.843), size = l_Vr(0.885, 0.885, 0.885), color = l_Cr(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.ViewModelBoneMods = {
	["ValveBiped.Tip"] = { scale = l_Vr(0.009, 0.009, 0.009), pos = l_Vr(0, 0, 0), angle = l_Ae(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = l_Vr(0.009, 0.009, 0.009), pos = l_Vr(0, 0, 0), angle = l_Ae(0, 0, 0) }
}
SWEP.SlotPos = 0
SWEP.Instructions = "LMB to slap, RMB to throw, R for sound"
SWEP.AutoSwitchFrom = false
SWEP.base = "weapon_base"
SWEP.Category = "Larry's DarkRP Sweps"
SWEP.DrawAmmo = true
SWEP.PrintName = "The Bible"
SWEP.Primary.Recoil				= 0
SWEP.Primary.Damage				= 1
SWEP.Primary.NumShots			= 0
SWEP.Primary.Cone				= 0
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic   		= true
SWEP.Primary.Ammo         		= "none"
SWEP.Secondary.Recoil			= 0
SWEP.Secondary.Damage			= 0
SWEP.Secondary.NumShots			= 0
SWEP.Secondary.Cone		  		= 0
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic   		= true
SWEP.Secondary.Ammo         	= "none"

function SWEP:Initialize()
	self.Idle = true
	self.IdleDelay = l_CTe() + 1
	self.timer1 = 0
	self.active1 = false
	self:SetWeaponHoldType( self.HoldType )
		if CLIENT then
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements)
		self:CreateModels(self.WElements)
		if l_IVd(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if l_IVd(vm) then
				self:ResetBonePositions(vm)
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(l_Cr(255,255,255,255))
				else
					vm:SetColor(l_Cr(255,255,255,1))
					vm:SetMaterial("Debug/hsv")
				end
			end
		end
	end

end

function SWEP:Holster()
	if CLIENT and l_IVd(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if l_IVd(vm) then
			self:ResetBonePositions(vm)
		end
	end
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then
	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		local vm = self.Owner:GetViewModel()
		if !l_IVd(vm) then return end
		if (!self.VElements) then return end
		self:UpdateBonePositions(vm)
		if (!self.vRenderOrder) then
			self.vRenderOrder = {}
			for k, v in l_ps( self.VElements ) do
				if (v.type == "Model") then
					l_tit(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					l_tit(self.vRenderOrder, k)
				end
			end
		end

		for k, name in l_ips( self.vRenderOrder ) do
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			if (!v.bone) then continue end
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			if (!pos) then continue end
			if (v.type == "Model" and l_IVd(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				local matrix = l_Mx()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )

				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end

				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				if (v.bodygroup) then
					for k, v in l_ps( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end


				if (v.surpresslightning) then
					l_rSELg(true)
				end


				l_rSCM(v.color.r/255, v.color.g/255, v.color.b/255)
				l_rSBd(v.color.a/255)
				model:DrawModel()
				l_rSBd(1)
				l_rSCM(1, 1, 1)


				if (v.surpresslightning) then
					l_rSELg(false)
				end


			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				l_rSMl(sprite)
				l_rDSe(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				l_cS3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				l_cE3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in l_ps( self.WElements ) do
				if (v.type == "Model") then
					l_tit(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					l_tit(self.wRenderOrder, k)
				end
			end

		end
		
		if (l_IVd(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in l_ps( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and l_IVd(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				local matrix = l_Mx()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in l_ps( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					l_rSELg(true)
				end
				
				l_rSCM(v.color.r/255, v.color.g/255, v.color.b/255)
				l_rSBd(v.color.a/255)
				model:DrawModel()
				l_rSBd(1)
				l_rSCM(1, 1, 1)
				
				if (v.surpresslightning) then
					l_rSELg(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				l_rSMl(sprite)
				l_rDSe(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				l_cS3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				l_cE3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			local v = basetab[tab.rel]
			if (!v) then return end
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
		else
			bone = ent:LookupBone(bone_override or tab.bone)
			if (!bone) then return end
			pos, ang = l_Vr(0,0,0), l_Ae(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			if (l_IVd(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r
			end
		end
		return pos, ang
	end

	function SWEP:CreateModels( tab )
		if (!tab) then return end
		for k, v in l_ps( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!l_IVd(v.modelEnt) or v.createdModel != v.model) and 
					l_sfd(v.model, ".mdl") and l_fEs (v.model, "GAME") ) then
				
				v.modelEnt = l_CMl(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (l_IVd(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and l_fEs ("materials/"..v.sprite..".vmt", "GAME")) then
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in l_ps( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end
				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
			end
		end
	end
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		if self.ViewModelBoneMods then
			if (!vm:GetBoneCount()) then return end
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i = 0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = l_Vr(1,1,1),
							pos = l_Vr(0,0,0),
							angle = l_Ae(0,0,0)
						}
					end
				end
				loopthrough = allbones
			end

			for k, v in l_ps( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				local s = l_Vr(v.scale.x,v.scale.y,v.scale.z)
				local p = l_Vr(v.pos.x,v.pos.y,v.pos.z)
				local ms = l_Vr(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while (cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				s = s * ms
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
	end
	function SWEP:ResetBonePositions(vm)
		if (!vm:GetBoneCount()) then return end
		for i = 0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, l_Vr(1, 1, 1) )
			vm:ManipulateBoneAngles( i, l_Ae(0, 0, 0) )
			vm:ManipulateBonePosition( i, l_Vr(0, 0, 0) )
		end
	end
	function table.FullCopy( tab )
		if (!tab) then return nil end
		local res = {}
		for k, v in l_ps( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = l_Vr(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = l_Ae(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		return res
	end
end

function SWEP:PrimaryAttack()
	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * 100 )
	tr.filter = self.Owner
	tr.mask = MASK_SHOT
	local trace = l_uTLe( tr )

	self:SetNextPrimaryFire(l_CTe() + .8)
	if ( trace.Hit ) then

		if trace.Entity:IsPlayer() or l_sfd(trace.Entity:GetClass(),"npc") or l_sfd(trace.Entity:GetClass(),"prop_ragdoll") then
			self:SendWeaponAnim(ACT_VM_HITCENTER)
			self.Owner:SetAnimation( PLAYER_ATTACK1 );
			bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = l_Vr(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = self.Primary.Damage
			self.Owner:FireBullets(bullet)
		else
			self:SendWeaponAnim(ACT_VM_HITCENTER)
			self.Owner:SetAnimation( PLAYER_ATTACK1 );
			bullet = {}
			bullet.Num = 1
			bullet.Src = self.Owner:GetShootPos()
			bullet.Dir = self.Owner:GetAimVector()
			bullet.Spread = l_Vr(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = self.Primary.Damage
			self.Owner:FireBullets(bullet)
			self:EmitSound("Cardboard.ImpactSoft")
		end
	else
		self:EmitSound("Weapon_Crowbar.Single")
		self:SendWeaponAnim(ACT_VM_MISSCENTER)
	end
	end

function SWEP:SecondaryAttack()
	self:TakePrimaryAmmo(self.Secondary.TakeAmmo)
	self:SetNextPrimaryFire( l_CTe() + .3 )
	self:SetNextSecondaryFire( l_CTe() + 5 )
	self:EmitSound("weapons/powerofchrist.wav")
	self:SendWeaponAnim(ACT_VM_MISSCENTER)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	l_tSe(.1, function()
		self:Throw_Attack (self.Secondary.Model, self.Primary.Sound, self.Secondary.AngVelocity)
	end)
end

function SWEP:Throw_Attack (Model, Sound, Angle)
	local tr = self.Owner:GetEyeTrace()
	if (!SERVER) then return end
	local ent = l_eCe("sent_bible_thrown")
	ent:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector() * 16))
	ent:SetAngles (self.Owner:EyeAngles())
	ent:Spawn()
	local phys = ent:GetPhysicsObject()
	local shot_length = (tr.HitPos:LengthSqr() * tr.HitPos:LengthSqr())
	local velocity = self.Owner:GetAimVector()
	velocity = velocity * 55000
	velocity = velocity + ( l_VeRd() * 200 )
	phys:ApplyForceCenter( velocity )
	phys:AddAngleVelocity( l_VeRd() * 1000 )
	self.Owner:StripWeapon("bible")

	local function deletebible()
			ent:Remove();
		end
		l_tSe( 8, deletebible );
		l_cAd( self.Owner, "props", ent )
end

function SWEP:Think()
	if self.Idle and self.IdleDelay <= l_CTe() then
		self:SendWeaponAnim( ACT_VM_IDLE )
		self.Idle = false
	end
end

function SWEP:Reload()
self:EmitSound("weapons/powerofchrist.wav")
end