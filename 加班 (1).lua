local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local soundService = game:GetService("SoundService")
local currentSound

local screenGui = Instance.new("ScreenGui")
local musicIDTextBox = Instance.new("TextBox")
local playButton = Instance.new("TextButton")
local volumeTextBox = Instance.new("TextBox")
local pauseButton = Instance.new("TextButton")
local resumeButton = Instance.new("TextButton")
local deleteButton = Instance.new("TextButton")
local exitButton = Instance.new("TextButton")

-- 设置UI控件属性
musicIDTextBox.PlaceholderText = "输入音乐ID"
musicIDTextBox.Position = UDim2.new(0.1, 0, 0.1, 0)
musicIDTextBox.Size = UDim2.new(0.2, 0, 0.05, 0)
musicIDTextBox.Parent = screenGui

playButton.Text = "播放音乐"
playButton.Position = UDim2.new(0.1, 0, 0.2, 0)
playButton.Size = UDim2.new(0.2, 0, 0.05, 0)
playButton.Parent = screenGui

volumeTextBox.PlaceholderText = "输入音量(1 - 10)"
volumeTextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
volumeTextBox.Size = UDim2.new(0.2, 0, 0.05, 0)
volumeTextBox.Parent = screenGui

pauseButton.Text = "暂停音乐"
pauseButton.Position = UDim2.new(0.1, 0, 0.4, 0)
pauseButton.Size = UDim2.new(0.2, 0, 0.05, 0)
pauseButton.Parent = screenGui

resumeButton.Text = "恢复音乐"
resumeButton.Position = UDim2.new(0.1, 0, 0.5, 0)
resumeButton.Size = UDim2.new(0.2, 0, 0.05, 0)
resumeButton.Parent = screenGui

deleteButton.Text = "删除当前音乐"
deleteButton.Position = UDim2.new(0.1, 0, 0.6, 0)
deleteButton.Size = UDim2.new(0.2, 0, 0.05, 0)
deleteButton.Parent = screenGui

exitButton.Text = "退出"
exitButton.Position = UDim2.new(0.1, 0, 0.7, 0)
exitButton.Size = UDim2.new(0.2, 0, 0.05, 0)
exitButton.Parent = screenGui

screenGui.Parent = player:WaitForChild("PlayerGui")

-- 输入音乐ID并播放
playButton.MouseButton1Click:Connect(function()
    if currentSound then
        print("已有音乐正在播放，不能重复播放。如需播放新音乐，请先删除当前音乐。")
        return
    end
    local musicID = tonumber(musicIDTextBox.Text)
    if musicID then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://".. musicID
        sound.Parent = soundService
        currentSound = sound
        currentSound:Play()
    else
        print("请输入有效的音乐ID")
    end
end)

-- 调整音量
volumeTextBox.FocusLost:Connect(function()
    local volume = tonumber(volumeTextBox.Text)
    if volume and volume >= 1 and volume <= 10 then
        if currentSound then
            currentSound.Volume = volume / 10
        else
            print("请先输入音乐ID并播放音乐")
        end
    else
        print("无效的音量值(1 - 10)")
    end
end)

-- 暂停音乐
pauseButton.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Pause()
    else
        print("请先输入音乐ID并播放音乐")
    end
end)

-- 恢复音乐
resumeButton.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Resume()
    else
        print("请先输入音乐ID并播放音乐")
    end
end)

-- 删除当前音乐
deleteButton.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Destroy()
        currentSound = nil
    else
        print("没有正在播放的音乐")
    end
end)

-- 退出功能
local function exitFunction()
    if currentSound then
        currentSound:Destroy()
        currentSound = nil
    end
    screenGui:Destroy()
end

exitButton.MouseButton1Click:Connect(exitFunction)

-- 处理玩家死亡事件（自动启动退出功能）
player.CharacterRemoving:Connect(exitFunction)
