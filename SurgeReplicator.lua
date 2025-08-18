loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local SurgeFaces = {LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F1.png"), LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F2.png"), LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F3.png") }
local SurgeEffect = LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_Effect%20(1).png")
local FaceColors = {
	ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255,255 , 224)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 150, 225)), 
      ColorSequenceKeypoint.new(0.8, Color3.new(1, 1, 1)), 
}
local PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)
local PointB = nil
local Model = nil --Own model with primarypart
local Part = nil

if Model == nil then
local Surge = Instance.new("Model")
      Surge.Name = "Surge" 
      local main = Instance.new("Part") 
      main.Parent = Surge
      main.Anchored = true
      main.Shape = Enum.PartType.Ball
      main.Size = Vector3.new(3,3,3)
      main.Transparency = 1
      main.Name = "SurgeMain"
      local FaceAtt = Instance.new("Attachment")
      FaceAtt.Parent = main
      FaceAtt.Name = "FaceAtt"
      FaceAtt.Position = Vector3.new(0,0,0)
      FaceAtt.WorldPosition = main.Position
      local Face = Instance.new("ParticleEmitter") 
      Face.Parent = FaceAtt
      Face.Texture = SurgeFaces[1]
      Face.Speed = 0
      Face.Lifetime = 0.1
      Face.Rate = 50
      Face.Rotation = NumberRange.new(-15, 15) 
      Face.RotSpeed = 0 
      Face.Name = "Face" 
      Face.Size = 2.56
      Face.Color = ColorSequence.new(FaceColors) 
      local light = Instance.new("PointLight")
      light.Parent = FaceAtt
      light Color = Color3.fromRGB(255,255,224)
	light Shadows = true
	Surge.PrimaryPart = main
	light.Range = 25
	Part = main
	Model = Surge
	Model.Parent = workspace
else
	Model.Parent = workspace
	Part = Model.PrimaryPart
end

local Magnitude = (PointA - PointB).Magnitude

local MidPosition = CFrame.new(PointA, PointB) * CFrame.new(0, 0, -Magnitude) * CFrame.new(-math.random(Magnitude / 2), math.random(Magnitude / 2)).Position

local function Lerp(a, b, c)
      return a + (b - a) * c
end

local function QuadBezier (StartPosition, MidPosition, EndPosition, Offset)
       local L1 = Lerp(StartPosition, MidPosition, Offset)
       local L2 = Lerp(MidPosition, EndPosition, Offset)
       local QuadBezier = Lerp(L1, L2, Offset)

       return QuadBezier
end
for Index = 1, math.random(3,7) do
for Index = 1, 10 do
     local CurrentPosition = QuadBezier(PointA, MidPosition, PointB, Index / 10)

     local PositionTween = game.TweenService:Create(Part, TweenInfo.new(1), {Position = 
     CurrentPosition})

     PositionTween:Play()
     PositionTween.Completed:Wait()
end
end
