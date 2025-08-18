loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local SurgeFaceBase = LoadCustomAsset("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Surge_F3.png") 
local PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)
local PointB = nil
local Part = nil --Own model with primarypart

if Part == nil then
local SurgeRemake = Instance.new("Model")
      local main = Instance.new("Part") 
      main.Parent = SurgeRemake
      main.Anchored = true
      main.Shape = Enum.PartType.Ball
      main.Size = Vector3.new(3,3,3)
      main.Transparency = 1
      main.Name = "SurgeMain"
      local FaceAtt = Instance.new("Attachment")
      FaceAtt.Parent = main
      FaceAtt.Name = "Face" 
      local Face = Instance.new("ParticleEmitter") 
      Face.Parent = FaceAtt
      Face.Texture = SurgeFaceBase
      Face.Speed = 0
      Face.Lifetime = 0.1
      Face.Rate = 50
      
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

for Index = 1, 10 do
     local CurrentPosition = QuadBezier(PointA, MidPosition, PointB, Index / 10)

     local PositionTween = game.TweenService:Create(Part, TweenInfo.new(.1), {Position = 
     CurrentPosition})

     PositionTween:Play()
     PositionTween.Completed:Wait()
end
