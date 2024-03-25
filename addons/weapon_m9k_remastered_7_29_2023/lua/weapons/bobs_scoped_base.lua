-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
--[[ Dev Notes:

	It is recommended to look at the Default variables assigned to every SWEP as some variables may not be documented.


	There is no more bob here. This base is 100% custom.

	The following has to be put into the SWEP for the recoil to function properly. This caches the Weapon spread so that it can be restored when un-zooming.
	> SWEP.Primary.SpreadBefore = SWEP.Primary.Spread

	SWEP.IsBoltAction Can be set to true to indicate that the sniper rifle is a bolt-action sniper rifle. If unset it will assume that it is a non-manual cycling sniper rifle. (Nice wording bro!)

	SWEP.ScopeScale		- Integer. Defines how large the scope overlay is.
	SWEP.ReticleScale	- Integer. Defines how large (a part of) the scope overlay is.


	SWEP.InitializeHooked2 - A function can be assigned to this that will run on SWEP:InitializeHooked. (CLIENT ONLY)
	SWEP.ResetInternalVarsHooked2 -- Hook for ResetInternalVarsHooked (CLIENT ONLY)

	SWEP.PrimaryAttackHooked2 - Hook for PrimaryAttackHooked (SERVER)
	SWEP.DeployHooked2 - Hook for DeployHooked (SERVER)

	-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

	The following is NOT required! But recommended so that other players can hear the sounds as well!


	SWEP.tBoltDynamic Contains sound sequence data for cycling a new round. Example:


	Taken from m9k_aw50.lua:

	SWEP.iBoltTotalTime = 0.55 + 0.45 + 1 -- Total time it takes before the weapon may fire again (includes animation time)
	SWEP.tBoltDynamic = {
		{ -- First sound
			sSound = "weapons/aw50/m24_boltback.mp3",
			iDelay = 0.55 -- Delay before playing the sound.
		},
		{ -- Second sound
			sSound = "weapons/aw50/m24_boltforward.mp3",
			iDelay = 0.55 + 0.45 -- Add the delay of previous sounds to it.
		}
	}

	-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

	SWEP.ScopeStages - How many scope stages the sniper rifle has. If it should only have one, do not set it in the SWEP file as the default is 1. MAXIMUM IS 3 STAGES. DO NOT GO ABOVE.


	SWEP.ScopeType - What type of scope the Weapon should have.
	> Possible options:
		gdcw_parabolicsight - Default
		gdcw_aimpoint
		gdcw_scopesight
		gdcw_svdsight
		gdcw_acog
		rocketscope


	Useful Information:

	- The spread when zooming in is: 0.00001 - Bullets should NEVER miss when zooming in.
	- IronSights are disabled in this base as they are replaced with scope logic.

]]
-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
local util_AddNetworkString = util.AddNetworkString
local _net = net
local  _IsValid = IsValid

SWEP.Base = "bobs_gun_base"
SWEP.Slot = 4

SWEP.Primary.SoundVolume = 100 -- PEW
SWEP.DynamicLightScale = 3 -- That's a big flash!

SWEP.ScopeType = "gdcw_parabolicsight" -- Default
SWEP.IsScoping = false
SWEP.ScopeStage = 0
SWEP.ScopeStages = 1 -- Default

SWEP.Secondary.Automatic = false -- We don't want scope spam!

-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
-- Optimization
-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

local sTag = "MMM_M9kr_Weapons_Snipers"

-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
-- SERVER
-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

