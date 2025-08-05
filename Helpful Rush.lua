loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CoolerScreech"))()
local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)



Caption = function(text)
	require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text,true)
end


TypeCaption = function(text, typewait) 
	for i = 1, #text do
		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i) ,true)
		if typewait ~= nil then
			task.wait(typewait)
		else
			task.wait(0.2)
		end
	end
end

SpeakerIconShow = function(IconId)
	local newui = Instance.new("ScreenGui")
	newui.Parent = game.Players.LocalPlayer.PlayerGui
	newui.Name = "SpeakerIcon"


	local icon = "rbxassetid://"..IconId
	local captiontext = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
	local iconholder = Instance.new("ImageLabel")
	iconholder.Name = "Icon"
	iconholder.Image = icon
	iconholder.Parent = newui
	local aspect = Instance.new("UIAspectRatioConstraint")
	aspect.Parent = iconholder
	local pos =  captiontext.Position + UDim2.new(-.05,-0.031,0,-118)
	iconholder.Size = UDim2.new(0.1, 0,0.18, 0)
