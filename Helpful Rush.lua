loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()

FireProxy = function(proxy)
local holdtime = proxy.HoldDuration
local timeheld = 0
proxy:InputHoldBegin()

if holdtime == 0 then
wait(0.1)
proxy:InputHoldEnd()
print("PromptInitiated")
else
repeat wait(1) timeheld = timeheld+1 until timeheld == holdtime
wait(0.1)
proxy:InputHoldEnd()
print("PromptFinished")
end
end


--ProxyDoor : CurrentDoor.Lock.UnlockPrompt
--Event : CurrentDoor.ClientOpen:FireServer()
--KeyPrompt : HasKey.ModulePrompt


local rushhelper = game:GetObjects("rbxassetid://94481096227907)[1]
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Octave = 0.5
local talk = Instance.new("Sound")
talk.SoundId = "rbxassetid://18637567424"
talk.RollOffMaxDistance = 100
talk.Parent = rushhelper.Main
talk.Name = "Talk"
pitch.Parent = talk
talk.PlaybackSpeed = 0.75
talk.Volume = 0.2
local entitytablelines = {{ "Something is here...","It seems like I'm... aproaching.?","Hide!", "Something's on its way!"-- Rush
	},{"Something is here... be ready.","Seems like an annoying entity is coming.","Hide!", "It will come back."-- Ambush
	},{"GO GO GO!","RUN FOR YOUR LIFE!","Run." -- Seek
	},{"Follow its rules. Turn around when it tells you." -- Halt
	},{"Stay quiet.", "Crouch!", "Don't be loud."--Figure
	},{"Psst.", "Around you!"--Screech
	},{"Don't look!", "Avoid eye contact."}--Eyes
,{"Uhm... the door?","Look at the door! Something may be lurking...","Look I'll hand it to you. The room number is "..game.ReplicatedStorage.GameData.LatestRoom.Value.."."}--Dupe
,{"A-120."}, {"A-60."},{"It- Blitz..."},
{"It isn't funny!","Stop laughing.","Giggle up ahead.", "Watch above you."}--Giggle

}

local deathmsgs = {{"Sorry I failed you..."},{"..."},{"Are you there!?"}, {"Please, respond!"}, {"What... happened?"},{"I'll do better, I promise..."}}

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local Camera = workspace.CurrentCamera
local DeathName = "DeathBackgroundBlue"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local remotesfolder = ReplicatedStorage:WaitForChild("RemotesFolder")
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
UserInputService.InputBegan:Connect(function(i,proc)
	if proc then return end

if Ended == false then

	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.Gamepad1 then
		Skipped = true
	end
end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()
--SpeakerIconShow("rbxassetid://83305678419163")
for i, Hint in ipairs(DeathHints) do
	--	HelpfulDialogue.TextTransparency = 1

--Caption(Hint)
if Skipped then
	--Caption("")	
		else
		--Caption("")	
end
		local Tick = tick() + 5 + utf8.len(HelpfulDialogue.ContentText) / 30
		if i == 1 or not Skipped then
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
		end
	--	TweenService:Create(HelpfulDialogue, TweenInfo.new(Time, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		task.wait(Time + 0.01)
	end
Ended = true
--SpeakerIconHide()
--Caption("")
wait(0.5)
SpeakerIconShow("rbxassetid://99087926706059")
Caption(deathmsgs[math.random(1,6)][1])
wait(5)
SpeakerIconHide()
end)


game.Workspace.ChildAdded:Connect(child)
if child.Name == "AmbushMoving" then
local text = entitytablelines[2][math.random(1,4)]
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

Caption(string.sub(text, 1, i))
				wait(0.002)
		end
elseif child.Name == "RushMoving" then
local text = entitytablelines[1][math.random(1,4)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
end
elseif child.Name == "A60" then
local text = entitytablelines[10][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
end
elseif child.Name == "A120" then
local text = entitytablelines[9][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
end
elseif child.Name == "BackdoorRush" then
local text = entitytablelines[11][1]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
end
		elseif child.Name == "Eyes" or child.Name == "BackdoorLookman" then
local text = entitytablelines[7][math.random(1,4)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
end
end)
workspace.CurrentCamera.ChildAdded:Connect(function(child)
    if child.Name == "Screech" then
        local text = entitytablelines[6][math.random(1,2)]
		print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
    end
end)
game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
local HasKey = false
local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if v.Name == "KeyObtain" then
                    HasKey = v
			local ogmad = HasKey.ModulePrompt.MaxActivationDistance
			local ogrlos = HasKey.ModulePrompt.RequiresLineOfSight
HasKey.ModulePrompt.MaxActivationDistance = 100000
HasKey.ModulePrompt.RequiresLineOfSight = false
			wait(0.03)
FireProxy(HasKey.ModulePrompt)
wait(0.03)
FireProxy(CurrentDoor.Lock.UnlockPrompt)
			wait(0.03)
			CurrentDoor.ClientOpen:FireServer()

                end
	end




	
local croom = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
if game.ReplicatedStorage.GameData.ChaseInSession.Value == true then
local text = entitytablelines[3][math.random(1,3)]
print(text)
		for i = 1, #text do 
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
end
if game.ReplicatedStorage.GameData.LatestRoom.Value  == 50 then
local text = entitytablelines[5][math.random(1,3)]
print(text)
		for i = 1, #text do 
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
end
        for _, dupeRoom in pairs(croom:GetChildren()) do
            if dupeRoom.Name == "DoorFake"   then
                        local text = entitytablelines[8][math.random(1,3)]
print(text)
		for i = 1, #text do
			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))
Caption(string.sub(text, 1, i))
			wait(0.002)
		end
break

end
        end
end)



local newatt = Instance.new("Attachment")
local char = game.Players.LocalPlayer.CharacterAdded:Wait()
newatt.Parent = char.UpperTorso
newatt.WorldCFrame = char.Head.CFrame
newatt.WorldPosition = char.Head.Position + Vector3.new(1.705, -0.5, -0.558)
newatt.Name = "RushAtt"
rushhelper.Parent = workspace
rushhelper.Root.AlignPosition.Attachment1 = newatt

local text = "Hi."
		print(text)
		for i = 1, #text do


			wait(0.002)
			rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
			rushhelper.Main.Talk:Play()
			print(string.sub(text, 1, i))

Caption(string.sub(text, 1, i))
				wait(0.002)
		end
