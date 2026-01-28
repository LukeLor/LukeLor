local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LatestRoom = ReplicatedStorage.GameData.LatestRoom

-- CONFIG
local screamDuration = 5          -- durée du cri en secondes
local damageOnRoomChange = 100    -- dégâts infligés (100 = kill)
local spawnChance = 5             -- % de chance de spawn
local cooldownRooms = 3           -- nombre de rooms minimum entre 2 spawns
local lastSpawnRoom = 0           -- track dernière room spawn

local screamSoundId = "rbxassetid://TON_SON_ID" -- remplace par ton son

-- Fonction pour spawn l'entité
local function spawnScreamer()
    lastSpawnRoom = LatestRoom.Value

    -- modèle invisible
    local model = Instance.new("Model")
    model.Name = "Screamer"
    model.Parent = workspace

    -- ajout du son
    local scream = Instance.new("Sound")
    scream.SoundId = screamSoundId
    scream.Volume = 10
    scream.PlaybackSpeed = 1
    scream.Parent = model
    scream:Play()

    -- entité active tant que le son joue
    local active = true
    local conn
    conn = LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
        if active then
            for _, player in pairs(Players:GetPlayers()) do
                local hum = player.Character and player.Character:FindFirstChild("Humanoid")
                if hum then
                    hum:TakeDamage(damageOnRoomChange)
                end
            end
        end
    end)

    -- fin du scream
    task.delay(screamDuration, function()
        active = false
        if conn then conn:Disconnect() end
        model:Destroy()
    end)
end

-- Détecte ouverture de porte / changement de room
LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    local room = LatestRoom.Value

    -- cooldown entre spawn
    if room - lastSpawnRoom < cooldownRooms then return end

    -- % de chance
    if math.random(1,100) <= spawnChance then
        spawnScreamer()
    end
end)
