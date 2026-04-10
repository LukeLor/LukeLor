local keyIndex = {
  ["C"] = 123672585109549, 
  ["D"] = 115464057786903,
  ["E"] = 102963120140364,
  ["F"] = 77562538525120,
  ["G"] =81649589707857,
  ["A"] =76938489240772,
  ["B"] =73361471894072,
  ["C2"] =107855371255694
}

local MediaPlayer = Instance.new("Sound")
MediaPlayer.Parent = workspace
MediaPlayer.Looped = true

local Tempo = 120

local Play = function(sequence)
for _, individNotes in ipairs(sequence) do 
local duration = individNotes[2]
local noteName = individNotes[1]
local slurred = individNotes[3]
    print(noteName, duration, slurred)
local noteId = keyIndex[noteName]
MediaPlayer.SoundId = "rbxassetid://"..noteId
MediaPlayer:Play()
    for i = 0, duration, 1 do
    task.wait(60/Tempo) 
    end
    if not slurred then
MediaPlayer:Stop()
    end
  end
  MediaPlayer:Stop()
end
Tempo = 78
Play({{"E",1,true},{"G",1,true},{"A",2,true},{"G",2,true},{"C",2,true}})                    
