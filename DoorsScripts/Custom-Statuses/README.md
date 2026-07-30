Here's how to use it:

You'd first: 
```lua
local StatusMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Statuses/Main.luau"))()
```
once you do that, use:
```lua
local STATUS_UI_NAME = StatusMaker.MakeStatus(ASSETID, NAME)
```
then that function should return the UI object for you then to delete, and, or, modify overall.

once you are dont with your status, since its a UI object, just run:

```lua
STATUS_UI_NAME:Destroy()
```

then the status effects UI should disappear!
