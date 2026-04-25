function VisualizeNodes(room)
  local pfs = game:GetService("PathfindingService")
local startPosition = room:WaitForChild("RoomEntrance").Position
local goalPosition = room:WaitForChild("RoomExit").Position
  local path = pfs:CreatePath()
path:ComputeAsync(startPosition, goalPosition)
  local generatednodes= {}
  local spart = Instance.new("Part")
  spart.Position = startPosition
  spart.Size= Vector3.new(1,1,1)
  spart.Parent = room
  spart.Anchored = true
  spart.CanCollide = false
spart.Transparency = 1
	generatednodes[1] = spart
  local epart = Instance.new("Part")
  epart.Position = goalPosition
  epart.Size= Vector3.new(1,1,1)
  epart.Parent = room
  epart.Anchored = true
  epart.CanCollide = false
	epart.Transparency = 1
  generatednodes[2] = epart
  if #path:GetWaypoints() > 0 then
    for _, wpt in path:GetWaypoints() do
  local part = Instance.new("Part")
  part.Position = wpt.Position + Vector3.new(0,6,0)
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

local nodes = VisualizeNodes(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value])
local cnode = nodes[math.random(1,#nodes)]

local model = game:GetObjects("rbxassetid://136064945135625")[1]
if not model then return end
print("Model has loaded!")

model.PrimaryPart = model:FindFirstChildWhichIsA("BasePart")
if not model.PrimaryPart then return end
print("PrimaryPart found.")
model.Parent = workspace
model:PivotTo(cnode.CFrame)
