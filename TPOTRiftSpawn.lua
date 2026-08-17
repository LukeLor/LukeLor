loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Functions.lua"))()
local Rift = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/TPOT-Rift.rbxm?=raw=true")

Rift.Parent = workspace
Rift:PivotTo(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0,13,0))

--Yeah, that's it, it just spawns the model. 

--I plan on using this in my Doors mod called "Out of Order."

-- :) 
