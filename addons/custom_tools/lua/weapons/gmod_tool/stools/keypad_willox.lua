if (SERVER) then
	CreateConVar("sbox_maxkeypads", 10)
end

TOOL.Category = "Construction"
TOOL.Name = "Fading Door Keypad"
TOOL.Command = nil

TOOL.ClientConVar["password"] = "1234"
TOOL.ClientConVar["secure"] = "1"
TOOL.ClientConVar["length_granted"] = "4"
TOOL.ClientConVar["key_granted"] = "0"

cleanup.Register("keypads")

if CLIENT then
	language.Add("tool.keypad_willox.name", "Keypad")
	language.Add("tool.keypad_willox.0", "Left Click: Create, Right Click: Update")
	language.Add("tool.keypad_willox.desc", "Creates Keypads for secure access")

	language.Add("Undone_Keypad", "Undone Keypad")
	language.Add("Cleanup_keypads", "Keypads")
	language.Add("Cleaned_keypads", "Cleaned up all Keypads")

	language.Add("SBoxLimit_keypads", "You've hit the Keypad limit!")
end

function TOOL:SetupKeypad(ent, pass)
	local data = {
		Password = pass,

		RepeatsGranted = 0,
		RepeatsDenied = 0,

		LengthGranted = self:GetClientNumber("length_granted"),
		LengthDenied = 0,

		DelayGranted = 0.1,
		DelayDenied = 0,

		InitDelayGranted = 0,
		InitDelayDenied = 0,

		KeyGranted = self:GetClientNumber("key_granted"),
		KeyDenied = 0,

		Secure = tobool(self:GetClientNumber("secure"))
	}

	ent:SetKeypadOwner(self:GetOwner())
	ent:SetData(data)
end

function TOOL:RightClick(tr)
	if not IsValid(tr.Entity) or not tr.Entity:GetClass():lower() == "keypad" then return false end

	if CLIENT  then return true end

	local ply = self:GetOwner()
	local password = tonumber(ply:GetInfo("keypad_willox_password"))

	local spawn_pos = tr.HitPos
	local trace_ent = tr.Entity

	if password == nil or (string.len(tostring(password)) > 4) or (string.find(tostring(password), "0")) then
		ply:PrintMessage(3, "Invalid password!")
		return false
	end

	if trace_ent.GetKeypadOwner and trace_ent:GetKeypadOwner() == ply then
		self:SetupKeypad(trace_ent, password)

		return true
	end
end

function TOOL:LeftClick(tr)
	if IsValid(tr.Entity) and tr.Entity:GetClass():lower() == "player" then return false end

	if CLIENT then return true end

	local ply = self:GetOwner()
	local password = self:GetClientNumber("password")

	local spawn_pos = tr.HitPos + tr.HitNormal
	local trace_ent = tr.Entity

	if password == nil or (string.len(tostring(password)) > 4) or (string.find(tostring(password), "0")) then
		ply:PrintMessage(3, "Invalid password!")
		return false
	end

	if not self:GetWeapon():CheckLimit("keypads") then return false end

	local ent = ents.Create("keypad")
	ent:SetPos(spawn_pos)
	ent:SetAngles(tr.HitNormal:Angle())
	ent:Spawn()

	ent:SetPlayer(ply)

	local freeze = 0
	local weld = 1

	if freeze or weld then
		local phys = ent:GetPhysicsObject() 

		if IsValid(phys) then
			phys:EnableMotion(false)
		end
	end

	if weld then
		local weld = constraint.Weld(ent, trace_ent, 0, 0, 0, true, false)
	end

	self:SetupKeypad(ent, password)

	undo.Create("Keypad")
		undo.AddEntity(ent)
		undo.SetPlayer(ply)
	undo.Finish()

	ply:AddCount("keypads", ent)
	ply:AddCleanup("keypads", ent)

	return true
end


if CLIENT then
	local function ResetSettings(ply)
		ply:ConCommand("keypad_willox_length_granted 4")
		ply:ConCommand("keypad_willox_secure 1")
	end

	concommand.Add("keypad_willox_reset", ResetSettings)

	function TOOL.BuildCPanel(CPanel)
		local r, l = CPanel:TextEntry("Access Password", "keypad_willox_password")
		r:SetTall(22)

		CPanel:ControlHelp("Max Length: 4\nAllowed Digits: 1-9")
		CPanel:CheckBox("Secure Mode", "keypad_willox_secure")

		local ctrl = vgui.Create("CtrlNumPad", CPanel)

			ctrl:SetConVar1("keypad_willox_key_granted")
			ctrl:SetLabel1("Access Granted Key")

		CPanel:AddPanel(ctrl)

		local granted = vgui.Create("DForm")
			granted:SetName("Access Granted Settings")
			granted:NumSlider("Hold Length:", "keypad_willox_length_granted", 4, 10, 2)
		CPanel:AddItem(granted)
		CPanel:Button("Default Settings", "keypad_willox_reset")
		CPanel:Help("")

		local faq = CPanel:Help("Information")
			faq:SetFont("GModWorldtip")

		CPanel:Help("You can enter your password with your numpad when numlock is enabled!")
	end
end