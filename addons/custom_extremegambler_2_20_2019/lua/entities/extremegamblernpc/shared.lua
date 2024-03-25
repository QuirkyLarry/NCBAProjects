ENT.Base = "base_ai" // This entity is based on "base_ai"
ENT.Type = "ai" // What type of entity is it, in this case, it's an AI.
ENT.Category = "Extreme Gambler"
ENT.Spawnable = true
ENT.AutomaticFrameAdvance = true // This entity will animate itself.

ENT.PrintName = "ExtremeGamblerNPC"
ENT.Author = "Sim"
ENT.Purpose = "Trick gambling NPC that never pays out. (Balance out funds across the DarkRP players)"

function ENT:SetAutomaticFrameAdvance( bUsingAnim ) // This is called by the game to tell the entity if it should animate itself.
	self.AutomaticFrameAdvance = bUsingAnim
end

// Edit settings below

-- GamblePrice = 1000