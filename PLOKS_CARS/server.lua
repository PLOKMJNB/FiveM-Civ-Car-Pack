-- Sets server list convar
SetConvarServerInfo('tags', 'PLOKS_CARS')
-- Setup for the version check
updatePath = "/PLOKMJNB/FiveM-Civ-Car-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "PLOKS_CARS" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'PLOKS_CARS' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? or wanna chat with other users? join discord.khandesign.net.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                       Uh Oh! Looks like PLOKS_CARS is outdated")
                print("                     ║ Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? or wanna chat with other users? join discord.khandesign.net.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                Uh Oh! You somehow skipped a few versions of PLOKS_CARS")
                print("                     ║  or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("    _/    _/ _/_/_/  ║                   Hey there! Yeah you, thanks for using my car pack!")
                print("   _/  _/   _/    _/ ║")
                print("  _/_/     _/    _/  ║ Got stuck? or have a question? or wanna chat with other users? join discord.khandesign.net.")
                print(" _/  _/   _/    _/   ║")
                print("_/    _/ _/_/_/      ║                   It looks like PLOKS_CARS is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/PLOKS_CARS/version", checkVersion, "GET")
end)
