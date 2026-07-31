--MODIFYING
if game.Players.LocalPlayer.Backpack:FindFirstChild("Gumdrop") or char:FindFirstChild("Gumdrop") then


  
end

local Gumdrop = game:GetObjects("rbxassetid://93593530342378")[1]
      
        local tweenService = game:GetService("TweenService")

        
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacteAdded:Wait()
        local hum = char:WaitForChild("Humanoid")

        
        local Durability = 35
        local InTrans = false
        local Duration = 10

        local xUsed = 0


      



        function AddDurability()
            InTrans = true
            hum:SetAttribute("SpeedBoost", 15)
            wait(Duration)
            InTrans = false
            hum:SetAttribute("SpeedBoost", 0)
        end




        function SetupGumdrop()
            Gumdrop.Parent = game.Players.LocalPlayer.Backpack
            Gumdrop.Name = "Gumdrop"

            for slotNum, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if tool.Name == "Gumdrop" then
                    local slot =game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI").MainFrame.Hotbar:FindFirstChild(slotNum)
                    
                    slot.DurabilityNumber.Visible = true
                    slot.DurabilityNumber.Text = "x"..xUsed

                    Vitamins.Unequipped:Connect(function()
                        slot.DurabilityNumber.Visible = true
                        slot.DurabilityNumber.Text = "x"..xUsed
                    end)

                    Vitamins.Equipped:Connect(function()
                        slot.DurabilityNumber.Visible = true
                    end)

                    Vitamins.Activated:Connect(function()
                        if not InTrans and xUsed > 0 then
                            xUsed = xUsed - 1
                            slot.DurabilityNumber.Visible = true
                            slot.DurabilityNumber.Text = "x"..xUsed
                            

                            tweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {FieldOfView = 100}):Play()
                            AddDurability()
                        end
                    end)
                end
            end




            Vitamins.Equipped:Connect(function()
                idleTrack:Play()
            end)


            Vitamins.Unequipped:Connect(function()
                idleTrack:Stop()

            end)
        end

        v1.SetupVitamins()

        function v1.AddLoop()
            while task.wait() do
                if InTrans then
                    wait()
                    hum.WalkSpeed = Durability
                else
                    hum.WalkSpeed = 16
                end
            end
        end

        while task.wait() do
            v1.AddLoop()
        end

        return v1


end
