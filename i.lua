-- 等待游戏加载完成
repeat task.wait() until game:IsLoaded()

-- 创建ScreenGui作为UI的根容器
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyGUIScreen"
screenGui.Parent = game.CoreGui

-- 创建一个Frame作为四圆角长方形的主体
local roundedRectFrame = Instance.new("Frame")
roundedRectFrame.Name = "RoundedRectFrame"
roundedRectFrame.Parent = screenGui
roundedRectFrame.AnchorPoint = Vector2.new(0.5, 0.5)
roundedRectFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
roundedRectFrame.Size = UDim2.new(0, 300, 0, 200)
roundedRectFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

-- 创建UICorner来实现四圆角效果
local corner = Instance.new("UICorner")
corner.Parent = roundedRectFrame
corner.CornerRadius = UDim.new(0, 20)

-- 创建TextLabel用于显示文字
local textLabel = Instance.new("TextLabel")
textLabel.Name = "MyTextLabel"
textLabel.Parent = roundedRectFrame
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Font = Enum.Font.GothamSemibold
textLabel.Text = "条脚本作者第一次做脚本不要骂我😭😭这个是缝合脚本"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 20
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center

-- 在底部创建按钮
local bottomButton = Instance.new("TextButton")
bottomButton.Name = "BottomButton"
bottomButton.Parent = roundedRectFrame
bottomButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
bottomButton.Position = UDim2.new(0.5, 0, 0.85, 0)
bottomButton.AnchorPoint = Vector2.new(0.5, 0.5)
bottomButton.Size = UDim2.new(0, 120, 0, 40)
bottomButton.Font = Enum.Font.GothamSemibold
bottomButton.Text = "确定"
bottomButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bottomButton.TextSize = 16
bottomButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    task.wait(1)
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%8A%A0%E7%8F%AD.lua"))()
    end)
    if not success then
        warn("加载脚本失败: ", result)
    end
end)
