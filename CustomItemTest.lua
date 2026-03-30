local st_item = game.InsertService:LoadAsset(10017566312)
local item = nil
local char = workspace.X_masLucas7 

for _, meshpart in st_item:GetDescendants() do
if meshpart:IsA("MeshPart") then 
item = meshpart
  end
end

if not item then return end 

local RepLaunch= game.ReplicatedStorage.ReplicatedCollectabables.Launcher:Clone()
RepLaunch.Parent = workspace 
RepLaunch
