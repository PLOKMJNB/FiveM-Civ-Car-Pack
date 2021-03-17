SetConvarServerInfo('tags', 'PLOKS_CARS')
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "PLOKS_CARS" then 
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'PLOKS_CARS' then
        print("   __ __  _____ ")
        print("  / //_/ / _  / |                      Thanks for using my car pack!                   ")
        print(" / ,<   / // /  |----------------------------------------------------------------------")
        print("/_/|_| /____/   | Need help or wanna chat with other users? join discord.khandesign.net")
    end
end)
