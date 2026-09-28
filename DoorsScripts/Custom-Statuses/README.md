(THIS ONLY CREATES THE UI STATUS EFFECT!)

Here's how to use it:

You'd first: 
```lua
local StatusMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Statuses/Main.luau"))()
```
once you do that, use:
```lua
local STATUS_UI_NAME = StatusMaker.MakeStatus("ASSETID", "NAME")
```
then that function should return the UI object for you then to delete, and, or, modify overall.

once you are done with your status, since its a UI object, just run:

```lua
STATUS_UI_NAME:Destroy()
```

then the status effect UI should disappear!


IF YOU WANT TO ANIMATE: 

COLOR:

Define the animation:
```lua
local ColorAnimation = StatusMaker.CreateStatusAnimationColor(STATUS_UI_NAME, TweenInfo.new(3), {Color3.fromRGB(255,255,255), Color3.fromRGB(255,125,125)})
```

to play the animation: 

```lua
StatusMaker.PlayStatusAnimation(ColorAnimation)
```

then to stop it:

```lua
StatusMaker.StopStatusAnimation(ColorAnimation)
```

SIZE

Define the animation:
```lua
local SizeAnimation = StatusMaker.CreateStatusAnimationSize(STATUS_UI_NAME, TweenInfo.new(0.5),"Big")

local SizeAnimation2 = StatusMaker.CreateStatusAnimationSize(STATUS_UI_NAME, TweenInfo.new(0.5),"Normal")
```

TYPES OF SIZES:
"Normal"
"Big"
"Small"


to play the animations: 

```lua
StatusMaker.PlayStatusAnimation(SizeAnimation)
task.wait(0.4)
StatusMaker.PlayStatusAnimation(SizeAnimation2)
```

and that should make it big, then normal size!

