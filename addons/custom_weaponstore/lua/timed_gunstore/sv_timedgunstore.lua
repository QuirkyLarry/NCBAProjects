require("mysqloo")

util.AddNetworkString("timedgstore_menu")
util.AddNetworkString("timedgstore_doAction")

timedGStore.sqlInfo = { -- MYSQL info
	host = "x",
	user = "x",
	pass = "x",
	db = "x",
	port = 3306
}

local conn = mysqloo.connect(timedGStore.sqlInfo.host, timedGStore.sqlInfo.user, timedGStore.sqlInfo.pass, timedGStore.sqlInfo.db, timedGStore.sqlInfo.port)

function conn:onConnected()
	print("[Timed Gunstore] Connected to database successfully.")
end

function conn:onConnectionFailed(err)
	print("[Timed Gunstore] Error connecting to database.")
	print(err)
end

function timedGStore:query(msql)
	local q = conn:query(msql)
	function q:onError(err)
		print("[Timed Gunstore] Error in query")
		print(err)
	end
	q:start()
	return q
end

conn:connect()

timedGStore:query("CREATE TABLE IF NOT EXISTS timedgstore(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, sid VARCHAR(30), wep VARCHAR(30), expiretime LONGTEXT)")

timedGStore.plyWeps = {}

local meta = FindMetaTable("Player")

function meta:AddTimedWep(class, time)
	if !self || !class then return end
	local expireTime = time && os.time() + time || 0
	timedGStore.plyWeps[self:SteamID64()] = (timedGStore.plyWeps[self:SteamID64()] || {})
	timedGStore.plyWeps[self:SteamID64()][class] = {wep = class, expiretime = expireTime, sid = self:SteamID64()}
	timedGStore:query("INSERT INTO timedgstore(sid, wep, expiretime) VALUES('" .. self:SteamID64() .. "', '" .. class .. "', '" .. expireTime .. "')")
end
function meta:remTimedWep(class)
	if !self || !class then return end
	if !timedGStore.plyWeps[self:SteamID64()] || !timedGStore.plyWeps[self:SteamID64()].class then return end
	timedGStore.plyWeps[self:SteamID64()].class = nil
	timedGStore:query("DELETE FROM timedgstore WHERE sid='" .. self:SteamID64() .. "' AND wep='" .. class .. "'")
end

function timedGStore.OpenMenu(ply)
	if !ply then return end
	local info
	if timedGStore.plyWeps[ply:SteamID64()] then
		info = timedGStore.plyWeps[ply:SteamID64()]
	else
		info = {}
	end
	net.Start("timedgstore_menu")
	net.WriteTable(info)
	net.Send(ply)
end
hook.Add("PlayerInitialSpawn", "timedgstore_init", function(ply)
	local qry = timedGStore:query("SELECT * FROM timedgstore WHERE sid=" .. ply:SteamID64() .. "")
	function qry:onSuccess(data)
		if !data || !data[1] then return end
		local weps = {}
		for k, v in pairs(data) do
			weps[v.wep] = v
		end
		timedGStore.plyWeps[ply:SteamID64()] = weps
	end
end)

hook.Add("PlayerSpawn", "timedgstore_checkweps", function(ply)
	if !timedGStore.plyWeps[ply:SteamID64()] then return end
	local weps = timedGStore.plyWeps[ply:SteamID64()]
	for k, v in pairs(weps) do
		if v.expiretime ~= 0 then
			if os.time() >= tonumber(v.expiretime) then
				ply:remTimedWep(v.wep)
				timedGStore.plyWeps[ply:SteamID64()][k] = nil
			end
		end
	end
end)

net.Receive("timedgstore_doAction", function(_, ply)
	if !ply then return end
	local item, mode = net.ReadString(), net.ReadInt(8)
	if !timedGStore.weapons[item] then return end
	local targetItem = timedGStore.weapons[item]
	if mode == 0 then
		if !timedGStore.plyWeps[ply:SteamID64()] || !timedGStore.plyWeps[ply:SteamID64()][item] then return end
		ply:Give(item)
	elseif mode == 1 then
		if targetItem.allowed && !table.HasValue(targetItem.allowed, ply:GetUserGroup()) then
			DarkRP.notify(ply, 1, 4, "You aren't the right rank to purchase this!")
			return
		end
		if !timedGStore.plyWeps[ply:SteamID64()] then
			timedGStore.plyWeps[ply:SteamID64()] = {}
		end
		if timedGStore.plyWeps[ply:SteamID64()][item] then return end
		if !ply:canAfford(targetItem.price) then
			DarkRP.notify(ply, 1, 4, "You can't afford this!")
			return
		end
		ply:addMoney(-targetItem.price)
		ply:AddTimedWep(item, targetItem.length)
		DarkRP.notify(ply, 0, 4, "Purchased weapon for " .. GAMEMODE.Config.currency .. string.Comma(targetItem.price))
	end
end)

concommand.Add("timedgunstore", function(ply)
	if !ply then return end
	timedGStore.OpenMenu(ply)
end)

hook.Add("PlayerSay", "timedgunstore_chatcmd", function(ply, txt)
	txt = txt:lower()
	if !ply || txt ~= timedGStore.chatCMD then return end
	timedGStore.OpenMenu(ply)
end)