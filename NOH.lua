local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%BD%A9%E8%89%B2UI.lua"))()
local window = library:new("Blud obby")
local creds = window:Tab("信息",'')

local ESP = window:Tab("透视",'')
local b46 = window:Tab("46关",'')

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








local ESP = Esp:section("透视",true)
Esp:Duomp



local b46 = b46:section("46关",true)