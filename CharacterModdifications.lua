local module = {}

module.PopEffect = function(color)
local char = game.Players.LocalPlayer.CharacterAdded:Wait()

for _,  bparts in pairs(char:GetDescendants()) do
	
	if bparts:IsA("Part") or bparts:IsA("BasePart") or bparts:IsA("MeshPart") then
		local ts = game:GetService("TweenService")
		local clonedbp = bparts:Clone()
		clonedbp.Anchored = true
		for _, welds in pairs(clonedbp:GetDescendants()) do
			if welds:IsA("WeldConstraint") or welds:IsA("Motor6D") or welds:IsA("Weld") then
				welds:Destroy()
			end
		end
		if bparts.Parent:IsA("Accessory") then
			if bparts.Parent.AccessoryType == Enum.AccessoryType.Shirt or bparts.Parent.AccessoryType == Enum.AccessoryType.Pants or bparts.Parent.AccessoryType == Enum.AccessoryType.Shorts or bparts.Parent.AccessoryType == Enum.AccessoryType.Jacket or bparts.Parent.AccessoryType == Enum.AccessoryType.TShirt or bparts.Parent.AccessoryType == Enum.AccessoryType.LeftShoe or bparts.Parent.AccessoryType == Enum.AccessoryType.RightShoe or bparts.Parent.AccessoryType == Enum.AccessoryType.Sweater or bparts.Parent.AccessoryType == Enum.AccessoryType.DressSkirt then
				clonedbp.Transparency = 1
			end
		end
	if clonedbp:IsA("MeshPart") then
		clonedbp.TextureID = ""
	end
		clonedbp.Parent = workspace
		clonedbp.Color = Color3.fromRGB(135, 255, 126)
		ts:Create(clonedbp, TweenInfo.new(3), {Transparency = 1}):Play()
		ts:Create(clonedbp, TweenInfo.new(3), {Size = clonedbp.Size*2.2}):Play()
		ts:Create(clonedbp, TweenInfo.new(0), {Material = 288}):Play()
		clonedbp.CanCollide = false
		clonedbp.Name = clonedbp.Name.."_Clone"
	
		if clonedbp:FindFirstChildOfClass("Decal") then
			
			clonedbp:FindFirstChildOfClass("Decal"):Destroy()
		end
game.Debris:AddItem(clonedbp, 3.5)

	end

end

end

module.InPopEffect = function(color)
local char = game.Players.LocalPlayer.CharacterAdded:Wait()

for _,  bparts in pairs(char:GetDescendants()) do
	
	if bparts:IsA("Part") or bparts:IsA("BasePart") or bparts:IsA("MeshPart") then
		local ts = game:GetService("TweenService")
		local clonedbp = bparts:Clone()
		clonedbp.Anchored = true
		for _, welds in pairs(clonedbp:GetDescendants()) do
			if welds:IsA("WeldConstraint") or welds:IsA("Motor6D") or welds:IsA("Weld") then
				welds:Destroy()
			end
		end
		if bparts.Parent:IsA("Accessory") then
			if bparts.Parent.AccessoryType == Enum.AccessoryType.Shirt or bparts.Parent.AccessoryType == Enum.AccessoryType.Pants or bparts.Parent.AccessoryType == Enum.AccessoryType.Shorts or bparts.Parent.AccessoryType == Enum.AccessoryType.Jacket or bparts.Parent.AccessoryType == Enum.AccessoryType.TShirt or bparts.Parent.AccessoryType == Enum.AccessoryType.LeftShoe or bparts.Parent.AccessoryType == Enum.AccessoryType.RightShoe or bparts.Parent.AccessoryType == Enum.AccessoryType.Sweater or bparts.Parent.AccessoryType == Enum.AccessoryType.DressSkirt then
				clonedbp.Transparency = 1
			end
		end
	if clonedbp:IsA("MeshPart") then
		clonedbp.TextureID = ""
	end
		clonedbp.Parent = workspace
		clonedbp.Color = Color3.fromRGB(135, 255, 126)
		ts:Create(clonedbp, TweenInfo.new(0), {Transparency = 1}):Play()
		ts:Create(clonedbp, TweenInfo.new(0), {Size = clonedbp.Size*2.2}):Play()
		ts:Create(clonedbp, TweenInfo.new(0), {Material = 288}):Play()
		clonedbp.CanCollide = false
		clonedbp.Name = clonedbp.Name.."_Clone"
	
		if clonedbp:FindFirstChildOfClass("Decal") then
			
			clonedbp:FindFirstChildOfClass("Decal"):Destroy()
		end

game.Debris:AddItem(clonedbp, 5)
wait(0.75)
ts:Create(clonedbp, TweenInfo.new(1.5), {Size = bparts.Size}):Play()
ts:Create(clonedbp, TweenInfo.new(1.5), {Transparency = 0}):Play()
		--ts:Create(clonedbp, TweenInfo.new(0), {Size = clonedbp.Size*2.2}):Play()
		ts:Create(clonedbp, TweenInfo.new(1.5), {Material = 272}):Play()

wait(0.4)
ts:Create(clonedbp, TweenInfo.new(0), {Size = clonedbp.Size*2.2}):Play()
	
	end

end

end

return module
