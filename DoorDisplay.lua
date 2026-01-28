--PrefixFrame.Prefix
--MainFrame
--Id: 113797893001247
local Ui = game:GetObjects("rbxassetid://113797893001247")[1]
Ui.Parent = game.Players.LocalPlayer.PlayerGui

local function Roll(NewNum:number, Label:TextLabel)
	local rollc = coroutine.create(function()
		local clonedlabel = Label:Clone()
		clonedlabel.Parent = script.Parent
		clonedlabel.Text = tostring(NewNum)
		Label.Name = Label.Name.."_Old"
		clonedlabel.Position = UDim2.fromScale(Label.Position.X.Scale, Label.Position.Y.Scale + 1)
		local rolltopos = Label.Position
		game:GetService("TweenService"):Create(Label, TweenInfo.new(1), {Position = UDim2.fromScale(Label.Position.X.Scale, Label.Position.Y.Scale-1)}):Play()
		game:GetService("TweenService"):Create(clonedlabel, TweenInfo.new(1), {Position = rolltopos}):Play()
		task.wait(1)
		Label:Destroy()
	end)
	coroutine.resume(rollc)
end
local sh = 0
local th = 0
local fh = 0
game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	local newval =game.ReplicatedStorage.GameData.LatestRoom.Value
	print(newval)
	local stringed_num = tostring(newval)
	print(#stringed_num)

	if #stringed_num == 1 then
		Roll(newval, Ui.MainFrame.FourthDigit)
		if Ui.MainFrame.ThirdDigit.Text ~="0" then
			Roll(0, Ui.MainFrame.ThirdDigit)
			sh = 0
		end
		if Ui.MainFrame.SecondDigit.Text ~="0" then
			Roll(0, Ui.MainFrame.SecondDigit)
			th = 0
		end
		if Ui.MainFrame.FirstDigit.Text ~="0" then
			Roll(0, Ui.MainFrame.FirstDigit)
			fh = 0
		end
	end
	if #stringed_num == 2 then
		Roll(string.sub(stringed_num,2,2), Ui.MainFrame.FourthDigit)
		if string.sub(stringed_num,1,1) ~= sh then
			Roll(string.sub(stringed_num,1,1), script.Parent.ThirdDigit)
		elseif string.sub(stringed_num,1,1) == sh then
			print("dude stay.")
		end
		sh = string.sub(stringed_num,1,1)
		print("sh = "..sh)

		if script.Parent.SecondDigit.Text ~="0" then
			Roll(0, script.Parent.SecondDigit)
			th = 0
		end
		if script.Parent.FirstDigit.Text ~="0" then
			Roll(0, script.Parent.FirstDigit)
			fh = 0
		end
	end
	if #stringed_num == 3 then
		Roll(string.sub(stringed_num,3,3), script.Parent.FourthDigit)
		if string.sub(stringed_num,2,2) ~= sh then
			Roll(string.sub(stringed_num,2,2), script.Parent.ThirdDigit)
		elseif string.sub(stringed_num,2,2) == sh then
			print("dude stay.")
		end
		sh = string.sub(stringed_num,2,2)
		print("sh = "..sh)
		print("c th:"..th)
		if string.sub(stringed_num,1,1) ~= th then
			Roll(string.sub(stringed_num,1,1), script.Parent.SecondDigit)
		elseif string.sub(stringed_num,1,1) == th then
			print("dude stay. th")
		end
		th = string.sub(stringed_num,1,1)
		print("th = "..th)
		if script.Parent.FirstDigit.Text ~="0" then
			Roll(0, script.Parent.FirstDigit)
			fh = 0
		end
	end
	if #stringed_num == 4 then
		Roll(string.sub(stringed_num,4,4), script.Parent.FourthDigit)

		if string.sub(stringed_num,3,3) ~= sh then
			Roll(string.sub(stringed_num,3,3), script.Parent.ThirdDigit)
		elseif string.sub(stringed_num,3,3) == sh then
			print("dude stay.")
		end
		sh = string.sub(stringed_num,3,3)
		print("sh = "..sh)
		if string.sub(stringed_num,2,2) ~= th then
			Roll(string.sub(stringed_num,2,2), script.Parent.SecondDigit)
		elseif string.sub(stringed_num,2,2) == th then
			print("dude stay.")
		end
		th = string.sub(stringed_num,2,2)
		print("sh = "..th)
		if string.sub(stringed_num,1,1) ~= fh then
			Roll(string.sub(stringed_num,1,1), script.Parent.FirstDigit)
		elseif string.sub(stringed_num,1,1) == fh then
			print("dude stay.")
		end
		fh = string.sub(stringed_num,1,1)
		print("fh = "..fh)
	end
	if #stringed_num == 5 then
		Roll("N", script.Parent.FirstDigit)
		Roll("/", script.Parent.SecondDigit)
		Roll("A", script.Parent.ThirdDigit)
		Roll(".", script.Parent.FourthDigit)
	end
end)
