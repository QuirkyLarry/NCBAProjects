/*
    ©2019 NCBA on behalf of Walrusking
    This was created by Walrusking for NCBA: https://steamcommunity.com/groups/NuclearBadasses[
        SteamID: STEAM_0:0:103519394
        Link to profile: http://steamcommunity.com/id/Walrusking_1/
    ]
*/

include("sh_config.lua")

concommand.Add( ncba_custom.bhop.cnslcmdwl, function( ply, com, args )
    if SERVER then
        if ( !args[1] or !args[2] or !args[3] or !args[4] or !args[5] ) then return print("[bHop] Whitelisted: Invalid SteamID") end
        local steamid = table.concat({args[1],args[2],args[3],args[4],args[5]})
        ncba_custom_bhopgrantwl(steamid)
    end
end, nil, nil, FCVAR_SERVER_CAN_EXECUTE )

concommand.Add( ncba_custom.bhop.cnslcmdunwl, function( ply, com, args )
    if SERVER then
        if ( !args[1] or !args[2] or !args[3] or !args[4] or !args[5] ) then return print("[bHop] Whitelisted: Invalid SteamID") end
        local steamid = table.concat({args[1],args[2],args[3],args[4],args[5]})
        ncba_custom_bhoprevokewl(steamid)
    end
end, nil, nil, FCVAR_SERVER_CAN_EXECUTE )

hook.Add( "PlayerSay", "ncba_custom_commands", function(ply, text, public)
    if (string.sub(text:lower() .. " ", 1, ncba_custom.bhop.command:len()) == ncba_custom.bhop.command) then
        if ply:GetNWBool("ncba_custom_bhop_whitelisted") then
            if ply:GetNWBool("ncba_custom_bhop") == false then
                ply:SetNWBool("ncba_custom_bhop",true)
                ply:PlayerMsg(Color(255,255,255),"[",Color(18,148,238),"bHop",Color(255,255,255),"]"," You have",Color(0,255,0)," enabled ",Color(255,255,255),"bHop.")
            else
                ply:SetNWBool("ncba_custom_bhop",false)
                ply:PlayerMsg(Color(255,255,255),"[",Color(18,148,238),"bHop",Color(255,255,255),"]"," You have",Color(255,0,0)," disabled ",Color(255,255,255),"bHop.")
            end
        else
            ply:PlayerMsg(Color(255,255,255),"[",Color(255,0,0),"Error",Color(255,255,255),"]"," You do not have access to bHop. Please consider buying it.")
        end
        return ""
    end
end)