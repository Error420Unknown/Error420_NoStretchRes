local isScreenBlackedOut = false
local kickTimer = 30 -- In Seconds

Citizen.CreateThread(function()
    while true do
        local res = GetIsWidescreen()

        if not res and not isScreenBlackedOut then
            isScreenBlackedOut = true
            kickTimer = 30 -- Timer Starts When Stretch Resolution Is Detected
        elseif res and isScreenBlackedOut then
            isScreenBlackedOut = false
        end

        if isScreenBlackedOut then
            DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 240)
            drawCenteredText("You may not use stretched resolution, change to a normal res. Time remaining: " .. kickTimer .. " seconds")

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