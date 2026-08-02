local module = {}

module.MakeStatus = function(assetid, name)
  local template = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Crouching:Clone()
template.Name = name
  template.Image = assetid
template.Parent = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects
return template
end

return module
