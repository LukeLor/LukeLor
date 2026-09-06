local CrucifixEverything = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Crucifix-Everything/main/init.luau"))()

CrucifixEverything:GiveCrucifix({
    Type = math.random(1,2),             -- 1 = Guiding, 2 = Curious
    Uses = nil,             -- Number of uses (nil : infinite)
    Resist = false,       -- Whether the Crucifix succeeds or fails
    EntitiesOnly = false, -- Only target custom entity models
    CustomColor = nil,    -- Custom Color3 (optional)
    IgnoreList = {}       -- Models that cannot be targeted
})
