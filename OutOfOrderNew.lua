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
local floorsToText = {
	["Hotel"] = "The Hotel",
	["Mines"] = "The Mines",
	["Rooms"] = "The Rooms",
	["Backdoor"] = "The Backdoor",
	["Archives"] = "The Archives",
	["Stairwell"] = "The Stairwell",
	["Outdoors"] = "The Outdoors"
}

local floorName = game.ReplicatedStorage.GameData.Floor.Value 
local floorToSay = "this floor"
if floorsToText[floorName] then
	floorToSay = floorsToText[floorName]
else
	floorToSay = "this floor"
end
print("Running \"Out Of Order,\" doing intro lines!")
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Something feels off about "..floorToSay.."...", "thought")
task.wait(5)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("It's probably best if I keep an eye out for anything...","thought")


print("alr, mode stuff roll out.")
