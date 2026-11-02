wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

print("go entity")

function VisualizeNodes(room)
	local pfs = game:GetService("PathfindingService")
	local startPosition = room:WaitForChild("RoomEntrance").Position
	local goalPosition = room:WaitForChild("RoomExit").Position
	local path = pfs:CreatePath()
	path:ComputeAsync(startPosition, goalPosition)
	local generatednodes= {}
	local spart = Instance.new("Part")
	spart.Position = startPosition - Vector3.new(0,15.5,0)
	spart.Size= Vector3.new(1,1,1)
	spart.Parent = room
	spart.Anchored = true
	spart.CanCollide = false
	spart.Transparency = 0
	generatednodes[1] = spart
	local epart = Instance.new("Part")
	epart.Position = goalPosition- Vector3.new(0,15.5,0)
	epart.Size= Vector3.new(1,1,1)
	epart.Parent = room
	epart.Anchored = true
	epart.CanCollide = false
	epart.Transparency = 1
	generatednodes[2] = epart
	--epart.Position = startPosition - Vector3.new(0,6,0)
	if #path:GetWaypoints() > 0 then
		for _, wpt in path:GetWaypoints() do
			local part = Instance.new("Part")
			part.Position = wpt.Position - Vector3.new(0,15.5,0)
			part.Size= Vector3.new(1,1,1)
			part.Parent = room
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1

			generatednodes[#generatednodes +1] = part
		end
	else
		warn("Couldn't find any nodes. Start -- End is too obstructed making pathfind not work.")
	end
	if #generatednodes == 2 then
		warn("2 nodes have been found, most likely the Start and End of room.")
	else
		print("Found 2+ nodes!")
	end
	return generatednodes
end
local room = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
local nodes = VisualizeNodes(room)
local cnode = nodes[math.random(1,#nodes)]

local model =  LoadCustomInstance("https://github.com/LukeLor/LukeLor/blob/main/DoorsStuffOther/A-150.rbxm?raw=true")
  -- game.ReplicatedStorage["A-150"]:Clone()

if not model then return end
print("Model has loaded!")
model.Entity.CanCollide = false
model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")
model.Parent = workspace
model:PivotTo(cnode.CFrame)

task.wait(2)
game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = model.Entity.Position + Vector3.new(0,15,0)}):Play()
game:GetService("TweenService"):Create(model.Root["a-150 =]"], TweenInfo.new(2), {Transparency = 1, Color3 = Color3.new(0.592157, 0.964706, 1)}):Play()

task.wait(2.3)
local startPos = model.Entity.Position
local hidingSpotsCheck = {"Wardrobe", "Locker_Large","Toolshed","Rooms_Locker","Rooms_LockerKitchen","Backdoor_Wardrobe","ArchivesLocker"}
local existingHidingSpots ={}
for _, inst in room:GetDescendants() do
	if table.find(hidingSpotsCheck, inst.Name) then
		table.insert(existingHidingSpots, inst)
	end

end
local closetNodes = Instance.new("Folder")
closetNodes.Parent = room
closetNodes.Name = "EntityCloseNodes"
for i = 1, #existingHidingSpots do
	local hidingSpot = existingHidingSpots[i]
	--game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = hidingSpot.PrimaryPart.Position}):Play()
	local openAnim = hidingSpot:FindFirstChild("Anim_EnterModel")
	local mainPart = hidingSpot:FindFirstChild("Main")
	local sound = nil
	if mainPart then
		sound = hidingSpot:FindFirstChild("Main").SoundEnter
	end
	local startPosition = model.Entity.Position
	local goalPosition = hidingSpot.PrimaryPart.Position
	local path = game:GetService("PathfindingService"):CreatePath()
	path:ComputeAsync(startPosition, goalPosition)

	if #path:GetWaypoints() > 0 then
		print("more than 0 wpts")
		for _, wpt in path:GetWaypoints() do
			local part = Instance.new("Part")
			part.Position = wpt.Position+ Vector3.new(0,6,0)
			part.Size= Vector3.new(1,1,1)
			part.Parent = closetNodes
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1
			game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2/#path:GetWaypoints()), {Position = part.Position}):Play()
			task.wait(2/#path:GetWaypoints())
		end
	else
		warn("no wpts")
	end
	game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = hidingSpot.PrimaryPart.Position}):Play()

	task.wait(2)
	if sound ~= nil then
		sound:Play()
	end
	if openAnim then
		hidingSpot:FindFirstChildOfClass("AnimationController"):LoadAnimation(openAnim):Play()
	end
	if hidingSpot:FindFirstChild("HiddenPlayer") then
		local char = hidingSpot:FindFirstChild("HiddenPlayer").Value
		if char ~= nil then
			char:WaitForChild("Humanoid").Health = 0
		end

	end
end

closetNodes:Destroy()
local path = game:GetService("PathfindingService"):CreatePath()
path:ComputeAsync(model.Entity.Position, startPos)

if #path:GetWaypoints() > 0 then
	print("more than 0 wpts")
	for _, wpt in path:GetWaypoints() do
		local part = Instance.new("Part")
		part.Position = wpt.Position + Vector3.new(0,6,0)
		part.Size= Vector3.new(1,1,1)
		part.Parent = closetNodes
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 1
		game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2/#path:GetWaypoints()), {Position = part.Position}):Play()
		task.wait(2/#path:GetWaypoints())
	end
else
	warn("no wpts")
end
game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position =startPos}):Play()
task.wait(2)
game:GetService("TweenService"):Create(model.Root["a-150 =]"], TweenInfo.new(2), {Transparency = 0, Color3 = Color3.new(0, 0, 0)}):Play()

game:GetService("TweenService"):Create(model.Entity, TweenInfo.new(2), {Position = startPos-Vector3.new(0,15,0)}):Play()
task.wait(2)
game:GetService("TweenService"):Create(model.Root, TweenInfo.new(1), {Size = Vector3.new(0,0,0)}):Play()
task.wait(3)
model:Destroy()
