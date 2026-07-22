loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CutsceneMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CutsceneMaker.lua"))()



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

--Verify Assets
if not (ILM and CamRig and Start_C and Start_I and Leave_I and Move and Leave_C) then
  --Add support for rbxassetid later.
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("One or more assets did NOT load. Make sure to support rbxassetid for this specific user.",true)

else
  --All set
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

local StartM = CustomSound(https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_Start, 1, WotF_Start)
local LoopM = CustomSound(https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_Loop, 1, WotF_Loop)
local EndM = CustomSound(https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/WotF_End, 1, WotF_End)
StartM.Parent = workspace
LoopM.Parent = workspace
EndM.Parent = workspace

--Functions
local PlayAnim = function(Rig, Animation)

	local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")
local Workspace = workspace
local Players = game:GetService("Players")

local hashId = KeyframeSequenceProvider:RegisterKeyframeSequence(Animation)

local playingAnim = Instance.new("Animation")
playingAnim.AnimationId = hashId

    local humanoid = Rig:FindFirstChildOfClass("Humanoid") or Rig:FindFirstChildOfClass("AnimationController")
    local animator =  humanoid:FindFirstChildOfClass("Animator")
    
    if animator then
         local track = animator:LoadAnimation(playingAnim)
        track.Priority = Enum.AnimationPriority.Action4
        track:Play()
  else
        local track = humanoid:LoadAnimation(playingAnim)
     track.Priority = Enum.AnimationPriority.Action4
        track:Play()
  end
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
game.worksapce.CuttentCamera.CameraType = Enum.CameraType.Scriptable
ILM:PivotTo(workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame)
CamRig:PivotTo(ILM.PrimaryPart.CFrame)
PlayAnim(ILM, Start_I)
PlayAnim(CamRig, Start_I)
task.wait(7)
CamLock(false)
workspace.CurrentCamera.CameraType = oldCamType
Caption("Scene over.")
