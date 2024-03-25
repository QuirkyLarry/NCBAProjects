local degree = surface.GetTextureID("vgui/gradient-d")
local cols = {
	bg = Color(18, 18, 18),
	head = Color(31, 31, 31),
	white = Color(225, 225, 225),
	panes = Color(29, 29, 29),
	popout = Color(50, 50, 50)
}

local function btnFade(self, w, h, speed, col)
	self.fade = (self.fade || 0)
	if self:IsHovered() then
		self.fade = Lerp(speed, self.fade, w)
	else
		self.fade = Lerp(speed, self.fade, 0)
	end
	draw.RoundedBox(2^3, 2, 2, self.fade - 4, h - 4, col)
end

function timedGStore.innerMenu(k, v, itm)
	if !k || !v || !itm then return end
	if !TGStore then return end
	if timedGStore.inMenu then
		timedGStore.inMenu:Remove()
	end
	local info = TGStore.myInfo
	PrintTable(info)
	timedGStore.inMenu = vgui.Create("DPanel", TGStore)
	timedGStore.inMenu:Dock(FILL)
	timedGStore.inMenu:DockMargin(TGStore:GetWide() * .2, TGStore:GetTall() * .025, TGStore:GetWide() * .2, TGStore:GetTall() * .025)
	timedGStore.inMenu.Paint = function(self, w, h)
		draw.RoundedBox(2^3, 0, 0, w, h, cols.popout)
	end
	local cBtn = vgui.Create("DButton", timedGStore.inMenu)
	cBtn:Dock(RIGHT)
	-- cBtn:DockMargin(0, 0, 5, 0)
	cBtn:SetText("X")
	cBtn:SetFont("Trebuchet24")
	cBtn:SetTextColor(cols.white)
	cBtn.Paint = function(self, w, h)
		self.fd = (self.fd || 200)
		if self:IsHovered() then
			self.fd = Lerp(FrameTime() * 4, self.fd, 255)
		else
			self.fd = Lerp(FrameTime() * 4, self.fd, 200)
		end
		local col = table.Copy(cols.panes)
		col.a = self.fd
		draw.RoundedBoxEx(2^3, 0, 0, w, h, col, false, true, false, true)
	end
	cBtn.DoClick = function()
		timedGStore.inMenu:Remove()
	end

	local container = vgui.Create("DPanel", timedGStore.inMenu)
	container:Dock(TOP)
	if info[k] then
		container:SetTall(timedGStore.inMenu:GetTall() * 1.7)
	end
	container:SetWide(timedGStore.inMenu:GetWide() * 2)
	container.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, cols.panes)
	end

	local stat1 = vgui.Create("DLabel", container)
	stat1:Dock(TOP)
	stat1:SetFont("Trebuchet18")
	stat1:SetContentAlignment(2)
	stat1:SetText("Use Period: " .. (v.length == 0 && "Permanent" || string.NiceTime(v.length)))

	if info[k] then
		local stat2 = vgui.Create("DLabel", container)
		stat2:Dock(TOP)
		stat2:SetFont("Trebuchet18")
		stat2:SetContentAlignment(2)
		stat2:SetText("Time left: " .. (v.length == 0 && "Permanent" || string.NiceTime(info[k].expiretime - os.time())))
	end

	local mdl = vgui.Create("DModelPanel", timedGStore.inMenu)
	mdl:Dock(TOP)
	mdl:SetTall(timedGStore.inMenu:GetTall() * 10)
	mdl:SetModel(itm.WorldModel)
	mdl.bk = mdl.Paint
	mdl.Paint = function(self, w, h)
		surface.SetTexture(degree)
		surface.SetDrawColor(cols.panes)
		surface.DrawTexturedRect(0, h - 64, w, 64)
		self:bk(w, h)
	end
	local mn, mx = mdl.Entity:GetRenderBounds()
	local size = 0
	size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
	size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
	size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

	mdl:SetFOV( 45 )
	mdl:SetCamPos( Vector( size, size, size ) )
	mdl:SetLookAt( ( mn + mx ) * 0.5 )

	local btn = vgui.Create("DButton", timedGStore.inMenu)
	btn:Dock(BOTTOM)
	btn:SetTall(timedGStore.inMenu:GetTall() * 1.5)
	btn:SetText(info[k] && "Spawn" || GAMEMODE.Config.currency .. string.Comma(v.price))
	btn:SetFont("Trebuchet24")
	btn:SetTextColor(cols.white)
	btn.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, cols.panes)
	end
	btn.DoClick = function(self)
		net.Start("timedgstore_doAction")
		net.WriteString(k)
		net.WriteInt(info[k] && 0 || 1, 8)
		net.SendToServer()
		TGStore:Remove()
	end
end

function timedGStore.Menu(info)
	if !info then return end
	if TGStore then
		TGStore:Remove()
	end
	local w, h = ScrW(), ScrH()
	TGStore = vgui.Create("DPanel")
	TGStore:SetSize(w * .4, h * .35)
	TGStore:Center()
	TGStore:MakePopup()
	TGStore:SetAlpha(0)
	TGStore:AlphaTo(255, .25)
	TGStore.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, cols.bg)
	end
	TGStore.myInfo = info

	local head = vgui.Create("DPanel", TGStore)
	head:Dock(TOP)
	head:SetTall(TGStore:GetTall() * .15)
	head.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, cols.head)
	end

	local cBtn = vgui.Create("DButton", head)
	cBtn:Dock(RIGHT)
	cBtn:DockMargin(5, 5, 5, 5)
	cBtn:SetText("X")
	cBtn:SetFont("Trebuchet24")
	cBtn:SetTextColor(cols.white)
	cBtn.Paint = function(self, w, h)
		-- draw.RoundedBox(0, 0, 0, w, h, cols.bg)
		-- draw.SimpleText("X", "Trebuchet24", w/2, h/2, cols.white)
	end
	cBtn.DoClick = function()
		TGStore:Remove()
	end

	local scroll = vgui.Create("DScrollPanel", TGStore)
	scroll:Dock(FILL)
	scroll:GetVBar():SetWide(0)

	local li = vgui.Create("DGrid", scroll)
	li:Dock(FILL)
	li:SetCols(4)
	li:SetColWide(TGStore:GetWide() / 4)
	li:SetRowHeight(TGStore:GetTall() / 6)

	for k, v in pairs(timedGStore.weapons) do
		local itm = weapons.Get(k)
		local wep = vgui.Create("DButton")
		wep:SetText(itm.PrintName || k)
		wep:SetTextColor(cols.white)
		wep:SetFont("Trebuchet18")
		wep:SetWide(TGStore:GetWide() / 4)
		wep:SetTall(TGStore:GetTall() / 6)
		wep.Paint = function(self, w, h)
			btnFade(self, w, h, FrameTime() * 4, cols.white)
			draw.RoundedBox(6, 5, 5, w-10, h-10, cols.panes)
		end
		wep.DoClick = function()
			timedGStore.innerMenu(k, v, itm)
		end
		li:AddItem(wep)
	end
end

net.Receive("timedgstore_menu", function()
	local data = net.ReadTable()
	timedGStore.Menu(data)
end)	