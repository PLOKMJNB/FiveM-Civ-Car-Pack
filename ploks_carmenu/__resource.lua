resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Add-On Vehicle Spawn Menu" -- Resource Descrption

dependencies {
    'NativeUI',
}

client_script {
	'@NativeUI/NativeUI.lua',
	'Client/Preload.lua',
	'Config.lua',
	'Categories.lua',
	'Client/Client.lua',
}

server_script {
	'Server/Server.lua',
}

-- Add-On Vehicle Spawn Menu Made By: FlatracerMOD (aka Flatracer)
