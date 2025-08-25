local module = {}

module.CamTo = function(destination, time, style, direction)
  if destination ~= nil and time ~= nil then
  if destination and time and not style and not direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time), {CFrame = destination.CFrame}):Play()
        task.wait(time)
    end
  end
  if destination and time and not style and not direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time), {CFrame = destination}):Play()
    task.wait(time)
      end
  end
  if destination and time and  style and not direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style), {CFrame = destination.CFrame}):Play()
  task.wait(time)
      end
  end
  if destination and time and  style and not direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style), {CFrame = destination}):Play()
  task.wait(time)
      end
  end
  if destination and time and  style and  direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style,direction), {CFrame = destination.CFrame}):Play()
   task.wait(time)
      end
  end
  if destination and time and  style and  direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style, direction), {CFrame = destination}):Play()
  task.wait(time)
      end
  end
  else
    warn("Invalid time and or destination. CamTo uses: (destination,time, style, direction). Style and Direction are optional.")
  end
    end

module.CreateScene = function(...)
local instructions = table.pack(...)
end

module.PlayScene = function(Scene)
for inum, instruction in Scene do
Scene[inum]()
end
end

module.PlayAnimation = function(Rig, Animation)
if Animation:IsA("String") then
local animationtrack = Instance.new("Animation")
    animationtrack.Parent = Rig
    animationtrack.AnimationId = Animation
    Animation = animationtrack
  end
  local player = Rig:WaitForChild("Humanoid") or Rig:WaitForChild("AnimationController")
  player:LoadAnimation(Animation)
end

return module 
