
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
function CreateCustomNotification(title, text, button1Text, button2Text, callback1, callback2)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame.Parent = screenGui
    

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Parent = frame
    
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Size = UDim2.new(1, -20, 0, 60)
    textLabel.Position = UDim2.new(0, 10, 0, 40)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = frame
    
    
    local button1 = Instance.new("TextButton")
    button1.Text = button1Text or "确认"
    button1.Size = UDim2.new(0, 120, 0, 30)
    button1.Position = UDim2.new(0, 20, 1, -40)
    button1.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    button1.Parent = frame
    
    
    local button2 = Instance.new("TextButton")
    button2.Text = button2Text or "取消"
    button2.Size = UDim2.new(0, 120, 0, 30)
    button2.Position = UDim2.new(1, -140, 1, -40)
    button2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    button2.Parent = frame
    
    
    button1.MouseButton1Click:Connect(function()
        if callback1 then callback1() end
        screenGui:Destroy()
    end)
    
    button2.MouseButton1Click:Connect(function()
        if callback2 then callback2() end
        screenGui:Destroy()
    end)
    
    return screenGui
end

CreateCustomNotification(
    "提示", 
    "选择服务器检测或者直接启用条脚本", 
    "服务器检测", 
    "条脚本", 
    function() 
Notification:Notify( 
     {Title = "条脚本提示", Description = "正在检测是否支持该服务器"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 





 end,
    function() 

loadstring(game:HttpGet(https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/aaaTW脚本.lua))()


 end
)
