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
Player:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(Value) 
    
 
          if Value then
         
          while Value do

            game.Lighting.Ambient = Color3.new(1, 1, 1)
          task.wait(0.01)
          end

        else
        
            game.Lighting.Ambient = Color3.new(0, 0, 0)
             
        end

end
})
local enabled = false
local connections = {}
Player:Toggle({
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



