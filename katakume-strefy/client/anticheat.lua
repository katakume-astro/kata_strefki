local przejmowanie = false

CreateThread(function() 
    local point = lib.points.new(vec3(58.3158, 3715.3621, 39.7549), 6, {
        strefa = 'strefa',
    })

    function point:onEnter()
        exports['astro_lib']:DrawText('[E] Przejmij strefe', 'right')
    end
    
    function point:onExit()
        exports['astro_lib']:HideText()
        przejmowanie = false
    end
    
    function point:nearby()
        DrawMarker(23, self.coords.x, self.coords.y, self.coords.z-0.7, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 10.0, 10.0, 10.0, 200, 20, 20, 50, false, true, 2, nil, nil, false)
        if self.currentDistance < 1 and IsControlJustReleased(0, 38) then
            przejmowanie = true
            for i = 1, 300, 1 do
                if przejmowanie == true then
                if i == 300 then exports['astro_lib']:HideText() lib.callback('strefy') return end
                Citizen.Wait(600)
                exports['astro_lib']:ChangeText('Przejmowanie strefy : '..i..' / 300', 'right')
                else
                    exports['astro_lib']:HideText()
                end
              end
        end
    end
    end)


