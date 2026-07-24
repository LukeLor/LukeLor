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
    sound.Name = sndName
    sound.Volume = vol or 0.5
  return sound
end

local LoopM = CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/IsolatedLightDeathLoopNew.mp3", 1, "IsolatedLightDeathLoop")
local EndM = CustomSound("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/IsolatedLightDeathEnd.mp3", 1, "IsolatedLightDeathEnd")

local ILChaseHappened = false
