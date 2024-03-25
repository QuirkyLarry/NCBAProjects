
local TTT = ( GAMEMODE_NAME == "terrortown" or cvars.Bool("csgo_knives_force_ttt", false) )

DEFINE_BASECLASS( 'swb_knife_base' )

if ( SERVER ) then
  SWEP.Weight         = 5
  SWEP.AutoSwitchTo   = false
  SWEP.AutoSwitchFrom = false

  if TTT then
    SWEP.EquipMenuData = nil
  end
end

if ( CLIENT ) then
  SWEP.Slot         = TTT and 6 or 2
  SWEP.SlotPos      = 0
end

SWEP.PrintName      = 'Default T Knife' .. ' | ' .. 'Golden'
SWEP.Category       = 'CS:GO Knives'

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = 'models/weapons/v_csgo_default_t.mdl'
SWEP.WorldModel     = 'models/weapons/w_csgo_default_t.mdl'

SWEP.SkinIndex      = 1
SWEP.PaintMaterial  = nil
SWEP.AreDaggers     = false

util.PrecacheModel( SWEP.ViewModel )
util.PrecacheModel( SWEP.WorldModel )

SWEP.DamagePrimaryMin = 24
SWEP.DamageSecondaryMin = 60
SWEP.DamagePrimaryMax = 24
SWEP.DamageSecondaryMax = 72
SWEP.DamageAltPrimaryMult = 1.5
SWEP.DamageAltSecondaryMult = 2

-- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_EQUIP

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = false

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
-- SWEP.AmmoEnt = "item_ammo_smg1_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = nil

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = nil

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = false

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = true

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = true

-- This sets the icon shown for the weapon in the DNA sampler, search window,
-- equipment menu (if buyable), etc.
SWEP.Icon = "vgui/entities/csgo_default_t_golden.vmt"

local mins, maxs = Vector(-6, -6, -6), Vector(6, 6, 6)
local dmgtype = bit.bor( DMG_ENERGYBEAM, DMG_DISSOLVE ) 
local td = {}
local tr, ent, DMG, damageinfo

local _util_TraceHull = util.TraceHull
local _IsValid = IsValid
local _ParticleEffect = ParticleEffect
local _math_random = math.random

function SWEP:Damage()
	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:EyeAngles():Forward() * 50
	td.filter = self.Owner
	td.mins = mins
	td.maxs = maxs

	tr = _util_TraceHull(td)

	if tr.Hit then
		ent = tr.Entity

		if _IsValid(ent) then
			if ent:IsPlayer() or ent:IsNPC() then
				if SERVER then
					DMG = _math_random(self.DamageMin, self.DamageMax)
					if self.Backstab then
						DMG = DMG * (self.AltAttack and self.DamageAltSecondaryMult or self.DamageAltPrimaryMult)
					end
          damageinfo = DamageInfo()
          damageinfo:SetAttacker( self.Owner )
          damageinfo:SetInflictor( self )
          damageinfo:SetDamage( DMG )
          damageinfo:SetDamageType( dmgtype )
          damageinfo:SetDamageForce( (self.Owner:GetAimVector():GetNormalized() * 300) * 2000 )
          damageinfo:SetDamagePosition( tr.HitPos )
          tr.Entity:DispatchTraceAttack( damageinfo, tr, td.start )
				end

				_ParticleEffect("blood_impact_red_01", tr.HitPos, tr.HitNormal:Angle(), ent)
				self:EmitSound(self.HitSound, 80, 100)
			else
				if SERVER then
					DMG = _math_random(self.DamageMin, self.DamageMax)
					if self.Backstab then
						DMG = DMG * (self.AltAttack and self.DamageAltSecondaryMult or self.DamageAltPrimaryMult)
					end
					ent:TakeDamage(DMG, self.Owner, self.Owner)

					if ent:GetClass() == "func_breakable_surf" then
						ent:Input("Shatter", NULL, NULL, "")
						self:EmitSound("physics/glass/glass_impact_bullet1.wav", 80, _math_random(95, 105))
					end
				end

				self:EmitSound(self.HitSoundElse, 80, 100)
			end
		else
			self:EmitSound(self.HitSoundElse, 80, 100)
		end
	end
end