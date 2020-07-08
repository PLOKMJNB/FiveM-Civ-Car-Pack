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

function AddAstonMartin(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Aston Martin", "All ~b~Aston Martin cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Aston Martin DBX Carbon Edition", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("amdbx")
        end
        submenu:AddItem(Item)
		
end

function AddAudi(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Audi", "All ~b~Audi cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("1983 Audi Quattro Sport", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("audquattros")
        end
        submenu:AddItem(Item)

        local Item = NativeUI.CreateItem("2020 Audi RS7", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("rs72020")
        end
        submenu:AddItem(Item)
		
end

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

function AddBMW(menu)
    local submenu = _menuPool:AddSubMenu(menu, "BMW", "All ~b~BMW cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("1995 BMW M5 E34", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("e45")
        end
        submenu:AddItem(Item)

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

function AddCorvette(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Corvette", "All ~b~Corvette cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Chevrolet Corvette C5 Z06", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("corvettec5z06")
        end
        submenu:AddItem(Item)
        
        local Item = NativeUI.CreateItem("2009 Chevrolet Corvette ZR1", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("czr1")
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

function AddFord(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Ford", "All ~b~Ford cars", 1400, 10)
    for i = 1, 1, 1 do 

	    local Item = NativeUI.CreateItem("1978 Ford F150 XLT Ranger", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("f15078")
        end
        submenu:AddItem(Item)
        
    end
end

function AddHonda(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Honda", "All ~b~Honda cars", 1400, 10)
    for i = 1, 1, 1 do 

	    local Item = NativeUI.CreateItem("Honda CRX SiR 1991", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("honcrx91")
        end
        submenu:AddItem(Item)
        
        local Item = NativeUI.CreateItem("1997 Honda Civic Sedan Drag Version", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("dragekcivick")
        end
        submenu:AddItem(Item)

    end
end

function AddKoenigsegg(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Koenigsegg", "All ~b~Koenigsegg cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2020 Koenigsegg Jesko", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("jes")
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

function AddLotus(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Lotus", "All ~b~Lotus cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2002 Lotus Esprit V8", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("esprit02")
        end
        submenu:AddItem(Item)
        
    end
end

function AddLucis(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Lucis", "All ~b~Lucis cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Quartz Regalia 723", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("regalia")
        end
        submenu:AddItem(Item)
        
    end
end

function AddMazda(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Mazda", "All ~b~Mazda cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("1984 Mazda RX-7 Stanced Version", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("84rx7k")
        end
        submenu:AddItem(Item)

        local Item = NativeUI.CreateItem("Mazda RX-7 FD", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("majfd")
        end
        submenu:AddItem(Item)
        
    end
end

function AddMercedes(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Mercedes", "All ~b~Mercedes cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2020 Mercedes-Benz AMG GT-R Roadster", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("amggtrr20")
        end
        submenu:AddItem(Item)

        local Item = NativeUI.CreateItem("2019 Mercedes-Benz E400 Coupe 4matic (C238)", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("e400")
        end
        submenu:AddItem(Item)
        
    end
end

function AddMitsubishi(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Mitsubishi", "All ~b~Mitsubishi cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("Mitsubishi FTO GP Version-R", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("fto")
        end
        submenu:AddItem(Item)
        
    end
end

function AddNissan(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Nissan", "All ~b~Nissan cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2017 Nissan Titan Warrior", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("nissantitan17")
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

function AddRollsRoyce(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Rolls Royce", "All ~b~Rolls Royce cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2014 Rolls Royce Phantom Coupe", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("RollsRoyceCP")
        end

        submenu:AddItem(Item)
        local Item = NativeUI.CreateItem("2018 Rolls-Royce Phantom VIII", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("rrphantom")
        end
        submenu:AddItem(Item)
        
    end
end

function AddToyota(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Toyota", "All ~b~Toyota cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("2002 Toyota MR-S", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("mr2zzw30")
        end
        submenu:AddItem(Item)
        
    end
end

function AddWMotors(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Range Rover", "All ~b~W Motors cars", 1400, 10)
    for i = 1, 1, 1 do 

        local Item = NativeUI.CreateItem("WMotors Fenyr Supersport", "~b~Spawn")
        Item.Activated = function(SelectedItem)
            spawnCar("wmfenyr")
        end
        submenu:AddItem(Item)
        
    end
end

AddAstonMartin(mainMenu)
AddAudi(mainMenu)
AddBMW(mainMenu)
AddCadillac(mainMenu)
AddChevrolet(mainMenu)
AddCorvette(mainMenu)
AddFerrari(mainMenu)
AddFord(mainMenu)
AddHonda(mainMenu)
AddKoenigsegg(mainMenu)
AddLexus(mainMenu)
AddLotus(mainMenu)
AddLucis(mainMenu)
AddMazda(mainMenu)
AddMercedes(mainMenu)
AddMitsubishi(mainMenu)
AddNissan(mainMenu)
AddPorsche(mainMenu)
AddRangeRover(mainMenu)
AddRollsRoyce(mainMenu)
AddToyota(mainMenu)
AddWMotors(mainMenu)
_menuPool:RefreshIndex()



--Functions--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
		RegisterCommand('vip1',function(scource, args)
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
end);