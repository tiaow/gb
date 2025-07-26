
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
 wait(0.5) 
 Notification:Notify( 
     {Title = "提示", Description = "检测更新中"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
local success, result = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E4%B8%BB%E8%84%9A%E6%9C%AC.lua"))()
end)
if success then
    wait(0.8)
    Notification:Notify( 
     {Title = "更新完毕", Description = "祝你玩的开心"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
if game.Player.Name = Gary_Xi666 then
local Fg = true
while Fg do
print("1")
task.wait(0.01)
else

end

else
   Notification:Notify( 
     {Title = "提示", Description = "更新中"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
end
