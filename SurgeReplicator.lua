local PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,100,0)
local PointB = nil
local Part = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position

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
