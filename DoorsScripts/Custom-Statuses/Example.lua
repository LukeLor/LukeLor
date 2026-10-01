local StatusMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Statuses/Main.luau"))()

local NoEnergyStatus = StatusMaker.MakeStatus("rbxassetid://112559284221064", "NoEnergy")
local ColorAnimation = StatusMaker.CreateStatusAnimationColor(NoEnergyStatus, TweenInfo.new(0.75), {Color3.fromRGB(255,255,255), Color3.fromRGB(255,125,125)})
StatusMaker.StartStatusAnimation(ColorAnimation)
NoEnergyStatus.Visible = true

task.wait(5)

NoEnergyStatus:Destroy()

