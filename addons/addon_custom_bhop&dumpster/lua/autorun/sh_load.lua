/*
	©2019 NCBA on behalf of Walrusking
	This was created by Walrusking for NCBA: https://steamcommunity.com/groups/NuclearBadasses[
		SteamID: STEAM_0:0:103519394
		Link to profile: http://steamcommunity.com/id/Walrusking_1/
	]
*/
AddCSLuaFile()

local ply = FindMetaTable("Player")

if SERVER then
	AddCSLuaFile()
	util.AddNetworkString( "ColoredMessage" )
	function BroadcastMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Broadcast()
	end
	function ply:PlayerMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Send(self)
	end
elseif CLIENT then
	net.Receive("ColoredMessage",function(len) 
		local msg = net.ReadTable()
		chat.AddText(unpack(msg))
		chat.PlaySound()
	end)
end
