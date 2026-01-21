local playerCFrame = workspace.CurrentCamera.CFrame 
	 local CameraShaker = require(game.ReplicatedStorage.CameraShaker) 
		local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame) 	
			workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * shakeCFrame 
		end) 
		workspace.used.TimePosition = 0.15
		workspace.used:Play()
		workspace.used.TimePosition = 0.15
		workspace.used.Volume = 0.5
		game.TweenService:Create(workspace.used, TweenInfo.new(1.75), {Volume = 0}):Play() 
		camShake:ShakeOnce(5,15,0,1) 
		task.wait(1.375) 
		workspace.used.TimePosition = 6
		game.TweenService:Create(workspace.used, TweenInfo.new(1), {Volume = 0.5}):Play()

		camShake:ShakeOnce(5,6,0,1.75)
