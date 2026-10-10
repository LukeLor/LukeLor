local subfloorCutscene = {}

loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

subfloorCutscene.MakeCutscene = function(doorModel, LightColor, VoidColor)
local environmentModel = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/SubfloorEntranceRemake.rbxm?raw=true")
environmentModel.Parent = workspace
environmentModel:PivotTo(workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0,300,0))

local camFold = environmentModel.SubfloorEntryCam



local Cam = workspace.CurrentCamera
local oldSubject = ( Cam.CameraSubject.Name ~= "LockOn" and Cam.CameraSubject) or ( Cam.CameraSubject.Name == "LockOn" and game.Players.LocalPlayer.Character:WaitForChild("Humanoid"))
local oldCamType = Cam.CameraType
local Pos1 = camFold.FarCam
local Pos2 = camFold.MidCam
local Pos3 = camFold.CloseCam
local TS = game:GetService("TweenService")
local Gavity = workspace.Gravity
local hasDoorFrame = true
local lightColor = (LightColor ~= nil and LightColor) or Color3.fromRGB(255, 190, 61)
local voidColor = (VoidColor ~= nil and VoidColor) or Color3.fromRGB(218, 138, 85)

if hasDoorFrame ~= true then
	environmentModel.Environment.DoorFrame:Destroy()
end
for _, light in environmentModel.Environment:GetDescendants() do
	if light:IsA("PointLight") or light:IsA("SpotLight") or light:IsA("SurfaceLight")  then
		light.Color = lightColor
	end
end
local lockCam = false
local lock = coroutine.create(function()
	while task.wait() do
		if lockCam == true then
			Cam.CameraSubject = environmentModel.SubfloorEntryCam.LockOn
			Cam.CameraType = Enum.CameraType.Scriptable
			Cam.CFrame = environmentModel.SubfloorEntryCam.LockOn.CFrame
		end
		if lockCam == "done" then
			break
		end
	end
end)
coroutine.resume(lock)
environmentModel.SubfloorEntryCam.LockOn.CFrame = Pos1.CFrame
environmentModel.Environment.Void.Color = voidColor
Cam.CameraType = Enum.CameraType.Scriptable
Cam.CameraSubject = Pos1
Cam.CFrame = Pos1.CFrame

workspace.Gravity = 25
	
local DoorModel = LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/BackdoorsDoorNoFrame.rbxm?raw=true")
	if  doorModel then
		DoorModel = doorModel
	end
		DoorModel.Parent = workspace
if DoorModel.PrimaryPart == nil then
	warn("Can't Pivot Door. Make sure to set PrimaryPart, or cutscene will not work.")
	return
end
DoorModel:PivotTo(environmentModel.Environment.Pivot.CFrame)

local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
maingame.stopcam = true
local shake = maingame.camShaker
lockCam = true
local Tween1 = TS:Create(environmentModel.SubfloorEntryCam.LockOn, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {CFrame = Pos2.CFrame})
Tween1:Play()
shake:ShakeOnce(15,1,0,4)

task.wait(2.5)
for _, part in DoorModel:GetDescendants() do
	if part:IsA("BasePart") then
		part.Anchored = false
		part.CanCollide = false
		part.AssemblyLinearVelocity = Vector3.new(0,math.random(-35,0),0)
		part.AssemblyAngularVelocity = Vector3.new(math.random(-12,12),math.random(-1,1),math.random(-12,12))

	end
	if part:IsA("Weld") or part:IsA("ManualWeld") or part:IsA("WeldConstraint") then
		part:Destroy()
	end
end
shake:ShakeOnce(1,1,0,0.1)

local Tween2 = TS:Create(environmentModel.SubfloorEntryCam.LockOn, TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {CFrame = Pos3.CFrame})
shake:ShakeOnce(20,1,0,3)
Tween2:Play()

task.wait(3)
shake:ShakeOnce(2,1,0,3)
DoorModel:Destroy()
Cam.CameraType = oldCamType
workspace.Gravity = Gavity
Cam.CameraSubject = oldSubject
lockCam = "done"
maingame.stopcam = false
task.wait(1)
environmentModel:Destroy()
end
	
return subfloorCutscene
