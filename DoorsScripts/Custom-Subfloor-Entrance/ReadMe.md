If you want to intiate the cutscene, 
(REPLACE "DoorModel" "LightColor" and "VoidColor" WITH THEIR CORRESPONDING THINGS. DoorModel to Model, LightColor to Color3, and VoidColor to Color3. MAKE SURE DOOR HAS A PrimaryPart!!)
```lua
local subfloorEntanceHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Subfloor-Entrance/Main.luau"))()
subfloorEntranceHandler.MakeCutscene(DoorModel, LightColor, VoidColor)
```

(Example with everything replaced, you can also visit the file too):

```lua
local subfloorEntanceHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Subfloor-Entrance/Main.luau"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
subfloorEntranceHandler.MakeCutscene(LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/BackdoorsDoorNoFrame.rbxm?raw=true"), Color3.fromRGB(255, 190, 61), Color3.fromRGB(218, 138, 85))


```

And if you do either of these properly, it should play!
