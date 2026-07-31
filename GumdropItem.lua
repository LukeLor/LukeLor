--MODIFYING
local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop") or char:FindFirstChild("Gumdrop") then

if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop"):GetAttribute("Stack") >= 5 or char:FindFirstChild("Gumdrop"):GetAttribute("Stack") >= 5 then
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

local Gumdrop = game:GetObjects("rbxassetid://93593530342378")[1]
      Gumdrop.TextureId ="rbxassetid://117093700428560"

Gumdrop:SetAttribute("Stack", 1)
        local tweenService = game:GetService("TweenService")

        
       char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")

        
        
        local InTrans = false
        

        local xUsed = Gumdrop:GetAttribute("Stack")


      



        



        function SetupGumdrop()
            Gumdrop.Parent = game.Players.LocalPlayer.Backpack
            Gumdrop.Name = "Gumdrop"
  Gumdrop.TextureId ="rbxassetid://117093700428560"

            for slotNum, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if tool.Name == "Gumdrop" then
     -- tool.TextureId = "rbxassetid://117093700428560"
                    local slot =game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI").MainFrame.Hotbar:FindFirstChild(slotNum)
                    
                    slot.DurabilityNumber.Visible = true
                    slot.DurabilityNumber.Text = "x"..xUsed

                    Gumdrop.Unequipped:Connect(function()
                        slot.DurabilityNumber.Visible = true
                        slot.DurabilityNumber.Text = "x"..xUsed
                    end)

                    Gumdrop.Equipped:Connect(function()
                        slot.DurabilityNumber.Visible = true
                    end)

                    Gumdrop.Activated:Connect(function()
                       if not InTrans and xUsed > 0 then
                        InTrans = true
                            xUsed = xUsed - 1
            Gumdrop:SetAttribute("Stack", xUsed)
                            slot.DurabilityNumber.Visible = true
                            slot.DurabilityNumber.Text = "x"..xUsed
                            

                           -- tweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {FieldOfView = 100}):Play()
                        
                            hum:SetAttribute("SpeedBoost", math.random(7,13))
                        hum.WalkSpeed = hum.WalkSpeed + hum:GetAttribute(SpeedBoost)
                        
                        if xUsed == 0 then 
Gumdrop:Destroy()
                        end
                        task.wait(math.random(7,12))

InTrans = false
                        hum.WalkSpeed = hum.WalkSpeed - hum:GetAttribute(SpeedBoost)
                        
                        
                    end
                    end)
                end
            end




            
        end

        SetupGumdrop()

        

        
        


end
