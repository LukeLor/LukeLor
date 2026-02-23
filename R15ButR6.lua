local char = workspace.X_masLucas7 

local j = char.LeftLowerArm:FindFirstChildOfClass("Motor6D")
local j2 = char.LeftUpperArm:FindFirstChildOfClass("Motor6D") 

j.Part0 = char.UpperTorso
j2.Part0 = j.Parent
