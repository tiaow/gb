local player = game.Players.LocalPlayer
local mainScreenGui = player:WaitForChild("StarterGui"):WaitForChild("MainScreenGui")
local blackSquareFrame = mainScreenGui:WaitForChild("BlackSquareFrame")
local customImageButton = blackSquareFrame:WaitForChild("CustomImageButton")
local tweenService = game:GetService("TweenService")

-- 设置自定义图片
customImageButton.Image = ("https://github.com/tiaow/ihv/blob/main/Image_1736837216588.jpg")

-- 初始隐藏方块和图片
blackSquareFrame.Visible = false
customImageButton.Visible = false

-- 方块淡入函数
local function fadeInSquare()
    blackSquareFrame.Visible = true
    local tweenInfo = TweenInfo.new(
        0.3,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    local tween = tweenService:Create(blackSquareFrame, tweenInfo, {
        Size = UDim2.new(0, 200, 0, 200),
        Position = UDim2.new(0.5, -100, 0.5, -100)
    })
    tween:Play()
end

-- 图片淡入函数
local function fadeInImage()
    customImageButton.Visible = true
    local tweenInfo = TweenInfo.new(
        0.3,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    local tween = tweenService:Create(customImageButton, tweenInfo, {
        ImageTransparency = 0
    })
    tween:Play()
end

-- 假设这里有一个函数模拟“点击脚本”的操作
local function clickScript()
    fadeInSquare()
    fadeInImage()
end

-- 用于存储原始的旋转角度
local originalRotation

-- 点击音效
local clickSound = Instance.new("Sound")
clickSound.SoundId = ("rbxassetid://4767345400") -- 替换为实际音效ID
clickSound.Parent = customImageButton

customImageButton.MouseButton1Click:Connect(function()
    clickSound:Play()
    if not originalRotation then
        originalRotation = customImageButton.Rotation
        customImageButton.Rotation = originalRotation + 180
    else
        customImageButton.Rotation = originalRotation
        originalRotation = nil
    end
end)
