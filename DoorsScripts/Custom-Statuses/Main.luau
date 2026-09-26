local module = {}

module.MakeStatus = function(assetid, name)
  local template = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Crouching:Clone()
template.Name = name
  template.Image = assetid
template.Parent = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects
template.ImageColor3 = Color3.fromRGB(255,255,255)
return template
end

module.CreateAnimation(UiElement, TweenInformation, Colors)
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
TweenInformation == TweenInfo.new(3, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
end

local animationThread = coroutine.create(function()
while task.wait() do
for i = 1, #Colors do
game:GetService("TweenService"):Create(UiElement, TweenInformation, {ImageColor3 = Colors[i]}):Play()
end
end
end)

print("Animation Thread made.")

return animationThread
end

module.StartAnimation(AnimThread)
if not AnimThread then
warn("Can't start due to not having animation thread")
end
coroutine.resume(AnimThread)
end

module.StopAnimation(AnimThread)

end

return module
