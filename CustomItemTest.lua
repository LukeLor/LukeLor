local st_item = game.InsertService:LoadAsset(10017566312)
local item = nil
local char = workspace.X_masLucas7 

for _, meshpart in st_item:GetDescendants() do
if meshpart:IsA("MeshPart") then 
item = meshpart
  end
end

if not item then return end 

local RepLaunch= game.ReplicatedStorage.ReplicatedCollectables.Launcher:Clone()
RepLaunch.Parent = workspace 
item.Parent = RepLaunch
item.CFrame = RepLaunch.Handle.CFrame
RepLaunch.Handle.BulletWeld.Part0 = item
RepLaunch.Handle.BulletWeld.Parent = item
RepLaunch.Handle.Bullet.Parent = item
RepLaunch.Handle:Destroy()
RepLaunch.Name = "Gun" 
item.Parent = RepLaunch 
item.Name = "Handle"
item.Size = item.Size * 0.2
item.CanCollide = false
item = RepLaunch
item.Parent = char
item.Name = "PGun"
local weld = Instance.new("WeldConstraint")
weld.Parent = char
weld.Name = "ItemWeld"
weld.Part0 = char.RightHand
weld.Part1 = item.Handle
item.Handle.Name = item.Name
item = item.PGun
item.Parent = char
char:FindFirstChildOfClass("Tool"):Destroy()

char.Data.HoldingItem.Value = true
char.Data.HoldingItem.HeldItem.Value = item
char.Data.HoldingItem.HeldItem.CanShoot.Value = true
