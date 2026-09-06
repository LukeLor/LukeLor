local module = {}

module.MakeStatus = function(assetid, name)
  local template = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Crouching:Clone()
template.Name = name
  template.Image = assetid
template.Parent = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects
template.ImageColor3 = Color3.fromRGB(255,255,255)
return template
end

return module
