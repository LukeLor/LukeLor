local char = workspace.X_masLucas7 
local RightHand = char:WaitForChild("RightHand")
local LeftHand = char:WaitForChild("LeftHand")
local hitbox = Instance.new("Part")
hitbox.Parent = char
hitbox.Size = Vector3.new(4,4,4)
hitbox.CanCollide = false
local weld = Instance.new("WeldConstraint")
hitbox.CFrame = RightHand.CFrame
weld.Part0 = RightHand 
weld.Part1 = hitbox
weld.Parent = hitbox
char.Data.HoldingItem.HeldItem.Value = hitbox
hitbox.Name = "Punch"
char.Data.HoldingItem.Value = true
char.Data.HoldingItem.HeldItem.Melee.Value = true
local animobj = Instance.new("Animation")
animobj.AnimationId = "rbxassetid://109097434361117"
animobj.Parent = char
hitbox.CanTouch = false
local animtrack = char:WaitForChild("Humanoid"):LoadAnimation(animobj)
game.ReplicatedStorage.Events.ItemEvent.OnServerEvent:Connect(function(plr, type, obj)

    if type == "Melee" and obj.Name == "Punch" then
      animtrack:Play()
      for i = 0, animtrack.Length*animtrack.Speed, 0.1 do
        hitbox.CanTouch = true
       hitbox.Touched:Connect(function(hit)
if hit.Parent:FindFirstChild("Humanoid") then
local hithum = hit.Parent:WaitForChild("Humanoid")
             hithum.Health -= 20
            end
          end)
      end
      hitbox.CanTouch = false
    end
  end)
