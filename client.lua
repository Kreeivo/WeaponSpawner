function spawnWeapon(weaponHash)

    local playerPed = PlayerPedId()

    if IsModelInCdimage(playerPed) and IsWeaponValid(weaponHash) then
        GiveWeaponToPed(playerPed, weaponHash, 100, false, true) 
        while not HasWeaponAssetLoaded(weaponHash) do
            Citzen.wait(0)
        end

    else

        TriggerEvent('chat:addMessage',{
            color = {255, 0, 0, 0},
            multiline = true,
            args = {"Me", "Weapon Hash is invalid!"}
        })

    end
end

RegisterCommand("weapon", function(source, args)

    if #args > 0 then
        local weaponHash = args[1]
        spawnWeapon(weaponHash)

    else
        
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Me", "Please Provide a Weapon Hash!"}
        })

    end
end)