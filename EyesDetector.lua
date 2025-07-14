local mt = getrawmetatable(game);
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(remote,...)
   args = {...}
   method = tostring(getnamecallmethod())
   if method == "FireServer" and tostring(remote) == "MotorReplication" then

      end
end)