if SERVER then

	util_AddNetworkString(sTag)
	util_AddNetworkString(sTag .. "_Bolt")


	local fUpdateWeapon = function(self)

		-- Notify Clients of change

		_net.Start(sTag)
			_net.WriteEntity(self)
			_net.WriteBool(self.IsScoping)
			_net.WriteInt(self.ScopeStage,6)
		_net.Broadcast()


		-- When we are scoped we should not have any bullet spread!!
		self.Primary.Spread = self.IsScoping and 0.00001 or self.Primary.SpreadBefore -- We don't use 0 spread here as that causes problems with FireBullets' prediction.

	end


	function SWEP:OnRemove()
		if self.IsScoping and _IsValid(self:GetOwner()) then
			self:GetOwner():SetFOV(0,0)
		end
	end


	function SWEP:DeployHooked()

		self.ScopeViewEntity = self:GetOwner():GetViewEntity()


		if self.DeployHooked2 then
			self:DeployHooked2()
		end
	end


	function SWEP:PrimaryAttackHooked()

		if self.IsBoltAction and self.tBoltDynamic then -- It's a bolt action, so network a dynamic sound routine!


			self.ScopeRestore = nil
			self.ScopeRestoreWhen = nil


			-- Un-scope if we are scoped!

			if self.IsScoping then
				timer.Simple(0.1, function()
					if _IsValid(self:GetOwner()) then
						self:GetOwner():SetFOV(0,0)
					end

					self.IsScoping = false
					self.ScopeStage = 0

					self.InScopingLast = false
					self.ScopeStageLast = 0


					fUpdateWeapon(self)
				end)
			end


			_net.Start(sTag .. "_Bolt")
				_net.WriteEntity(self)
			_net.Broadcast()

		end

		self._CanReload = true
		if self.PrimaryAttackHooked2 then
			self:PrimaryAttackHooked2()
		end

	end


	function SWEP:SecondaryAttack()
		if not IsFirstTimePredicted() or not self._CanReload or (_IsValid(self:GetOwner()) and self:GetOwner():GetViewEntity() ~= self:GetOwner()) or (self.IsBoltAction and (self:GetNextPrimaryFire() + 0.2) > CurTime()) then return end -- What a mess. Offset: 0.2 is required!
	end


	function SWEP:ReloadHooked()

		return false

	end


	function SWEP:ThinkHooked()
		if not _IsValid(self:GetOwner()) then return end


		if self.NextReloadTime and not self:GetOwner():KeyDown(IN_RELOAD) then -- Reset the reload timer when they stop pressing the reload key!
			self.NextReloadTime = nil
		end



		local eView = self:GetOwner():GetViewEntity()

		if self.ScopeViewEntity ~= eView and eView ~= self:GetOwner() then -- Make sure they are not scoped when they changed their view entity and its not them!
			self:ResetInternalVarsHooked()

			fUpdateWeapon(self)
		end

		self.ScopeViewEntity = eView -- Update cache



		if self.ScopeRestore and CurTime() > self.ScopeRestoreWhen then -- Restore scope stage after cycling a new round (Bolt-action only)

			self.IsScoping = true
			self.ScopeStage = self.ScopeRestore
			self.ScopeStageLast = self.ScopeStage -- Has to be set, very important!


			if _IsValid(self:GetOwner()) then
				self:GetOwner():SetFOV((self.ScopeStage == 1 and 50) or (self.ScopeStage == 2 and 25) or (self.ScopeStage == 3 and 10) or 0,0.1)
			end


			fUpdateWeapon(self)


			self.ScopeRestore = nil
			self.ScopeRestoreWhen = nil

		end


		self.IsScoping = self._CanReload and self:GetOwner():KeyDown(IN_ATTACK2)
		self.ScopeStage = (self._CanReload and self.IsScoping and self.ScopeStages) or 0 -- If we are not making use of the toggle then the zoom is always maxed when zoomed in


		if self.IsScoping ~= self.InScopingLast or self.ScopeStage ~= self.ScopeStageLast then -- Update zoom state

			self.ScopeStageLast = self.ScopeStage
			self.InScopingLast = self.IsScoping


			if _IsValid(self:GetOwner()) then
				self:GetOwner():SetFOV((self.ScopeStage == 1 and 50) or (self.ScopeStage == 2 and 25) or (self.ScopeStage == 3 and 10) or 0,0.1)
			end


			fUpdateWeapon(self)

		end
	end


	function SWEP:ResetInternalVarsHooked()
		if _IsValid(self:GetOwner()) then
			self:GetOwner():SetFOV(0,0)

			self.ScopeViewEntity = self:GetOwner():GetViewEntity()
		end

		self.IsScoping = false
		self.ScopeStage = 0

		self.InScopingLast = false
		self.ScopeStageLast = 0

		self.ScopeRestore = nil
		self.ScopeRestoreWhen = nil

		self.NextReloadTime = nil

		fUpdateWeapon(self)
	end
