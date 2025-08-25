local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 创建远程事件用于玩家间通信
local chatRemoteEvent
if ReplicatedStorage:FindFirstChild("CustomChatRemoteEvent") then
    chatRemoteEvent = ReplicatedStorage:FindFirstChild("CustomChatRemoteEvent")
else
    chatRemoteEvent = Instance.new("RemoteEvent")
    chatRemoteEvent.Name = "CustomChatRemoteEvent"
    chatRemoteEvent.Parent = ReplicatedStorage
end

-- 创建主界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomChat"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- 获取Roblox自带聊天按钮的位置参考
local function findChatButton()
    local chatGui = PlayerGui:FindFirstChild("Chat")
    if chatGui then
        local frame = chatGui:FindFirstChild("Frame")
        if frame then
            return frame:FindFirstChild("BottomLeftControl")
        end
    end
    return nil
end

-- 创建聊天按钮容器
local chatButtonContainer = Instance.new("Frame")
chatButtonContainer.Name = "ChatButtonContainer"
chatButtonContainer.BackgroundTransparency = 1
chatButtonContainer.Size = UDim2.new(0, 50, 0, 50)

-- 尝试将按钮放在Roblox聊天按钮旁边
local chatBottomLeft = findChatButton()
if chatBottomLeft then
    chatButtonContainer.Parent = chatBottomLeft.Parent
    chatButtonContainer.LayoutOrder = chatBottomLeft.LayoutOrder + 1
else
    -- 备用位置
    chatButtonContainer.Position = UDim2.new(0, 10, 0, 10)
    chatButtonContainer.Parent = ScreenGui
end

-- 创建聊天按钮
local chatButton = Instance.new("ImageButton")
chatButton.Name = "ChatButton"
chatButton.Size = UDim2.new(0, 46, 0, 46)
chatButton.Position = UDim2.new(0, 0, 0, 0)
chatButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
chatButton.AutoButtonColor = false
chatButton.Image = "rbxassetid://6233278327" -- 聊天图标
chatButton.Parent = chatButtonContainer

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = chatButton

-- 创建聊天框
local chatFrame = Instance.new("Frame")
chatFrame.Name = "ChatFrame"
chatFrame.Size = UDim2.new(0, 400, 0, 300) -- 固定尺寸
chatFrame.Position = UDim2.new(0, 10, 0, 60)
chatFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
chatFrame.BackgroundTransparency = 0.5
chatFrame.Visible = false
chatFrame.Parent = chatButtonContainer

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = chatFrame

-- 创建聊天消息框
local messagesScrollingFrame = Instance.new("ScrollingFrame")
messagesScrollingFrame.Name = "Messages"
messagesScrollingFrame.Size = UDim2.new(1, -10, 1, -60)
messagesScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
messagesScrollingFrame.BackgroundTransparency = 1
messagesScrollingFrame.BorderSizePixel = 0
messagesScrollingFrame.ScrollBarThickness = 8
messagesScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
messagesScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y -- 只允许垂直滚动
messagesScrollingFrame.Parent = chatFrame

local messagesLayout = Instance.new("UIListLayout")
messagesLayout.Padding = UDim.new(0, 8)
messagesLayout.SortOrder = Enum.SortOrder.LayoutOrder
messagesLayout.Parent = messagesScrollingFrame

-- 创建输入框
local inputFrame = Instance.new("Frame")
inputFrame.Name = "InputFrame"
inputFrame.Size = UDim2.new(1, -50, 0, 40)
inputFrame.Position = UDim2.new(0, 5, 1, -50)
inputFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
inputFrame.BackgroundTransparency = 0.3
inputFrame.Parent = chatFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent = inputFrame

local inputBox = Instance.new("TextBox")
inputBox.Name = "InputBox"
inputBox.Size = UDim2.new(1, -10, 1, -4)
inputBox.Position = UDim2.new(0, 5, 0, 2)
inputBox.BackgroundTransparency = 1
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Text = ""
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.PlaceholderText = "输入消息..."
inputBox.TextSize = 16
inputBox.Parent = inputFrame

-- 创建表情按钮
local emojiButton = Instance.new("ImageButton")
emojiButton.Name = "EmojiButton"
emojiButton.Size = UDim2.new(0, 40, 0, 40)
emojiButton.Position = UDim2.new(1, -45, 1, -50)
emojiButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
emojiButton.BackgroundTransparency = 0.3
emojiButton.Image = "rbxassetid://6233279655" -- 表情图标
emojiButton.Parent = chatFrame

local emojiCorner = Instance.new("UICorner")
emojiCorner.CornerRadius = UDim.new(0, 6)
emojiCorner.Parent = emojiButton

-- 创建表情选择框
local emojiFrame = Instance.new("Frame")
emojiFrame.Name = "EmojiFrame"
emojiFrame.Size = UDim2.new(0, 240, 0, 120)
emojiFrame.Position = UDim2.new(1, 5, 0, 0)
emojiFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
emojiFrame.BackgroundTransparency = 0.2
emojiFrame.Visible = false
emojiFrame.Parent = emojiButton

local emojiUICorner = Instance.new("UICorner")
emojiUICorner.CornerRadius = UDim.new(0, 8)
emojiUICorner.Parent = emojiFrame

