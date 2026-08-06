local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local open = false
local maxDist = 60
local cDist = 0
local model = workspace["The Universal Eye"]

local functionC = coroutine.create(function()
	while task.wait() do
		--print(cDist)
		cDist = (model.PrimaryPart.Position - char:WaitForChild("HumanoidRootPart").Position).Magnitude
		if open == true then
			model.Root.Attachment.Close.Enabled = false
			model.Root.Attachment.Open.Enabled = true
			model.Root.Attachment.SparkOpen.Enabled = true
			model.Root.Attachment.SparkClosed.Enabled = false
		else
			model.Root.Attachment.Close.Enabled = true
			model.Root.Attachment.Open.Enabled = false
			model.Root.Attachment.SparkOpen.Enabled = false
			model.Root.Attachment.SparkClosed.Enabled = true
			model.Root.Attachment.Attack.Enabled = false
		end
		if open == true and cDist <= maxDist then
			local origin = model:GetPivot().Position
			local charOrigin = char:WaitForChild("HumanoidRootPart").Position

			-- In Sight detection
			local inSight = false
			local CollectionService = game:GetService("CollectionService")
				local params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				params.FilterDescendantsInstances = {char, model, CollectionService:GetTagged("HidingSpot")}

				inSight = workspace:Raycast(origin, charOrigin - origin, params) == nil
			--print(inSight)
			if inSight then
				--if char:WaitForChild("Humanoid")
				if char.Humanoid.MoveDirection.Magnitude > 0 then
				char.Humanoid.Health -= 0.1
				
					model.Root.Attachment.Attack.Enabled = true
					
					if model.Root.Attack.Playing then
						--Nothing
					else
						model.Root.Attack:Play()
					end				
			else
				model.Root.Attachment.Attack.Enabled = false
				end
				end
		end
	end
end)
coroutine.resume(functionC)



local cToggle = coroutine.create(function()
	while task.wait(math.random(2,5)) do
		open = not open
		print(open)
	end
end)

coroutine.resume(cToggle)


