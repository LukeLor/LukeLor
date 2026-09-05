local facePart = game:GetObjects("rbxassetid://1877579717")

facePart.Parent = workspace
facePart.Anchored = false
facePart.CanCollide = false

local Root = facePart:Clone()
Root.Transparency = 0.5

local model = Instance.new("Model")

model.Parent = workspace
Root.Parent = model
model.PrimaryPart = Root
facePart.Parent = model
facePart.Color3 = Color3.fromRGB(250, 221, 90)

local pickUp = Instance.new("ProximityPrompt")
pickUp.Parent = Root
pickUp.Enabled = true
pickUp.RequiresLineOfSight = false
pickUp.MaxActivationDistance = 10

local face = Instance.new("Part")
face.Parent = model
face.Size = Vector3.new(2,2,2)
face.CanCollide = false
face.Anchored = true


local decal = Instance.new("Decal")
decal.Parent = face
decal.ColorMapContent = "rbxassetid://0"
