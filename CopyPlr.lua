local id = 290323663
local char = workspace.X_masLucas7 
local plrrep = game.ReplicatedStorage.StoredObj.PlrRep
local plr = plrrep:Clone()
local plr2 = plrrep:Clone()
plr2.Parent =workspace
plr.Parent = workspace
 --game.Players:FindFirstChild(script.Parent.Name).UserId
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
local char = workspace.X_masLucas7
local plrrep = game.ReplicatedStorage.StoredObj.PlrRep
local plr = plrrep:Clone()


plr.Parent = workspace--game.Players:FindFirstChild(script.Parent.Name).UserId
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
 local desc = game.Players:GetHumanoidDescriptionFromUserId(id) local emotes = desc:GetEmotes() local char = workspace.X_masLucas7 local num = 0  for _, alrsetemotes in game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main:FindFirstChildOfClass("Frame").Front:FindFirstChildOfClass("TextButton"):GetChildren() do alrsetemotes.Image = "rbxassetid://0" alrsetemotes:SetAttribute("Name", "") end for i, v in pairs(emotes) do local emote = game.InsertService:LoadAsset(v[1]) local temp = char.Animate.walk:Clone() temp.Parent = char.Animate temp.Name = string.lower(i) temp:FindFirstChildOfClass("Animation").AnimationId = emote:FindFirstChildOfClass("Animation").AnimationId num = num+1 local image = "rbxthumb://type=Asset&id=" ..v[1].. "&w=150&h=150" game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main:FindFirstChildOfClass("Frame").Front:FindFirstChildOfClass("TextButton")[tostring(num)].Image = image game.Players[char.Name].PlayerGui.MainUi.EmoteWheel.Main:FindFirstChildOfClass("Frame").Front:FindFirstChildOfClass("TextButton")[tostring(num)]:SetAttribute("Name", i)    end 