end

-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
-- CLIENT
-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

if CLIENT then


	-- Define all the different sights

	local texture_Parabolic		= surface.GetTextureID("scope/gdcw_parabolicsight")
	local texture_Aimpoint		= surface.GetTextureID("scope/aimpoint")
	local texture_ClosedSight	= surface.GetTextureID("scope/gdcw_closedsight")
	local texture_ScopeSight	= surface.GetTextureID("scope/gdcw_scopesight")
	local texture_SVDSight		= surface.GetTextureID("scope/gdcw_svdsight")
	local texture_ACOG1			= surface.GetTextureID("scope/gdcw_closedsight")
	local texture_ACOG2			= surface.GetTextureID("scope/gdcw_acogchevron")
	local texture_ACOG3			= surface.GetTextureID("scope/gdcw_acogcross")
	local texture_rocketscope	= surface.GetTextureID("scope/rocketscope")


	local tScopeTypes = {
		["gdcw_parabolicsight"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_Parabolic)
			surface.DrawTexturedRect(self.LensTable.x,self.LensTable.y,self.LensTable.w,self.LensTable.h)
		end,
		["gdcw_aimpoint"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_Aimpoint)
			surface.DrawTexturedRect(self.ReticleTable.x,self.ReticleTable.y,self.ReticleTable.w,self.ReticleTable.h)

			surface.SetTexture(texture_ClosedSight)
			surface.DrawTexturedRect(self.LensTable.x,self.LensTable.y,self.LensTable.w,self.LensTable.h)
		end,
		["gdcw_scopesight"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_ScopeSight)
			surface.DrawTexturedRect(self.LensTable.x,self.LensTable.y,self.LensTable.w,self.LensTable.h)
		end,
		["gdcw_svdsight"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_SVDSight)
			surface.DrawTexturedRect(self.LensTable.x,self.LensTable.y,self.LensTable.w,self.LensTable.h)
		end,
		["gdcw_acog"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_ACOG1)
			surface.DrawTexturedRect(self.LensTable.x,self.LensTable.y,self.LensTable.w,self.LensTable.h)

			surface.SetTexture(texture_ACOG2)
			surface.DrawTexturedRect(self.ReticleTable.x,self.ReticleTable.y,self.ReticleTable.w,self.ReticleTable.h)

			surface.SetTexture(texture_ACOG3)
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
		end,
		["rocketscope"] = function(self)
			surface.SetDrawColor(0,0,0,255)
			surface.SetTexture(texture_rocketscope)
			surface.DrawTexturedRect(self.LensTable.x - 1,self.LensTable.y,self.LensTable.w,self.LensTable.h)
		end
	}


	_net.Receive(sTag,function()
		local eWep = _net.ReadEntity()
		if not _IsValid(eWep) or not eWep._IsM9kRemasteredBased then return end


		eWep.IsScoping = _net.ReadBool()

		eWep.ScoeStageLast = eWep.ScopeStage
		eWep.ScopeStage = _net.ReadInt(6)


		eWep.Primary.Spread = eWep.IsScoping and 0.00001 or eWep.Primary.SpreadBefore


		if eWep.ScopeStage ~= eWep.ScoeStageLast then -- Required to fix a bug when switching ViewEntities.
			eWep.Owner:EmitSound("weapons/zoom.wav",70)
		end


		if not eWep.IsScoping then
			eWep:ResetInternalVarsHooked()
		end
	end)


	_net.Receive(sTag .. "_Bolt",function()
		local eWep = _net.ReadEntity()
		if not _IsValid(eWep) or not eWep._IsM9kRemasteredBased then return end

		if not eWep.IsBoltAction or not eWep.tBoltDynamic then return end


		local iStart = CurTime()
		local tPlayed = {}


		eWep.DoBolt = true


		local sStr = sTag .. "_Bolt_" .. eWep.OurIndex


		hook.Add("Tick",sStr,function() -- The fact I have to do this is just sad. Improvising a Think here is.. needed


			-- This hook gets removed as soon as the weapon / owner becomes invalid or the round cycle finished / was canceled


			if eWep.DoBolt and not eWep.IsReloading and _IsValid(eWep) and (eWep.Owner and _IsValid(eWep.Owner)) then

				local iPassed = CurTime() - iStart


				for k,v in ipairs(eWep.tBoltDynamic) do

					if tPlayed[k] then -- We already played that one
						goto continued
					end


					if iPassed > v.iDelay then


						eWep.Owner:EmitSound(v.sSound,eWep.iVolume or 70,math.random(95,105),1,CHAN_ITEM) -- Random pitch = Better


						tPlayed[k] = true


						if k == #eWep.tBoltDynamic then
							hook.Remove("Tick",sStr)
						end
					end


					::continued::

				end


				return

			end

			hook.Remove("Tick",sStr)

		end)
	end)


	function SWEP:InitializeHooked()

		local iScreenWidth = ScrW()
		local iScreenHeight = ScrH()


		-- The way these tables are defined needs to be optimized at one point. It's just bad.

		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight * self.ScopeScale
		self.ScopeTable.x1 = 0.5 * (iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5 * (iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5 * (iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5 * (iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1) * self.ScopeScale
		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5 * iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5 * iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5 * iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5 * iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3
		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2 * self.ScopeTable.l
		self.LensTable.h = 2 * self.ScopeTable.l
		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579 / self.ReticleScale
		self.ReticleTable.x = (iScreenWidth / 2) - ((iScreenHeight / self.ReticleTable.hdivider) / 2)
		self.ReticleTable.y = (iScreenHeight / 2) - ((iScreenHeight / self.ReticleTable.hdivider) / 2)
		self.ReticleTable.w = iScreenHeight / self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight / self.ReticleTable.hdivider


		if self.InitializeHooked2 then
			self:InitializeHooked2()
		end
	end


	function SWEP:AdjustMouseSensitivity()
		return (self.ScopeStage == 0 and 1) or (self.ScopeStage == 1 and 0.75) or (self.ScopeStage == 2 and 0.35) or (self.ScopeStage == 3 and 0.1)
	end


	function SWEP:ResetInternalVarsHooked()

		if _IsValid(self:GetOwner()) then
			self:GetOwner():DrawViewModel(true) -- Draw the Viewmodel again!
		end


		self.IsScoping = false
		self.ScopeStage = 0
		self.DoBolt = nil


		if self.ResetInternalVarsHooked2 then
			self:ResetInternalVarsHooked2()
		end
	end


	function SWEP:DrawHUD()
		if self:GetOwner():GetViewEntity() ~= self:GetOwner() then return end

		if self.IsScoping  then

			if self.DrawCrosshair then
				if _IsValid(self:GetOwner()) then
					self:GetOwner():DrawViewModel(false)
				end

				self.DrawCrosshair = false
			end

			tScopeTypes[self.ScopeType](self) -- Draw the scope

		elseif not self.DrawCrosshair then

			if _IsValid(self:GetOwner()) then
				self:GetOwner():DrawViewModel(true)
			end

			self.DrawCrosshair = true

		end
	end


	function SWEP:FireAnimationEvent(_,_,event) -- Override Base (Hide muzzleflash while scoping)
		if event == 5001 or event == 5011 or event == 5021 or event == 5031 then
			if self:GetOwner():GetViewEntity() ~= self:GetOwner() or self.IsScoping then return true end


			local vm = self:GetOwner():GetViewModel()
			if not _IsValid(vm) then return end

			local vmAttachment = vm:GetAttachment("1")
			if not istable(vmAttachment) then return end


			local effectData = EffectData()

			effectData:SetAttachment(1)
			effectData:SetEntity(vm)
			effectData:SetScale(1)
			effectData:SetMagnitude(1)
			effectData:SetOrigin(vmAttachment.Pos)
			effectData:SetAngles(vmAttachment.Ang)

			util.Effect("CS_MuzzleFlash",effectData)


			return true
		end
	end
end

-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----
-- SHARED
-- ----- ----- ----- ----- ------- ----- ----- ----- ----- -----

function SWEP:IronSight()

end