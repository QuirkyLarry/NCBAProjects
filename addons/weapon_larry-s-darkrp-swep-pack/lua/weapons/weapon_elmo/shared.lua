if SERVER then AddCSLuaFile("shared.lua") end

if CLIENT then
    SWEP.PrintName = "Elmo Swep"
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
SWEP.Purpose = "Elmo job for DarkRP"
SWEP.Instructions = "Left mouse to play sounds, right mouse to select sound."
-- SWEP.ViewModel = ""
SWEP.WorldModel = ""
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 5
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.NextSwing = 0

local SWEPsounds = ""
local sounds = {
{ name = "Elmo's Place", sound = "elmo/elmo_almostplace"},
{ name = "Another Cartoon", sound = "elmo/elmo_anothercartoon"},
{ name = "Better Than", sound = "elmo/elmo_betterthan"},
{ name = "B*tches Lining UP", sound = "elmo/elmo_bitchesliningup"},
{ name = "Cracker", sound = "elmo/elmo_cracker"},
{ name = "Cut You", sound = "elmo/elmo_cutyou"},
{ name = "Elmo", sound = "elmo/elmo_elmo"},
{ name = "One Phone Call", sound = "elmo/elmo_onephonecall"},
{ name = "Pimp", sound = "elmo/elmo_pimp"},
{ name = "Pissed", sound = "elmo/elmo_pissed"},
{ name = "Run This Town", sound = "elmo/elmo_runningthistown"},
{ name = "Say To You", sound = "elmo/elmo_saytoyou"},
{ name = "Stepping To Elmo", sound = "elmo/elmo_steppingtoelmo"},
{ name = "Piss", sound = "elmo/elmo_thispiss"},
{ name = "Elmo's World", sound = "elmo/elmo_world"}
}

for i,v in pairs(sounds) do util.PrecacheSound(v.sound .. ".wav") end
function SWEP:PrimaryAttack()
    if CurTime() < self.NextSwing and !checked then
        return
    end
    self.NextSwing = CurTime() + self.Primary.Delay
    if CLIENT then
        net.Start("ElmoSound") net.WriteString(SWEPsounds) net.SendToServer()
    end
end

if SERVER then
    util.AddNetworkString("ElmoSound")
    net.Receive( "ElmoSound", function( len, ply )
        SWEPsounds = net.ReadString()
        ply:EmitSound(SWEPsounds .. ".wav",SNDLVL_75dB,100,1,CHAN_WEAPON)
    end)
end

function SWEP:SecondaryAttack()
    if CLIENT then
        Menu = DermaMenu()
        for i,v in pairs(sounds) do
            Menu:AddOption( v.name, function() SWEPsounds = v.sound end)
        end
        Menu:Open(ScrW() / 2,ScrH() / 4)
    end
end

function SWEP:PreDrawViewModel()
    return true
end