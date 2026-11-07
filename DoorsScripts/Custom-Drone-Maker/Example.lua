local DroneSpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Drone-Maker/Main.lua"))()

local MeDrone = DroneSpawner.CreateDrone("rbxassetid://106703947609396", nil, nil, 1, 3, 0, "Lucas")
DroneSpawner.SpawnDrone(MeDrone, game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
