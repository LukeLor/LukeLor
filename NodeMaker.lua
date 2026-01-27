function VisualizeNodes(room)
  local pfs = game:GetService("PathfindingService")
local startPosition = room:WaitForChild("RoomEntrance").Position
local goalPosition = room:WaitForChild("RoomExit").Position
  local path = pfs:CreatePath()
path:ComputeAsync(startPosition, goalPosition)
  local generatednodes= {}
  local spart = Instance.new("Part")
   spart.Position = startCFrame
   spart.Size= Vector3.new(1,1,1)
  spart.Parent = workspace
  generatednodes[1] = spart
  local epart = Instance.new("Part")
   epart.Position = goalPosition
   epart.Size= Vector3.new(1,1,1)
  epart.Parent = workspace
  generatednodes[2] = epart
  for wpt in path:GetWaypoints() do
local part = Instance.new("Part")
   part.Position = wpt.Position
   part.Size= Vector3.new(1,1,1)
  part.Parent = workspace
    generatednodes[#generatednodes +1] = part
  end
  if #generatednodes == 2 then
warn("2 nodes have been found, most likely the Start and End of room.")
  else
    warn("Found 2+ nodes!")
  end
    return generatednodes
end

local nodes = VisualizeNodes(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value])
local cnode = nodes[math.random(1,#nodes)]

local highlight = Instance.new("Highlight")
highlight.Parent = cnode
