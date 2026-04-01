local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%BD%A9%E8%89%B2UI.lua"))()
local window = library:new("Blud obby")
local creds = window:Tab("信息",'')
local Pl = window:Tab("玩家",'')
local b41 = window:Tab("41关",'')
local b46 = window:Tab("46关",'')

    local bin = creds:section("作者信息",true)
    bin:Label("作者:条纹")
    bin:Label("是否被拉入黑名单：")
    bin:Label("用此脚本请观看视频使用")
    bin:Label("拉黑名单别找我")
     local credits = creds:section("设置",true)
           credits:Toggle("移除UI辉光", "", false, function(state)
        if state then
            game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = false
        else
            game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = true
        end
    end)

    credits:Toggle("彩虹UI", "", false, function(state)
        if state then
            game:GetService("CoreGui")["frosty is cute"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty is cute"].Main.Style = "Custom"
        end
    end)

    
        credits:Button("摧毁GUI",function()
            game:GetService("CoreGui")["frosty is cute"]:Destroy()
        end)

while true do
local ban = game:GetService("Players").LocalPlayer.SideStats.Fraud
task.wait(1)
end

local P = Pl:section("玩家",true)

local b41 = b41:section("41关",true)
local b46 = b46:section("46关",true)
