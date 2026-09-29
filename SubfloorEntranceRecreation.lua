--CURRENTLY STUDIO-BOUND, WILL EDIT TO MAKE WORK IN REAL GAME.

local Cam = workspace.CurrentCamera
local Pos1 = workspace.FarCam
local Pos2 = workspace.MidCam
local Pos3 = workspace.CloseCam
local TS = game:GetService("TweenService")
local Gavity = workspace.Gravity

Cam.CameraType = Enum.CameraType.Scriptable
Cam.CameraSubject = Pos1
Cam.CFrame = Pos1.CFrame
local camModule = require(game.ReplicatedStorage.CameraShaker)
workspace.Gravity = 25
local DoorModel = game.ServerStorage.DoorTest:Clone()
DoorModel.Parent = workspace
DoorModel.Script.Enabled = true
local shake = camModule.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	Cam.CFrame = Cam.CFrame * shakeCf
end)

shake:Start()
local Tween1 = TS:Create(Cam, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {CFrame = Pos2.CFrame})
Tween1:Play()
shake:ShakeOnce(15,1,0,4)
task.wait(2.5)
for _, part in DoorModel:GetDescendants() do
	if part:IsA("BasePart") then
		part.Anchored = false
	end
end
shake:ShakeOnce(1,1,0,0.1)

local Tween2 = TS:Create(Cam, TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {CFrame = Pos3.CFrame})
shake:ShakeOnce(20,1,0,3)
Tween2:Play()

task.wait(3)
Cam.CameraType = Enum.CameraType.Custom
workspace.Gravity = Gavity
