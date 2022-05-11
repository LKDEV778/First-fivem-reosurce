--WEAPONS--

RegisterCommand("clearweapons", function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify("~r~Cleared All Weaopons")
end, false)

Citizen.CreateThread(function()
    local h_key = 74
    local x_key = 73
    while true do 
        Citizen.Wait(1)
        if IsControlJustPressed(1, h_key) then
            print("the key".. h_key .. "was pressed")
            giveWeapon("weapon_pistol")
            giveWeapon("weapon_knife")
            alert("~b~Given Weapon with ~INPUT_VEH_HEADLIGHT~")
        end
    end
end)

--VEHICLES--
RegisterCommand('spawnveh', function(src, args)
    RequestModel(args[1])
    while not HasModelLoaded(args[1]) do 
        Wait(0)
    end
    local Player = PlayerPedId()
    local pCoords = GetEntityCoords(Player) --vector3
    local pHeading = GetEntityHeading(Player) --Heading
    if IsPedInAnyVehicle(Player, false) then 
        DeleteVehicle(GetVehiclePedIsIn(Player))
    end
    local car = CreateVehicle(GetHashKey(args[1]), pCoords, pHeading, true, false)
    TaskWarpPedIntoVehicle(Player, car, -1)
    notify("~p~Spawn vehicle: " .. args[1])
end)
