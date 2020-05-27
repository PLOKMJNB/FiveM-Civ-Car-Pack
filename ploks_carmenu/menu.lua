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


function AddBMW(menu)
    local submenu = _menuPool:AddSubMenu(menu, "BMW", "All ~b~BMW cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2016 BMW M2", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("m2")
        end
        submenu:AddItem(Item)
		
	local Item = NativeUI.CreateItem("2008 BMW M3 e92", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("m3e92")
        end
        submenu:AddItem(Item)
        
    end
end

--[[Cadillac]]--

function AddBentley(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Bentley", "All ~b~Bentley cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Bentley Bentayga", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("bbentayga")
        end
        submenu:AddItem(Item)
        
    end
end

function AddCadillac(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Cadillac", "All ~b~Cadillac cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2021 Cadillac Escalade", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("cesc21")
        end
        submenu:AddItem(Item)
        
    end
end

function AddChevrolet(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Chevrolet", "All ~b~Chevrolet cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2009 Chevrolet Tahoe", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("09tahoe")
        end
        submenu:AddItem(Item)
        
        local Item = NativeUI.CreateItem("2015 Chevrolet Tahoe", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("15tahoe")
        end
        submenu:AddItem(Item)

    end
end

function AddFerrari(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Ferrari", "All ~b~Ferrari cars", 1400, 10)
    for i = 1, 1, 1 do 

	    local Item = NativeUI.CreateItem("2019 Ferrari Pista 488 Spider", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("pistaspider19")
        end
        submenu:AddItem(Item)
        
    end
end

function AddLexus(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Lexus", "All ~b~Lexus cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Lexus GS 350", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("gs350")
        end
        submenu:AddItem(Item)
        
    end
end

function AddPorsche(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Porsche", "All ~b~Porsche cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Porsche 718 Cayman S", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("718caymans")
        end
        submenu:AddItem(Item)
        
    end
end

function AddRangeRover(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Range Rover", "All ~b~Range Rover cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Range Rover Evoque", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("rrevoque")
        end
        submenu:AddItem(Item)
        
    end
end

AddBentley(mainMenu)
AddBMW(mainMenu)
AddCadillac(mainMenu)
AddChevrolet(mainMenu)
AddFerrari(mainMenu)
AddLexus(mainMenu)
AddPorsche(mainMenu)
AddRangeRover(mainMenu)
_menuPool:RefreshIndex()



--Functions--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
		RegisterCommand('cars',function(scource, args)
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
