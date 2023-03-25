GlobalState = false

function TimerThread()
	GlobalState = true
	local math = math.random(500000, 900000)
    print(math)
	Citizen.Wait(math)
	GlobalState = false
end

lib.callback.register('strefy', function()
    local state = GlobalState
    local cupka = math.random(1, 3)
	local money = math.random(1000, 5000)
    local money2 = math.random(30, 60)
    if state == false then
    -- https://docs.esx-framework.org/legacy/Client/functions/shownotification
	exports.ox_inventory:AddItem(source, 'money', money)
    exports['astro_lib']:log(source, 'Gracz ojebal strefke')
    if cupka == 1 then
        exports.ox_inventory:AddItem(source, 'ammo-9', money2)
        TimerThread()
    elseif cupka == 2 then
        exports.ox_inventory:AddItem(source, 'weapon_pistol', 1)
        TimerThread()
    elseif cupka == 3 then
        exports.ox_inventory:AddItem(source, 'ammo-50', money2)
        TimerThread()
    end
else TriggerClientEvent('esx:showNotification',source, 'ta strefa jest juz przejeta', 'error')
    end
end)