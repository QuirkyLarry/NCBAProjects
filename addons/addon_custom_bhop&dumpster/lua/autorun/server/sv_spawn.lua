hook.Add( "PlayerInitialSpawn", "ncba_custom_spawn", function(ply)
	timer.Simple(3,function()
		ncba_custom_bhopcheckwl(ply:SteamID())
		ncba_custom_updatename(ply:SteamID())
	end)
end)