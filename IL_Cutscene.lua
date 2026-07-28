loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CutsceneMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CutsceneMaker.lua"))()

--TESTING!!!
local DeathManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Death-Count-Handler/Main.luau"))()

--ANIMATION HANDLER
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
local LoadAnim = function(Rig, Animation)
	local Hum = Rig:FindFirstChildOfClass("Humanoid") 
	if Hum == nil then
Hum = Instance.new("Humanoid")
		if Rig:FindFirstChildOfClass("AnimationController") then
			local aC_Name = Rig:FindFirstChildOfClass("AnimationController").Name
Rig:FindFirstChildOfClass("AnimationController"):Destroy()
			Hum.Parent = Rig 
			Hum.Name = aC_Name
    end
		Hum.Parent = Rig 
end
		local Animator = AnimatorModule.new(Hum)
local AnimationTrack = Animator:LoadAnimation(Animation) 
	return AnimationTrack
end

local PlayAnim = function(AnimationTrack)
AnimationTrack:Play()
end
local StopAnim = function(AnimationTrack)
AnimationTrack:Stop()
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
local I_Start_Track = LoadAnim(ILM, Start_I)
local C_Start_Track = LoadAnim(CamRig, Start_C)
PlayAnim(I_Start_Track)
PlayAnim(C_Start_Track)
task.wait(7)
CamLock(false)
workspace.CurrentCamera.CameraType = oldCamType
Caption("Scene over, ADDED NEW TESTING LINES, SO CURRENT PLAYER WILL DIE IN 3 SECONDS.")
task.wait(3)
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
if DeathManager:CheckDeaths("IsolatedLightDeaths") == 0 then
DeathManager:SetupDeaths({
Identifier = "IsolatedLightDeaths"
})
	DeathManager:UpdateDeaths({
Identifier = "IsolatedLightDeaths"
}) 
else
	DeathManager:UpdateDeaths({
Identifier = "IsolatedLightDeaths"
}) 
end

if firesignal then
	if DeathManager:CheckDeaths("IsolatedLightDeaths") == 1 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Well, sorry here "..game.Players.LocalPlayer.DisplayName..", but I can't spoil anything.", "Maybe... it'llbe possible if you die again though?", "See you on the other side.", "I know you'll come back.", "You're just too...", "Curious."}, "Yellow")
	elseif DeathManager:CheckDeaths("IsolatedLightDeaths") == 2 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Actually, I'm unsure about something.", "Am I supposed to be the architect that you're...", "supposed to be seeing?", "Just a thought for myself to ponder on.", "Not as it'd concern you though."}, "Yellow")
	elseif DeathManager:CheckDeaths("IsolatedLightDeaths") == 3 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"3rd times a charm, huh?", "I think I'm not supposed to see you.", "It's another architect, though I can't tell who...", "I'll let her take over for me.", "Hope she'll see you."}, "Yellow")
	elseif DeathManager:CheckDeaths("IsolatedLightDeaths") == 4 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Hello!", "You're the one that Curious wanted to send to me...", "correct?", "We're still... trying to figure things out.","You'll be off the hook, come back again, okay?"}, "Blue")
	elseif DeathManager:CheckDeaths("IsolatedLightDeaths") == 5 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"Welcome back!", "WE don't know anything about this 'Fourth Architect' which is quite unfortunate.", "It seems that it'll be important.", "For all we know, it could be more powerful than all of us together!", "I'll let you see Curious one more time.."}, "Blue")
	
				elseif DeathManager:CheckDeaths("IsolatedLightDeaths") == 6 then
					firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").DeathHint.OnClientEvent, {"You're... back again.", "Guiding tell you everything?","In that case, it seems that the case is closed.", "We won'tknow for quite a while.", "Maybe that last architect will show its face one day!", "But for now, farewell, "..game.Players.LocalPlayer.DisplayName..", I'm sure you'll make it far in whatever you do."}, "Yellow")
	end
else
					warn("firesignal not supported, ignore death hints.")
				end
						gameStats["Player_".. plr.Name].Total.DeathCause.Value = "Unknown..."
				
