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
Core.Shape = Enum.PartType.Ball 
Core.Transparency = 0
Core.Material = Enum.Material.Neon
 
local SpinC = coroutine.create(function()
    while task.wait() do
    Part.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))           
    Part2.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))           
    Part3.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))
    Core.Rotation += Vector3.new(math.random(1,4),math.random(10,40),math.random(1,4))
    end        
end)
 
coroutine.resume(SpinC)

