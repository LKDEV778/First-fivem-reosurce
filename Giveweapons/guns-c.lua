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