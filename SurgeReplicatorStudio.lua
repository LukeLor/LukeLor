loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

	local SurgeFaces = {"rbxassetid://118873055196420", "rbxassetid://134903720492948", "rbxassetid://132882139467436"}
	local SurgeEffect = "rbxassetid://87098132980397"
	local start = Instance.new("Part")
	start.Size=Vector3.new(1,1,1)
	start.Transparency =1
	start.Position = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)

	local FaceColors = {
		ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
		ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 192, 0)),
		ColorSequenceKeypoint.new(0.9, Color3.fromRGB(0, 150, 225)), 
		ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)), 
	}
	print("going off")

	local PointA = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)
	local PointB = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position
	local main = Instance.new("Part")
	main.Size=Vector3.new(1,1,1)

	main.Transparency =1
	main.Position = PointB
	local Model = nil --Own model with primarypart
	local Part = nil
	local remotesFolder = ReplicatedStorage:WaitForChild("RemotesFolder")

	if Model == nil then
		local Surge = Instance.new("Model")
		Surge.Name = "Surge" 
		local main = Instance.new("Part") 
		main.Parent = Surge
		main.Anchored = true
		main.Shape = Enum.PartType.Ball
		main.Size = Vector3.new(3,3,3)
		main.Transparency = 1
		main.CanCollide = false
		main.Name = "SurgeMain"
		local FaceAtt = Instance.new("Attachment")
		FaceAtt.Parent = main
		FaceAtt.Name = "FaceAt"
		FaceAtt.Position = Vector3.new(0,0,0)
		FaceAtt.WorldPosition = main.Position
		local Face = Instance.new("ParticleEmitter") 
		Face.Parent = FaceAtt
		Face.Texture = SurgeFaces[1]
		Face.Speed = NumberRange.new(0, 0)
		Face.Lifetime = NumberRange.new(0.1, 0.1)
		Face.Rate = 50
		Face.Rotation = NumberRange.new(-15, 15) 
		Face.RotSpeed = NumberRange.new(0, 0)
		Face.Name = "Face" 
		Face.Size = NumberSequence.new(2.56)
		Face.Color = ColorSequence.new(FaceColors) 
		local light = Instance.new("PointLight")
		light.Parent = FaceAtt
		light.Color = Color3.fromRGB(255,255,224)
		light.Shadows = true
		Surge.PrimaryPart = main
		light.Range = 25
	light.Brightness = 20
		Part = main
		Model = Surge
		Model.Parent = workspace
	else
		Model.Parent = workspace
		Part = Model.PrimaryPart
	end
	local effectui=Instance.new("ScreenGui")
	local effectil = Instance.new("ImageLabel")
	effectil.Image = SurgeEffect 
	effectui.Name = "SurgeEffectUi" 
	effectil.Parent = effectui
	effectil.Size = UDim2.new(1, 0,1, 0) 
	effectil.Transparency = 1
	effectui.Parent = game.Players.LocalPlayer.PlayerGui
	effectil.AnchorPoint = Vector2.new(0,0)
	Model:PivotTo(start.CFrame)
	local cosf = coroutine.create(function()
		while wait(0.1) do

			for i=1, 1 do
				if Model.Name == "Surge" then
					Model.SurgeMain.FaceAt.Face.Texture = SurgeFaces[i] 
					wait(0.1)
				end
			end
		end

	end)

	coroutine.resume(cosf)
	local cosd = coroutine.create(function()
		while wait(0.1) do

			local MagnitudeS = (workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position - Part.Position).Magnitude
			local cd = false
			if MagnitudeS < 10 and cd == false and workspace:FindFirstChild(game.Players.LocalPlayer.Name):GetAttribute("Hiding") == false then 
				cd = true
				workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid").Health -= 40
				wait(0.4)
				cd = false
				wait(0.1)
				if workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("Humanoid").Health <= 0 then
					--Death msg
				if firesignal then
					firesignal(remotesFolder.DeathHint.OnClientEvent, {"Hmm. What was it this time?", "You've died to what I call Surge.","What did it feel like? All the electricity in your body?","...Probably not great.", "You can do this. I believe in you.", "I'll see you next time. Right?" } , "Yellow")
				else
					warn("firesignal not supported, ignore death hints.")
				end
					cd=true
				end
			end
		end

	end)

	coroutine.resume(cosd)

	local cose = coroutine.create(function()


		while task.wait() do

			local MagnitudeS = (workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position - Part.Position).Magnitude
			if MagnitudeS < 131 then 
				effectil.ImageTransparency = MagnitudeS/13
			end
		end

	end)

	coroutine.resume(cose)

	local Magnitude = (PointA - PointB).Magnitude
	print(Magnitude)
	print(PointA)
	print(PointB)
	wait(0.1)
	--local MidPosition = CFrame.new(PointA, PointB) * CFrame.new(0, 0, -Magnitude) * CFrame.new(-math.random(Magnitude / 2), math.random(Magnitude / 2)).Position

	LerpTo = function(model, target)
		local alpha = 0
		local speed = 100
		local dist = (model.PrimaryPart.Position - target.Position).Magnitude
		local relativeSpeed = dist / speed
		local startCFrame = model.PrimaryPart.CFrame
		local loop = nil
		local reachedTarget = Instance.new("BindableEvent")

		loop = game:GetService("RunService").Heartbeat:Connect(function(delta)


			local goalCFrame = startCFrame:Lerp(target.CFrame, alpha)
			model:PivotTo(goalCFrame)
			alpha += delta / relativeSpeed
			if alpha >= 1 then
				loop:Disconnect()
				reachedTarget:Fire()
			end
		end)

		reachedTarget.Event:Wait()

	end

	local partaround = Instance.new("Part")
	partaround.Anchored = true
	partaround.CanCollide = false
	local dest = Instance.new("Part")
	dest.Anchored = true
	dest.CanCollide = false
	local randompos = Instance.new("Part")
	randompos.Anchored = true
	randompos.CanCollide = false
	for i = 1, math.random(3,7) do
		partaround.Position =  workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(math.random(-10,30),math.random(-5,5),math.random(-10,30))
		randompos.Position =  partaround.Position
LerpTo(Model, partaround)
		local to = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart")
		local from = partaround

		local base = Part
		local anchor = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,20,0)

		for i = 0, 1, 0.02 do
			local interpolation_1 = from.Position:Lerp(anchor, i)
			local interpolation_2 = anchor:Lerp(to.Position, i)
			local interpolation_3 = interpolation_1:Lerp(interpolation_2, i)
			dest.Position = interpolation_3
			Model:PivotTo(dest.CFrame)

			wait(0.01)
		end
		LerpTo(Model, from)
	end
	local partforlerp = Instance.new("Part")
	partforlerp.Size=Vector3.new(1,1,1)
	partforlerp.Transparency =1
	partforlerp.Position = workspace:FindFirstChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").Position + Vector3.new(0,130,0)
	LerpTo(Model, partforlerp)
	Model:Destroy()
	effectui:Destroy()
