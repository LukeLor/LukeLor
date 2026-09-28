(THIS ONLY CREATES THE UI STATUS EFFECT!)

UPDATING README SOON, BECAUSE MAIN FILE HAS SOME VERY COOL UPDATES!!!

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

Define the animation:
```lua
local ColorAnimatoin = StatusMaker.CreateStatusAnimationColor(STATUS_UI_NAME, TweenInfo.new(3), {Color.fromRGB(255,255,255), Color.fromRGB(255,125,125)})
```

to play the animation: 

```lua
StatusMaker.PlayAnimation(ColorAnimation)
```

then to stop it:

```lua
StatusMaker.StopAnimation(ColorAnimation)
```
