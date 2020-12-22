SetConvarServerInfo('tags', 'PLOKS_CARS')

message = false
Citizen.CreateThread(function()
    Wait(1000)
    while message == false do
        message = true
        print("   __ __  _____ ")
        print("  / //_/ / _  / |                                Thanks for using my car pack!                                    ")
        print(" / ,<   / // /  |-------------------------------------------------------------------------------------------------")
        print("/_/|_| /____/   | If your ever looking for a better host than Zap or any unauthorized GSP check out khandesign.net")
    end
end)

if GetCurrentResourceName() ~= "PLOKS_CARS" then 
  while true do 
    print("Please Dont Change the resource name I'd suggest you change it back.")  
  end
end
                     



