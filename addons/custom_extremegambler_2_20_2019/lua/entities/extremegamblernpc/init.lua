AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

util.AddNetworkString("ExtremeGamblerNPCUsed")
util.AddNetworkString("GambleButtonClicked")
util.AddNetworkString("plyCantAffordGamble")

function ENT:Initialize()
	//self:SetModel( "models/characters/hostage_04.mdl" )
	self:SetModel("models/odessa.mdl")
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal()
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid( SOLID_BBOX )
	self:CapabilitiesAdd(bit.bor( CAP_ANIMATEDFACE , CAP_TURN_HEAD))
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
end


function ENT:OnTakeDamage()
	return false
end

function ENT:AcceptInput( Name, Activator, Caller )
	if Name == "Use" and Caller:IsPlayer() then
	   net.Start("ExtremeGamblerNPCUsed") net.Send(Caller)
	end
end

net.Receive( "GambleButtonClicked", function(length, sender)
	currentMoney = sender:getDarkRPVar("money")
	local rNum, rNum2,rNum3 = math.random(1,50),math.random(1,50),(math.random(1,30) / 100)
	local payoutMulti,lossMulti,plyCount,allPlayers = (math.random(10,100) / 100),rNum3,player.GetCount(),player.GetAll()
	local ecotable = {};local ecototal = 0
	for i, allPlyEco in ipairs( allPlayers ) do
		table.insert(ecotable, allPlyEco:getDarkRPVar("money"))
	end
	for i, v in ipairs( ecotable ) do
		ecototal = ecototal + v
	end
	local plyCantAfford = math.Round(ecototal * 1.01 / plyCount)
	if currentMoney <= plyCantAfford then
		net.Start("plyCantAffordGamble") net.Send(sender)
		plyCantAfford = DarkRP.formatMoney(plyCantAfford)
		sender:ChatPrint("[Extreme Gambler]: " .. sender:Name() .. " you are unable to gamble. You need at least " .. plyCantAfford .. " to play.")
	elseif rNum == rNum2 then
		sender:addMoney(currentMoney * payoutMulti)
		print(payoutMulti)
		print(currentMoney)
		local money = DarkRP.formatMoney(math.Round(currentMoney * payoutMulti))
		for i, allPlyWon in ipairs( allPlayers ) do
			allPlyWon:ChatPrint("[Extreme Gambler]: " .. sender:Name() .. " won " .. money .. " at the Extreme Gambler. " .. payoutMulti .. "% their money.")
		end
	else
		local loss = math.Round(currentMoney * lossMulti)
		local donation = math.Round(loss / plyCount)
		sender:addMoney(-loss)
		loss = DarkRP.formatMoney(math.Round(loss * .30))
		local donationText = DarkRP.formatMoney(math.Round(donation * .30))
		local lossPerc = (lossMulti * 100)
		for i, allPlyLost in ipairs( allPlayers ) do
			if allPlyLost == sender then
				allPlyLost:ChatPrint("[Extreme Gambler]: " .. sender:Name() .. " lost " .. loss .. " at the Extreme Gambler. This was " .. lossPerc .. "% of their money.")
			else
				allPlyLost:ChatPrint("[Extreme Gambler]: " .. sender:Name() .. " lost " .. loss .. " at the Extreme Gambler. This was " .. lossPerc .. "% of their money. " .. "You have recieved " .. donationText .. " from their losses.")
				allPlyLost:addMoney(donation * .30)
			end
		end
	end
end)