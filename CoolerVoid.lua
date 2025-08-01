VoidPlayer = function(dest, plr)
	local lighting = game:GetService("Lighting")
	local ts = game:GetService("TweenService")

	local voidedplr = nil

	if plr ~= nil then
		voidedplr = plr
	else
		voidedplr = game.Players.LocalPlayer
	end
	local cfogcolor = lighting.FogColor
	local cfogstart = lighting.FogStart
	local cfogend = lighting.FogEnd
	
	print("{"..tostring(cfogcolor).."}, ", tostring(cfogstart)..", ", tostring(cfogend))
	wait(0.5)
	lighting.FogColor = Color3.fromRGB(0,0,0)
	ts:Create(lighting, TweenInfo.new(0.75),{FogStart = 0}):Play()
	ts:Create(lighting, TweenInfo.new(0.75),{FogEnd = 0}):Play()
	wait(0.75)
	local tpremote = Instance.new("RemoteEvent")
	tpremote.Parent = game.ReplicatedStorage
	tpremote:FireServer(dest,voidedplr)
	local vpChar = workspace:FindFirstChild(voidedplr.Name)
	vpChar.HumanoidRootPart.Anchored = true
	wait(0.5)
	
	
		
			if game.ReplicatedStorage:FindFirstChild("GameData") then
				if game.ReplicatedStorage.GameData.Floor.Value == "Hotel" then
					vpChar:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value-1]:WaitForChild("Door").PrimaryPart.CFrame)
				end

				if game.ReplicatedStorage.GameData.Floor.Value == "Mines" then
					vpChar:PivotTo(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value-1]:WaitForChild("Parts"):WaitForChild("DoorNormal").PrimaryPart.CFrame)
				end 
				print("Door")
	end
	vpChar.HumanoidRootPart.Anchored = false
	local blur = Instance.new("BlurEffect")
	blur.Parent = lighting 
	blur.Size = 24
	game:GetService("TweenService"):Create(blur, TweenInfo.new(2), {Size = 0}):Play()
	lighting.FogColor = Color3.fromRGB(255,255,255)
	ts:Create(lighting, TweenInfo.new(1.25),{FogStart = 0}):Play()
	ts:Create(lighting, TweenInfo.new(1.25),{FogEnd = 100}):Play()
	wait(0.5)
	
	ts:Create(lighting, TweenInfo.new(1.25),{FogColor = cfogcolor}):Play()
	wait(0.5)
	ts:Create(lighting, TweenInfo.new(1.25),{FogStart = cfogstart}):Play()
	ts:Create(lighting, TweenInfo.new(1.25),{FogEnd = cfogend}):Play()

	
	tpremote:Destroy()

end

local vm = require(game.ReplicatedStorage.ClientModules.EntityModules.Void)
vm.stuff = VoidPlayer()
