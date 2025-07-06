-- 定义传送点数据（修正表定义语法）
local teleportPoints = {
    ["售卖点"] = {
        tool = game:GetService("Players").LocalPlayer.Character:WaitForChild("Shovel"),
        unknownValue = 1751615072.037301,
        direction = Vector3.new(0.5085581541061401, -0.18179628252983093, -0.8416168093681335)
    }
}

local selectedPoint = nil  -- 存储当前选择的坐标

-- 下拉菜单设置
credits:Dropdown("设", "点", 
    {"售卖点"}, 
    function(selected)
        selectedPoint = teleportPoints[selected]
        print("已选择:", selected)
    end)

-- 开关设置（修正循环逻辑）
credits:Toggle("重复执行", "Toggle", false, function(Value)
    local ez = Value
    while ez do
        -- 确保selectedPoint存在后执行操作
        if selectedPoint then
            -- 假设这里需要重复调用FireServer
            local args = {
                selectedPoint.tool,
                selectedPoint.unknownValue,
                selectedPoint.direction
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("SwingMelee"):FireServer(unpack(args))
        end
        task.wait(0.1)
    end
end)