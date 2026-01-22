local cooldown = false
game:GetService("RunService").RenderStepped:Connect(function()
	
	local v3, OnScreen = workspace.CurrentCamera:WorldToScreenPoint(workspace.EyesE.PrimaryPart.Position)
	

	if OnScreen and not cooldown then
		if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Health > 0 and #workspace.CurrentCamera:GetPartsObscuringTarget({workspace.CurrentCamera.CFrame.Position,workspace.EyesE.PrimaryPart.Position},{workspace.EyesE.PrimaryPart}) == 0 and (workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position - workspace.EyesE.PrimaryPart.Position).Magnitude <= 125 then
		game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Health -= math.random(3,5)
	if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Health <= 0 then
game.TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0), {FieldOfView = 100, CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.EyesE.PrimaryPart.Position)}):Play()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				local moveSpeed = 0.01 
	repeat task.wait()
				
		
				local targetCFrame = workspace.CurrentCamera.CFrame 
				local distance = 1
moveSpeed = moveSpeed + 0.01
				
					local playerCFrame = workspace.CurrentCamera.CFrame 
					local CameraShaker = require(game.ReplicatedStorage.Modules.CameraShaker) 
					local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame) 	
						workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * shakeCFrame 
					end) 
					camShake:Start()
					camShake:ShakeOnce(3,1,0,0.025) 
				workspace.CurrentCamera.CFrame = targetCFrame * CFrame.new(0, 0, -distance)
				until (workspace.CurrentCamera.CFrame.Position - workspace.EyesE.PrimaryPart.Position).Magnitude <= 20
				workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				workspace.CurrentCamera.FieldOfView = 70
					
					
	end
	cooldown = true
			local playerCFrame = workspace.CurrentCamera.CFrame 
			local CameraShaker = require(game.ReplicatedStorage.Modules.CameraShaker) 
			local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame) 	
				workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * shakeCFrame 
			end) 
			camShake:Start()
			camShake:ShakeOnce(5,15,0,1) 
		task.wait(0.25)
		cooldown = false
		else
			
		end
	else
		
	end
end)
