local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()

CurrencyManager:SetupCurrency({
    Identifier = "Shinies"
})

local character = game.Players.LocalPlayer.Character
if character then
local Humanoid = character:WaitForChild("Humanoid")
  if Humanoid then
 Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if Humanoid.Health <= 0 then
                CurrencyManager:UpdateCurrency({
                    Identifier = "Shinies"
                }
50)
            end
        end)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(tostring(CurrencyManager:CheckBalance("Shinies")).." is your balance for the currency with an identifier of: 'Shinies.'", true)
  end
end

--[[IF YOU WANT TO CLEAR THE EXAMPLE CURRENCY, EXECUTE THIS: 

local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()

if CurrencyManager:CheckBalance("Shinies") then
    CurrencyManager:ResetDeaths("Shinies")
end

]]
