local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()
local balance = CurrencyManager:CheckBalance("Shinies")
if balance >= 30 then
if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:SetAttribute("CanJump", true)
    end
end
