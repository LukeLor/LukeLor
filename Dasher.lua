---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderEntitySpawner.lua"))()

---====== Create entity ======---

local entity = spawner:Create({
	Entity = {
		Name = "Dasher",
		Asset = "https://github.com/LukeLor/LukeLor/raw/main/DasherMostRecent.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 2.5
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 25, 0.2, 2} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 300,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 6,
		Delay = 1
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 1000
	},
	Crucifixion = {
			ItemToSeek = {"Crucifix"},
				CanBeInBackpack = false,
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true,
			CrucifixBadge = {
					Enabled = true,
					BadgeLink = "https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderBadges/Crucifix/Dasher.lua"
		}
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Dasher..", "Use what you learned from Ambush!", "Keep note that Dasher is faster than Ambush."},
		Cause = ""
	}
})

---====== Debug entity ======---
local plantFolder = Instance.new("Folder")
plantFolder.Parent = workspace
plantFolder.Name = "PlantsDasher"
local run = true
entity:SetCallback("OnSpawned", function()
    print("Entity Spawned.")
end)
	
entity:SetCallback("OnStartMoving", function()
   	print("Entity has started moving")
	

	
	function Plant()
		local entityModel = entity.Model
		for i = 0, math.random(1,1), 1 do -- go from 0 to 100 in steps of 2
			print(i,"th/st plant pot thrown.") -- print the number
			local potholder = Instance.new("Part")
			potholder.Position = entityModel.PrimaryPart.Position
			local pot =script.Potted_Plant:Clone()
			potholder.Parent = plantFolder
			pot.Parent = plantFolder
			potholder.Size = pot.PrimaryPart.Size
			pot:PivotTo(potholder.CFrame)
			for _, parts in pairs(pot:GetDescendants()) do
				if parts:IsA("Part") or parts:IsA("MeshPart") or parts:IsA("BasePart") then
					parts.Anchored = false
					local weld = Instance.new("WeldConstraint")
					weld.Part0 = potholder
					weld.Part1 = parts
					weld.Parent = potholder
				end
				if parts:IsA("WeldConstraint") or parts:IsA("Weld")then
					parts:Destroy()
				end
			end

			potholder.CanCollide = true
			potholder.Transparency = 1



			local initialHeight = 0 -- the initial height of the part
			local velocitySpread = 10 -- the amount of spread for the initial velocity
			local upwardForce = 40 -- the upward force to apply to the part

			-- generate a random initial velocity for the part
			local velocity = Vector3.new(
				math.random(-velocitySpread, velocitySpread),
				upwardForce,
				math.random(-velocitySpread, velocitySpread)
			)

			-- apply the initial velocity to the part
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = velocity
			bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge) -- set max force to allow full control of velocity
			bodyVelocity.P = 5000 -- set P to control how fast the part reaches the desired velocity
			bodyVelocity.Parent = potholder

			-- add a wait to allow the part to gain some height before disabling the BodyVelocity
			wait(0.1)

			-- disable the BodyVelocity to let gravity take over
			bodyVelocity:Destroy()
			local vanish = coroutine.create(function()
				task.wait(6)
				for _, inst in pot:GetDescendants() do
					inst.CanCollide = false
					if inst:IsA("BasePart") then
						game:GetService("TweenService"):Create(inst, TweenInfo.new(4), {Transparency = 1}):Play()
					end
				end
				task.wait(4)
				potholder:Destroy()
				pot:Destroy()
			end)
			coroutine.resume(vanish)
		end
	end
	function FlingExisting(Model)
		local entityModel = entity.Model
		if Model:GetAttribute("Used") == true then return end
		Model:SetAttribute("Used", true)
	
			--print(i,"th/st model thrown.") -- print the number
			local potholder = Instance.new("Part")
			potholder.Position = Model.PrimaryPart.Position
			local pot =Model:Clone()
			potholder.Parent = plantFolder
		pot.Parent = plantFolder
		if pot:IsA("Model") then
			potholder.Size = pot.PrimaryPart.Size
		elseif pot:IsA("BasePart") then
			potholder.Size = pot.Size
			potholder.Anchored = false
			end
			pot:PivotTo(potholder.CFrame)
			for _, parts in pairs(pot:GetDescendants()) do
				if parts:IsA("Part") or parts:IsA("MeshPart") or parts:IsA("BasePart") then
					parts.Anchored = false
					local weld = Instance.new("WeldConstraint")
					weld.Part0 = potholder
					weld.Part1 = parts
					weld.Parent = potholder
				end
				if parts:IsA("WeldConstraint") or parts:IsA("Weld")then
					parts:Destroy()
				end
			end

			potholder.CanCollide = true
			potholder.Transparency = 1



			local initialHeight = 0 -- the initial height of the part
			local velocitySpread = 10 -- the amount of spread for the initial velocity
			local upwardForce = 40 -- the upward force to apply to the part

			-- generate a random initial velocity for the part
			local velocity = Vector3.new(
				math.random(-velocitySpread, velocitySpread),
				upwardForce,
				math.random(-velocitySpread, velocitySpread)
			)

			-- apply the initial velocity to the part
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = velocity
			bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge) -- set max force to allow full control of velocity
			bodyVelocity.P = 5000 -- set P to control how fast the part reaches the desired velocity
			bodyVelocity.Parent = potholder

			-- add a wait to allow the part to gain some height before disabling the BodyVelocity
		Model:Destroy()
		wait(0.1)

			-- disable the BodyVelocity to let gravity take over
		bodyVelocity:Destroy()
		for _, inst in pot:GetDescendants() do
			if inst:IsA("ProximityPrompt") then
				inst.Enabled = false
			end
		end
			local vanish = coroutine.create(function()
				task.wait(6)
				for _, inst in pot:GetDescendants() do
				if inst:IsA("BasePart") then
					inst.CanCollide = false
				end
			
					if inst:IsA("BasePart") or inst:IsA("ImageLabel") or inst:IsA("Frame") or inst:IsA("TextLabel") then
						game:GetService("TweenService"):Create(inst, TweenInfo.new(4), {Transparency = 1}):Play()
					end
				
				end
				task.wait(4)
				potholder:Destroy()
				pot:Destroy()
			end)
			coroutine.resume(vanish)
		end
	
	while task.wait() do
		if run == false then return end
		local hitTable = workspace:GetPartsInPart(entity.Model.PrimaryPart)
		for _, hitInst in hitTable do
			--print(hitInst.Name)
			if hitInst.Name == "Door" or hitInst.Name == "DoorHitbox" then
				print("OMG, OMG,", hitInst.Name)
				local room = hitInst.Parent
				--	task.spawn(Plant)
				if hitInst.Parent.Parent == workspace.CurrentRooms then
					room = hitInst.Parent.Parent
				elseif hitInst.Parent.Parent.Parent == workspace.CurrentRooms then
					room = hitInst.Parent.Parent.Parent
				elseif hitInst.Parent.Parent.Parent.Parent == workspace.CurrentRooms then
					room = hitInst.Parent.Parent.Parent.Parent
				elseif hitInst.Parent.Parent.Parent.Parent.Parent == workspace.CurrentRooms then
					room = hitInst.Parent.Parent.Parent.Parent.Parent
				elseif hitInst.Parent.Parent.Parent.Parent.Parent.Parent == workspace.CurrentRooms then
					room = hitInst.Parent.Parent.Parent.Parent.Parent.Parent
				
				end
				print(room.Name)
				for _, decor in room:GetDescendants() do
					if decor.Name == "Potted_Plant" then
						task.spawn(Plant)
						decor:Destroy()
					elseif string.sub(decor.Name,1,8) == "Painting" then
						local func = coroutine.create(function()
							FlingExisting(decor)
							end)
						task.spawn(func)
					elseif decor.Name == "Table" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
					elseif decor.Name == "WoodenCrate" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
					elseif decor.Name == "Wall_Clock" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
					elseif decor.Name == "Arrow" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
					elseif decor.Name == "ThisWaySign" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
					elseif decor.Name == "HolidayLight" then
						local func = coroutine.create(function()
							FlingExisting(decor)
						end)
						task.spawn(func)
						if decor:FindFirstChild("Metal") then
							decor.Metal.Neon.Particle.Enabled = true
							decor.Metal.Casing.CanCollide = true
							decor.Metal.Neon.CanCollide = true
							end
					end
				end
			end
		end

	end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    --[[if firstTime == true then
			local entityModel = entity.Model
for i = 0, math.random(4,8), 1 do -- go from 0 to 100 in steps of 2
    print(i,"th/st plant pot thrown.") -- print the number
local potholder = Instance.new("Part")
potholder.Position = entitymodel.PrimaryPart.Position
local pot = game:GetObjects("rbxassetid://121218933252054")[1]
potholder.Parent = workspace
pot.Parent = workspace
potholder.Size = pot.PrimaryPart.Size
pot:PivotTo(potholder.CFrame)
for _, parts in pairs(pot:GetDescendants()) do
if parts:IsA("Part") or parts:IsA("MeshPart") or parts:IsA("BasePart") then
parts.Anchored = false
local weld = Instance.new("WeldConstraint")
weld.Part0 = potholder
weld.Part1 = parts
weld.Parent = potholder
end
if parts:IsA("WeldConstraint") or parts:IsA("Weld")then
parts:Destroy()
end
end

potholder.CanCollide = true
potholder.Transparency = 1



local initialHeight = 0 -- the initial height of the part
local velocitySpread = 10 -- the amount of spread for the initial velocity
local upwardForce = 40 -- the upward force to apply to the part

-- generate a random initial velocity for the part
local velocity = Vector3.new(
    math.random(-velocitySpread, velocitySpread),
    upwardForce,
    math.random(-velocitySpread, velocitySpread)
)

-- apply the initial velocity to the part
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = velocity
bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge) -- set max force to allow full control of velocity
bodyVelocity.P = 5000 -- set P to control how fast the part reaches the desired velocity
bodyVelocity.Parent = potholder

-- add a wait to allow the part to gain some height before disabling the BodyVelocity
wait(0.1)

-- disable the BodyVelocity to let gravity take over
bodyVelocity:Destroy()
end
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end]]
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderBadges/Encounters/Dasher.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
