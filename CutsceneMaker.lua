local module = {}
module.LookAt = function(Part, timev)
	if Part and Part:IsA("Part") or Part and Part:IsA("BasePart") or Part and Part:IsA("MeshPart") then
		if timev then
			
			game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timev), {CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Part.Position)}):Play()	
	else	
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Part.Position)
		end	
		else
		warn("Can't look at object. LookAt uses: Part and time. Time is optional.")
	end
	
end
module.LockOn = function(Part, timev)
	if Part and Part:IsA("Part") or Part and Part:IsA("BasePart") or Part and Part:IsA("MeshPart") then
		if timev then
			
			local countdown = function(desttime)
				local timer = 0
				repeat timer = timer + 0.1 wait(0.1) print(timer) workspace.CurrentCamera.CFrame = Part.CFrame until timer >= desttime
			end
		local camto = coroutine.create(function()
			countdown(timev)
			end
		)	
		coroutine.resume(camto)
	else
		warn("Can't lock on to object. LockOn uses: Part and time.")
	end
	else
		warn("Can't lock on to object. LockOn uses: Part and time.")
	end
		

end
module.ShakeCamera = function(magnitude, roughness, fadeInTime, fadeOutTime)
	local camera = workspace.CurrentCamera
	local shaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/RbxCameraShaker/refs/heads/master/src/CameraShaker/init.lua"))()
	local camShake = shaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
		camera.CFrame =  camera.CFrame * shakeCFrame
	end)
	if magnitude and roughness and fadeInTime and fadeOutTime then
		camShake:ShakeOnce(magnitude, roughness, fadeInTime, fadeOutTime)
	else
		warn("Missing magnitude, roughness, fadeInTime, or fadeOutTime. ShakeCamera uses: (magnitude, roughness, fadeInTime, fadeOutTime).")
	end
end

module.CamTo = function(destination, timeT, style, direction)
	
	if destination ~= nil and timeT ~= nil then
		
		if destination and timeT and not style and not direction then
			if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT), {CFrame = destination.CFrame}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and not style and not direction then
			if destination:IsA("CFrame")  then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT), {CFrame = destination}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and not direction then
			if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style), {CFrame = destination.CFrame}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and not direction then
			if destination:IsA("CFrame")  then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style), {CFrame = destination}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and  direction then
			if destination:IsA("Part") or destination:IsA("BasePart") or destination:IsA("MeshPart") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style,direction), {CFrame = destination.CFrame}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and  direction then
			if destination:IsA("CFrame")  then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style, direction), {CFrame = destination}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and not style and not direction then
			if destination:IsA("Attachment") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT), {CFrame = destination.WorldCFrame}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and not direction then
			if destination:IsA("Attachment") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style), {CFrame = destination.WorldCFrame}):Play()
				task.wait(timeT)
			end
		end
		if destination and timeT and  style and  direction then
			if destination:IsA("Attachment") then
				game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(timeT, style, direction), {CFrame = destination.WorldCFrame}):Play()
				task.wait(timeT)
			end
		end
	else
		warn("Invalid time and or destination. CamTo uses: (destination,time, style, direction). Style and Direction are optional.")
	end
end

module.CreateScene = function(...)

--return instructions
	--warn("There are no instructions (arguments) to create a scene.")

end



module.PlayAnimation = function(Rig, Animation, Name)
	if Rig and Animation then
		if Animation then
			local animationtrack = Instance.new("Animation")
			animationtrack.Parent = Rig
			animationtrack.AnimationId = Animation
			Animation = animationtrack
			wait()
			Animation.Name = Name
		end
		Animation.Parent = Rig
		local player = Rig:WaitForChild("Humanoid") or Rig:WaitForChild("AnimationController")
		player:LoadAnimation(Animation):Play()
	else
		warn("Invalid Rig and or Animation. PlayAnimation uses: (Rig, Animation, Name). Name is optional.")
	end

end


module.PlaySound = function(SoundId, Parent)
	if SoundId then
		local sound = Instance.new("Sound") 
		sound.SoundId = SoundId
		if Parent then
			sound.Parent = Parent
		else 
			sound.Parent = workspace
		end
		sound:Play()
	else
		warn("No SoundId to play..")
	end
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
