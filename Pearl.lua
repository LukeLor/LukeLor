local Part = Instance.new("Part")
Part.CanCollide = false
Part.Material = Enum.Material.Glass
Part.Transparency = 0.5
Part.Anchored = true
Part.Size = Vector3.new(1.5,1.5,1.5)
Part.Position = Vector3.new(0,0,0)
Part.Parent = workspace

local Part2 = Part:Clone()
Part2.Parent = workspace

local Part3 = Part:Clone()
Part3.Parent = workspace

local SpinC = coroutine.create(function()
Part.Rotation += Vector3.new(math.random(1,4),math.random(1,4),math.random(1,4))           
  Part2.Rotation += Vector3.new(math.random(1,4),math.random(1,4),math.random(1,4))           
  Part3.Rotation += Vector3.new(math.random(1,4),math.random(1,4),math.random(1,4))           
  end)

coroutine.resume(SpinC)
