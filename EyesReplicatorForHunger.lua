local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local model = game:GetObjects("rbxassetid://130117055058747")[1]
local num = math.random(1, #currentLoadedRoom.Nodes:GetChildren())
model.PrimaryPart.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)
model.PrimaryPart.Parent = workspace
