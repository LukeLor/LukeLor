local char = workspace.X_masLucas7 

local j = Instance.new("WeldConstraint")
local j2 = Instance.new("WeldConstraint")


j.Part0 = char.LeftLowerArm
j.Part1 = char.LeftUpperArm
j.Parent = char

char.LeftUpperArm.Name = "Hi"
local mainj = nil

for _, j in char.UpperTorso:GetChildren() do
  if j:IsA("Motor6D") and j.Part1.Name == "Hi" then 
    mainj = j
    break
  end
end

mainj.Part1 = j.Part0
