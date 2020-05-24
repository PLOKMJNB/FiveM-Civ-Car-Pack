_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("~u~PLOK's Car Menu", "~c~Main Menu - made by PLOKMJNB#8692", 1400, 10)
_menuPool:Add(mainMenu)


            
--[[Replace Car Checkbox]]--

bool = true

function FirstItem(menu)
   local checkbox = NativeUI.CreateCheckboxItem("Replace Previous Car", bool, "Replace Toggle")
   menu:AddItem(checkbox)
   menu.OnCheckboxChange = function (sender, item, checked_)
        if item == checkbox then
            bool = checked_
            notify("Replace Previous Car Is Off")
        end
    end
end

--[[Cadillac]]--

function AddCadillac(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Cadillac", "All ~b~Cadillac's cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2021 Cadillac Escalade", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("cesc21")
        end
        submenu:AddItem(Item)
        
    end
end

AddCadillac(mainMenu)
_menuPool:RefreshIndex()



--Functions--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
		RegisterCommand('/car menu',function(scource, args)
            mainMenu:Visible(not mainMenu:Visible())
		end, false)
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end



function spawnCar(car)
    _menuPool:RefreshIndex()
    local car = GetHashKey(car)
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    if IsModelValid(car) then
        if FirstItem then
            if IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityAsMissionEntity(car, 1, 1)
				SetEntityAsMissionEntity(GetVehiclePedIsIn(PlayerPedId(), false), 1, 1)
				DeleteEntity(car)
                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
            end
        end
    end

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end
    
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    SetEntityAsMissionEntity(vehicle, true, true) 
end

function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end




_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

CreateThread(function()
while true do
Wait(0)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false)
end
end)