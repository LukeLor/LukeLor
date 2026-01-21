workspace.DescendantAdded:Connect(function(Object)
	if Object.Name == "Snare" and Object:FindFirstChild("Snare") then
			print("snare")
				local ds = coroutine.create(function()
						while task.wait() do
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Object.Hitbox.Position).Magnitude < 8 and Object.Hitbox.CanTouch == true then
		Object.Hitbox.CanTouch = false
	
		local lock = game:GetObjects("rbxassetid://134623425206809")[1]
lock.Parent = workspace
local newlock = lock.Lock
		newlock.ParticleEmitter.Enabled = true
		newlock.Parent = Object.Hitbox
		lock:Destroy()
	
		local effects=	game:GetObjects("rbxassetid://107175245956530")[1] -- Curious: 82037744082799
		effects.Parent = workspace
		for _, effect in effects:GetChildren() do
			print( effecth.Name)
			effecth.Parent = Object.Snare.Holes
			print("Parented: "..effecth.Name)
			
		end
	
		effects:Destroy()
		game:GetService("TweenService"):Create(Object.Snare.Holes, TweenInfo.new(0), {Color = Color3.fromRGB(0,0,0)}):Play()
		game:GetService("TweenService"):Create(Object.Snare.Holes, TweenInfo.new(0.25), {Color = Color3.fromRGB(100, 146, 219)}):Play()--Curious: 248, 217, 109
	task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://135389918701762"
	task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://75134945132260"
	task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://113033745280657"
	task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://92040110017917"
	task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://109471683017650"
		task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://92040110017917"
		task.wait(0.1)
		newlock.ParticleEmitter.Texture = "rbxassetid://109471683017650"
							print("vfx finished")
					end		
					end
					end)
			coroutine.resume(ds)
	end
	end)
