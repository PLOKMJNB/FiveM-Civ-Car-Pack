SetConvarServerInfo('tags', 'PLOKS_CARS')
                  
AddEventHandler('onResourceStart', function(resource)
    if resource ~= 'PLOKS_CARS' then
       print("------------------------------------------------------------------------------------")
       print("Please use the default resource name PLOKS_CARS to prevent issues with the car pack")
       print("------------------------------------------------------------------------------------")
    else
        print("   __ __  _____ ")
        print("  / //_/ / _  / |                                Thanks for using my car pack!                                    ")
        print(" / ,<   / // /  |-------------------------------------------------------------------------------------------------")
        print("/_/|_| /____/   | If your ever looking for a better host than Zap or any unauthorized GSP check out khandesign.net")
    end
end)
