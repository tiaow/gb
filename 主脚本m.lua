local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "条脚本v2",
    Icon = "rbxassetid://129260712070622",
    Size = UDim2.fromOffset(400, 300),
    Theme = "Dark"
})
local MainTab = Window:Tab({
    Title = "按钮演示",
    Icon = "mouse-pointer-2"
})
local shezhi = Window:Tab({
    Title = "按钮演示",
    Icon = "mouse-pointer-2"
})
MainTab:Slider({
    Title = "移动速度",
    Desc = "调整角色移动速度",
    Value = {
        Min = 0,
        Max = 1000,
        Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
    },
    Callback = function(Speed) 
        -- 直接赋值一次即可，无需循环
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed 
    end
})

MainTab:Slider({
    Title = "跳跃高度",
    Desc = "调整角色跳跃高度",
    Value = {
        Min = 0,
        Max = 100000000,
        Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
    },
    Callback = function(JValue) 
        -- 直接赋值一次即可，无需循环
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JValue
                             
         game.Players.LocalPlayer.Character.Humanoid.JumpHeight =  JValue
            
            
        end
    
})
MainTab:Slider({
    Title = "设置重力",
    Desc = "默认196.2",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 196.2,
    },
    Callback = function(zhongl) 
      
       Game.Gravity = zhongl
    end
   end
})
 MainTab:Slider({
    Title = "缩放距离",
    Desc = "默认128",
    Value = {
        Min = 128,
        Max = 100000,
        Default = 128,
    },
    Callback = function(SF) 
  
       game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = SF
    end
   
})
MainTab:Slider({
    Title = "视界",
    Desc = "默认70",
    Value = {
        Min = 0,
        Max = 120,
        Default = 70,
    },
    Callback = function(shijie) 
      
       game.Workspace.CurrentCamera.FieldOfView = shijie
    end
    
})

MainTab:Input({
    Title = "跑步速度",
    Value = "建议1",
    InputIcon = "bird",
    Placeholder = "输入",
    Callback = function(king)

 local tspeed = king
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end
})

MainTab:Toggle({
    Title = "Activate Mode",
    Value = false,
    Callback = function(state) 
while state do
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed 
task.wait(1)
end

end
})

