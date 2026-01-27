function GeneratePath(room)
local pfs = game:GetService("PathfindingService")
local startPosition = room:WaitForChild("RoomEntrance").Position
local goalPosition = room:WaitForChild("RoomExit").Position
local path = pfs:CreatePath()
path = path:ComputeAsync(startPosition, goalPosition)
return path
end

function VisualizeNodes(path)
  local generatednodes= {}
for wpt in path:GetWaypoints() do
local part = Instance.new("Part")
   part.Position = wpt.Position
   part.Size= Vector3.new(1,1,1)
  part.Parent = workspace
    generatednodes[#generatednodes +1] = part
  end
  return generatednodes
end

local nodes = VisualizeNodes(GeneratePath(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]))
local cnode = nodes[math.random(1,#nodes)]

local highlight = Instance.new("Highlight")
highlight.Parent = cnode
