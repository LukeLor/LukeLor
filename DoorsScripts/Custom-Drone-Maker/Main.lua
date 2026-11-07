local module = {}

module.CreateDrone = function(SpritesheetId, FlipbookLayout, FlipbookMode, FlipbookSizeX, FlipbookSizeY)
if SpritesheetId == nil then warn("No Spritesheet was given, can't create Drone. Returning...") return end
if FlipbookSizeX == nil then FlipbookSizeX = 1 end
if FlipbookSizeY == nil then FlipbookSizeY = 1 end

local DroneModel = game:GetObjects("rbxassetid://132790332494353")[1]
local mainParticle
  for _, particle in DroneModel:GetDescendants() do
    if particle:IsA("ParticleEmitter") then
mainParticle = particle
    end
  end
if mainParticle == nil then warn("Particle holder wasn't found for Drone. Returning...") return end
mainParticle.Texture = SpritesheetId

end



return module
--------Filler to continue typing and fix some typos whenever they're made...
