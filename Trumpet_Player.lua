local keyIndex = {
  "C" = 115464057786903, 
  "D" = 102963120140364,
  "E" = 123672585109549,
  "F"= 81649589707857,
  "G"=77562538525120,
  "A"=76938489240772,
  "B"=73361471894072,
  "C2" =107855371255694
}

local MediaPlayer = Instance.new("Sound")
MediaPlayer.Parent = workspace

local BPM = 60

local Play = function(sequence)
for individNotes in sequence do 
local duration = individNotes[2]
local noteName = individNotes[1]
local noteId = keyIndex[noteName]
MediaPlayer.SoundId = noteId
MediaPlayer:Play()
    task.wait(
  end
end
