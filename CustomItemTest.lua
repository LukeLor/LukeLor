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
RepLaunch.Parent = char
item.Parent = RepLaunch
item.CFrame = RepLaunch.Handle.CFrame

RepLaunch.Handle.BulletWeld.Part0 = item
RepLaunch.Handle.BulletWeld.Parent = item
item.BulletWeld.Enabled = false
RepLaunch.Handle.Bullet.CFrame = item.CFrame
item.BulletWeld.Enabled = true
RepLaunch.Handle.Bullet.Parent = item
item.Bullet.Material = Enum.Material.Neon
item.Bullet.Color = Color3.fromRGB(0,255,127.5)
RepLaunch.Handle:Destroy()
RepLaunch.Name = "PGun" 
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
item.Rotation += Vector3.new(90,0,0)
item.Name = "PGun"

char.Data.HoldingItem.Value = true
char.Data.HoldingItem.HeldItem.Value = item
char.Data.HoldingItem.HeldItem.CanShoot.Value = true


game.ReplicatedStorage.Events.ItemEvent.OnServerEvent:Connect(function(plr, itemobj)
print("omg item")
    if plr.Name == char.Name then
    if itemobj.Name == "PGun" then
      print("paired")
      local bullet = itemobj.Bullet
      bullet.Touched:Connect(function(hit)
          print("ack")
if hit.Name ~= "PGun" then
local tp= Instance.new("Part")
           tp.Parent = workspace
            tp.Size = Vector3.new(1,1,1)
           tp.CFrame = bullet.CFrame
            tp.Anchored = true
            char:PivotTo(tp.CFrame)
            print("Boop")
            bullet:Destroy()
          end
        end)
      while task.wait(0.1) do
bullet.AssemblyLinearVelocity = bullet.AssemblyLinearVelocity - Vector3.new(0,15,0)
      end
      end
    end
  end)
