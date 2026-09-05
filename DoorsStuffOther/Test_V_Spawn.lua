local facePart = game:GetObjects("rbxassetid://1877579717")

facePart.Parent = workspace
facePart.Anchored = false
facePart.CanCollide = false

local Root = facePart:Clone()
Root.Transparency = 0.5
Root.Name = "Root"

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
pickUp.Style = Enum.ProximityPromptStyle.Custom

local face = Instance.new("Part")
face.Parent = model
face.Size = Vector3.new(2,2,2)
face.CanCollide = false
face.Anchored = true
face.Rotation = facePart.Rotation


local decal = Instance.new("Decal")
decal.Parent = face
decal.ColorMapContent = "rbxassetid://85160359837223" --Talking: 113838091420033, Idle: 85160359837223

pickUp.Triggered:Connect(function()
local tool = Instance.new("Tool")
     tool.Name = "Verity"
    tool.Parent = game.Players.LocalPlayer.Backpack
    local contents = model:Clone()
   contents.Parent = tool
    for _, part in contents:GetDescendants() do 
    if part:IsA("BasePart") and part.Name ~= "Root" then 
                local weld = Instance.new("WeldConstraint")
               weld.Part0 = contents.Root 
               weld.Part1 = part
               part.Anchored = false
      end
    end
        contents.Root.Anchored = false
        contents.Root.Name = "Handle"
        
  end)

