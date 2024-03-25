local l_ACSLF = AddCSLuaFile
local l_sGTID = (CLIENT and surface.GetTextureID or NULL)
local l_Ml = Model
local l_Sd = Sound
local l_CT = CurTime
local l_hC = hook.Call
local l_sF = string.find
local l_sL = string.lower
local l_IV = IsValid
local l_IFTP = IsFirstTimePredicted
local l_ST = SysTime
local l_hA = hook.Add
local l_hR = hook.Remove
local l_tS = timer.Simple
local l_tSg = tostring
local l_mR = math.Round
local l_uSR = util.SharedRandom
local l_sLen = string.len
local l_dRB = (CLIENT and draw.RoundedBox or NULL)
local l_Cr = Color
local l_mC = math.Clamp
local l_mM = math.Min
local l_ScW, l_ScH = ScrW , ScrH
local l_eAG = engine.ActiveGamemode
if l_eAG() ~= "darkrp" then return end

l_ACSLF()

local LockPickTime = 20

if CLIENT then
    SWEP.PrintName = "Pro Lock Pick"
    SWEP.Slot = 4
    SWEP.SlotPos = 30
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
    SWEP.WepSelectIcon = l_sGTID("vgui/entities/lockpick_pro")
end

SWEP.Author = "DarkRP Developers, Modified by Larry"
SWEP.Instructions = "Left or right click to pick a lock"
SWEP.Contact = "thenuclearbadasses@gmail.com"
SWEP.Purpose = "Steal Shit"
SWEP.IsDarkRPLockpick = true
SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = l_Ml("models/weapons/c_crowbar.mdl")
SWEP.WorldModel = l_Ml("models/weapons/w_crowbar.mdl")
SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "Larry's DarkRP Sweps"
SWEP.Sound = l_Sd("physics/wood/wood_box_impact_hard3.wav")
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsLockpicking")
    self:NetworkVar("Float", 0, "LockpickStartTime")
    self:NetworkVar("Float", 1, "LockpickEndTime")
    self:NetworkVar("Float", 2, "NextSoundTime")
    self:NetworkVar("Int", 0, "TotalLockpicks")
    self:NetworkVar("Entity", 0, "LockpickEnt")
end

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(l_CT() + 2)
    if self:GetIsLockpicking() then return end

    self:GetOwner():LagCompensation(true)
    local trace = self:GetOwner():GetEyeTrace()
    self:GetOwner():LagCompensation(false)
    local ent = trace.Entity

    if not l_IV(ent) or ent.DarkRPCanLockpick == false then return end
    local canLockpick = l_hC("canLockpick", nil, self:GetOwner(), ent, trace)

    if canLockpick == false then return end
    if canLockpick ~= true and (
            trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 10000 or
            (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) or
            (not ent:isDoor() and not ent:IsVehicle() and not l_sF(l_sL(ent:GetClass()), "vehicle") and (not GAMEMODE.Config.lockpickfading or not ent.isFadingDoor))
        ) then
        return
    end

    self:SetHoldType("pistol")
    self:SetIsLockpicking(true)
    self:SetLockpickEnt(ent)
    self:SetLockpickStartTime(l_CT())
    local endDelta = LockPickTime
    self:SetLockpickEndTime(l_CT() + endDelta)
    self:SetTotalLockpicks(self:GetTotalLockpicks() + 1)

    if l_IFTP() then
        l_hC("lockpickStarted", nil, self:GetOwner(), ent, trace)
    end

    if CLIENT then
        self.Dots = ""
        self.NextDotsTime = l_ST() + 0.5
        return
    end

    local onFail = function(ply) if ply == self:GetOwner() then l_hC("onLockpickCompleted", nil, ply, false, ent) end end

    l_hA("PlayerDeath", self, fc{onFail, fn.Flip(fn.Const)})
    l_hA("PlayerDisconnected", self, fc{onFail, fn.Flip(fn.Const)})
    l_hA("onLockpickCompleted", self, fc{fp{l_hR, "PlayerDisconnected", self}, fp{l_hR, "PlayerDeath", self}})
end

function SWEP:Holster()
    self:SetIsLockpicking(false)
    self:SetLockpickEnt(nil)
    return true
end

function SWEP:Succeed()
    self:SetHoldType("normal")
    local ent = self:GetLockpickEnt()
    self:SetIsLockpicking(false)
    self:SetLockpickEnt(nil)
    if not l_IV(ent) then return end
    local override = l_hC("onLockpickCompleted", nil, self:GetOwner(), true, ent)
    if override then return end
    if ent.isFadingDoor and ent.fadeActivate and not ent.fadeActive then
        ent:fadeActivate()
        if l_IFTP() then l_tS(5, function() if l_IV(ent) and ent.fadeActive then ent:fadeDeactivate() end end) end
    elseif ent.Fire then
        ent:keysUnLock()
        ent:Fire("open", "", .6)
        ent:Fire("setanimation", "open", .6)
    end
