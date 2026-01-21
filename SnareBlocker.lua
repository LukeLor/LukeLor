workspace.DescendantAdded:Connect(function(Object)
	if Object.Name == "Snare" and Object:FindFirstChild("Snare") then
	if hit.Parent:FindFirstChild("Humanoid") then
				local ds = coroutine.create(function()
		Object.Hitbox.CanTouch = false
	
		local lock = game:GetObjects(134623425206809)[1]
lock.Parent = script.Parent
local newlock = lock.LockEffect.Lock
		newlock.ParticleEmitter.Enabled = true
		newlock.Parent = Object.Hitbox
		lock:Destroy()
	
		local effects=	game:GetObjects(107175245956530)[1] ] -- Curious: 82037744082799
		effects.Parent = workspace
		for _, effecth in effects:GetChildren() do
			print( effecth.Name)
			effecth.Parent = Snare.Snare.Holes
			print("Parented: "..effecth.Name)
			for _, effect in effecth:GetChildren() do
				print( effect.Name)
				effect.Parent = script.Parent.Parent.Snare.Holes
				print("Parented: "..effect.Name)

			end
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
	end
				end)
	end
	end)
