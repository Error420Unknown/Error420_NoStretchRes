RegisterNetEvent("kickPlayerDueToResolution")
AddEventHandler("kickPlayerDueToResolution", function()
    local src = source
    DropPlayer(src, "Kicked for using a stretched resolution.")
end)