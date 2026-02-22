local char = workspace.X_masLucas7
local plrrep = game.ReplicatedStorage.StoredObj.PlrRep
local plr = plrrep:Clone()


plr.Parent = workspace
local id = 290323663 --game.Players:FindFirstChild(script.Parent.Name).UserId
print(id)
local desc = game.Players:GetHumanoidDescriptionFromUserIdAsync(id)
plr.Humanoid:ApplyDescriptionAsync(desc)
plr:PivotTo(char.HumanoidRootPart.CFrame)
local s_id = "rbxassetid://0"
if plr:FindFirstChildOfClass("Shirt") then
s_id = plr:FindFirstChildOfClass("Shirt").ShirtTemplate
end

local p_id = "rbxassetid://0"

if plr:FindFirstChildOfClass("Pants") then
	p_id = plr:FindFirstChildOfClass("Pants").PantsTemplate
end

local t_id = "rbxassetid://0"

if plr:FindFirstChildOfClass("ShirtGraphic") then
	t_id = plr:FindFirstChildOfClass("Pants").PantsTemplate
end

	--Upper
for _, textures in char:WaitForChild("UpperTorso"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].TorsoColor3
	end
if textures:IsA("Texture") and textures.Name == "TShirt" then
		textures.Texture = t_id
		textures.ZIndex = 5
	end
end
for _, textures in char:WaitForChild("LowerTorso"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].TorsoColor3
	end
if textures:IsA("Texture") and textures.Name == "TShirt" then
		textures.Texture = t_id
		textures.ZIndex = 5
	end
end
for _, textures in char:WaitForChild("LeftUpperArm"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].LeftArmColor3
	end
if textures:IsA("Texture") and textures.Name == "TextureBU" then
		textures.Texture = s_id
		textures.ZIndex = 2
end
end
for _, textures in char:WaitForChild("LeftLowerArm"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].LeftArmColor3
	end
end
for _, textures in char:WaitForChild("RightUpperArm"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
if textures:IsA("Texture") and textures.Name == "TextureBU" then
		textures.Texture = s_id
		textures.ZIndex = 2
end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].RightArmColor3
	end
end
for _, textures in char:WaitForChild("RightLowerArm"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = s_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].RightArmColor3
	end
end

--Hands
for _, textures in char:WaitForChild("LeftHand"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		if textures.Face ~= Enum.NormalId.Bottom then
			textures.Texture = s_id
			textures.ZIndex = 3
		else
			textures.Texture = "rbxassetid://15650043117"
			textures.ZIndex = 1
			textures.Color3 = plr["Body Colors"].LeftArmColor3
		end
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].LeftArmColor3
	end
end
for _, textures in char:WaitForChild("RightHand"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		if textures.Face ~= Enum.NormalId.Bottom then
		textures.Texture = s_id
			textures.ZIndex = 3
		else
			textures.Texture = "rbxassetid://15650043117"
			textures.ZIndex = 1
			textures.Color3 = plr["Body Colors"].RightArmColor3
		end
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].RightArmColor3
	end
end

--Head

for _, textures in char:WaitForChild("Head"):GetDescendants() do
	if textures:IsA("Texture") then
		textures.Color3 = plr["Body Colors"].HeadColor3
			textures.ZIndex = 3
		
	end
end

--Legs

for _, textures in char:WaitForChild("LeftUpperLeg"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = p_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].LeftLegColor3
	end
end
for _, textures in char:WaitForChild("LeftLowerLeg"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = p_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].LeftLegColor3
	end
end
for _, textures in char:WaitForChild("RightUpperLeg"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = p_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].RightLegColor3
	end
end
for _, textures in char:WaitForChild("RightLowerLeg"):GetDescendants() do
	if textures:IsA("Texture") and textures.Name == "Texture" then
		textures.Texture = p_id
		textures.ZIndex = 3
	end
	if textures:IsA("Texture") and textures.Name == "SkinTexture" then
		textures.Texture = "rbxassetid://15650043117"
		textures.ZIndex = 1
		textures.Color3 = plr["Body Colors"].RightLegColor3
	end
end

char.HumanoidRootPart.Anchored = false

--script.Parent:PivotTo(workspace.SpawnLocation.CFrame)
plr:Destroy()

