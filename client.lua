local QBCore = exports['qb-core']:GetCoreObject()

-- Code

local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true

    QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetConfig', function(config)
        Config.IllegalActions = config
    end)
end)

local scoreboardOpen = false
local scoreboardOpen1 = false

local PlayerOptin = {}



fontId = RegisterFontId('Arb')
DrawText3D = function(x, y, z, text)
	SetTextScale(0.25, 0.25)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 0)
    ClearDrawOrigin()
end

GetClosestPlayer = function()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

GetPlayers = function()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end

GetPlayersFromCoords = function(coords, distance)
    local players = GetPlayers()
    local closePlayers = {}

    if coords == nil then
		coords = GetEntityCoords(GetPlayerPed(-1))
    end
    if distance == nil then
        distance = 5.0
    end
    for _, player in pairs(players) do
		local target = GetPlayerPed(player)
		local targetCoords = GetEntityCoords(target)
		local targetdistance = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)
		if targetdistance <= distance then
			table.insert(closePlayers, player)
		end
    end
    
    return closePlayers
end


Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(0, Config.OpenKey1) then
            if not scoreboardOpen then
                if not scoreboardOpen1 then
                    QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetPlayersArrays', function(playerList)
                        QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetActivity', function(cops, ambulance)
                            QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetPoints', function(craft, dealer)
                                PlayerOptin = playerList
                                Config.CurrentCops = cops
                                SendNUIMessage({
                                    action = "open",
                                    players = GetCurrentPlayers(),
                                    maxPlayers = Config.MaxPlayers,
                                    requiredCops = Config.IllegalActions,
                                    currentCops = Config.CurrentCops,
                                    currentCraft = Config.CurrentCraft,
                                    currentDealer = Config.CurrentDealer,
                                    maxCops = Config.MaxCops,
                                    maxAmb = Config.MaxAmb,
                                    currentAmbulance = ambulance,
                                    currentCraft = craft,
                                    currentDealer = dealer
                                })
                                scoreboardOpen = true
                                
                            end)
                        end)
                    end)
                end
            end
        elseif IsControlJustPressed(0, Config.OpenKey) then
            if not scoreboardOpen1 then
                if not scoreboardOpen then
                    PlayerJob = QBCore.Functions.GetPlayerData()
                    QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetPlayersArrays', function(playerList)
                        QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetActivity', function(cops, ambulance, judge, mechanic, realestate, cardealer, taxi, lawyer, tow, admin)
                            QBCore.Functions.TriggerCallback('qb-scoreboard:server:GetPoints', function(craft, dealer)
                                PlayerOptin = playerList
                                Config.CurrentCops = cops
    
                                SendNUIMessage({
                                    action = "open1",
                                    players = GetCurrentPlayers(),
                                    maxPlayers = Config.MaxPlayers,
                                    requiredCops = Config.IllegalActions,
                                    currentCops = Config.CurrentCops,
                                    currentCraft = Config.CurrentCraft,
                                    currentDealer = Config.CurrentDealer,
                                    maxCops = Config.MaxCops,
                                    maxAmb = Config.MaxAmb,
                                    currentAmbulance = ambulance,
                                    CurrentCops = police,
                                    currentJudge = judge,
                                    currentMechanic = mechanic,
                                    currentRealestate = realestate,
                                    currentCardealer = cardealer,
                                    currentTaxi = taxi,
                                    currentLawyer = lawyer,
                                    currentTow = tow,
                                    currentCraft = craft,
                                    currentDealer = dealer,
                                    currentAdmin = admin,
                                    Job = PlayerJob.job.label,
                                    Grade = PlayerJob.job.label,
                                    Payment = PlayerJob.job.payment,
                                    Cash = PlayerJob.money["cash"],
                                    Ethereum = PlayerJob.money["ethereum"]
                                })
                                scoreboardOpen1 = true
                            end)
                        end)
                    end)
                end
            end
        end

        if IsControlJustReleased(0, Config.OpenKey1) then
            if scoreboardOpen then
                SendNUIMessage({
                    action = "close",
                })
                scoreboardOpen = false
            end
        end

        if IsControlJustReleased(0, Config.OpenKey) then
            if scoreboardOpen1 then
                SendNUIMessage({
                    action = "close1",
                })
                scoreboardOpen1 = false
            end
        end

        if scoreboardOpen then
            for _, player in pairs(GetPlayersFromCoords(GetEntityCoords(GetPlayerPed(-1)), 10.0)) do
                local PlayerId = GetPlayerServerId(player)
                local PlayerPed = GetPlayerPed(player)
                local PlayerName = GetPlayerName(player)
                local PlayerCoords = GetEntityCoords(PlayerPed)

                DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '~b~ID~w~ [ '..PlayerId..' ]')
                -- if not PlayerOptin[PlayerId].permission then
                --     DrawText3D(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z + 1.0, '['..PlayerId..']')
                -- end
            end
        end
        if not scoreboardOpen then
        end

        Citizen.Wait(3)
    end
end)

function GetCurrentPlayers()
    local TotalPlayers = 0

    for _, player in ipairs(GetActivePlayers()) do
        TotalPlayers = TotalPlayers + 1
    end

    return TotalPlayers
end

RegisterNetEvent('qb-scoreboard:client:SetActivityBusy')
AddEventHandler('qb-scoreboard:client:SetActivityBusy', function(activity, busy)
    Config.IllegalActions[activity].busy = busy
end)