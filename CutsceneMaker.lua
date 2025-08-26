local module = {}

module.ShakeCamera = function(ST)
	local camera = workspace.CurrentCamera
local shaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/RbxCameraShaker/refs/heads/master/src/CameraShaker/init.lua"))()
	local camShake = shaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
			camera.CFrame =  camera.CFrame * shakeCFrame
		end)
end

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
		if destination and time and not style and not direction then
    if destination:IsA("Attachment") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time), {CFrame = destination.WorldCFrame}):Play()
        task.wait(time)
    end
		end
		if destination and time and  style and not direction then
    if destination:IsA("Attachment") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style), {CFrame = destination.WorldCFrame}):Play()
        task.wait(time)
    end
		end
		if destination and time and  style and  direction then
    if destination:IsA("Attachment") then
game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(time, style, direction), {CFrame = destination.WorldCFrame}):Play()
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
	local oldcamtype = workspace.CurrentCamera.CameraType
	task.wait(0.1)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
for inum, instruction in Scene do
Scene[inum]()
end
	workspace.CurrentCamera.CameraType = oldcamtype
	
end

module.PlayAnimation = function(Rig, Animation, Name)
  if Rig and Animation then
if Animation:IsA("String") then
local animationtrack = Instance.new("Animation")
    animationtrack.Parent = Rig
    animationtrack.AnimationId = Animation
    Animation = animationtrack
      wait()
      Animation.Name = Name
  end
  local player = Rig:WaitForChild("Humanoid") or Rig:WaitForChild("AnimationController")
  player:LoadAnimation(Animation):Play()
  else
    warn("Invalid Rig and or Animation. PlayAnimation uses: (Rig, Animation, Name). Name is optional."
  end
end


module.PlaySound = function(SoundId, Parent)
local sound = Instance.new("Sound") 
    sound.SoundId = SoundId
    if Parent then
sound.Parent = Parent
      else 
      sound.Parent = workspace
    end
    sound:Play()
  end

  module.SyncAnimationEvent = function(Animation, SignalName, WhatToDo)
		if Animation and SignalName then
Animation:GetMarkerReachedSignal(SignalName):Connect(function(...)
					if WhatToDo then
	WhatToDo()
					else
						print("Nothing is available.")
					end
end)
				
		else
			warn("Invalid Animation and or SignalName. SyncAnimationEvent uses: (Animation, SignalName,WhatToDo). WhatToDo is optional.")
		end
  end

  
    return module 
