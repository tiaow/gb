local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 创建ScreenGui
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "AutoFarmUI"

-- 创建主Frame（加长的白色长方形）
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 220, 0, 150)  -- 加长高度
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.Active = true
mainFrame.Draggable = true

-- 添加标题
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "自动打"
title.TextColor3 = Color3.new(0, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

-- 创建按钮（调整位置避开标题）
local autoRatButton = Instance.new("TextButton", mainFrame)
autoRatButton.Size = UDim2.new(0.9, 0, 0.3, 0)
autoRatButton.Position = UDim2.new(0.05, 0, 0.25, 0)
autoRatButton.Text = "自动打老鼠"
autoRatButton.BackgroundColor3 = Color3.new(1, 1, 1)

local autoAppleButton = Instance.new("TextButton", mainFrame)
autoAppleButton.Size = UDim2.new(0.9, 0, 0.3, 0)
autoAppleButton.Position = UDim2.new(0.05, 0, 0.65, 0)
autoAppleButton.Text = "自动打苹果"
autoAppleButton.BackgroundColor3 = Color3.new(1, 1, 1)

-- 自动打老鼠功能
local ratLoopActive = false
autoRatButton.MouseButton1Click:Connect(function()
    ratLoopActive = not ratLoopActive
    autoRatButton.BackgroundColor3 = ratLoopActive and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
    
    while ratLoopActive do
        -- 检测场上是否有老鼠
        local rat = workspace.Game.Enemies:FindFirstChild("Rat")
        if rat then
            -- 如果有老鼠，攻击老鼠
            local args = {
                [1] = rat.Head
            }
            game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
            local args = {
    [1] = workspace.Game.Enemies.Rat.Head
}

game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
local args = {
    [1] = workspace.Game.Enemies.Rat.Head
}

game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
local args = {
    [1] = workspace.Game.Enemies.Rat.Head
}

game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
local args = {
    [1] = workspace.Game.Enemies.Rat.Head
}

game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
local args = {
    [1] = workspace.Game.Enemies.Rat.Head
}

game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))

            wait(0.1)  -- 攻击间隔
        else
            -- 如果没有老鼠，等待老鼠出现
            wait(1)  -- 检测间隔
        end
    end
end)

-- 自动打苹果功能
local appleLoopActive = false
autoAppleButton.MouseButton1Click:Connect(function()
    appleLoopActive = not appleLoopActive
    autoAppleButton.BackgroundColor3 = appleLoopActive and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
    
    while appleLoopActive do
        local args = {
            [1] = workspace.Game.Buildings.Farm.Farm.Apples.Handle
        }
        game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
        wait(0.5)  -- 循环间隔0.5秒
    end
end)