local module = {}

module.CreateDrone = function(SpritesheetId, FlipbookLayout, FlipbookMode, FlipbookSizeX, FlipbookSizeY, Squash)
if SpritesheetId == nil then warn("No Spritesheet was given, can't create Drone. Returning...") return end
if FlipbookSizeX == nil then FlipbookSizeX = 1 warn("FlipbookSizeX wasn't given, defaulting to 1") end
if FlipbookSizeY == nil then FlipbookSizeY = 1 warn("FlipbookSizeY wasn't given, defaulting to 1") end
if FlipbookLayout == nil then FlipbookLayout = Enum.ParticleFlipbookLayout.Custom warn("FlipbookLayout wasn't provided, defaulting to \"Custom\"") end
if FlipbookMode == nil then FlipbookMode = Enum.ParticleFlipbookMode.Random warn("FlipbookMode wasn't provided, defaulting to \"Random\"") end
if Squash == nil or typeof(Squash) ~= "NumberSequence" then Squash = NumberSequence.new(NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0)) warn("Squash wasn't given, or type was incorrect... setting Squash to 0..") end
  
local DroneModel = game:GetObjects("rbxassetid://132790332494353")[1]
local mainParticle
  for _, particle in DroneModel:GetDescendants() do
    if particle:IsA("ParticleEmitter") then
mainParticle = particle
    end
  end
if mainParticle == nil then warn("Particle holder wasn't found for Drone. Returning...") return end
mainParticle.Texture = SpritesheetId
mainParticle.Squash = Squash
mainParticle.FlipbookSizeX = FlipbookSizeX
mainParticle.FlipbookSizeY = FlipbookSizeY
mainParticle.FlipbookMode = FlipbookMode
mainParticle.FlipbookLayout = FlipbookLayout
print("Drone Created!")
return DroneModel
end

module.SpawnDrone = function(DroneModel, Location) 
if DroneModel == nil then warn("No DroneModel given to spawn... returning...") return end
  
  if not workspace:FindFirstChild("CustomDrones") then
    local folder = Instance.new("Folder")
    folder.Parent = workspace
    folder.Name = "CustomDrones"
  end
  
  DroneModel.Parent = workspace:WaitForChild("CustomDrones")
  if typeof(Location) == "CFrame" then
    if DroneModel.PrimaryPart == nil then
DroneModel.PrimaryPart = DroneModel.Hitbox
    end
    DroneModel:PivotTo(Location)
  end
  if typeof(Location) == "Vector3" then
   DroneModel.Hitbox.Position = Location
  end
  if typeof(Location) == "BasePart" then
DroneModel.Hitbox.Position = Location.Position
  end
end



return module
--------Filler to continue typing and fix some typos whenever they're made...
