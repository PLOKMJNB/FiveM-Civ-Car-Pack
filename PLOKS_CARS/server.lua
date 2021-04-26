-- Sets server list convar
SetConvarServerInfo('tags', 'PLOKS_CARS')
-- Setup for the version check
updatePath = "/PLOKMJNB/FiveM-Civ-Car-Pack" -- your git user/repo path
resourceName = "PLOKS_CARS ("..GetCurrentResourceName()..")" -- the resource name
-- Console stuff
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
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!
    
        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
            print("\n###############################")
            print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
            print("\n###############################")
        elseif tonumber(curVersion) > tonumber(responseText) then
            print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
        else
            print("\n"..resourceName.." is up to date, have fun!")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
    end)
end)
