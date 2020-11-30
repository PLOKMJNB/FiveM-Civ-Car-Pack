-- Resource Metadata
fx_version 'cerulean'
games {'gta5'}

author 'PLOKMJNB'
description 'Add-On Vehicle Spawn Menu by FlatracerMOD (aka Flatracer) Adapted for PLOKS Civ Car Pack'
version '1.0.0-final
repository 'https://github.com/PLOKMJNB/FiveM-Civ-Car-Pack'

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
