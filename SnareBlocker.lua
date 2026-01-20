script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		script.Parent.CanTouch = false
	
		local lock = game:GetService("InsertService"):LoadAsset(134623425206809) -- Curious: 82037744082799
lock.Parent = script.Parent
local newlock = lock.LockEffect.Lock
		newlock.ParticleEmitter.Enabled = true
		newlock.Parent = script.Parent
		lock:Destroy()
	
		local effects=	game:GetService("InsertService"):LoadAsset(107175245956530)
		effects.Parent = workspace
		for _, effecth in effects:GetChildren() do
			print( effecth.Name)
			effecth.Parent = script.Parent.Parent.Snare.Holes
			print("Parented: "..effecth.Name)
			for _, effect in effecth:GetChildren() do
				print( effect.Name)
				effect.Parent = script.Parent.Parent.Snare.Holes
				print("Parented: "..effect.Name)

			end
		end
	
		effects:Destroy()
		game:GetService("TweenService"):Create(script.Parent.Parent.Snare.Holes, TweenInfo.new(0), {Color = Color3.fromRGB(0,0,0)}):Play()
		game:GetService("TweenService"):Create(script.Parent.Parent.Snare.Holes, TweenInfo.new(0.25), {Color = Color3.fromRGB(100, 146, 219)}):Play()--Curious: 248, 217, 109
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
