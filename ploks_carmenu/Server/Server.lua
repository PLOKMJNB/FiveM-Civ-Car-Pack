--Update Check

local LatestVersion = ''; CurrentVersion = '3.0.3'
local GithubResourceName = 'AddOnVehicleSpawnMenu'

PerformHttpRequest('https://raw.githubusercontent.com/Flatracer/FiveM_Resources/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/Flatracer/FiveM_Resources/master/' .. GithubResourceName .. '/CHANGES', function(Error, Changes, Header)
		LatestVersion = NewestVersion
		print('\n')
		print('##############')
		print('## ' .. GetCurrentResourceName())
		print('##')
		print('## Current Version: ' .. CurrentVersion)
		print('## Newest Version: ' .. NewestVersion)
		print('##')
		if CurrentVersion ~= NewestVersion then
			print('## Outdated')
			print('## Check the Topic (type DownloadAOVSM and press enter)')
			print('## For the newest Version!')
			print('##############')
			print('CHANGES:\n' .. Changes)
		else
			print('## Up to date!')
			print('##############')
		end
		print('\n')
	end)
end)

AddEventHandler('rconCommand', function(Name, Arguments)
	if Name == 'DownloadAOVSM' and CurrentVersion ~= LatestVersion then
		if os.getenv('HOME') then
			os.execute('open https://forum.fivem.net/t/release-add-on-vehicle-spawn-menu/53063')
		else
			os.execute('start https://forum.fivem.net/t/release-add-on-vehicle-spawn-menu/53063')
		end
	end
end)

--Add-On Vehicles
AddOnVehiclesTable = {}

Citizen.CreateThread(function()
	local AddOnVehiclesTXT = LoadResourceFile(GetCurrentResourceName(), 'Add-On Vehicles.txt'):gsub('\r', '\n')
	if AddOnVehiclesTXT ~= nil and AddOnVehiclesTXT ~= '' then
		if not (AddOnVehiclesTXT:find('SpawnName') or AddOnVehiclesTXT:find('DisplayName')) then
			AddOnVehiclesTable = GetAddOns(AddOnVehiclesTXT)
		elseif AddOnVehiclesTXT:find('SpawnName') or AddOnVehiclesTXT:find('DisplayName') then
			print('Add-On Vehicles.txt format isn\'t correct, correcting it now.')
			AddOnVehiclesTXT = AddOnVehiclesTXT:gsub('\nDisplayName: \n', ''):gsub('\nSpawnName: ', ''):gsub('SpawnName: ', ''):gsub('\nDisplayName: ', ':')
			SaveResourceFile(GetCurrentResourceName(), 'Add-On Vehicles.txt', AddOnVehiclesTXT, -1)
			
			AddOnVehiclesTable = GetAddOns(AddOnVehiclesTXT)
		else
			print('Add-On Vehicles.txt format is unknown!')
		end
	else
		print('Add-On Vehicles.txt not found or empty!')
	end
end)

RegisterServerEvent('AOVSM:GetVehicles') --Just Don't Edit!
AddEventHandler('AOVSM:GetVehicles', function() --Gets the Add-On Vehicles
	TriggerClientEvent('AOVSM:GotVehicles', source, AddOnVehiclesTable)
end)

--Admin Check

RegisterServerEvent('AOVSM:CheckAdminStatus') --Just Don't Edit!
AddEventHandler('AOVSM:CheckAdminStatus', function()
	local IDs = GetPlayerIdentifiers(source)
	local Admins = LoadResourceFile(GetCurrentResourceName(), 'Admins.txt')
	local AdminsSplitted = stringsplit(Admins, '\n')
	for k, AdminID in pairs(AdminsSplitted) do
		local AdminID = AdminID:gsub(' ', '')
		local SingleAdminsSplitted = stringsplit(AdminID, ',')
		for _, ID in pairs(IDs) do
			if ID:lower() == SingleAdminsSplitted[1]:lower() or ID:lower() == SingleAdminsSplitted[2]:lower() or ID:lower() == SingleAdminsSplitted[3]:lower() then
				TriggerClientEvent('AOVSM:AdminStatusChecked', source, true); return
			end
		end
	end
end)

AddEventHandler('es:playerLoaded', function(Source, user) --Checks if Player is a ESMode Admin
	if user.getGroup() == 'admin' or user.getGroup() == 'superadmin' then
		TriggerClientEvent('AOVSM:AdminStatusChecked', Source)
	end
end)

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function GetAddOns(AddOnVehiclesTXT)
	local AddOnVehiclesTXTSplitted = stringsplit(AddOnVehiclesTXT, '\n')
	local ReturnTable = {}
	
	for Key, Value in ipairs(AddOnVehiclesTXTSplitted) do
		if Value:find(':') then
			local VehicleInformations = stringsplit(Value, ':')
			if #VehicleInformations >= 2 then
				local SpawnName = VehicleInformations[1]
				local DisplayName = VehicleInformations[2]
				local Class = tonumber(VehicleInformations[3]) or 'N/A'
				if SpawnName and SpawnName ~= '' and DisplayName and DisplayName ~= '' then
					table.insert(ReturnTable, {['SpawnName'] = SpawnName, ['DisplayName'] = DisplayName, ['Class'] = Class})
				end
			end
		end
	end
	return ReturnTable
end

