GlobalState = false

function TimerThread()
	GlobalState = true
	Citizen.Wait(math.random(500000, 900000))
	GlobalState = false
end

lib.callback.register('strefy', function()
    local state = GlobalState
    local item = math.random(1, 3)
    local ammo = math.random(30, 60)
    local money = math.random(1000, 5000)

    if state == false then
        exports.ox_inventory:AddItem(source, 'money', money)
        exports['astro_lib']:log(source, 'Gracz ojebal strefke')
        if item == 1 then
            exports.ox_inventory:AddItem(source, 'ammo-9', ammo)
            TimerThread()
        elseif item == 2 then
            exports.ox_inventory:AddItem(source, 'weapon_pistol', 1)
            TimerThread()
        elseif item == 3 then
            exports.ox_inventory:AddItem(source, 'ammo-50', ammo)
            TimerThread()
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'ta strefa jest juz przejeta', 'error')
    end
end)
