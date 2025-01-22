local player = game.Players.LocalPlayer
local tweenService = game:GetService("TweenService")
local mainScreenGui
local blackSquareFrame
local customImageButton

local function getUIElements()
    local success, err = pcall(function()
        mainScreenGui = player:WaitForChild("StarterGui"):WaitForChild("MainScreenGui")
    end)
    if not success then
        warn("无法获取 MainScreenGui: ", err)
        return false
    end

    success, err = pcall(function()
        blackSquareFrame = mainScreenGui:WaitForChild("BlackSquareFrame")
    end)
    if not success then
        warn("无法获取 BlackSquareFrame: ", err)
        return false
    end

    success, err = pcall(function()
        customImageButton = blackSquareFrame:WaitForChild("CustomImageButton")
    end)
    if not success then
        warn("无法获取 CustomImageButton: ", err)
        return false
    end

    return true
end

if not getUIElements() then
    return
end

customImageButton.Image = "rbxassetid://112396419286940"
blackSquareFrame.Visible = false
customImageButton.Visible = false

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

local function fadeInImage()
    task.wait(0.1)
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

local function clickScript()
    fadeInSquare()
    fadeInImage()
end

local originalRotation
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://4767345400"
clickSound.Parent = customImageButton

local function rotateImage()
    local tweenInfo = TweenInfo.new(
        0.3,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.Out
    )
    local newRotation = (originalRotation or 0) + 180
    local tween = tweenService:Create(customImageButton, tweenInfo, {
        Rotation = newRotation
    })
    tween:Play()
    tween.Completed:Connect(function()
        originalRotation = newRotation
    end)
end

customImageButton.MouseButton1Click:Connect(function()
    clickSound:Play()
    rotateImage()
end)

clickScript()
