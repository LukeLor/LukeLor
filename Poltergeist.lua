---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderEntitySpawner.lua"))()

---====== Create entity ======---

local entity = spawner:Create({
	Entity = {
		Name = "Poltergeist",
		Asset = "https://github.com/LukeLor/LukeLor/raw/main/DasherMostRecent.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 3
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 5, 0.2, 4} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 60,
		Delay = 5,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz", -- "Blitz"
		Min = 1,
		Max = 3,
		Delay = math.random(10,30)/10
	},
	Damage = {
		Enabled = true,
		Range = 50,
		Amount = 40
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
		Hints = {"You died to Poltergeist...", "It's quite a tricky one.", "Slower than you're used to.", "It should be familiar with the direction it comes from...","\"Scribbles,\" correct?","I'm sure you'll get the hang of it!","I have faith in you."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity Spawned.")
end)
	
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
			


--[[potholder.CanCollide = true
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
end]]
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
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
		--loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/OutOfOrderBadges/Encounters/Dasher.lua"))()
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
