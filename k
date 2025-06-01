local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%BD%A9%E8%89%B2UI.lua"))()
local window = library:new("条脚本v2")local creds = window:Tab("愚蠢的boss战",'106133116600295')
local credits = creds:section("内容","false
"）credits:Toggle("重复选择地图3", "Toggle", false,function(Value)
Tui3 = Value
while Tui3 do
game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("Sugar"):InvokeServer()

task.wait(0.1)
end
end)