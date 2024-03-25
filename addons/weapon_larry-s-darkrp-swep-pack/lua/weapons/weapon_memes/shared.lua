if SERVER then AddCSLuaFile("shared.lua") end

if CLIENT then
    SWEP.PrintName = "Memes Swep One"
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
SWEP.Purpose = "Knuckles job for DarkRP"
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
{ name = "Ahhhh", sound = "knuckles/knuckles_argh"},
{ name = "Attract Female", sound = "knuckles/knuckles_attractfemale"},
{ name = "Click", sound = "knuckles/knuckles_click"},
{ name = "Click 2", sound = "knuckles/knuckles_click2"},
{ name = "Click 3", sound = "knuckles/knuckles_click3"},
{ name = "Don't Know Da Wae", sound = "knuckles/knuckles_dontknowway"},
{ name = "Ebola", sound = "knuckles/knuckles_ebola"},
{ name = "Know Da Wae", sound = "knuckles/knuckles_knowtheway"},
{ name = "Know Da Wae Song", sound = "knuckles/knuckles_knowthewaysong"},
{ name = "Look At Him", sound = "knuckles/knuckles_lookathim"},
{ name = "Never See You Again", sound = "knuckles/knuckles_neversee"},
{ name = "Not Gay", sound = "knuckles/knuckles_notgay"},
{ name = "See Da Devil", sound = "knuckles/knuckles_seethedevil"},
{ name = "Take a Seat", sound = "knuckles/knuckles_takeaseat"},
{ name = "Teach Da Wae", sound = "knuckles/knuckles_teachtheway"},
{ name = "The Wae", sound = "knuckles/knuckles_thewae"},
{ name = "WAA WAA WAA", sound = "knuckles/knuckles_waawaawaa"},
{ name = "Without A Cause", sound = "knuckles/knuckles_withoutacause"},
{ name = "Without Purpose :(", sound = "knuckles/knuckles_withoutpurpose"}
}

for i,v in pairs(sounds) do util.PrecacheSound(v.sound .. ".wav") end
function SWEP:PrimaryAttack()
    if CurTime() < self.NextSwing and !checked then
        return
    end
    self.NextSwing = CurTime() + self.Primary.Delay
    if CLIENT then
        net.Start("MemesSound") net.WriteString(SWEPsounds) net.SendToServer()
    end
end

if SERVER then
    util.AddNetworkString("MemesSound")
    net.Receive( "MemesSound", function( len, ply )
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