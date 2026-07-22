loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

--Models
local ILM = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/IL.rbxm")
local CamRig = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CustomCam.rbxm")

--Animations
local Start_C = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/StartCam.rbxm")
local Start_I = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Start.rbxm")
local Move = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Move.rbxm")
local Leave_I = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Leave.rbxm")
local Leave_C = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/LeaveCam.rbxm")

if not (ILM and CamRig and Start_C and Start_I and Leave_I and Move and Leave_C) then
  --Add support for rbxassetid.
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("One or more assets did NOT load. Make sure to support rbxassetid for this specific user.",true)
else
  --All set
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("ALL assets LOADED. Yayyyy!!!",true)
end


