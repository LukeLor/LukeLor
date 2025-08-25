local module = {}

module.CamTo = function(destination, time, style, direction)
  if destination and time and not style and not direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time), {CFrame = destination.CFrame}):Play()
    end
  end
  if destination and time and not style and not direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time), {CFrame = destination}):Play()
    end
  end
  if destination and time and  style and not direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style), {CFrame = destination.CFrame}):Play()
    end
  end
  if destination and time and  style and not direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style), {CFrame = destination}):Play()
    end
  end
  if destination and time and  style and  direction then
    if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style,direction), {CFrame = destination.CFrame}):Play()
    end
  end
  if destination and time and  style and  direction then
    if destination:IsA("CFrame")  then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style, direction), {CFrame = destination}):Play()
    end
  end
    end


return module 
