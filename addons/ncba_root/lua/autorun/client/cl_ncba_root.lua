
-- Removes the default text of player name and health when looking at a player.
hook.Add( "HUDDrawTargetID", "HidePlayerInfo", function() return false end )
-- Removes Death Notice From players that are not staff.
hook.Add("DrawDeathNotice", "NCBA_HideDeathNotice", function()
    if !LocalPlayer():HasPermission("see_admin_chat") then
        hook.Remove("DrawDeathNotice")
    end
end)

-- Removed unused tool guns from the spawn menu.
local toolsToShow = {ledscreen = true,weld = true,rope = true,camera = true,creator = true,advdupe2 = true,button = true,colour = true,fading_door = true,keypad_willox = true,material = true,nocollide = true,precision = true,remover = true,stacker_improved = true,textscreen = true,}
hook.Add( "PreReloadToolsMenu", "NCBA_HideTools", function()
    -- Tool contains information about all registered tools.
    for name, data in pairs( weapons.GetStored( "gmod_tool" ).Tool ) do
        if !toolsToShow[ name ] then
            data.AddToMenu = false
        end
    end
end )
-- Adds a spawnmenu tabs that shows our forums.
spawnmenu.AddCreationTab( "NCBA.gg - Forums", function()
    local html = vgui.Create("DHTML", frame)
    html:Dock(FILL)
    html:OpenURL("https://ncba.gg")
    return html


end, "icon16/control_repeat_blue.png", 200 )

-- Adds a spawnmenu tabs that shows our Discord.
--[[spawnmenu.AddCreationTab( "NCBA.gg - Discord", function()
    local html = vgui.Create("DHTML", frame)
    html:Dock(FILL)
    html:OpenURL("https://discord.gg/WQeYRnJDJv")
    return html


end, "icon16/control_repeat_blue.png", 200 )--]]

-- Disables all default HUD UI from Sandbox & DarkRP.
local hook_Add = hook.Add
local hide = {
    ["CHudCrosshair"] = true,
    ["CHudBattery"] = true,
    ["DarkRP_HUD"] = true,
    ["DarkRP_EntityDisplay"] = true,
    ["DarkRP_LocalPlayerHUD"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_Agenda"] = true,
    ["DarkRP_LockdownHUD"] = true,
    ["DarkRP_ArrestedHUD"] = true,
    ["CHudHealth"] = true,
    ["DarkRP_ChatReceivers"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudChat"] = true
}

hook_Add( "HUDShouldDraw", "HideHUD", function( name )
    if ( hide[ name ] ) then
    	return false
    end

    -- Don't return anything here, it may break other addons that rely on this hook.
end )