local emojiLayout = Instance.new("UIGridLayout")
emojiLayout.CellSize = UDim2.new(0, 40, 0, 40)
emojiLayout.CellPadding = UDim2.new(0, 5, 0, 5)
emojiLayout.SortOrder = Enum.SortOrder.LayoutOrder
emojiLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
emojiLayout.VerticalAlignment = Enum.VerticalAlignment.Center
emojiLayout.Parent = emojiFrame

-- 添加一些表情
local emojis = {"😀", "😂", "😍", "😎", "🤔", "👍", "❤️", "🔥", "🎮", "😊", "😢", "😡"}
for _, emoji in pairs(emojis) do
    local emojiBtn = Instance.new("TextButton")
    emojiBtn.Size = UDim2.new(0, 40, 0, 40)
    emojiBtn.BackgroundTransparency = 1
    emojiBtn.Text = emoji
    emojiBtn.TextSize = 20
    emojiBtn.Parent = emojiFrame
end

-- 按钮状态变量
local chatOpen = false
local emojiOpen = false

-- 添加消息到聊天框
local function addMessage(sender, message, isEmoji)
    local messageFrame = Instance.new("Frame")
    messageFrame.Size = UDim2.new(1, -10, 0, 0) -- 高度自适应
    messageFrame.AutomaticSize = Enum.AutomaticSize.Y
    messageFrame.BackgroundTransparency = 1
    messageFrame.LayoutOrder = #messagesScrollingFrame:GetChildren()
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, 0, 0, 0)
    messageLabel.AutomaticSize = Enum.AutomaticSize.Y
    messageLabel.BackgroundTransparency = 1
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Text = sender .. ": " .. message
    messageLabel.TextSize = 16
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextWrapped = true -- 文本自动换行
    messageLabel.Parent = messageFrame
    
    messageFrame.Parent = messagesScrollingFrame
    
    -- 只有当消息超出可视区域时才滚动到底部
    if messagesScrollingFrame.CanvasSize.Y.Offset > messagesScrollingFrame.AbsoluteWindowSize.Y then
        -- 延迟一点时间再滚动，确保UI更新完成
        task.wait(0.05)
        messagesScrollingFrame.CanvasPosition = Vector2.new(0, messagesScrollingFrame.AbsoluteCanvasSize.Y)
    end
end

-- 切换聊天框显示/隐藏
local function toggleChat()
    chatOpen = not chatOpen
    
    -- 添加动画效果
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if chatOpen then
        chatFrame.Size = UDim2.new(0, 0, 0, 0)
        chatFrame.Visible = true
        local tween = TweenService:Create(chatFrame, tweenInfo, {Size = UDim2.new(0, 400, 0, 300)})
        tween:Play()
    else
        local tween = TweenService:Create(chatFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        tween.Completed:Connect(function()
            chatFrame.Visible = false
        end)
        -- 同时关闭表情框
        emojiFrame.Visible = false
        emojiOpen = false
    end
end

-- 切换表情框显示/隐藏
local function toggleEmoji()
    emojiOpen = not emojiOpen
    emojiFrame.Visible = emojiOpen
end

-- 发送消息给所有玩家
local function sendMessage(message, isEmoji)
    if message ~= "" then
        -- 发送到服务器，让其他玩家也能看到
        chatRemoteEvent:FireServer(message, isEmoji)
        
        -- 本地立即显示
        addMessage(Players.LocalPlayer.Name, message, isEmoji)
        inputBox.Text = ""
    end
end

-- 发送表情
local function sendEmoji(emoji)
    sendMessage(emoji, true)
    emojiFrame.Visible = false
    emojiOpen = false
end

-- 监听来自其他玩家的消息
chatRemoteEvent.OnClientEvent:Connect(function(playerName, message, isEmoji)
    addMessage(playerName, message, isEmoji)
end)

-- 连接事件
chatButton.MouseButton1Click:Connect(toggleChat)
emojiButton.MouseButton1Click:Connect(toggleEmoji)

inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendMessage(inputBox.Text, false)
    end
end)

-- 连接表情按钮事件
for _, child in pairs(emojiFrame:GetChildren()) do
    if child:IsA("TextButton") then
        child.MouseButton1Click:Connect(function()
            sendEmoji(child.Text)
        end)
    end
end

-- 初始消息
addMessage("系统", "欢迎使用模拟聊天！开始与其他玩家聊天吧！")

-- 服务器脚本（需要放在ServerScriptService中）
-- 以下是服务器端脚本，需要放在ServerScriptService中
local serverScript = [[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local chatRemoteEvent = ReplicatedStorage:WaitForChild("CustomChatRemoteEvent")

chatRemoteEvent.OnServerEvent:Connect(function(player, message, isEmoji)
    -- 广播给所有玩家
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        chatRemoteEvent:FireClient(otherPlayer, player.Name, message, isEmoji)
    end
end)
]]

-- 创建服务器脚本（如果不存在）
if not game.ServerScriptService:FindFirstChild("CustomChatServer") then
    local serverScriptInstance = Instance.new("Script")
    serverScriptInstance.Name = "CustomChatServer"
    serverScriptInstance.Source = serverScript
    serverScriptInstance.Parent = game.ServerScriptService
end