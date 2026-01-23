local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LatestRoom = ReplicatedStorage.GameData.LatestRoom.Value

local currentLoadedRoom = workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom-1))
if not currentLoadedRoom then return end

local model = game:GetObjects("rbxassetid://130117055058747")[1]
if not model then return end

model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end

local nodes = currentLoadedRoom.PathfindNodes:GetChildren()
if #nodes == 0 then return end

local node = nodes[math.random(1, #nodes)]
model:SetPrimaryPartCFrame(node.CFrame + Vector3.new(0, 7, 0))
model.Parent = workspace
