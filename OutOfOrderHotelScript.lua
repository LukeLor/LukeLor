--Base Script by RegularVynixu 
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()
local Communicator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Communicator/main/init.luau"))()

-- \\ Services // --

local Players = game:GetService("Players")

-- \\ Variables // --

local LocalPlayer = Players.LocalPlayer
local Host: Player? = nil

local activeClients = {} :: {Player}
local listOfEntities = {
    [1] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Stomper.lua"
	[2] = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Dasher.lua"
}

-- \\ Setup // --

Communicator.Config.ExcludeSelf = false

task.spawn(function()
    while true do
        activeClients = Communicator:Ping(1, true)
        
        -- Elect player as Host by UserId
        table.sort(activeClients, function(a: Player, b: Player)
            return a.UserId < b.UserId
        end)

        local host = activeClients[1]
        if host ~= Host then
            print("New Host elected:", host)
        end

        Host = host

        task.wait(10)
    end
end)

Communicator:Listen("SpawnEntity", function(sender: Player, id: number)
    if sender ~= Host then
        -- Ignore commands not sent by Host
        return
    end

    -- Spawn entity with id
  loadstring(game:HttpGet(listOfEntities[id]))()
end)

-- \\ Main // --

while task.wait( math.random(10, 30) ) do
    if LocalPlayer == Host then
        -- Request to summon random entity as Host
        local randomId = math.random(1, #listOfEntities)
        Communicator:Send("SpawnEntity", randomId)
    end
end
