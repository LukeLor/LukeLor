local groupingModel = Instance.new("Model")
groupingModel.Parent = workspace

local Part = Instance.new("Part")
Part.CanCollide = false
Part.Material = Enum.Material.Glass
Part.Transparency = 0.5
Part.Anchored = true
Part.Size = Vector3.new(3,3,3)
Part.Position = Vector3.new(0,0,0)
Part.Parent = groupingModel 
Part.Color = Color3.fromRGB(115, 255, 152)
 
local Part2 = Part:Clone()
Part2.Parent = groupingModel 
Part2.Color = Color3.fromRGB(158, 215, 255)

local Part3 = Part:Clone()
Part3.Parent = groupingModel 
Part3.Color = Color3.fromRGB(255, 160, 112)

local Core = Part:Clone()
Core.Size = Vector3.new(0.5,0.5,0.5)
Core.Parent = groupingModel 
Core.Color = Color3.fromRGB(255,255,255)
Core.Transparency = 0
Core.Material = Enum.Material.Neon

local LightAtt1 = Instance.new("Attachment")
LightAtt1.Parent = Core
LightAtt1.WorldPosition = Vector3.new(0,0,1)

local LightAtt2 = Instance.new("Attachment")
LightAtt2.Parent = Core
LightAtt2.WorldPosition = Vector3.new(0,0,-1)

local LightAtt3 = Instance.new("Attachment")
LightAtt3.Parent = Core
LightAtt3.WorldPosition = Vector3.new(0,1,0)

local Light1 = Instance.new("PointLight")
Light1.Parent = LightAtt1
Light1.Shadows = true
Light1.Brightness =1
Light1.Color = Color3.fromRGB(255, 160, 112)

local Light2 = Instance.new("PointLight")
Light2.Parent = LightAtt2
Light2.Shadows = true
Light2.Brightness =1
Light2.Color = Color3.fromRGB(158, 215, 255)

local Light3 = Instance.new("PointLight")
Light3.Parent = LightAtt3
Light3.Shadows = true
Light3.Brightness =1
Light3.Color = Color3.fromRGB(115, 255, 152)

Light1.Range = 32 
Light2.Range = 32 
Light3.Range = 32

local SpinC = coroutine.create(function()
    while task.wait() do
    Part.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))           
    Part2.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))           
    Part3.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))
    Core.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))
    end        
end)
 
coroutine.resume(SpinC)

