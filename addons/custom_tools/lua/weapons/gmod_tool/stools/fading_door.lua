TOOL.Category = "Construction"
TOOL.Name = "#tool.fading_door.name"

TOOL.ClientConVar["key"] = "5"
TOOL.ClientConVar["toggle"] = "1"
TOOL.ClientConVar["reversed"] = "0"

-- create convar fading_door_nokeyboard (default 0)
local noKeyboard = CreateConVar("fading_door_nokeyboard", "0", FCVAR_ARCHIVE, "Set to 1 to disable using fading doors with the keyboard")

local function checkTrace(tr)
	-- edgy, yes, but easy to read

	return tr.Entity
		and tr.Entity:IsValid()
		and not (
			tr.Entity:IsPlayer()
			or tr.Entity:IsNPC()
			or tr.Entity:IsVehicle()
			or tr.HitWorld
		)
end

if CLIENT then
	-- handle languages
	language.Add( "tool.fading_door.name", "Fading Door" )
	language.Add( "tool.fading_door.desc", "Makes an object fade away when activated." )
	language.Add( "tool.fading_door.0", "Click on an object to make it a fading door." )
	language.Add( "Undone_fading_door", "Undone Fading Door" )
	-- handle tool panel
	function TOOL:BuildCPanel()
		self:AddControl( "Header", { Text = "#tool.fading_door.name", Description = "#tool.fading_door.desc" } )
		self:AddControl( "CheckBox", { Label = "Start Faded", Command = "fading_door_reversed" } )
		self:AddControl( "CheckBox", { Label = "Toggle", Command = "fading_door_toggle" } )
		self:AddControl( "Numpad", { Label = "Fade", ButtonSize = "22", Command = "fading_door_key" } )
	end
	-- leftclick trace function
	TOOL.LeftClick = checkTrace
	return
end

local function fadeActivate(self)
	self.fadeActive = true
	
	self.fadeMaterial = self:GetMaterial()
	self.fadeColor = self:GetColor()
	self:SetMaterial("sprites/heatwave") -- sprites/heatwave
	--self:DrawTranslucent(true)
	self:DrawShadow(false)
	self:SetNotSolid(true)

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		self.fadeMoveable = phys:IsMoveable()
		phys:EnableMotion(false)
	end
end

local function fadeDeactivate(self)
	self.fadeActive = false

	self:SetMaterial(self.fadeMaterial or "")
	self:SetColor(self.fadeColor or color_white)

	self:DrawShadow(false)
	self:SetNotSolid(false)

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		phys:EnableMotion(self.fadeMoveable or false)
	end
end

local function fadeToggleActive(self, ply)
	if noKeyboard:GetBool() and not numpad.FromButton() then
		ply:ChatPrint("You cannot use fading doors with the keyboard on this server.")
		ply:ChatPrint("Try using a button or keypad instead.")
		return
	end

	if self.fadeActive then
		self:fadeDeactivate()
	else
		self:fadeActivate()
	end
end

local function onUp(ply, ent)
	if not (ent:IsValid() and ent.fadeToggleActive and not ent.fadeToggle) then
		return
	end

	ent:fadeToggleActive(ply)
end

numpad.Register("Fading Door onUp", onUp)

local function onDown(ply, ent)
	if not (ent:IsValid() and ent.fadeToggleActive) then
		return
	end

	ent:fadeToggleActive(ply)
end

numpad.Register("Fading Door onDown", onDown)

local function onRemove(self)
	numpad.Remove(self.fadeUpNum)
	numpad.Remove(self.fadeDownNum)
end

local function dooEet(ply, ent, stuff)
	if ent.isFadingDoor then
		ent:fadeDeactivate()
		onRemove(ent)
	else
		ent.isFadingDoor = true

		ent.fadeActivate = fadeActivate
		ent.fadeDeactivate = fadeDeactivate
		ent.fadeToggleActive = fadeToggleActive

		ent:CallOnRemove("Fading Door", onRemove)
	end

	ent.fadeUpNum = numpad.OnUp(ply, stuff.key, "Fading Door onUp", ent)
	ent.fadeDownNum = numpad.OnDown(ply, stuff.key, "Fading Door onDown", ent)
	ent.fadeToggle = stuff.toggle

	if stuff.reversed then
		ent:fadeActivate()
	end

	duplicator.StoreEntityModifier(ent, "Fading Door", stuff)

	return true
end

duplicator.RegisterEntityModifier("Fading Door", dooEet)

if not FadingDoor then
	local function legacy(ply, ent, data)
		return dooEet(ply, ent, {
			key      = data.Key,
			toggle   = data.Toggle,
			reversed = data.Inverse,
		})
	end

	duplicator.RegisterEntityModifier("FadingDoor", legacy)
end

local function doUndo(undoData, ent)
	if IsValid(ent) then
		onRemove(ent)
		ent:fadeDeactivate()
		ent.isFadingDoor = false
	end
end

function TOOL:LeftClick(tr)
	if not checkTrace(tr) then
		return false
	end

	local ent = tr.Entity
	local ply = self:GetOwner()

	dooEet(ply, ent, {
		key      = self:GetClientNumber("key"),
		toggle   = self:GetClientNumber("toggle") == 1,
		reversed = self:GetClientNumber("reversed") == 1,
	})

	undo.Create("Fading_Door")
		undo.AddFunction(doUndo, ent)
		undo.SetPlayer(ply)
	undo.Finish()

	return true
end
