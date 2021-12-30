local QBCore = exports['qb-core']:GetCoreObject()

-- Code

QBCore.Functions.CreateCallback('qb-scoreboard:server:GetActivity', function(source, cb)
    local PoliceCount = 0
    local AmbulanceCount = 0
    local JudgeCount = 0
    local CraftCount = 0
    local DealerCount = 0
    local MechanicCount = 0
    local RealestateCount = 0
    local CardealerCount = 0
    local TaxiCount = 0
    local LawyerCount = 0
    local TowCount = 0
	local AdminCount = 0
    
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                PoliceCount = PoliceCount + 1
            end

            if (Player.PlayerData.job.name == "judge") then
                JudgeCount = JudgeCount + 1
            end

            if ((Player.PlayerData.job.name == "ambulance" or Player.PlayerData.job.name == "doctor") and Player.PlayerData.job.onduty) then
                AmbulanceCount = AmbulanceCount + 1
            end

            if (Player.PlayerData.job.name == "mechanic" and Player.PlayerData.job.onduty) then
                MechanicCount = MechanicCount + 1
            end

            if (Player.PlayerData.job.name == "realestate") then
                RealestateCount = RealestateCount + 1
            end

            if (Player.PlayerData.job.name == "cardealer") then
                CardealerCount = CardealerCount + 1
            end

            if (Player.PlayerData.job.name == "taxi") then
                TaxiCount = TaxiCount + 1
            end

            if (Player.PlayerData.job.name == "lawyer") then
                LawyerCount = LawyerCount + 1
            end
			
            if (Player.PlayerData.job.name == "admin") then
                AdminCount = AdminCount + 1
            end

            if (Player.PlayerData.job.name == "tow") then
                TowCount = TowCount + 1
            end
        end
    end
    cb(PoliceCount, AmbulanceCount, JudgeCount, MechanicCount, RealestateCount, CardealerCount, TaxiCount, LawyerCount, TowCount, AdminCount)
end)

QBCore.Functions.CreateCallback('qb-scoreboard:server:GetPoints', function(source, cb)

    local CraftCount = 0
    local DealerCount = 0
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.metadata["craftingrep"] > Config.CurrentCraft then
        CraftCount = CraftCount + Player.PlayerData.metadata["craftingrep"]
    end

    if Player.PlayerData.metadata["dealerrep"] > Config.CurrentDealer then
        DealerCount = DealerCount + Player.PlayerData.metadata["dealerrep"]
    end

    cb(CraftCount, DealerCount)
end)

QBCore.Functions.CreateCallback('qb-scoreboard:server:GetConfig', function(source, cb)
    cb(Config.IllegalActions)
end)

QBCore.Functions.CreateCallback('qb-scoreboard:server:GetPlayersArrays', function(source, cb)
    local players = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            players[Player.PlayerData.source] = {}
            players[Player.PlayerData.source].permission = QBCore.Functions.IsOptin(Player.PlayerData.source)
        end
    end
    cb(players)
end)

RegisterServerEvent('qb-scoreboard:server:SetActivityBusy')
AddEventHandler('qb-scoreboard:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('qb-scoreboard:client:SetActivityBusy', -1, activity, bool)
end)
