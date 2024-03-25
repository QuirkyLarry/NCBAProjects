ptute_requests = {}
net.Receive("cl3ptute_handlerequest", function(_,ply)
	local typ = net.ReadInt(32)
	if typ == 1 then
		local target = net.ReadEntity()
		local offering = net.ReadInt(32)
		if !table.HasValue(cl3ptute_cfg.allowedTeams, team.GetName(ply:Team())) then return end
		if offering < cl3ptute_cfg.minimumSell then DarkRP.notify(ply,1,4,"You must offer a minimum of $" .. cl3ptute_cfg.minimumSell) return end
		if offering > cl3ptute_cfg.maximumSell then DarkRP.notify(ply,1,4,"You can't offer more than $" .. cl3ptute_cfg.maximumSell) return end
		if ply:GetPos():Distance(target:GetPos()) > 250 then return end
		if !target:canAfford(offering) then DarkRP.notify(ply,1,4,"This player cannot afford your offering") return end
		if !target:Alive() then return end
		for k, v in pairs(ptute_requests) do
			if target == v.client then
				DarkRP.notify(ply,1,4,"This player already has a request")
				return
			elseif ply == v.sender then
				DarkRP.notify(ply,1,4,"You already have a pending request")
				return
			end
		end
		if target.has_std then
			DarkRP.notify(ply,1,4,"This player has an STD and will die a painful death. You don't want that STD!")
			return
		end
		local ins = table.insert(ptute_requests, {sender = ply, offer = offering, client = target})
		net.Start("cl3ptute_handlerequest")
		net.WriteInt(1, 32)
		net.WriteEntity(ply)
		net.WriteInt(offering, 32)
		net.WriteInt(ins, 32)
		net.Send(target)
	elseif typ == 2 then
		local index = net.ReadInt(32)
		if ptute_requests[index].client ~= ply then return end
		local cur = ptute_requests[index]
		ptute_requests[index] = nil
		if !IsValid(cur.sender) || !IsValid(cur.client) then return end
		if !ply:canAfford(cur.offer) then
			DarkRP.notify(ply,1,4,"You can't afford to pay " .. cur.sender:Nick())
			DarkRP.notify(cur.sender,1,4,ply:Nick() .. " could not afford to pay you")
			return
		end
		ply:addMoney(-cur.offer)
		local pay = (pay || cur.offer)
		for k, v in pairs(player.GetAll()) do
			if table.HasValue(cl3ptute_cfg.pimpJobs,team.GetName(v:Team())) then
				local perc = cur.offer * cl3ptute_cfg.pimpPercentage
				v:addMoney(perc)
				pay = cur.offer - perc
				break
			end
		end
		cur.sender:addMoney(pay)
		local ppl = {ply,cur.sender}
		net.Start("cl3ptute_handlerequest")
		net.WriteInt(2, 32)
		net.WriteBool(true)
		net.Send(ppl)
		for k, v in pairs(ppl) do
			v:Lock()
		end
		local moansounds = {
			"vo/npc/female01/moan01.wav",
			"vo/npc/female01/moan02.wav",
			"vo/npc/female01/moan03.wav",
			"vo/npc/female01/moan04.wav",
			"vo/npc/female01/moan05.wav",
			--"vo/npc/male01/moan01.wav",
			--"vo/npc/male01/moan02.wav",
			--"vo/npc/male01/moan03.wav",
			--"vo/npc/male01/moan04.wav",
			--"vo/npc/male01/moan05.wav"
		}
		table.Random(ppl):EmitSound(table.Random(moansounds),100,100,1)
		timer.Create(ppl[1]:SteamID64() .. "_ptute",3,0, function()
			table.Random(ppl):EmitSound(table.Random(moansounds),100,100,1)
		end)
		timer.Simple(cl3ptute_cfg.sexytime, function()
			net.Start("cl3ptute_handlerequest")
			net.WriteInt(2, 32)
			net.WriteBool(false)
			net.Send(ppl)
			timer.Remove(ppl[1]:SteamID64() .. "_ptute")
			for k, v in pairs(ppl) do
				v:UnLock()
			end
			local chance = math.random(0,100)
			if chance <= cl3ptute_cfg.stdChance then
				ply.has_std = true
				ply:ChatPrint("You were infected with an STD during sexy time! Your HP will slowly degrade until you eventually die.")
				local hurtsounds = {
					"vo/npc/Alyx/hurt04.wav",
					"vo/npc/Alyx/hurt05.wav",
					"vo/npc/Alyx/hurt06.wav",
					"vo/npc/Alyx/hurt08.wav"
				}
				timer.Create(ply:SteamID64() .. "_stdtimer",5,0, function()
					ply:TakeDamage(2)
					ply:EmitSound(table.Random(hurtsounds),100,100,1)
				end)
			end
		end)
	elseif typ == 3 then
		local index = net.ReadInt(32)
		if ptute_requests[index].client ~= ply then return end
		local cur = ptute_requests[index]
		ptute_requests[index] = nil
		cur.sender:ChatPrint(ply:Nick() .. " denied your offer")
	elseif typ == 10 then
		local index = net.ReadInt(32)
		if ptute_requests[index].client == ply then
			ptute_requests[index].sender:ChatPrint(ply:Nick() .. " didn't respond to your request")
			ptute_requests[index] = nil
		end
	end
end)

hook.Add("PlayerDeath","ptute_remove_std_ondeath", function(ply)
	if ply.has_std then
		ply.has_std = nil
		timer.Remove(ply:SteamID64() .. "_stdtimer")
	end
end)

hook.Add("PlayerDisconnected","ptute_remove_ondisconnect", function(ply)
	for k, v in pairs(ptute_requests) do
		if v.sender == ply || v.client == ply then
			ptute_requests[k] = nil
		end
	end
end)