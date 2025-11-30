local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()


local placeId = game.PlaceId

local gameScripts = {
    [10834586502] = "ATBB.lua"  
}
local jiancejb = {
    [10834586502] = "战斗砖块"  
}
if gameScripts[placeId] then

Notification:Notify( 
     {Title = "检测服务器", Description = "检测到服务器为" .. jiancejb[placeId] }, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
    wait(1)
    local qidong = "https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/" .. gameScripts[placeId]
    loadstring(game:HttpGet(qidong))()

else
Notification:Notify( 
     {Title = "未支持服务器", Description = "启动条脚本"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 

loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/aaaTW脚本.lua"))()

end

