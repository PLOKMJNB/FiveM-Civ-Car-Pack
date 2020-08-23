local Pool = MenuPool.New()
local MainMenu = UIMenu.New('PLOKs Add-On Menu', '~b~Spawn custom added vehicles')
local SettingsMenu = UIMenu.New('Settings', 'Settings for the "Add-On Vehicles" menu')
local SubMenus = {}; Items = {}
Pool:Add(MainMenu)
Pool:Add(SettingsMenu)

-- Actual Menu [

local IsAdmin, Model

RegisterNetEvent('AOVSM:AdminStatusChecked')
AddEventHandler('AOVSM:AdminStatusChecked', function(State) --Just Don't Edit!
	IsAdmin = State
end)


Citizen.CreateThread(function() --Controls
	AOVSM.CheckStuff()

	local Time
	while true do
		Citizen.Wait(0)

        Pool:ProcessMenus()

		if GetIsControlPressed(AOVSM.SettingsKey) and GetIsControlJustPressed(AOVSM.KBKey) and GetLastInputMethod(2) and AOVSM.SettingsAllowed then
			MainMenu:Visible(false)
			for SubMenuIndex, SubMenu in pairs(SubMenus) do
				SubMenu:Visible(false)
			end

			SettingsMenu:Visible(not SettingsMenu:Visible())
		elseif ((GetIsControlJustPressed(AOVSM.KBKey) and GetLastInputMethod(2)) or ((GetIsControlPressed(AOVSM.GPKey1) and GetIsControlJustPressed(AOVSM.GPKey2)) and not GetLastInputMethod(2))) then
			SettingsMenu:Visible(false)
			if MainMenu:Visible() then
				MainMenu:Visible(false)
			else
				local SubMenuClosed = false
				for SubMenuIndex, SubMenu in pairs(SubMenus) do
					if SubMenu:Visible() then
						SubMenu:Visible(false)
						SubMenuClosed = true
					end
				end
				if not SubMenuClosed then
					MainMenu:Visible(true)
				end
				SubMenuClosed = false
			end
		end
	end
end)

RegisterNetEvent('AOVSM:GotVehicles')
AddEventHandler('AOVSM:GotVehicles', function(AddOnVehicles)
	for Key, Value in pairs(AddOnVehicles) do
		if Value.Class == 'N/A' then
			AddOnVehicles[Key].Class = GetVehicleClassFromName(GetHashKey(Value.SpawnName))
		end

		local Vehicle = UIMenuItem.New(Value.DisplayName, 'Model: ' .. Value.SpawnName)
		if AOVSM.UseCategorization then
			if not SubMenus[Value.Class] then
				SubMenus[Value.Class] = Pool:AddSubMenu(MainMenu, Categories[Value.Class] or GetLabelText('VEH_CLASS_' .. tostring(GetVehicleClassFromName(GetHashKey(Value.SpawnName)))))
			end
			
			SubMenus[Value.Class]:AddItem(Vehicle)
		else
			MainMenu:AddItem(Vehicle)
		end
		table.insert(Items, {Vehicle, Value.SpawnName, Value.Class})
	end

	if AOVSM.UseCategorization then
		for SubMenuIndex, SubMenu in pairs(SubMenus) do
			local SubMenuVehicles = {}
			
			for Key, Value in pairs(Items) do
				if Value[3] == SubMenuIndex then
					table.insert(SubMenuVehicles, Value)
				end
			end

			SubMenu.OnItemSelect = function(Sender, Item, Index)
				for Key, Value in pairs(SubMenuVehicles) do
					if Item == Value[1] then
						AOVSM.SpawnVehicle(Value[2])
					end
				end
			end
		end
	else
		MainMenu.OnItemSelect = function(Sender, Item, Index)
			for Key, Value in pairs(Items) do
				if Item == Value[1] then
					AOVSM.SpawnVehicle(Value[2])
				end
			end
		end
	end

	local Despawnable = UIMenuCheckboxItem.New('Despawnable', AOVSM.despawnable)
    SettingsMenu:AddItem(Despawnable)
	local Replace = UIMenuCheckboxItem.New('Replace', AOVSM.autodelete)
    SettingsMenu:AddItem(Replace)
	local MarkOnMap = UIMenuCheckboxItem.New('Mark On Map', AOVSM.mapblip)
    SettingsMenu:AddItem(MarkOnMap)

    SettingsMenu.OnCheckboxChange = function(Sender, Item, Checked)
        if Item == Despawnable then
			AOVSM.despawnable = Checked
        elseif Item == Replace then
			AOVSM.autodelete = Checked
        elseif Item == MarkOnMap then
			AOVSM.mapblip = Checked
		end
    end

	Pool:RefreshIndex()
end)

-- ] Actual Menu

-- Functions [

function AOVSM.SpawnVehicle(Model)
	Model = GetHashKey(Model)
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	if IsModelValid(Model) then
		if AOVSM.autodelete then
			if IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityAsMissionEntity(Object, 1, 1)
				SetEntityAsMissionEntity(GetVehiclePedIsIn(PlayerPedId(), false), 1, 1)
				DeleteEntity(Object)
				DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
			end
		end
		RequestModel(Model)
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		local veh = CreateVehicle(Model, x, y, z + 1, GetEntityHeading(PlayerPedId()), true, true)
		SetPedIntoVehicle(PlayerPedId(), veh, -1)
		if AOVSM.despawnable then
			SetEntityAsNoLongerNeeded(veh)
		else
			SetVehicleHasBeenOwnedByPlayer(veh, true)
		end

		if AOVSM.mapblip then
			local vehBlip = AddBlipForEntity(veh)
			SetBlipColour(vehBlip, 3)
		end
		SetVehicleModKit(veh, 0)
		SetModelAsNoLongerNeeded(Model)
	else
		SetNotificationTextEntry('STRING')
		AddTextComponentString('~r~Invalid Model!')
		DrawNotification(false, false)
	end
end

function AOVSM.CheckStuff()
	IsAdmin = nil
	if AOVSM.OnlyForAdmins then
		TriggerServerEvent('AOVSM:CheckAdminStatus')
		while (IsAdmin == nil) do
			Citizen.Wait(0)
		end
		if IsAdmin then
			TriggerServerEvent('AOVSM:GetVehicles')
		end
	else
		TriggerServerEvent('AOVSM:GetVehicles')
	end
end

function GetIsControlPressed(Control)
	if IsControlPressed(1, Control) or IsDisabledControlPressed(1, Control) then
		return true
	end
	return false
end

function GetIsControlJustPressed(Control)
	if IsControlJustPressed(1, Control) or IsDisabledControlJustPressed(1, Control) then
		return true
	end
	return false
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght, NoSpaces)
	AddTextEntry(GetCurrentResourceName() .. '_KeyboardHead', TextEntry)
	DisplayOnscreenKeyboard(1, GetCurrentResourceName() .. '_KeyboardHead', '', ExampleText, '', '', '', MaxStringLenght)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		if NoSpaces == true then
			drawNotification('~y~NO SPACES!')
		end
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(500)
		return nil
	end
end
	
-- ] Functions

