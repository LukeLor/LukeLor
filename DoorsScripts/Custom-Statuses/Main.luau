local module = {}

module.MakeStatus = function(assetid, name)
  local template = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Crouching:Clone()
template.Name = name
  template.Image = assetid
template.Parent = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects
template.ImageColor3 = Color3.fromRGB(255,255,255)
return template
end

module.CreateStatusAnimationColor = function(UiElement, TweenInformation, Colors)
if not UiElement then
warn("Ui Element not provided... returning.")
return
end
if not UiElement:IsA("ImageLabel") then
warn("UiElement isn't an ImageLabel, returning..")
end 

if not Colors then
warn("Can't animate Colors, because no Colors provided. Returning.")
return
end
--[[if not string.lower(typeof(Colors)) == "table" then
warn("Colors isnt a table, returning..")
end]]

if not TweenInformation then
TweenInformation = TweenInfo.new(3, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
end

local animationThread = coroutine.create(function()
while task.wait() do
for i = 1, #Colors do
game:GetService("TweenService"):Create(UiElement, TweenInformation, {ImageColor3 = Colors[i]}):Play()
task.wait(math.clamp(TweenInformation.Time-TweenInformation.Time/10,0,9999))
end
end
end)

print("Color Animation Thread made.")

return animationThread
end

module.CreateStatusAnimationSize = function(UiElement, TweenInformation, SizeType)
if not UiElement then
warn("Ui Element not provided... returning.")
return
end
if not UiElement:IsA("ImageLabel") then
warn("UiElement isn't an ImageLabel, returning..")
end 

if not TweenInformation then
TweenInformation = TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
end
local reference = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Crouching

local smallSize = reference.Size/2

local bigSize = reference.Size*2

local normalSize = reference.Size

local destSize = nil


if SizeType == "Normal" then
destSize = normalSize
elseif SizeType == "Big" then
destSize = bigSize
elseif SizeType == "Small" then
destSize = smallSize
else
destSize = normalSize
end

local SizeAnimThread = coroutine.create(function()
game:GetService("TweenService"):Create(UiElement, TweenInformation, {Size = destSize}):Play()
end)
print("Size Anim Thread made.")
return SizeAnimThread
end

module.StartStatusAnimation = function(AnimThread)
if not AnimThread then
warn("Can't start due to not having animation thread")
end
coroutine.resume(AnimThread)
end

module.StopStatusAnimation = function(AnimThread)
if not AnimThread then
warn("Cant stop due to having no animation thread.")
end
coroutine.yield(AnimThread)
end


return module
