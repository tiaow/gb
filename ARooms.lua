local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "条脚本v2",
    Icon = "rbxassetid://129260712070622",
    Size = UDim2.fromOffset(400, 300),
    Theme = "Dark"
})
local Player = Window:Tab({
    Title = "玩家",
    Icon = "mouse-pointer-2"
})

local MainTab = Window:Tab({
    Title = "FPS/透视",
    Icon = "mouse-pointer-2"
})

Player:Slider({
    Title = "移动速度",
    Desc = "调整角色移动速度",
    Value = {
        Min = 0,
        Max = 100,
        Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
    },
    Callback = function(Speed) 
        -- 直接赋值一次即可，无需循环
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed 
    end
})