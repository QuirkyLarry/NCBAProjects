AddCSLuaFile()

local sTag = "M9kR_Initialize_Addon_Plus"

--[[
if SERVER then
	resource.AddWorkshop("2215998262") -- If you don't want others to automatically download M9k Remastered content on joining, remove this line or comment it out.
end--]]

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- --
-- Kill icons
-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- --

if CLIENT then


	local tData = {
		["m9k_vp90"] = "vgui/hud/m9k_vp90",
		["m9k_glock18_extclip"] = "vgui/hud/m9k_glock18_extclip",
		["m9k_fnp"] = "vgui/hud/m9k_fnp",
		["m9k_guardian"] = "vgui/hud/m9k_guardian",
		["m9k_ruger"] = "vgui/hud/m9k_ruger",
		["m9k_usps"] = "vgui/hud/m9k_usps",
		["m9k_usps_unsilenced"] = "vgui/hud/m9k_usps_unsilenced",
		["m9k_coltscoped"] = "vgui/hud/m9k_coltscoped",
		["m9k_mr96"] = "vgui/hud/m9k_mr96",
		["m9k_bren_ten"] = "vgui/hud/m9k_bren_ten",

		["m9k_m4a4"] = "vgui/hud/m9k_m4a4",
		["m9k_lr300"] = "vgui/hud/m9k_lr300",
		["m9k_sturmgewehr44"] = "vgui/hud/m9k_sturmgewehr44",
		["m9k_vz58"] = "vgui/hud/m9k_vz58",
		["m9k_fnc"] = "vgui/hud/m9k_fnc",
		["m9k_xm8"] = "vgui/hud/m9k_xm8",
		["m9k_qbz97"] = "vgui/hud/m9k_qbz97",
		["m9k_fw"] = "vgui/hud/m9k_fw",
		["m9k_asg36"] = "vgui/hud/m9k_asg36",
		["m9k_m16a4"] = "vgui/hud/m9k_m16a4",
		["m9k_ak74u"] = "vgui/hud/m9k_ak74u",
		["m9k_ak47sd"] = "vgui/hud/m9k_ak47sd",

		["m9k_ksg"] = "vgui/hud/m9k_ksg",
		["m9k_spas12stock"] = "vgui/hud/m9k_spas12stock",
		["m9k_dragonsbreath"] = "vgui/hud/m9k_dragonsbreath",
		["m9k_serbushorty"] = "vgui/hud/m9k_serbushorty",
		["m9k_fntps"] = "vgui/hud/m9k_fntps",
		["m9k_spas12silenced"] = "vgui/hud/m9k_spas12silenced",
		["m9k_baikal"] = "vgui/hud/m9k_baikal",
		["m9k_m3tactical"] = "vgui/hud/m9k_m3tactical"
	}


	local killiconAdd = killicon.Add

	local cCached1 = Color(255,255,255)


	hook.Add("Initialize",sTag,function()

		hook.Remove("Initialize",sTag)


		if MMM_M9k_IsBaseInstalled then

			for Key,v in pairs(tData) do
				killiconAdd(Key,v,cCached1)
			end
		end

	end)
end