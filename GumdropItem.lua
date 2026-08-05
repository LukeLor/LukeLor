--MODIFYING
local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
--BACKPACK
if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop") then
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):GetAttribute("Stack") >= 5 then
		--Return due to stack being maxed.
		return 
	else
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):SetAttribute("Stack", game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):GetAttribute("Stack") + 1)
		elseif char:FindFirstChild("Gumdrop") then 
			char:FindFirstChild("Gumdrop"):SetAttribute("Stack", char:FindFirstChild("Gumdrop"):GetAttribute("Stack") + 1)
		end
		--Return because Gumdrop has been added to stack.
		return 
	end
    --CHAR
elseif char:FindFirstChild("Gumdrop") then
	if char:FindFirstChild("Gumdrop"):GetAttribute("Stack") >= 5  then
		--Return due to stack being maxed.
		return 
	else
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop") then
			game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):SetAttribute("Stack", game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):GetAttribute("Stack") + 1)
		elseif char:FindFirstChild("Gumdrop") then 
			char:FindFirstChild("Gumdrop"):SetAttribute("Stack", char:FindFirstChild("Gumdrop"):GetAttribute("Stack") + 1)
		end
		--Return because Gumdrop has been added to stack.
		return 
	end
end
local StatusMaker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/DoorsScripts/Custom-Statuses/Main.luau"))()
local ItemArray = game:GetObjects("rbxassetid://93593530342378")[1]
local Gumdrop = ItemArray.Gumdrop
     -- Gumdrop.TextureId ="rbxassetid://117093700428560"
Gumdrop:SetAttribute("Interactable",true)
Gumdrop:SetAttribute("Stack", 5)
        local tweenService = game:GetService("TweenService")

        
       char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")

        
        
        local InTrans = false
        

        local xUsed = Gumdrop:GetAttribute("Stack")


      



        



        function SetupGumdrop()
            Gumdrop.Parent = game.Players.LocalPlayer.Backpack
            Gumdrop.Name = "Gumdrop"

                Gumdrop.Unequipped:Connect(function()
                            xUsed = Gumdrop:GetAttribute("Stack")
                end)

                Gumdrop.Equipped:Connect(function()
        xUsed = Gumdrop:GetAttribute("Stack")
        task.wait(0.1)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I have "..tostring(xUsed).." gumdrops left in this stack...",true)
                end)

                    Gumdrop.Activated:Connect(function()
                       if not InTrans and xUsed > 0 then
                        InTrans = true
                            xUsed = xUsed - 1
            Gumdrop:SetAttribute("Stack", xUsed)
                            hum:SetAttribute("SpeedBoost", math.random(7,13))
                        hum.WalkSpeed = hum.WalkSpeed + hum:GetAttribute("SpeedBoost")
                  	local PassiveHeal = StatusMaker.MakeStatus("rbxassetid://127452134994180", "PassiveHeal")    
			local Energetic = StatusMaker.MakeStatus("rbxassetid://108269020278219", "Energetic")
			PassiveHeal.Visible = true
			Energetic.Visible = true
                        if xUsed == 0 then 
Gumdrop:Destroy()
                        end
                        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I have "..tostring(xUsed).." gumdrops now...",true)


                       local effectTime = math.random(7,12)
                        for i= 1, effectTime, 1 do
task.wait(0.1)
                         hum.Health += math.random(1,2)/5/10*6
                        end

InTrans = false
                        hum.WalkSpeed = hum.WalkSpeed - hum:GetAttribute("SpeedBoost")
                        task.wait(0.1) 
                        hum:SetAttribute("SpeedBoost", 0)
                        PassiveHeal:Destroy()
                        Energetic:Destroy()
                    end
                    end)
             end

        SetupGumdrop()

        

        
