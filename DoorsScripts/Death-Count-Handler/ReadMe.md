Thanks to RegularVynixu who made the "Custom Doors Achievement" script, which I used as the base to make this!

Here's how to use it:

You'd first: 

local DeathManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Death-Count-Handler/Main.luau"))()

then if you want to set up a death count tracker, then use:

DeathManager:SetupDeaths({
Identifier = "YOUR_DEATH_IDENTIFIER"
})


next, if you want to update it, use:

DeathManager:UpdateDeaths({
Identifier = "YOUR_DEATH_IDENTIFIER"
}) 

(UpdateDeaths only adds one kill)

if you want to check how many deaths you have, use: 

DeathManager:CheckDeaths("YOUR_DEATH_IDENTIFIER")


and lastly, if you want to reset, use:

DeathManager:ResetDeaths("YOUR_DEATH_IDENTIFIER")
