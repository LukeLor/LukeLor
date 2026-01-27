local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LatestRoom = ReplicatedStorage.GameData.LatestRoom.Value

local currentLoadedRoom = workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom-1))
if not currentLoadedRoom then return end
print("Got current room: "..currentLoadedRoom.Name)

local model = game:GetObjects("rbxassetid://130117055058747")[1]
if not model then return end
print("Model has loaded!")

model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")

function GetNodesFromRoom(room, reversed)
	local nodes = {}
	local roomEntrance = room:FindFirstChild("RoomEntrance")
	if roomEntrance then
		local n = roomEntrance:Clone()
		n.Name = "0"
		n.CFrame -= Vector3.new(0, 3, 0)
		nodes[1] = n
	end

	local nodesFolder = room:FindFirstChild("PathfindNodes")
	if nodesFolder then
		for _, n in nodesFolder:GetChildren() do
			nodes[#nodes + 1] = n
		end
	end

	local roomExit = room:FindFirstChild("RoomExit")
	if roomExit then
		local index = #nodes + 1
		local n = roomExit:Clone()
		n.Name = index
		n.CFrame -= Vector3.new(0, 3, 0)
		nodes[index] = n
	end

	table.sort(nodes, function(a, b)
        if reversed then
            return tonumber(a.Name) > tonumber(b.Name)
        else
            return tonumber(a.Name) < tonumber(b.Name)
        end
	end)

	return nodes
end

local pathfindNodes = GetNodesFromRoom(currentLoadedRoom,  false)
model.Parent = workspace
model:PivotTo(CFrame.new(Vector3.new(0,0,0))

if pathfindNodes then
for _, n in pathfindNodes do
local cframe = n.CFrame + Vector3.new(0, 3, 0)
model:PivotTo(cframe)
  break
end
else
warn("for some non-apparent reason, there aren't any nodes...")
end
	print("spawned")
