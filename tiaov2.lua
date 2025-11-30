local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

function CreateCustomNotification(title, text, button1Text, button2Text, callback1, callback2)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = frame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleLabel
    
    local closeButton = Instance.new("TextButton")
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0, 2)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextScaled = true
    closeButton.Parent = frame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeButton
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Size = UDim2.new(1, -20, 0, 60)
    textLabel.Position = UDim2.new(0, 10, 0, 40)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.BackgroundTransparency = 1
    textLabel.TextWrapped = true
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.Gotham
    textLabel.Parent = frame
    
    local button1 = Instance.new("TextButton")
    button1.Text = button1Text or "确认"
    button1.Size = UDim2.new(0, 120, 0, 30)
    button1.Position = UDim2.new(0, 20, 1, -40)
    button1.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    button1.Font = Enum.Font.GothamBold
    button1.Parent = frame
    
    local button1Corner = Instance.new("UICorner")
    button1Corner.CornerRadius = UDim.new(0, 6)
    button1Corner.Parent = button1
    
    local button2 = Instance.new("TextButton")
    button2.Text = button2Text or "取消"
    button2.Size = UDim2.new(0, 120, 0, 30)
    button2.Position = UDim2.new(1, -140, 1, -40)
    button2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    button2.Font = Enum.Font.GothamBold
    button2.Parent = frame
    
    local button2Corner = Instance.new("UICorner")
    button2Corner.CornerRadius = UDim.new(0, 6)
    button2Corner.Parent = button2
    
    local function handleButtonClick(callback)
        button1.AutoButtonColor = false
        button2.AutoButtonColor = false
        button1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        button2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        button1.Active = false
        button2.Active = false
        
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = tweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.5, -150, 1, 10)})
        tween:Play()
        
        tween.Completed:Connect(function()
            if callback then 
                callback() 
            end
            screenGui:Destroy()
        end)
    end
    
    local function closeNotification()
        button1.AutoButtonColor = false
        button2.AutoButtonColor = false
        closeButton.AutoButtonColor = false
        button1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        button2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        closeButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60)
        button1.Active = false
        button2.Active = false
        closeButton.Active = false
        
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = tweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.5, -150, 1, 10)})
        tween:Play()
        
        tween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end
    
    button1.MouseButton1Click:Connect(function()
        handleButtonClick(callback1)
    end)
    
    button2.MouseButton1Click:Connect(function()
        handleButtonClick(callback2)
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        closeNotification()
    end)
    
    return screenGui
end

CreateCustomNotification(
    "提示", 
    "选择服务器检测或者直接启用脚本", 
    "服务器检测", 
    "直接启用", 
    function() 
        Notification:Notify( 
            {Title = "脚本提示", Description = "正在检测是否支持该服务器"}, 
            {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "image"}, 
            {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
        )
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/主脚本.lua"))()
    end,
    function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/aaaTW脚本.lua"))()
    end
)