local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local model = game:GetObjects("rbxassetid://11488518082")[1]
local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
model.PrimaryPart.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)
model.PrimaryPart.Parent = workspace
