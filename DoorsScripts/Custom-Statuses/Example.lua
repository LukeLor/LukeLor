local StatusMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Statuses/Main.luau"))()

local NoEnergyStatus = StatusMaker.MakeStatus("rbxassetid//:126374173893352", "NoEnergy")

NoEnergyStatus.Visible = true

task.wait(5)

NoEnergyStatus:Destroy()