end

function SWEP:Fail()
    self:SetIsLockpicking(false)
    self:SetHoldType("normal")
    l_hC("onLockpickCompleted", nil, self:GetOwner(), false, self:GetLockpickEnt())
    self:SetLockpickEnt(nil)
end

local dots = {
    [0] = ".",
    [1] = "..",
    [2] = "...",
    [3] = ""
}
function SWEP:Think()
    if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

    if l_CT() >= self:GetNextSoundTime() then
        self:SetNextSoundTime(l_CT() + 1)
        local snd = {1,3,4}
        self:EmitSound("weapons/357/357_reload" .. l_tSg(snd[l_mR(l_uSR("DarkRP_Shitty_LockpickSnd" .. l_CT(), 1, #snd))]) .. ".wav", 50, 100)
    end

    if CLIENT and (not self.NextDotsTime or l_ST() >= self.NextDotsTime) then
        self.NextDotsTime = l_ST() + 0.5
        self.Dots = self.Dots or ""
        local len = l_sLen(self.Dots)

        self.Dots = dots[len]
    end

    local trace = self:GetOwner():GetEyeTrace()
    if not l_IV(trace.Entity) or trace.Entity ~= self:GetLockpickEnt() or trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 10000 then
        self:Fail()
    elseif self:GetLockpickEndTime() <= l_CT() then
        self:Succeed()
    end
end

function SWEP:DrawHUD()
    if not self:GetIsLockpicking() or self:GetLockpickEndTime() == 0 then return end

    self.Dots = self.Dots or ""
    local w = l_ScW()
    local h = l_ScH()
    local x, y, width, height = w / 2 - w / 10, h / 2 - 60, w / 5, h / 15
    l_dRB(8, x, y, width, height, l_Cr(10,10,10,120))

    local time = self:GetLockpickEndTime() - self:GetLockpickStartTime()
    local curtime = l_CT() - self:GetLockpickStartTime()
    local status = l_mC(curtime / time, 0, 1)
    local BarWidth = status * (width - 16)
    local cornerRadius = l_mM(8, BarWidth / 3 * 2 - BarWidth / 3 * 2 % 2)
    l_dRB(cornerRadius, x + 8, y + 8, BarWidth, height - 16, l_Cr(255 - (status * 255), 0 + (status * 255), 0, 255))

    draw.DrawNonParsedSimpleText(DarkRP.getPhrase("picking_lock") .. self.Dots, "Trebuchet24", w / 2, y + height / 2, l_Cr(255, 255, 255, 255), 1, 1)
end

function SWEP:SecondaryAttack()
    self:PrimaryAttack()
end


DarkRP.hookStub{
    name = "canLockpick",
    description = "Whether an entity can be lockpicked.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick an entity.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
        {
            name = "trace",
            description = "The trace result.",
            type = "table"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the entity can be lockpicked",
            type = "boolean"
        }
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "lockpickStarted",
    description = "Called when a player is about to pick a lock.",
    parameters = {
        {
            name = "ply",
            description = "The player that is about to pick a lock.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
        {
            name = "trace",
            description = "The trace result.",
            type = "table"
        }
    },
    returns = {},
    realm = "Shared"
}

DarkRP.hookStub{
    name = "onLockpickCompleted",
    description = "Result of a player attempting to lockpick an entity.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick the entity.",
            type = "Player"
        },
        {
            name = "success",
            description = "Whether the player succeeded in lockpicking the entity.",
            type = "boolean"
        },
        {
            name = "ent",
            description = "The entity that was lockpicked.",
            type = "Entity"
        },
    },
    returns = {
        {
            name = "override",
            description = "Return true to override default behaviour, which is opening the (fading) door.",
            type = "boolean"
        }
    },
    realm = "Shared"
}

DarkRP.hookStub{
    name = "lockpickTime",
    description = "The length of time, in seconds, it takes to lockpick an entity.",
    parameters = {
        {
            name = "ply",
            description = "The player attempting to lockpick an entity.",
            type = "Player"
        },
        {
            name = "ent",
            description = "The entity being lockpicked.",
            type = "Entity"
        },
    },
    returns = {
        {
            name = "time",
            description = "Seconds in which it takes a player to lockpick an entity",
            type = "number"
        }
    },
    realm = "Shared"
}
