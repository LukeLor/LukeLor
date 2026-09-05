local facePart = game:GetObjects("rbxassetid://1877579717")

facePart.Parent = workspace
facePart.Anchored = false
facePart.CanCollide = false

local Root = facePart:Clone()
Root.Transparency = 0.5

local model = Instance.new("Model")

model.Parent = workspace
Root.Parent = model
facePart.Parent = model
facePart.Color3 = Color3.fromRGB()
