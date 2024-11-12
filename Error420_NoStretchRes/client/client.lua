local usingStretchedres = false
local kickTimer = 30 -- In Seconds

Citizen.CreateThread(function()
    while true do
        local res = GetIsWidescreen()

        if not res and not usingStretchedres then
            usingStretchedres = true
            kickTimer = 30
        elseif res and usingStretchedres then
            usingStretchedres = false
        end

        if usingStretchedres then
            lib.notify({
                title = 'WARNING!',
                description = 'Turn Off Stretched Resolution To Prevent Being Kicked!',
                type = 'error'
            })

            kickTimer = kickTimer - 1
            if kickTimer <= 0 then
                TriggerServerEvent("kickPlayerDueToResolution")
            end
            Citizen.Wait(1000)
        else
            Citizen.Wait(5000)
        end
    end
end)

function drawCenteredText(text)
    SetTextFont(4)
    SetTextScale(0.0, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.5)
end