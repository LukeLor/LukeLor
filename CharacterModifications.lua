local module = {}

module.Vaporize = function(color)
	for i = 1, math.random(10,30) do
local model = Instance.new("Model")
local part = Instance.new("Part")
model.Parent = workspace
	part.Parent = model
	part.Anchored = true
	part.CanCollide = false
	model.PrimaryPart = part
	part.Color = color
local sizerandom = Vector3.new(math.random(1,5), math.random(1,5),math.random(1,5))
	part.Size = sizerandom
local randpos = Vector3.new(math.random(0,5),math.random(0,5),math.random(0,5))
	local mainranpos = part.Position + randpos

Model:SetPrimaryPartCFrame(CFrame.lookat(part.Position,mainranpos))


 local rotation = CFrame.Angles(math.rad(math.random(0,90)), math.rad(math.random(0,90)), math.rad(math.random(0,90)))

local modelCFrame = model:GetPrimaryPartCFrame()

	for i=1, 20 do
model:SetPrimaryPartCFrame( modelCFrame * rotation )
		part.Transparency += 0.05
		wait(0.1)
	end
	end
end


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
		clonedbp.Color = color
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
		clonedbp.Color = color
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
ts:Create(clonedbp, TweenInfo.new(0.75), {Size = clonedbp.Size*2.2}):Play()
	ts:Create(clonedbp, TweenInfo.new(0.75), {Transparency = 1}):Play()
	end

end

end for name, func in module do
    if typeof(func) == "function" then
        getgenv()[name] = func
    end
end

return module
