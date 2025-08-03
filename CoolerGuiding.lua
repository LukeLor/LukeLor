local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local Camera = workspace.CurrentCamera
local DeathName = "DeathBackgroundBlue"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local remotesfolder = ReplicatedStorage:WaitForChild("RemotesFolder")


local gicon = LoadCustomAsset("126072881343009")
local cicon = LoadCustomAsset("https://github.com/LukeLor/LukeLor/raw/refs/heads/main/CuriousIcon.png")
local bridge = LoadCustomInstance("https://github.com/LukeLor/LukeLor/raw/refs/heads/main/CustomDeathBridge.rbxm")

local backgroundColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 255, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 255, 150))
})

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local MainUI = PlayerGui:WaitForChild("MainUI")
local Death = MainUI:WaitForChild("Death")
local HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
local MainGame = MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
local Health = MainGame:WaitForChild("Health")
local Music = Health:WaitForChild("Music")
local UserInputService = game:GetService("UserInputService")



--Death Handler

local Skipped = false
local Ended = false
remotesfolder.DeathHint.OnClientEvent:Connect(function(DeathHints)
	 PlayerGui = Player:WaitForChild("PlayerGui")
		 MainUI = PlayerGui:WaitForChild("MainUI")
		 Death = MainUI:WaitForChild("Death")
	HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
		Ended = false
	
	HelpfulDialogue.Visible = false
		--MainGame.fovtarget = 70
	wait(4)
	HelpfulDialogue.Visible = false
		if MainGame.fovtarget then
		MainGame.fovtarget = 60
		wait(0.1)
		MainGame.fovtarget = 65
		wait(0.1)
		MainGame.fovtarget = 70
		end
	UserInputService.InputBegan:Connect(function(i,proc)
		if proc then return end

		if Ended == false then

			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.Gamepad1 then
				Skipped = true
				
			end
		end
	end)
 loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()
	SpeakerIconShow("83305678419163")
	for i, Hint in ipairs(DeathHints) do
		HelpfulDialogue.Visible = false
		HelpfulDialogue.Interactable = false
			 if MainGame.fovtarget then
			MainGame.fovtarget = 70
			end
		print(Hint)
		--Caption(Hint)
		if Skipped then
			Caption(Hint)	
			HelpfulDialogue.Visible = false

if MainGame.fovtarget then
				MainGame.fovtarget = 70
				end

			--HelpfulDialogue.Interactable = false
		else
				Caption("")	
			HelpfulDialogue.Visible = false

if MainGame.fovtarget then
				MainGame.fovtarget = 70
				end

			--HelpfulDialogue.Interactable = false
		end
		local Tick = tick() + 5 + utf8.len(HelpfulDialogue.ContentText) / 30
		if i == 1 or not Skipped then
			HelpfulDialogue.Visible = false

if MainGame.fovtarget then
				MainGame.fovtarget = 70
				end

		--	HelpfulDialogue.Interactable = false
			task.wait(0.5)
		else
			task.wait(0.1)
		end
		Skipped = false
		for i2 = 1, 10000000000000 do
			task.wait()
			if Tick <= tick() then
				break
			end
			if Skipped then
				break
			end
		end
		local Time = 0.4
		if Skipped then
			Time = 0.25
			HelpfulDialogue.Visible = false
if MainGame.fovtarget then

				MainGame.fovtarget = 70
				end

		end
--		TweenService:Create(HelpfulDialogue, TweenInfo.new(Time, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		task.wait(Time + 0.01)
		HelpfulDialogue.Visible = false

if MainGame.fovtarget then
			MainGame.fovtarget = 70
			end

--		HelpfulDialogue.Interactable = false
	end
	Ended = true
	SpeakerIconHide()
	Caption("")

end)


Workspace.DescendantAdded:Connect(function(Child)
    if Child.Name ~= DeathName then return end
    
local Main = Child:WaitForChild("MainPart")
	local CharAtt = Main:WaitForChild("CharAttach")
	local CharAttBelow = Main:WaitForChild("CharAttachBelow")
	local CamAtt = Main:WaitForChild("CamAttach")
	CharAtt.Position = CharAtt.Position + Vector3.new(0.521, 5.681, 2.420)
	CharAtt.Orientation =  Vector3.new(0, 0, 0)

	CamAtt.Orientation = CharAtt.Orientation + Vector3.new(14.522, -40.234 ,0)
	CamAtt.Position = CharAtt.Position - Vector3.new(13.938, 0, -0.628)-- -5.928
	wait(0.1)
	CharAttBelow.Position = CharAtt.Position
	CharAttBelow.Orientation =  Vector3.new(0, 0, 0)


local d_anim = "rbxassetid://107897966884951"
Child.CharAnim.AnimationId = d_anim
    local Lights = Child:WaitForChild("Lights")
    local Fog = Child:WaitForChild("FogAndSmaller")
    local Water = Child:WaitForChild("Water")
local bridgeclone = bridge:Clone()
bridgeclone.Parent = Child
bridgeclone:PivotTo(Fog.CFrame)

end)

