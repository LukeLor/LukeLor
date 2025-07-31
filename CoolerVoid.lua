
local module = {}

VoidPlayer = function(dest, plr)
  local lighting = game:GetService("Lighting")
local ts = game:GetService("TweenService")

local voidedplr = nil

if plr ~= nil then
voidedplr = plr
  else
    voidedplr = game.Players.LocalPlayer
  end
local cfogcolor = lighting.FogColor
local cfogstart = lighting.FogStart
local cfogend = lighting.FogEnd
  wait()
  lighting.FogColor = Color3.fromRGB(0,0,0)
  ts:Create(lighting, TweenInfo.new(0.75),{FogStart = 0}):Play()
  ts:Create(lighting, TweenInfo.new(0.75),{FogEnd = 0}):Play()
  wait(1.25)
  lighting.FogColor = Color3.fromRGB(255,255,255)
ts:Create(lighting, TweenInfo.new(1.25),{FogStart = cfogstart}):Play()
  ts:Create(lighting, TweenInfo.new(1.25),{FogEnd = cfogend}):Play()
  wait(0.25)
	ts:Create(lighting, TweenInfo.new(1.25),{FogColor = cfogcolor}):Play()
  
end

return modul
