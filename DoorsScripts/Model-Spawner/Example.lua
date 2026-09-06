---====== Define spawner ======---
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Model-Spawner/Main.luau"))();

---====== Create ======---
local currentRoomIndex = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value; -- Get index of the current room

local model = spawner.createModel({
    Url = "https://github.com/LukeLor/LukeLor/blob/main/Asterdust.rbxm?raw=true";
    Spawning = {
        Offset = CFrame.new();
        MinRoom = currentRoomIndex; -- Set min room index to current room's index
        MaxRoom = currentRoomIndex; -- Set max room index to current room's index
        Chance = 100;
    };
    Locations = {
        Drawers = true;
        Tables = true;
        Chests = true;
        Floor = true;
    };
    Prompt = {
        Range = 7;
        Duration = 0;
    };
});

---====== Debug ======---
item.Debug.OnSpawned = function()
    print("Model spawned:", model);
end;

item.Debug.OnPickedUp = function()
    print("Model interacted:", model);
end;

item.Debug.OnEnteredItemRoom = function(room)
    print("Entered room:", room, "of model:", model);
end;

---====== Spawn ======---
spawner.spawnModel(model);
