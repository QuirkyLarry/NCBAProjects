-- Localized Globals
local l_ACSLFe = AddCSLuaFile
local l_uPMl = util.PrecacheModel
local l_uPSd = util.PrecacheSound
local l_CTe = CurTime
local l_mrm = math.random
local l_Vr = Vector
local l_tSe = timer.Simple

if SERVER then l_ACSLFe("shared.lua") end

if CLIENT then
    SWEP.PrintName = "Dog Swep"
    SWEP.Category = "Larry's DarkRP Sweps"
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = true
    SWEP.ViewModelFOV = 70
    SWEP.ViewModelFlip = false
    SWEP.CSMuzzleFlashes = false
end

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.HoldType = "knife"
SWEP.Author = "Made specially for Paradox DarkRP, Modified for by Larry."
SWEP.Purpose = "Dog job for DarkRP"
SWEP.Instructions = "Left mouse to attack, right mouse for angry barking, reload for friendly barking."
-- SWEP.ViewModel = ""
SWEP.WorldModel = ""
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 1.5
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

function SWEP:Precache()
    l_uPMl(self.ViewModel)
    l_uPSd("dogswep/attack_hit_1.wav")
    l_uPSd("dogswep/attack_hit_2.wav")
    l_uPSd("dogswep/attack_hit_3.wav")
    l_uPSd("dogswep/attack_hit_4.wav")
    l_uPSd("dogswep/bdog_attack_1.wav")
    l_uPSd("dogswep/bdog_attack_2.wav")
    l_uPSd("dogswep/bdog_attack_3.wav")
    l_uPSd("dogswep/bdog_attack_4.wav")
    l_uPSd("dogswep/bdog_die_2.wav")
    l_uPSd("dogswep/bdog_die_3.wav")
    l_uPSd("dogswep/bdog_eat_1.wav")
    l_uPSd("dogswep/bdog_groan_1.wav")
    l_uPSd("dogswep/bdog_hurt_1.wav")
    l_uPSd("dogswep/bdog_hurt_2.wav")
    l_uPSd("dogswep/bdog_idle_1.wav")
    l_uPSd("dogswep/bdog_idle_2.wav")
    l_uPSd("dogswep/bdog_idle_3.wav")
    l_uPSd("dogswep/bdog_idle_4.wav")
    l_uPSd("dogswep/bdog_panic_1.wav")
    l_uPSd("dogswep/bdog_panic_2.wav")
end

function SWEP:Think()
    if not self.NextHit or l_CTe() < self.NextHit then
        return
    end
    self.NextHit = nil
    local pl = self.Owner
    local vStart = pl:EyePos() + l_Vr(0, 0, -10)

    local trace = util.TraceLine({
        start = vStart,
        endpos = vStart + pl:GetAimVector() * 71,
        filter = pl,
        mask = MASK_SHOT
    })
    local ent

    if trace.HitNonWorld then
        ent = trace.Entity
    elseif self.PreHit and self.PreHit:IsValid() and not (self.PreHit:IsPlayer() and not self.PreHit:Alive()) and self.PreHit:GetPos():DistToSqr(vStart) < 12100 then
        ent = self.PreHit
        trace.Hit = true
    end

    if trace.Hit then
        pl:EmitSound("npc/zombie/claw_strike" .. l_mrm(1, 3) .. ".wav")
    end
    pl:EmitSound("npc/zombie/claw_miss" .. l_mrm(1, 2) .. ".wav")
    self.PreHit = nil

    if ent and ent:IsValid() and not (ent:IsPlayer() and not ent:Alive()) then
        local damage = 25
        local phys = ent:GetPhysicsObject()
        if phys:IsValid() and not ent:IsNPC() and phys:IsMoveable() then
            local vel = damage * 487 * pl:GetAimVector()
            phys:ApplyForceOffset(vel, (ent:NearestPoint(pl:GetShootPos()) + ent:GetPos() * 2) / 3)
            ent:SetPhysicsAttacker(pl)
        end
        if not CLIENT and SERVER then
            ent:TakeDamage(damage, pl, self)
        end
    end
end

SWEP.NextSwing = 0

function SWEP:PrimaryAttack()
    if l_CTe() < self.NextSwing then
        return
    end
    local attack = l_mrm(1, 2)
    if self and self:IsValid() then
        if attack == 1 then
            self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
        elseif attack == 2 then
            self:SendWeaponAnim(ACT_VM_HITCENTER)
        end
    end
    self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_ZOMBIE)
    self.Owner:EmitSound("dogswep/attack_hit_" .. l_mrm(1, 4) .. ".wav")
    l_tSe(1.4, function()
        if self and self:IsValid() then
            self:SendWeaponAnim(ACT_VM_IDLE)
        end
    end)
    self.NextSwing = l_CTe() + self.Primary.Delay
    self.NextHit = l_CTe() + 1
    local vStart = self.Owner:EyePos() + l_Vr(0, 0, -10)
    local trace = util.TraceLine({
        start = vStart,
        endpos = vStart + self.Owner:GetAimVector() * 65,
        filter = self.Owner,
        mask = MASK_SHOT
    })
    if trace.HitNonWorld then
        self.PreHit = trace.Entity
    end
end

SWEP.NextMoan = 0

function SWEP:SecondaryAttack()
    if l_CTe() < self.NextMoan then
        return
    end
    self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_TAUNT_ZOMBIE)
    if SERVER and not CLIENT then
        self.Owner:EmitSound("dogswep/bdog_attack_" .. l_mrm(1, 4) .. ".wav")
    end
    self.NextMoan = l_CTe() + 2.5
end

function SWEP:Reload()
    if l_CTe() < self.NextMoan then
        return
    end
    self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_TAUNT_ZOMBIE)
    if SERVER and not CLIENT then
        self.Owner:EmitSound("dogswep/bdog_idle_" .. l_mrm(1, 3) .. ".wav")
    end
    self.NextMoan = l_CTe() + 2.5
end

function SWEP:PreDrawViewModel()
    return true
end