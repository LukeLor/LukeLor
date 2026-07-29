Used my "Death-Count-Handler" as the base, and you'll find the credits there.

Here's how to use this:

You'd first: 
```lua
local CurrencyManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Currency/Main.luau"))()
```
then if you want to set up a currency, then use:
```lua
CurrencyManager:SetupCurrency({
Identifier = "YOUR_CURRENCY_IDENTIFIER"
})
```

next, if you want to update it, use:
```lua
CurrencyManager:UpdateCurrency({
Identifier = "YOUR_CURRENCY_IDENTIFIER"
}, 10) 
```
(REPLACE 10 WITH THE AMOUNT IT'D GIVE/ UPDATE WITH.)

if you want to check how much of the currency you have, use: 
```lua
CurrencyManager:CheckBalance("YOUR_CURRENCY_IDENTIFIER")
```

and lastly, if you want to reset it, use:
```lua
CurrencyManager:ResetCurrency("YOUR_CURRENCY_IDENTIFIER")
```
