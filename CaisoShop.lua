local met = true --CHANGE THIS TO CHECK FOR ANY SIDE ROOMS AVAILABLE

if met then 
  local roomCFrame = CFrame.new(0,0,0) --REPLACE FOR REAL ENTIRY CFRAME!
  loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

  --Animation Handler, mayhaps for Caiso?
  local AnimatorStore = game:GetObjects("rbxassetid://104077319394815")[1] --Thanks, Proxiom!!!
local AnimatorModule = require(AnimatorStore.ReplicatedStorage.Animator)


--Shop model
local Shop = LoadCustomInstance("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaisoShop.rbxm")

if Shop then 
Shop.Parent = workspace
Shop:PivotTo(roomCFrame)
  end
  
end
