local char = workspace.X_masLucas7 
local plrrep = game.ReplicatedStorage.StoredObj.PlrRep
local plr = plrrep:Clone()
local plr2 = plrrep:Clone()
plr2.Parent =workspace
plr.Parent = workspace
local id = 290323663 --game.Players:FindFirstChild(script.Parent.Name).UserId
print(id)
local desc = game.Players:GetHumanoidDescriptionFromUserIdAsync(id)
plr.Humanoid:ApplyDescriptionAsync(desc)
plr:PivotTo(char.HumanoidRootPart.CFrame)
plr2:PivotTo(plr.PrimaryPart.CFrame)
plr2.HumanoidRootPart.Anchored = true
char.HumanoidRootPart.Anchored = true
for _, EA in char:GetChildren() do
if EA.Name == "AccWeld" then
EA:Destroy()
end
end
for _, part in plr:GetDescendants() do
	if part:IsA("Accessory") then
	part.Parent = plr2
		if part.AccessoryType == Enum.AccessoryType.Jacket or part.AccessoryType == Enum.AccessoryType.Shirt or part.AccessoryType == Enum.AccessoryType.Pants or part.AccessoryType == Enum.AccessoryType.Shorts or part.AccessoryType == Enum.AccessoryType.TShirt or part.AccessoryType == Enum.AccessoryType.Eyebrow or part.AccessoryType == Enum.AccessoryType.Eyelash or part.AccessoryType == Enum.AccessoryType.Sweater or part.AccessoryType == Enum.AccessoryType.DressSkirt then
	part:Destroy()
end
	
	for _, pw in part:GetDescendants() do
				if pw:IsA("Weld") then
			
	
			print("doing pw now")
			local weld = Instance.new("WeldConstraint")
			weld.Parent = char
			weld.Name = "AccWeld"
				weld.Part0 = char[pw.Part1.Name]
			weld.Part1 = pw.Part0
			pw.Part0.Massless = true
			pw.Part0.Name = part.Name
			pw.Part0.Parent = char
		weld.Enabled = true
			print("done: "..part.Name)
		end
	end
	
	end
end
char.HumanoidRootPart.Anchored = false

--script.Parent:PivotTo(workspace.SpawnLocation.CFrame)
plr:Destroy()
plr2:Destroy()
