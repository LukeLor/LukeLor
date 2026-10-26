local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local Camera = workspace.CurrentCamera
local DeathName = "DeathBackgroundBlue"
loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local remotesfolder = ReplicatedStorage:WaitForChild("RemotesFolder")
local backgroundColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 255, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 255))
})

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local MainUI = PlayerGui:WaitForChild("MainUI")
local Death = MainUI:WaitForChild("Death")
local HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
local MainGame = MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
local Health = MainGame:WaitForChild("Health")
local Music = Health:WaitForChild("Music")

function GetGitSound(GithubSnd, SoundName)
    local url = GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

function CustomSound(soundLink, vol, sndName)
    local sound = Instance.new("Sound")
    sound.SoundId = GetGitSound(soundLink, sndName)
    sound.Parent = Music
    sound.Name = "DeathHint_Sound"
    sound.Volume = vol or 0.5
    sound:Play()
end


Camera.ChildAdded:Connect(function(Child)
    if Child.Name ~= DeathName then return end
    
  --[[  for _, Asset in Music:GetChildren() do
        if Asset:IsA("Sound") then
            Asset:Destroy()
        end
    end]]
local Main = Child:WaitForChild("MainPart")
local CharAtt = Main:WaitForChild("CharAttach")
local CharAttBelow = Main:WaitForChild("CharAttachBelow")
local CamAtt = Main:WaitForChild("CamAttach")
CharAtt.Position = CharAtt.Position + Vector3.new(0.521, 5.681, 2.420)
	CamAtt.Orientation = CamAtt.Orientation - Vector3.new(0, 40.234,0) -- X is 14.522
	CamAtt.Position = CamAtt.Position - Vector3.new(13.938, -1.928, 0.628)
	--CamAtt.CFrame = CFrame.new(CamAtt.Position, Child.Lights.BigLight.Position).Rotation
	wait(0.1)
	CharAttBelow.Position = CharAtt.Position


--local d_anim = "rbxassetid://107897966884951"
--Child.CharAnim.AnimationId = d_anim
    local Lights = Child:WaitForChild("Lights")
    local Fog = Child:WaitForChild("FogAndSmaller")
    local Water = Child:WaitForChild("Water")


    for _, Light in Lights:GetDescendants() do
        if Light:IsA("SpotLight") then
            Light.Color = Color3.fromRGB(150, 255, 150)
        end
        if Light:IsA("ParticleEmitter") then
            Light.Color = backgroundColor
        end
    end

    for _, FogL in Fog:GetChildren() do
        FogL.Color = backgroundColor
    end

    for _, WaterL in Water:GetChildren() do
        WaterL.Color = backgroundColor
    end

    local BigLight = Lights:FindFirstChild("BigLight")
    if BigLight then
        local Attachment = BigLight:FindFirstChild("Attachment")
        if Attachment then
            local Moon = Attachment:FindFirstChild("Moon")
            if Moon then
               	Moon.Texture = "rbxassetid://108114349730544"
				Moon.LightEmission = 0.5
				Moon.Brightness = 0.5
				Moon.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),ColorSequenceKeypoint.new(1, Color3.new(1,1,1))})
			
            end
        end
    end

   local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,Color3.fromHex("69ff69")),
		ColorSequenceKeypoint.new(0.402,Color3.fromHex("85ffb8")),
		ColorSequenceKeypoint.new(0.696,Color3.fromHex("4cb7ff")),
		ColorSequenceKeypoint.new(1,Color3.fromHex("63d5ff"))}
)

	HelpfulDialogue.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	
	gradient.Parent = HelpfulDialogue
	gradient.Rotation = 45
local LightOST = CustomSound("https://github.com/LukeLor/LukeLor/blob/main/IsolatedLightDeathLoopNew.mp3?raw=true", 1, "Isolated")
local LightOSTEnd = CustomSound("https://github.com/LukeLor/LukeLor/blob/main/IsolatedLightDeathEnd.mp3?raw=true", 1, "End")
LightOSTEnd.Parent = LightOST
		Music.Blue.SoundId = LightOST.SoundId
		
		Music.Blue.End.SoundId = LightOSTEnd.SoundId
		--CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/LLMuffledNew.mp3", 1, "Little_DeathHint")

end)
