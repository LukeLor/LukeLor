local module = {}

local hasToolOut = function(char)
  if char:FindFirstChildOfClass("Tool") then   
  return char:FindFirstChildOfClass("Tool"), true
  end
  return nil, false
end

local toolMatch = function(tool, name)
if tool.Name == name then
    return true
  else
    return false
  end
end

module.Run = function(itemName, Skin, char)
  --Make sure everything's there.
if not Skin then
warn("Can't run because no replacement skin was given...")
    return
  end
  if not itemName then
warn("Can't run because no itemName was given to search for...")
    return
  end
  local skin = Skin:Clone()
  local performingTool
  local c = coroutine.create(function()
  --Main
  char.ChildAdded:Connect(function()
    --find a tool
local tool, hastool = hasToolOut(char)
  if hastool == true then
      --tool has same name
local match = toolMatch(tool, itemName)
      if match then
        --Make sure that it hasn't been changed already
        if tool:GetAttribute("Custom") ~= true then
      --Destroy existing content, import skin into workspace
       skin.Parent = game.Players:WaitForChild(char.Name).Backpack
          local objTable = {}
          for _, inst in skin:GetDescendants() do
            table.insert(objTable, inst.Name)
            if inst:IsA("BasePart") then
           --  inst.Anchored = true
            end
          end
                task. wait()
                skin.Parent = char
                task.wait()
                       
          --Handle main item
            for _, contents in tool:GetChildren() do
          if contents:IsA("Folder") or contents.Name == "Handle" or contents.Name == "Animation" or table.find(objTable, contents.Name) then
--Do Nothing
          else
              --Destroy
              contents:Destroy()
          end
        end
        --Import
          for _, obj in skin:GetChildren() do
obj.Parent = tool.Handle
if obj:IsA("BasePart") then
obj.Anchored = false
              local weld = Instance.new("WeldConstraint")
             weld.Parent = tool.Handle
              weld.Part0 = tool.Handle
              weld.Part1 = obj
            end
          end
              skin:Destroy()
              print("Finished Set-up!!!")
              tool:SetAttribute("Custom",true)
           performingTool = tool

               local event = nil
             event=  tool.Unequipped:Connect(function()
                  if tool:GetAttribute("Custom") == true then
                        tool:SetAttribute("Custom", false)
                
                    
                      end
                  event:Disconnect()
                end)
          end
    end
    end
  end)
    end)
  coroutine.resume(c)
  return c
end
  
module.Close = function(thread)
    if not thread then warn("Cant close due to having no thread.") return end
coroutine.close(thread)
  end

  
return module 
