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
    
    sound.Name = "Lock"
    sound.Volume = vol or 1
    return sound
end

local CameraShaker = require(game.Player.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
	
local locked = CustomSound("https://github.com/LukeLor/LukeLor/blob/main/LockSnareSound.mp3?raw=true",0.5,"SnareLock")
		locked.Parent = workspace
locked.TimePosition = 0.15
		locked:Play()
		locked.TimePosition = 0.15
		locked.Volume = 0.5
		game.TweenService:Create(locked, TweenInfo.new(1.75), {Volume = 0}):Play() 
		CameraShake.camShaker:ShakeOnce(5,15,0,1) 
		task.wait(1.375) 
		locked.TimePosition = 6
		game.TweenService:Create(locked, TweenInfo.new(1), {Volume = 0.5}):Play()

		CameraShake.camShaker:ShakeOnce(5,6,0,1.75)
