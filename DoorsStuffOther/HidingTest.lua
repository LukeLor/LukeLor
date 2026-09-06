workspace.DescendantAdded:Connect(function(child)
if child.Name == "RushMoving" then
child:Destroy()
    end
  end)
