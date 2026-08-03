require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Spawner Initiated!",true)
game:GetService("TextChatService").MessageReceived:Connect(function(msg)
if msg.Text == "/A15" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A15.lua"))()
end	
if msg.Text == "/A35" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsStuffOther/A35.lua"))()
end
	end)
