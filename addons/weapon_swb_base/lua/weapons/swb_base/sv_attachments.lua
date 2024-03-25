local _concommand_Add = concommand.Add
local _net_Receive = net.Receive
local _net_WriteData = net.WriteData
local _net_ReadUInt = net.ReadUInt
local _hook_Add = hook.Add
local _util_Compress = util.Compress
local _net_Start = net.Start
local _tonumber = tonumber
local _util_Decompress = util.Decompress
local _net_WriteUInt = net.WriteUInt
local _print = print
local _net_ReadData = net.ReadData
local _util_TableToJSON = util.TableToJSON
local _net_Send = (SERVER and net.Send or nil)
local _util_AddNetworkString = (SERVER and util.AddNetworkString or nil)
local _util_JSONToTable = util.JSONToTable
local _net_WriteFloat = net.WriteFloat
local _IsValid = IsValid
local _net_WriteString = net.WriteString
local _CurTime = CurTime
local _pairs = pairs
local _player_GetAll = player.GetAll
local _player_GetCount = player.GetCount

--[[
    !IMPORTANT!
    All materials must use argument 'UnlitGeneric'
    If you don't know what this is please refer to valve wiki for definitions!

    Note:
    Some materials and submaterial groups
    may differ from the viewmodel materials list.

    I recommend doing this to check

	local function PrintBones(ent)
		for i=0, ent:GetBoneCount()-1 do
			print(i,ent:GetBoneName(i))
		end
	end
    
    local vm = LocalPlayer():GetViewModel()
    local wm = LocalPlayer():GetActiveWeapon()
    wm = wm.WMEnt or wm
    PrintTable(vm:GetMaterials())
    PrintBones(vm)
    print('------')
    PrintTable(wm:GetMaterials())
    PrintBones(wm)

    Skin Configuration Format

    material - material to be used
    x_shift - units of shift on axis x
    y_shift - units of shift on axis x
    blendfactor - the blending factor between the skin and the model
    blendmode - the blending modes of the skin (only 1 & 3 works)
    color - the color of the skin including alpha
    scale - the scale of the rendering of the texture
    drawtype - the drawing type to be used
        └► 'UV' - Uses the UV drawing mode (https://wiki.garrysmod.com/page/surface/DrawTexturedRectUV)
            └► Requires 'drawdata' to be created in the table
            └► 'drawdata' requirements: startu, startv, endu, endv (refer to wiki for usage)
        └► 'Rotated' - Uses the Rotational drawing mode (https://wiki.garrysmod.com/page/surface/DrawTexturedRectRotated)
            └► Requires 'drawdata' to be created in the table
            └► 'drawdata' requirements: rotation (refer to wiki for usage)
        └► 'Normal'/None - Uses the default drawing mode (https://wiki.garrysmod.com/page/surface/DrawTexturedRect)

    Skin Purchasing Configuration
        cost - adds a cost to the skin (not setting this will make it unobtainable)
        name - defines the name of the skin
        event - adds an event for the availability of the skin
            └► startdate - what day and month of the year for this skin to start?
                └► EX: {20, 12} < enables on December 20
            └► enddate - what day and month of the year for this skin to end?
                └► EX: {26, 12} < disables on December 26
]]

_util_AddNetworkString('SWB.AddAttachment')
_util_AddNetworkString('SWB.RemoveAttachment')
_util_AddNetworkString('SWB.SaveAttachments')
_util_AddNetworkString('SWB.SyncAttachment')
_util_AddNetworkString('SWB.InitSyncAttachment')
_util_AddNetworkString('SWB.RemoveIDATTCache')
_util_AddNetworkString('SWB.ServerTime')

local curdate = os.time()
local fixeddate = curdate - _CurTime() -- corrects dates for clients

SWB_Purchases = SWB_Purchases or {}

SWB_Purchases.Add = function(plr, value)
	return plr:addMoney(value) -- DarkRP
end

SWB_Purchases.Sub = function(plr, value)
	return plr:addMoney(-value) -- DarkRP
end

SWB_Purchases.Afford = function(plr, value)
	return plr:getDarkRPVar("money") > _tonumber(value) -- DarkRP
end

SWB_Purchases.Format = function(value)
	return DarkRP.formatMoney(value) -- DarkRP
end

if !sql.TableExists( "swb_attachments" ) then
	sql.Query([[DROP TABLE IF EXISTS `swb_attachments`;
    CREATE TABLE `swb_attachments` (
        `steamid` TEXT NOT NULL,
        `data` TEXT NOT NULL,
        `index` INTEGER PRIMARY KEY AUTOINCREMENT
    );]])
	_print("[SWB] Generated SQLite table: swb_attachments")
end

local function SWB_GetAttachmentOwned(pl)
	local data = sql.Query("SELECT `data` FROM `swb_attachments` WHERE `steamid` = '" .. pl:SteamID64() .. "'")
	if !data or !data[1] then
		return {}
	end
	return _util_JSONToTable(data[1]['data'] or '[]')
end

local function SWB_SetAttachmentOwned(pl, _data)
	local ID64 = pl:SteamID64()
	local data = sql.Query("SELECT `data` FROM `swb_attachments` WHERE `steamid` = '" .. ID64 .. "'")
	if !data or !data[1] then
		return sql.Query("INSERT INTO `swb_attachments`(`steamid`, `data`) VALUES('" .. ID64 .. "', '" .. sql.SQLStr(_util_TableToJSON(_data or {}), true) .. "')")
	else
		return sql.Query("UPDATE `swb_attachments` SET `data` = '" .. sql.SQLStr(_util_TableToJSON(_data or {}), true) .. "' WHERE `steamid` = '" .. ID64 .. "'")
	end
end

_net_Receive('SWB.SyncAttachment', function(_, pl)
	if pl.SWB_SycnAttachment then return end
	pl.SWB_SycnAttachment = true

	pl.SWB_HasAttachment = SWB_GetAttachmentOwned(pl)

	local data = _net_ReadData(_net_ReadUInt(32))
	data = _util_Decompress(data)
	data = _util_JSONToTable(data)

	local checkeddata = {}
	for class, v in _pairs(pl.SWB_HasAttachment) do
		for attachtype, vv in _pairs(v) do
			for attachid, vvv in _pairs(vv) do
				if data[class] and data[class][attachtype] and data[class][attachtype][attachid] then
					if not checkeddata[class] then
						checkeddata[class] = {}
					end
					if not checkeddata[class][attachtype] then
						checkeddata[class][attachtype] = {}
					end
					if data[class][attachtype][attachid] == 1 then
						checkeddata[class][attachtype][attachid] = 1
						SWB_ApplyAttachment(pl, class, attachtype, attachid, false, 1)
					else
						checkeddata[class][attachtype][attachid] = 0
					end
				else
					if not checkeddata[class] then
						checkeddata[class] = {}
					end
					if not checkeddata[class][attachtype] then
						checkeddata[class][attachtype] = {}
					end
					if not checkeddata[class][attachtype][attachid] then
						checkeddata[class][attachtype][attachid] = 0
					end
				end
			end
		end
	end
	
	local _data = _util_TableToJSON(checkeddata)
	_data = _util_Compress(_data)
	_net_Start('SWB.SaveAttachments')
	_net_WriteUInt(#_data, 32)
	_net_WriteData(_data, #_data)
	_net_Send(pl)

	pl.SWB_Attachments = checkeddata

	local weps = pl:GetWeapons()
	for i=1, #weps do
		local v = weps[i]
        if not v.SWBWeapon or not v.LuaAttachments then continue end
		for k, vv in _pairs(v.LuaAttachments) do
			if vv.default and not v.AttachmentData['Active'][k] then
				SWB_ApplyAttachment(pl, v, k, vv.default, false, 1)
			end
		end
	end

	local playerdatas = {}

	local plys = _player_GetAll()
	for i=1, _player_GetCount() do
		local v = plys[i]
		if v ~= pl then
			playerdatas[#playerdatas + 1] = {
				pl = v:SteamID64(),
				data = v.SWB_Attachments
			}
		end
	end

	local playerdatas = _util_TableToJSON(playerdatas)
	playerdatas = _util_Compress(playerdatas)
	_net_Start('SWB.InitSyncAttachment')
	_net_WriteUInt(#playerdatas, 32)
	_net_WriteData(playerdatas, #playerdatas)
	_net_Send(pl)
end)

_hook_Add('WeaponEquip', 'SWB.Attachments', function(SWEP, pl)
	local class = SWEP:GetClass()
	if pl.SWB_Attachments and pl.SWB_Attachments[class] then
		local data = pl.SWB_Attachments
		for attachtype, vv in _pairs(data[class]) do
			for attachid, vvv in _pairs(vv) do
				if SWB_HasAttachmentOwned(pl, class, attachtype, attachid) == false then
					data[class][attachtype][attachid] = nil
					illegaldata = true
				elseif vvv == 1 then
					SWB_ApplyAttachment(pl, SWEP, attachtype, attachid, false, 1)
				end
			end
		end

		if illegaldata then
			local _data = _util_TableToJSON(data)
			_data = _util_Compress(_data)
			_net_Start('SWB.SaveAttachments')
			_net_WriteUInt(#_data, 32)
			_net_WriteData(_data, #_data)
			_net_Send(pl)
		end
	end

	if SWEP.SWBWeapon and SWEP.LuaAttachments then 
		for k, v in _pairs(SWEP.LuaAttachments) do
			if v.default and not SWEP.AttachmentData['Active'][k] then
				SWB_ApplyAttachment(pl, SWEP, k, v.default, false, 1)
			end
		end
	end
end)

_concommand_Add('swb_eqatt', function(pl, cmd, args)
	if not _IsValid(pl) then
		return
	end

	local class = args[1]
	local attachtype = args[2]
	local attachid = _tonumber(args[3]) or -1
	
	if SWB_HasAttachmentOwned(pl, class, attachtype, attachid) == false then return end
	local attachment = SWB_HasAttachmentData(class, attachtype, attachid)
	if attachment == false then return end

	SWB_ApplyAttachment(pl, class, attachtype, attachid, true)
end)

--[[self.AttachmentData = {
	['Active'] = {
		['Barrels.1'] = true
	},
	['Effects'] = {
		['Shots'] = {def = 1, new = 10}
	}
}]]

concommand.Add("swb_cattmenu", function(ply)
	local SWEP = ply:GetActiveWeapon()
	
	if not SWEP.SWBWeapon or not SWEP.LuaAttachments then
		return
	end
	local CT = CurTime()
	
	if SWEP.ReloadDelay and CT < SWEP.ReloadDelay then
		return
	end
	
	if IsValid(SWEP) then
		if SWEP.dt.State == SWB_CUSTOMIZING then
			SWEP.dt.State = SWB_IDLE
		else
			SWEP.dt.State = SWB_CUSTOMIZING
		end
	end
end)

_concommand_Add('swb_buyatt', function(pl, cmd, args)
	if not _IsValid(pl) then
		return
	end

	local class = args[1]
	local attachtype = args[2]
	local attachid = _tonumber(args[3]) or -1
	local attachment = SWB_HasAttachmentData(class, attachtype, attachid)
	if attachment == false then return end

	if SWB_HasAttachmentOwned(pl, class, attachtype, attachid) then return end

	local attachdata = attachment['data'][attachid]

	if not attachdata.cost then return end

	if attachdata.event then
		local day, month = _tonumber(os.date( "%d" , os.time() )), _tonumber(os.date( "%m" , os.time() ))
		local startdate, enddate = attachdata.event.startdate, attachdata.event.enddate
		if startdate and enddate and (startdate[1] < day or startdate[2] < month or enddate[1] > day or enddate[2] > month) then
			return
		end
	end

	if SWB_Purchases.Afford(pl, attachdata.cost) then
		SWB_Purchases.Sub(pl, attachdata.cost)
	else
		return
	end

	do
		local data = pl.SWB_HasAttachment
		if not data[class] then
			data[class] = {}
		end
		data = data[class]
		if not data[attachtype] then
			data[attachtype] = {}
		end
		data = data[attachtype]
		data[attachid] = true
	end

	SWB_SetAttachmentOwned(pl, pl.SWB_HasAttachment)
	
	do
		local data = pl.SWB_Attachments
		if not data[class] then
			data[class] = {}
		end
		data = data[class]
		if not data[attachtype] then
			data[attachtype] = {}
		end
		data = data[attachtype]
		data[attachid] = 0
	end

	_net_Start('SWB.AddAttachment')
	_net_WriteString(class)
	_net_WriteString(attachtype)
	_net_WriteUInt(attachid, 8)
	_net_Send(pl)
end)


local printclient = function(pl, txt)
	pl:ChatPrint('[SWB] ' .. txt)
end

local printconsole = function(_, txt)
	print('[SWB] ' .. txt)
end

--Admin stuff
_concommand_Add('swb_giveatt', function(admin, cmd, args)
	if _IsValid(admin) then
		return
	else
		admin = nil
	end

	local printtogiver = (not admin and printconsole or printclient)

	local pl = player.GetBySteamID64(args[1])
	local class = args[2]
	local attachtype = args[3]
	local attachid = _tonumber(args[4]) or -1
	if not pl then return end
	local attachment = SWB_HasAttachmentData(class, attachtype, attachid)
	if attachment == false then 
		printtogiver(admin, 'Invalid attachment')
		return 
	end

	if SWB_HasAttachmentOwned(pl, class, attachtype, attachid) then 
		printtogiver(admin, 'User already has this attachment')
		return 
	end

	local attachdata = attachment['data'][attachid]

	do
		local data = pl.SWB_HasAttachment
		if not data[class] then
			data[class] = {}
		end
		data = data[class]
		if not data[attachtype] then
			data[attachtype] = {}
		end
		data = data[attachtype]
		data[attachid] = true
	end

	SWB_SetAttachmentOwned(pl, pl.SWB_HasAttachment)
	
	do
		local data = pl.SWB_Attachments
		if not data[class] then
			data[class] = {}
		end
		data = data[class]
		if not data[attachtype] then
			data[attachtype] = {}
		end
		data = data[attachtype]
		data[attachid] = 0
	end

	printtogiver(admin, 'Gave "' .. pl:SteamID() .. '" attachment [' .. class .. '][' .. attachtype .. '][' .. attachid .. ']')

	_net_Start('SWB.AddAttachment')
	_net_WriteString(class)
	_net_WriteString(attachtype)
	_net_WriteUInt(attachid, 8)
	_net_Send(pl)
end)

_concommand_Add('swb_rematt', function(admin, cmd, args)
	if _IsValid(admin) then
		return
	else
		admin = nil
	end

	local printtogiver = (not admin and printconsole or printclient)

	local pl = player.GetBySteamID64(args[1])
	local class = args[2]
	local attachtype = args[3]
	local attachid = _tonumber(args[4]) or -1
	if not pl then return end
	local attachment = SWB_HasAttachmentData(class, attachtype, attachid)
	if attachment == false then 
		printtogiver(admin, 'Invalid attachment')
		return 
	end

	if not SWB_HasAttachmentOwned(pl, class, attachtype, attachid) then
		printtogiver(admin, 'User does not have this attachment')
		return 
	end

	SWB_ApplyAttachment(pl, class, attachtype, attachid, true, 0)

	local attachdata = attachment['data'][attachid]

	do
		local data = pl.SWB_HasAttachment
		if data[class] then
			data = data[class]
			if data[attachtype] then
				data = data[attachtype]
				data[attachid] = nil
			end
		end
	end

	SWB_SetAttachmentOwned(pl, pl.SWB_HasAttachment)
	
	do
		local data = pl.SWB_Attachments
		if data[class] then
			data = data[class]
			if data[attachtype] then
				data = data[attachtype]
				data[attachid] = nil
			end
		end
	end

	printtogiver(admin, 'Revoked "' .. pl:SteamID() .. '" attachment [' .. class .. '][' .. attachtype .. '][' .. attachid .. ']')

	_net_Start('SWB.RemoveAttachment')
	_net_WriteString(class)
	_net_WriteString(attachtype)
	_net_WriteUInt(attachid, 8)
	_net_Send(pl)
end)