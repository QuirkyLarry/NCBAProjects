local surface_SetDrawColor = surface.SetDrawColor

function draw.OutlinedBox( x, y, w, h, thickness, clr )
    surface_SetDrawColor( clr )
    for i=0, thickness - 1 do
        surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
    end
end

local function manageBorder()
	if cl3ptute_cfg.bordercol == "rainbow" then
		return HSVToColor( CurTime() % 6 * 60, 1, 1 )
	else
		return cl3ptute_cfg.bordercol
	end
end
net.Receive("cl3ptute_menu", function()
	local target = net.ReadEntity()
	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*0.3, ScrH()*0.2)
	main:Center()
	main:SetTitle("")
	main:SetAlpha(0)
	main:AlphaTo(255,.5)
	main:MakePopup()
	main.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(25,25,25,150))
		draw.OutlinedBox(0,0,w,h,2,manageBorder())
		local txt = string.Replace(cl3ptute_cfg.offeringTxt,"%name%",target:Nick())
		draw.SimpleText(txt,"Trebuchet24",w/2,h*0.3,cl3ptute_cfg.txtcol,1,1)
	end

	local val = vgui.Create("DNumberWang", main)
	val:SetSize(main:GetWide()*0.15,main:GetTall()*0.15)
	val:Center()
	val:SetMax(cl3ptute_cfg.maximumSell)
	val:SetMin(cl3ptute_cfg.minimumSell)
	val:SetValue(cl3ptute_cfg.minimumSell)

	local submit = vgui.Create("DButton", main)
	submit:SetSize(main:GetWide()*0.3,main:GetTall()*0.15)
	submit:SetPos(0,main:GetTall()*0.7)
	submit:CenterHorizontal()
	submit:SetText("")
	submit.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,cl3ptute_cfg.btncol)
		draw.SimpleText(cl3ptute_cfg.btntxt,"Trebuchet18",w/2,h/2,cl3ptute_cfg.btntxtcol,1,1)
	end
	submit.DoClick = function()
		net.Start("cl3ptute_handlerequest")
		net.WriteInt(1, 32)
		net.WriteEntity(target)
		local amt = math.floor(val:GetValue())
		net.WriteInt(amt, 32)
		net.SendToServer()
		main:Close()
	end
end)
local effectbox = (effectbox || nil)
net.Receive("cl3ptute_handlerequest", function()
	local typ = net.ReadInt(32)
	if typ == 1 then
		local person = net.ReadEntity()
		local offer = net.ReadInt(32)
		local index = net.ReadInt(32)
		local main = vgui.Create("DPanel")
		main:SetSize(ScrW()*0.2,ScrH()*0.1)
		main:SetPos(-main:GetWide(),0)
		main:MoveTo(0,0,1,0,-1, function()
			timer.Simple(15, function()
				if main:IsValid() then
					main:MoveTo(ScrW(),0,.5,0,2, function()
						main:Remove()
						net.Start("cl3ptute_handlerequest")
						net.WriteInt(10, 32)
						net.WriteInt(index, 32)
						net.SendToServer()
					end)
				end
			end)
		end)
		main.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,cl3ptute_cfg.bgcol)
			draw.SimpleText(person:Nick() .. " has offered their services for $" .. string.Comma(offer),"Trebuchet18",w/2,h*0.25,Color(255,255,255),1,1)
			draw.OutlinedBox(0,0,w,h,2,manageBorder())
		end

		local accept = vgui.Create("DButton", main)
		accept:SetSize(main:GetWide()*0.2,main:GetTall()*0.2)
		accept:SetPos(main:GetWide()*0.2,main:GetTall()*0.6)
		accept:SetText("")
		accept.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(0,255,0))
			draw.SimpleText("Accept","Trebuchet18",w/2,h/2,Color(255,255,255),1,1)
		end
		accept.DoClick = function()
			net.Start("cl3ptute_handlerequest")
			net.WriteInt(2, 32)
			net.WriteInt(index, 32)
			net.SendToServer()
			accept.DoClick = function() end
			main:MoveTo(ScrW(),0,.5,0,2, function()
				main:Remove()
			end)
		end

		local deny = vgui.Create("DButton", main)
		deny:SetSize(main:GetWide()*0.2,main:GetTall()*0.2)
		deny:SetPos(main:GetWide()-deny:GetWide()-main:GetWide()*0.2,main:GetTall()*0.6)
		deny:SetText("")
		deny.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
			draw.SimpleText("Deny","Trebuchet18",w/2,h/2,Color(255,255,255),1,1)
		end
		deny.DoClick = function()
			net.Start("cl3ptute_handlerequest")
			net.WriteInt(3, 32)
			net.WriteInt(index, 32)
			net.SendToServer()
			deny.DoClick = function() end
			main:MoveTo(ScrW(),0,.5,0,2, function()
				main:Remove()
			end)
		end
	elseif typ == 2 then
		local enabled = net.ReadBool()
		if enabled then
			effectbox = vgui.Create("DPanel")
			effectbox:SetSize(ScrW(),ScrH())
			effectbox.Paint = function(self,w,h)
				draw.RoundedBox(0,0,0,w,h,Color(math.abs(math.sin(CurTime()*5)*255),math.abs(math.sin(CurTime()*3)*255),math.abs(math.sin(CurTime()*4)*255),math.abs(math.sin(CurTime()*3)*255)))
			end
		else
			effectbox:AlphaTo(0,.5,0, function()
				effectbox:Remove()
			end)
		end
	end
end)