local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()

if CurrencyManager:CheckBalance("Shinies") == 0 then
CurrencyManager:SetupCurrency({
    Identifier = "Shinies"
})
end

CurrencyManager:UpdateCurrency({Identifier = "Shinies"}, 50)    

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(tostring(CurrencyManager:CheckBalance("Shinies")).." is your balance for the currency with an identifier of: 'Shinies.'", true)


--[[IF YOU WANT TO CLEAR THE EXAMPLE CURRENCY, EXECUTE THIS: 

local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()

if CurrencyManager:CheckBalance("Shinies") then
    CurrencyManager:ResetCurrency("Shinies")
end

]]
