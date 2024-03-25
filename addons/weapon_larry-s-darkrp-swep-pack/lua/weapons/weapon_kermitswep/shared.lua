if SERVER then AddCSLuaFile("shared.lua") end

if CLIENT then
    SWEP.PrintName = "Kermit Swep"
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
SWEP.Instructions = "Left mouse to play sounds, right mouse to select sound, reload for friendly barking."
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
{ name = "Big Booty Bitches", sound = "kermit/kermit_bigbootybitches"},
{ name = "Corpse", sound = "kermit/kermit_corpse"},
{ name = "Touched", sound = "kermit/kermit_getstouched"},
{ name = "Minorities", sound = "kermit/kermit_hatesminorites"},
{ name = "Hi", sound = "kermit/kermit_hi"},
{ name = "Lust For Blood", sound = "kermit/kermit_lustforblood"},
{ name = "World Deaf", sound = "kermit/kermit_makeworlddeaf"},
{ name = "Santa's Fleesh", sound = "kermit/kermit_santafleesh"},
{ name = "Suck Dk", sound = "kermit/kermit_suckdk"},
{ name = "Suicide", sound = "kermit/kermit_suicide"},
{ name = "Teeth", sound = "kermit/kermit_teeth"},
{ name = "There You Go", sound = "kermit/kermit_thereyougo"},
{ name = "Weeeed", sound = "kermit/kermit_weeeeeeed"},
{ name = "Yea", sound = "kermit/kermit_yea"}
}

for i,v in pairs(sounds) do util.PrecacheSound(v.sound .. ".wav") end
function SWEP:PrimaryAttack()
    if CurTime() < self.NextSwing and !checked then
        return
    end
    self.NextSwing = CurTime() + self.Primary.Delay
    if CLIENT then
        net.Start("KermitSound") net.WriteString(SWEPsounds) net.SendToServer()
    end
end

if SERVER then
    util.AddNetworkString("KermitSound")
    net.Receive( "KermitSound", function( len, ply )
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