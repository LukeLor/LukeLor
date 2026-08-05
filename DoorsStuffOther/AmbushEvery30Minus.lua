---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Ambush",
    Model = "rbxassetid://11652567875", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 175,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 2,
        Delay = 2
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died to Ambush",
"This ones different",
"It spawns every 30 seconds",
"Try to stay near closets"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
