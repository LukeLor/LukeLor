local DeathManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Death-Count-Handler/Main.luau"))()

--[[if DeathManager:CheckDeaths("DeathsTest") then
    DeathManager:ResetDeaths("DeathsTest")
end]]

DeathManager:SetupDeaths({
    Identifier = "DeathsTest"
})

local character = game.Players.LocalPlayer.Character
if character then
local Humanoid = character:WaitForChild("Humanoid")
  if Humanoid then
 Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if Humanoid.Health <= 0 then
                DeathManager:UpdateDeaths({
                    Identifier = "DeathsTest"
                })
            end
        end)
        require(playerGui.MainUI.Initiator.Main_Game).caption(DeathManager:CheckDeaths(), true)
  end
end
