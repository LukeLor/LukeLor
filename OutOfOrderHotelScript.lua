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
    [1] = Spawner:Create(
		Entity = {
		Name = "Dasher",
		Asset = "https://github.com/LukeLor/LukeLor/raw/main/DasherNew.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 2.5
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 25, 0.2, 2} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 300,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 6,
		Delay = 3
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 1000
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Dasher..", "Use what you learned from Ambush!", "Keep note that Dasher is faster than Ambush."},
		Cause = ""
	}
	
)

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
    listOfEntities[id]:Run(true)
end)

-- \\ Main // --

while task.wait( math.random(10, 30) ) do
    if LocalPlayer == Host then
        -- Request to summon random entity as Host
        local randomId = math.random(1, #listOfEntities)
        Communicator:Send("SpawnEntity", randomId)
    end
end
