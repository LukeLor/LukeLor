--nvm no use
local surge = game:GetService("InsertService"):LoadAsset(94333632974037)
surge.Parent = workspace
surge.Surge.Position = workspace.X_masLucas7.HumanoidRootPart.Position
for _, pe in surge.Surge:GetDescendants() do 
  if pe:IsA("ParticleEmitter") then 
    pe.Texture = "rbxassetid://138309800791829" 
    pe.Transparency = NumberSequence.new(0)
    pe.Brightness = 1 
    pe.LightInfluence = 0 
    pe.LightEmission = 0.25
  end
end 
