loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CutsceneMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CutsceneMaker.lua"))()

local AnimatorStore = game:GetObjects("rbxassetid://104077319394815")[1] --Thanks, Proxiom!!!
local AnimatorModule = require(AnimatorStore.ReplicatedStorage.Animator)


--Models
local ILM = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/IL.rbxm")
local CamRig = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CustomCam.rbxm")

--Animations
local Start_C = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/StartCam.rbxm")
local Start_I = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Start.rbxm")
local Move = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Move.rbxm")
local Leave_I = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Leave.rbxm")
local Leave_C = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/LeaveCam.rbxm")
local sceneFolder = Instance.new("Folder")
sceneFolder.Parent = workspace
sceneFolder.Name = "IsolatedLightCutsceneAssets"

--Verify Assets
if not (ILM and CamRig and Start_C and Start_I and Leave_I and Move and Leave_C) then
  --Add support for rbxassetid later.
	
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("One or more assets did NOT load with custom function. Using rbxasetid...",true)
ILM = game:GetObjects("rbxassetid://140198400419491")[1]
CamRig = game:GetObjects("rbxassetid://125432385789057")[1]
Start_C = CamRig.RawAnimations:WaitForChild("IsolatedLight_C_I-Ca")
Leave_C = CamRig.RawAnimations:WaitForChild("IL_Leave_Cam")
Leave_I = ILM.RawAnimations:WaitForChild("IsolatedLight_Leave")
Start_I = ILM.RawAnimations:WaitForChild("IsolatedLight_Chase_Intro")
Move = ILM.RawAnimations:WaitForChild("IsolatedLight_Move")
	Start_C.Parent = sceneFolder
	Start_I.Parent = sceneFolder
	Leave_C.Parent = sceneFolder
	Leave_I.Parent = sceneFolder
	Move.Parent = sceneFolder
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Set up rbxassetid versions.",true)
else
  --All set
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("All assets loaded and are being parented.",true)
	Start_C.Parent = sceneFolder
	Start_I.Parent = sceneFolder
	Leave_C.Parent = sceneFolder
	Leave_I.Parent = sceneFolder
	Move.Parent = sceneFolder
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("ALL assets LOADED. Yayyyy!!!",true)
end

--Music
function GetGitSound(GithubSnd, SoundName)
    local url = GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

function CustomSound(soundLink, vol, sndName)
    local sound = Instance.new("Sound")
    sound.SoundId = GetGitSound(soundLink, sndName)
    sound.Name = sndName
    sound.Volume = vol or 0.5
  return sound
end

local StartM = CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_Start.mp3", 1, "WotF_Start")
local LoopM = CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_Loop.mp3", 1, "WotF_Loop")
local EndM = CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_End.mp3", 1, "WotF_End")
if (StartM and LoopM and EndM) then
StartM.Parent = sceneFolder 
LoopM.Parent = sceneFolder 
EndM.Parent = sceneFolder 
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Music also registered.",true)
else
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Music failed to register...",true)
end

--Functions
local PlayAnim = function(Rig, Animation)
	local Lifeform = Rig:FindFirstChildOfClass("Humanoid",5) or Rig:FindFirstChildOfClass("AnimationController",5)
	local Animator = AnimatorModule.new(Lifeform) -- Your rig (you can also use the player)
local AnimationTrack = Animator:LoadAnimation(Animation) -- Path to KeyFrameSequence
end

local Caption = function(text) 
	
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text, true)
		
end

local CamLock = function(lock_unlock:boolean)
	local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
	if maingame then
		maingame.stopcam = lock_unlock
	end
end

--Parenting session #2
ILM.Parent = workspace
CamRig.Parent = workspace


--CUTSCENE, YAY!!!
CutsceneMaker.LockOn(CamRig:WaitForChild("Head"), 7)
Caption("Scene started.")
CamLock(true)
local oldCamType = workspace.CurrentCamera.CameraType
game.workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
ILM:PivotTo(workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame)
CamRig:PivotTo(ILM.PrimaryPart.CFrame)
PlayAnim(ILM, Start_I)
PlayAnim(CamRig, Start_C)
task.wait(7)
CamLock(false)
workspace.CurrentCamera.CameraType = oldCamType
Caption("Scene over.")
