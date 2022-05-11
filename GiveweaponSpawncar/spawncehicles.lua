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
end)