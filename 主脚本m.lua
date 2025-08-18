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
      
       game.Workspace.Gravity = zhongl
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
    Value = "",
    InputIcon = "bird",
    Placeholder = "建议设置1",
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
    Title = "人物显示",
    Value = false,
    Callback = function(NC) 

local Workspace = game:GetService("Workspace") 
local Players = game:GetService("Players") 
if NC then 
Clipon = true 
else Clipon = false end 
Stepped = game:GetService("RunService").Stepped:Connect(function() if not Clipon == false then for a, b in pairs(Workspace:GetChildren()) do if b.Name == Players.LocalPlayer.Name then for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end end else Stepped:Disconnect() end 
end)

end
})
MainTab:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(Value) 
    
 
          if Value then
         
          
            game.Lighting.Ambient = Color3.new(1, 1, 1)
          
        else
        
            game.Lighting.Ambient = Color3.new(0, 0, 0)
             
        end

end
})
local enabled = false
local connections = {}
MainTab:Toggle({
    Title = "快速互动",
    Value = false,
    Callback = function(Value) 
    enabled = Value
    
    -- 清理旧连接
    for _, conn in pairs(connections) do
        conn:Disconnect()
    end
    connections = {}
    
    if enabled then
        -- 持续检测函数
        local function processPrompt(prompt)
            prompt.HoldDuration = 0
            prompt.Enabled = true  -- 确保提示启用
            
            -- 添加属性监听防止被重置
            local conn = prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
                if prompt.HoldDuration ~= 0 then
                    prompt.HoldDuration = 0
                end
            end)
            table.insert(connections, conn)
        end
        
        -- 遍历现有提示
        for _, prompt in ipairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                processPrompt(prompt)
            end
        end
        
        -- 监听新提示
        local newPromptConn = workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") then
                processPrompt(descendant)
            end
        end)
        table.insert(connections, newPromptConn)
    end


end


})
credits:Toggle('上帝模式', 'No Description', false, function(Value)



    