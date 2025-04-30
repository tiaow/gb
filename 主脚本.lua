
  local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
 wait(0.5) 
 Notification:Notify( 
     {Title = "条脚本", Description = "作者条纹"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
   local musicId = "rbxassetid://3848738542"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
 wait(1) 
 Notification:Notify( 
     {Title = "脚本启动成功", Description = "准备好了！祝你玩的开心"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
   local musicId = "rbxassetid://3848738542"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
 wait(1)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner = Instance.new("UICorner")

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%BD%A9%E8%89%B2UI.lua"))()
local window = library:new("条脚本v2")
local creds = window:Tab("信息",'106133116600295')
    local bin = creds:section("作者信息",true)
    bin:Label("作者:条纹大地")
    bin:Label("缝合脚本")
    bin:Label("QQ:1023929190")
    
local bin = creds:section("玩家", true)
local positionLabel = bin:Label("你的位置'X: %.2f Y: %.2f Z: %.2f'")
local fpsLabel = bin:Label("当前帧率: 计算中...")
local pingLabel = bin:Label("当前 Ping: 计算中...")
local timeLabel = bin:Label("当前时间: 计算中...")
local usTimeLabel = bin:Label("美国时间: 计算中...")
local initialPlayersLabel = bin:Label("初始玩家人数: 计算中...")
local currentPlayersLabel = bin:Label("当前玩家人数: 计算中...")
local serverInfoLabel = bin:Label("服务器信息: 计算中...")
local serverNameLabel = bin:Label("服务器名字: 计算中...")
local playerCodeLabel = bin:Label("slap埃及密码: 计算中...")
local player = game.Players.LocalPlayer

-- 玩家人数代码映射表
local playerCodeMap = {
    [1] = 1118,
    [2] = 1143,
    [3] = 1168,
    [4] = 1193,
    [5] = 1218,
    [6] = 1243,
    [7] = 1268,
    [8] = 1293,
    [9] = 1318,
    [10] = 1343,
    [11] = 1368,
    [12] = 1393,
    [13] = 1418,
    [14] = 1443
}

-- 更新玩家位置显示
local function updateCoordinateDisplay()
    local function updatePosition()
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local position = humanoidRootPart.Position
                positionLabel.Text = string.format('X: %.2f Y: %.2f Z: %.2f', position.X, position.Y, position.Z)
            else
                warn("未能找到HumanoidRootPart")
            end
        end
    end

    -- 首次更新
    updatePosition()

    -- 连接CharacterAppearanceLoaded事件，在角色重生时更新
    player.CharacterAppearanceLoaded:Connect(updatePosition)

    -- 异步执行持续更新位置
    spawn(function()
        while true do
            updatePosition()
            task.wait(0)
        end
    end)
end

updateCoordinateDisplay()

-- 计算帧率（FPS）
local function updateFPS()
    local lastTick = tick()
    local frameCount = 0

    spawn(function()
        while true do
            local currentTick = tick()
            frameCount = frameCount + 1

            -- 每秒更新一次帧率
            if currentTick - lastTick >= 1 then
                local fps = math.floor(frameCount / (currentTick - lastTick))
                fpsLabel.Text = "当前帧率: " .. fps
                frameCount = 0
                lastTick = currentTick
            end

            task.wait()
        end
    end)
end

updateFPS()

-- 计算当前 Ping
local function updatePing()
    spawn(function()
        while true do
            local stats = game:GetService("Stats")
            local ping = stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            pingLabel.Text = "当前 Ping: " .. math.floor(ping) .. " ms"
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updatePing()

-- 显示当前时间（中国时间）
local function updateTime()
    spawn(function()
        while true do
            local currentTime = os.date("%Y-%m-%d %H:%M:%S") -- 格式化时间
            timeLabel.Text = "当前时间: " .. currentTime
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updateTime()

-- 显示美国时间
local function updateUSTime()
    spawn(function()
        while true do
            local usTime = os.date("!%Y-%m-%d %H:%M:%S", os.time() - 5 * 3600) -- UTC-5（美国东部时间）
            usTimeLabel.Text = "美国时间: " .. usTime
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updateUSTime()

-- 显示初始玩家人数
local function updateInitialPlayers()
    local initialPlayers = #game.Players:GetPlayers()
    initialPlayersLabel.Text = "初始玩家人数: " .. initialPlayers
end

updateInitialPlayers()

-- 显示当前玩家人数（持续更新）
local function updateCurrentPlayers()
    spawn(function()
        while true do
            local currentPlayers = #game.Players:GetPlayers()
            currentPlayersLabel.Text = "当前玩家人数: " .. currentPlayers
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updateCurrentPlayers()

-- 显示服务器信息
local function updateServerInfo()
    spawn(function()
        while true do
            local serverId = game.JobId
            serverInfoLabel.Text = "服务器信息: ID=" .. serverId
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updateServerInfo()

-- 显示服务器名字
local function updateServerName()
    spawn(function()
        while true do
            local serverName = game:GetService("ReplicatedStorage"):FindFirstChild("ServerName") -- 假设服务器名字存储在 ReplicatedStorage 中
            if serverName then
                serverNameLabel.Text = "服务器名字: " .. serverName.Value
            else
                serverNameLabel.Text = "服务器名字: 未知"
            end
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updateServerName()

-- 显示玩家人数代码（持续更新）
local function updatePlayerCode()
    spawn(function()
        while true do
            local currentPlayers = #game.Players:GetPlayers()
            local code = playerCodeMap[currentPlayers] or "未知"
            playerCodeLabel.Text = "slap埃及密码: " .. code
            task.wait(1) -- 每秒更新一次
        end
    end)
end

updatePlayerCode()
 
local creds = window:Tab("通用",'7743875962')
local credits = creds:section("内容",true)      
    credits:Slider("步行速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 1000, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)       
                          
    credits:Slider("跳跃高度", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 1000, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)
credits:Slider('设置重力（正常196.2）', 'Sliderflag', 196.2, 0.1, 1000,false, function(Value)
    game.Workspace.Gravity = Value
end)
    credits:Slider('缩放距离', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end)
    credits:Slider('视界（正常70）', 'Sliderflag', 70, 0.1, 120, false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
    end)
   

    credits:Slider(
	"最大血量",
	"",
	100,
	1,
	999999999,
	false,
	function(Value)
		game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
	end	 
)
    credits:Slider(
    "血量",
    "",
    100,
    1,
    999999999,
    false,
    function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Health = Value
    end
)
credits:Textbox("快速跑步（死后重置）建议用2", "tpwalking", "输入", function(king)
local tspeed = king
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)



    credits:Toggle("穿墙", "NoClip", false, function(NC)
  local Workspace = game:GetService("Workspace") local Players = game:GetService("Players") if NC then Clipon = true else Clipon = false end Stepped = game:GetService("RunService").Stepped:Connect(function() if not Clipon == false then for a, b in pairs(Workspace:GetChildren()) do if b.Name == Players.LocalPlayer.Name then for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end end else Stepped:Disconnect() end end)
end)
credits:Toggle("夜视", "Light", false, function(Light)
  spawn(function() while task.wait() do if Light then game.Lighting.Ambient = Color3.new(1, 1, 1) else game.Lighting.Ambient = Color3.new(0, 0, 0) end end end)
end) 
local enabled = false
local connections = {}

credits:Toggle("自动零延迟交互", "Toggle", false, function(Value)
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
end)
local autoInteract = false
local trackedPrompts = {}
local connections = {}

-- 核心检测函数
local function processPrompt(prompt)
    if not trackedPrompts[prompt] then
        trackedPrompts[prompt] = true
        
        -- 创建区域检测连接
        local conn
        conn = game:GetService("RunService").Heartbeat:Connect(function()
            if autoInteract and prompt.Enabled then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local distance = (char.HumanoidRootPart.Position - prompt.Parent.Position).Magnitude
                    if distance <= prompt.MaxActivationDistance then
                        -- 自动触发提示
                        prompt:InputHoldBegin()
                        prompt:InputHoldEnd()
                    end
                end
            end
        end)
        table.insert(connections, conn)
    end
end

credits:Toggle("智能自动交互(建议搭配立即互动)", "Toggle", false, function(value)
    autoInteract = value
    
    -- 清理旧连接
    for _, conn in pairs(connections) do
        conn:Disconnect()
    end
    trackedPrompts = {}
    connections = {}
    
    if autoInteract then
        -- 初始化检测现有提示
        for _, prompt in ipairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                processPrompt(prompt)
            end
        end
        
        -- 监听新提示
        local newPromptConn = workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("ProximityPrompt") then
                processPrompt(obj)
            end
        end)
        table.insert(connections, newPromptConn)
    end
end)
    credits:Toggle("人物显示", "RWXS", false, function(RWXS)    getgenv().enabled = RWXS getgenv().filluseteamcolor = true getgenv().outlineuseteamcolor = true getgenv().fillcolor = Color3.new(1, 0, 0) getgenv().outlinecolor = Color3.new(1, 1, 1) getgenv().filltrans = 0.5 getgenv().outlinetrans = 0.5 loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()end) 
    credits:Button("无敌可能不适用",function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
  	end) 
  	credits:Button("死亡笔记", function()   
  	 loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/dfhj/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.txt"))()end)                       credits:Button("黑洞脚本", function()                 
  	 loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/XSK/refs/heads/main/HeiDongscript.lua"))()
  	 end)                                       
   credits:Button("飞行v3",function()
  loadstring(game:HttpGet'https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt')()
end)                      
credits:Toggle('上帝模式', 'No Description', false, function(Value)
        if Value then
            local LP = game:GetService"Players".LocalPlayer
            local HRP = LP.Character.HumanoidRootPart
            local Clone = HRP:Clone()
            Clone.Parent = LP.Character
        else
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end)
credits:Button("第三人称(需手动缩放)", function()  game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic  end)
credits:Button("隐身道具", function()
  loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
end)      
credits:Button(
  "加速回血",
  function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
  end)
   credits:Toggle(
    "无限跳跃",
    "text",
    false,
    function(s)
        getgenv().InfJ = s
        game:GetService("UserInputService").JumpRequest:connect(
            function()
                if InfJ == true then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState(
                        "Jumping"
                    )
                end
            end
        )
    end
)               
credits:Button(
    "工具包",
    function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
)              
credits:Button("子弹追踪",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()
end)
credits:Button("飞车",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/63T0fkBm"))()
end)
credits:Button("吸人",function()
    loadstring(game:HttpGet("https://shz.al/~HHAKS"))()
end)                         
    credits:Button("反挂机v2",function()  loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()end)                 
    credits:Button("透视", function()  local Players = game:GetService("Players"):GetChildren() local RunService = game:GetService("RunService") local highlight = Instance.new("Highlight") highlight.Name = "Highlight" for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" end end game.Players.PlayerAdded:Connect(function(player) repeat wait() until player.Character if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = player.Character highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart") highlightClone.Name = "Highlight" end end) game.Players.PlayerRemoving:Connect(function(playerRemoved) playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy() end) RunService.Heartbeat:Connect(function() for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" task.wait() end end end)end)       
                              
    credits:Button("音乐脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%8A%A0%E7%8F%AD%20(1).lua"))()
    end)
    credits:Button("阿尔宙斯自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
    end)
    credits:Button("爬墙",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)                                                                                           
 credits:Button("立即死亡",function()
  game.Players.LocalPlayer.Character.Humanoid.Health=0
end)
    credits:Button("复制当前位置", function()
    setclipboard('game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new('..tostring(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)..'))')                       end)
    credits:Button("位置实时显示", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E4%BD%8D%E7%BD%AE%E5%AE%9E%E6%97%B6%E6%98%BE%E7%A4%BA(%E5%BD%A9%E8%89%B2%E7%89%88).lua"))()
    end)
    credits:Button("踏空行走", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end)
    credits:Button(
    "键盘⌨️",
    function()
        loadstring(
            game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true)
        )()
    end
)
    credits:Button("甩人",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)
    credits:Button("iw指令", function()  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)
    credits:Button("玩家加入游戏提示",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)
    credits:Button("撸🥵🥵🥵", function()
    loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() end)
    credits:Label("转圈")
    credits:Button(
    "旋转0",
    function()
    local speed = 0

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Button(
    "旋转10",
    function()
    local speed = 10

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Button(
    "旋转50",
    function()
    local speed = 50

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Button(
    "旋转100",
    function()
    local speed = 100

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Button(
    "旋转300",
    function()
    local speed = 300

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Button(
    "旋转500",
    function()
    local speed = 500

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)          
    credits:Label("范围")
    credits:Button(
    "范围",
    function()
        _G.HeadSize = 20
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
    end
)

credits:Button(
    "中级范围",
    function()
        _G.HeadSize = 100
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
    end
)
credits:Button(
    "高级范围",
    function()
        _G.HeadSize = 500
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
    end
)
    credits:Button("🗿🗿🗿🗿", function()
    local musicId = "rbxassetid://18103562975"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
    end)
     local creds = window:Tab("音频",'106133116600295')
local credits = creds:section("内容",true)
-- 音乐播放系统初始化
local SoundService = game:GetService("SoundService")
local currentSound
local isPaused = false

-- 播放功能
credits:Textbox("音乐播放器", "输入音乐ID", "输入音乐ID", function(Value)
    local musicID = Value:match("%d+")
    
    -- 输入验证
    if not musicID or musicID == "" then
        sendNotification("输入错误", "请输入有效的数字ID")
        return
    end
    
    -- 清理之前的音效
    cleanupSound()
    
    -- 创建新音效
    currentSound = Instance.new("Sound")
    currentSound.SoundId = "rbxassetid://"..musicID
    currentSound.Parent = SoundService
    
    -- 尝试播放
    local success, err = pcall(function()
        currentSound:Play()
        isPaused = false
    end)
    
    -- 处理结果
    if success then
        sendNotification("播放成功", "正在播放 ID: "..musicID)
    else
        handlePlayError(err)
    end
end)

-- 暂停功能
credits:Button("暂停音乐", function()
    if not currentSound then
        sendNotification("操作失败", "没有正在播放的音乐")
        return
    end
    
    if isPaused then
        sendNotification("提示", "音乐已经处于暂停状态")
        return
    end
    
    local success, err = pcall(function()
        currentSound:Pause()
        isPaused = true
    end)
    
    if success then
        sendNotification("已暂停", "点击继续按钮恢复播放")
    else
        sendNotification("暂停失败", "错误: "..tostring(err))
    end
end)

-- 继续功能
credits:Button("继续播放", function()
    if not currentSound then
        sendNotification("操作失败", "没有可继续的音乐")
        return
    end
    
    if not isPaused then
        sendNotification("提示", "音乐正在正常播放中")
        return
    end
    
    local success, err = pcall(function()
        currentSound:Resume()  -- 或者使用 currentSound:Play()
        isPaused = false
    end)
    
    if success then
        sendNotification("继续播放", "音乐已恢复")
    else
        sendNotification("继续失败", "错误: "..tostring(err))
    end
end)

-- 辅助函数
function sendNotification(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 3
    })
end

function cleanupSound()
    if currentSound then
        pcall(function()
            currentSound:Stop()
            currentSound:Destroy()
        end)
        currentSound = nil
        isPaused = false
    end
end

function handlePlayError(err)
    warn("播放失败: "..err)
    sendNotification("播放失败", "错误代码: "..tostring(err))
    cleanupSound()
end
credits:Button("彩虹瀑布",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    credits:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
local creds = window:Tab("抓包",'106133116600295')
local credits = creds:section("工具",true)
    credits:Button("spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/Spy.lua"))()
    end)
    credits:Button("Dex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
    end)
    credits:Button("nb的dex", function()
getgenv().Key = "Bash" loadstring(game:HttpGet("https://raw.githubusercontent.com/crceck123/roblox-script/main/MC_IY%20Dex.txt"))()
end)

credits:Button("redz", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/DEX-Explorer/refs/heads/main/Mobile.lua"))()
end)
credits:Button("小云 翻译dex", function()
loadstring(game:HttpGet("https://github.com/XiaoYunCN/VIP/raw/main/DexV2%20Mobile", true))()
end)
local creds = window:Tab("传送", '106133116600295')
local credits = creds:section("传送功能", true)
getgenv().ED_AntiKick = {
    Enabled = true,
    SendNotifications = true,
    CheckCaller = true
}
local dropdown = {}
local playernamedied = ""
local teleportConnection
local selectedDirection = ""
local totalOffset = 0

for i, player in pairs(game.Players:GetPlayers()) do
    dropdown[i] = player.Name
end

function Notify(top, text, ico, dur)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = top,
        Text = text,
        Icon = ico,
        Duration = dur,
    })
end

credits:Dropdown("选择玩家", 'Dropdown', dropdown, function(v)
    playernamedied = v
end)

game.Players.ChildAdded:Connect(function(player)
    dropdown[player.UserId] = player.Name
    dropdown[#dropdown + 1] = player.Name
end)

game.Players.ChildRemoved:Connect(function(player)
    for k, v in pairs(dropdown) do
        if v == player.Name then
            dropdown[k] = nil
        end
    end
end)

local directionDropdown = {
    "上面",
    "下面",
    "左边",
    "右边",
    "前面",
    "后面",
    "中间"
}

credits:Dropdown("选择方向", 'DirectionDropdown', directionDropdown, function(v)
    selectedDirection = v
    print("选择的方向: ", selectedDirection)
end)

-- 总的偏移量输入框
credits:Textbox("总偏移量", 'TotalOffsetTextBox', "0", function(value)
    totalOffset = tonumber(value) or 0
end)

local function getDirectionOffset(direction)
    local offset = Vector3.new()
    if direction == "上面" then
        offset = Vector3.new(0, totalOffset, 0)
    elseif direction == "下面" then
        offset = Vector3.new(0, -totalOffset, 0)
    elseif direction == "左边" then
        offset = Vector3.new(-totalOffset, 0, 0)
    elseif direction == "右边" then
        offset = Vector3.new(totalOffset, 0, 0)
    elseif direction == "前面" then
        offset = Vector3.new(0, 0, totalOffset)
    elseif direction == "后面" then
        offset = Vector3.new(0, 0, -totalOffset)
    elseif direction == "中间" then
        offset = Vector3.new(0, 0, 0)
    end
    return offset
end

-- 优化后的“传送到玩家旁边一次”按钮功能
credits:Button("传送到玩家旁边一次", function()
    local localPlayer = game.Players.LocalPlayer
    if not localPlayer then
        Notify("提示", "本地玩家对象不存在", "rbxassetid://", 5)
        return
    end
    local localCharacter = localPlayer.Character
    if not localCharacter then
        Notify("提示", "本地玩家角色未加载", "rbxassetid://", 5)
        return
    end
    local HumRoot = localCharacter.HumanoidRootPart
    if not HumRoot then
        Notify("提示", "本地玩家角色的HumanoidRootPart不存在", "rbxassetid://", 5)
        return
    end
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if not tp_player then
        Notify("提示", "目标玩家不存在", "rbxassetid://", 5)
        return
    end
    local targetCharacter = tp_player.Character
    if not targetCharacter then
        Notify("提示", "目标玩家角色未加载", "rbxassetid://", 5)
        return
    end
    local targetHumanoidRootPart = targetCharacter.HumanoidRootPart
    if not targetHumanoidRootPart then
        Notify("提示", "目标玩家角色的HumanoidRootPart不存在", "rbxassetid://", 5)
        return
    end
    local offset = getDirectionOffset(selectedDirection)
    HumRoot.CFrame = targetHumanoidRootPart.CFrame + offset
    Notify("提示", "成功", "rbxassetid://", 5)
end)

-- 优化后的“把玩家传送过来”按钮功能
credits:Button("把玩家传送过来", function()
    local localPlayer = game.Players.LocalPlayer
    if not localPlayer then
        Notify("提示", "本地玩家对象不存在", "rbxassetid://", 5)
        return
    end
    local localCharacter = localPlayer.Character
    if not localCharacter then
        Notify("提示", "本地玩家角色未加载", "rbxassetid://", 5)
        return
    end
    local HumRoot = localCharacter.HumanoidRootPart
    if not HumRoot then
        Notify("提示", "本地玩家角色的HumanoidRootPart不存在", "rbxassetid://", 5)
        return
    end
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if not tp_player then
        Notify("提示", "目标玩家不存在", "rbxassetid://", 5)
        return
    end
    local targetCharacter = tp_player.Character
    if not targetCharacter then
        Notify("提示", "目标玩家角色未加载", "rbxassetid://", 5)
        return
    end
    local targetHumanoidRootPart = targetCharacter.HumanoidRootPart
    if not targetHumanoidRootPart then
        Notify("提示", "目标玩家角色的HumanoidRootPart不存在", "rbxassetid://", 5)
        return
    end
    local offset = getDirectionOffset(selectedDirection)
    targetHumanoidRootPart.CFrame = HumRoot.CFrame + offset
    Notify("提示", "已传送过来", "rbxassetid://", 5)
end)

credits:Toggle("查看玩家", 'Toggleflag', false, function(state)
    if state then
        local targetPlayer = game.Players:FindFirstChild(playernamedied)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character.Humanoid then
            game:GetService('Workspace').CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
            Notify("提示", "已查看", "rbxassetid://", 5)
        else
            Notify("提示", "目标玩家或其角色不可用", "rbxassetid://", 5)
        end
    else
        Notify("提示", "已关闭", "rbxassetid://", 5)
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character.Humanoid then
            game:GetService('Workspace').CurrentCamera.CameraSubject = lp.Character.Humanoid
        end
    end
end)

credits:Toggle("循环传送玩家", "Toggle", false, function(Value)
    if Value then
        local localPlayer = game.Players.LocalPlayer
        if not localPlayer then
            Notify("提示", "本地玩家对象不存在", "rbxassetid://", 5)
            return
        end
        local localCharacter = localPlayer.Character
        if not localCharacter then
            Notify("提示", "本地玩家角色未加载", "rbxassetid://", 5)
            return
        end
        local targetPlayer = game.Players:FindFirstChild(playernamedied)
        if not targetPlayer then
            Notify("提示", "目标玩家不存在", "rbxassetid://", 5)
            return
        end
        local targetCharacter = targetPlayer.Character
        if not targetCharacter then
            Notify("提示", "目标玩家角色未加载", "rbxassetid://", 5)
            return
        end
        local function doTeleport()
            local HumRoot = localCharacter.HumanoidRootPart
            local tp_player = targetCharacter.HumanoidRootPart
            local offset = getDirectionOffset(selectedDirection)
            HumRoot.CFrame = tp_player.CFrame + offset
        end

        local RunService = game:GetService("RunService")
        local teleportTimer = 0
        local teleportInterval = 0.01
        teleportConnection = RunService.Heartbeat:Connect(function(dt)
            teleportTimer = teleportTimer + dt
            if teleportTimer >= teleportInterval then
                doTeleport()
                teleportTimer = 0
            end
        end)

    else
        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
        end
        Notify("提示", "已停止循环传送玩家", "rbxassetid://", 5)
    end
end)
 local creds = window:Tab("骨折模拟器",'106133116600295')
local credits = creds:section("传送(人物往下坠时使用)",true)
credits:Button("传送到1万米高空", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(2415.21875, 10000.1722717285156, 804.8123779296875))
end)
credits:Button("传送到2万米高空", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(2415.21875, 20000.1722717285156, 804.8123779296875))
end)
credits:Button("传送到3万米高空", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(2415.21875, 30000.1722717285156, 804.8123779296875))
end)
credits:Button("传送到4万米高空", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(2415.21875, 40000.1722717285156, 804.8123779296875))
end)
credits:Button("传送到5万米高空", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(2415.21875, 50000.1722717285156, 804.8123779296875))
end)
local creds = window:Tab("伐木大亨2",'106133116600295')
local credits = creds:section("伐木大亨",true)
  credits:Button("LuaWareL", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
   end)
   credits:Button("伐木大亨脚本", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
   end)
   local creds = window:Tab("Doors",'106133116600295')
local credits = creds:section("Doors脚本",true)
    credits:Button("BoBHub汉化", function()
 loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
    end)
     local credits = creds:section("Doors通用",true)
     credits:Toggle("刷新时通知", "TZ", false, function(TZ)     _G.IE = (TZ and true or false) LatestRoom.Changed:Connect(function() if _G.IE == true then local n = ChaseStart.Value - LatestRoom.Value if 0 < n and n < 4 then Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) end end end) workspace.ChildAdded:Connect(function(inst) if inst.Name == "RushMoving" and _G.IE == true then Notify("请注意", "Rush大爹来了","rbxassetid://17360377302",3) elseif inst.Name == "AmbushMoving" and _G.IE == true then Notify("请注意", "Ambush大爹来了","rbxassetid://17360377302",3) end end)end)
    credits:Button("Doors硬核模式(仅自己可见)", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\104\117\121\104\111\97\110\112\104\117\99\47\103\102\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\104\99\104\102\99\103\100\99\121\102\103\102\34\41\41\40\41")()
    end)
    local creds = window:Tab("巴掌",'106133116600295')
    local credits = creds:section("巴掌脚本",false)
    credits:Button("巴掌", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/Dusty1234567890/NewGloves/refs/heads/main/Clock')()
    end)
    credits:Button("刷终极bob", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Rob/main/Rob"))()
    end)
    credits:Button("刷可爱的向导😭", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E8%87%AA%E5%8A%A8%E6%89%93%E5%90%91%E5%AF%BC%E6%B1%89%E5%8C%96.lua"))()
    end)
    credits:Button("国外巴掌超级好用", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
    end)
    credits:Button("国外巴掌可以刷巴掌", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/FREE-LIMITED-Slap-Battles-VINQ-Royale-ROYALE-25956"))()
    end)
    credits:Button("自动老鼠", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E8%87%AA%E5%8A%A8%E6%89%93%E8%80%81%E9%BC%A0.lua"))() end)
    local bin = creds:section("遗忘之地答案",false)
    bin:Label("How old is your account in day?")
    bin:Label("回答你加入roblox时间多久")
    bin:Label("What is the badge name for the Glitch glove?")
    bin:Label("010100100101010101001110")
    bin:Label("Did you forget that you repressed your memories?")
    bin:Label("是")
    bin:Label("What glove has exactly 9750 slap requirements to unlock ?")
    bin:Label("线圈")
    bin:Label("How many players were present in this server when you were sent here?")
    bin:Label("回答你进来是服务器有多少人包括你")
    bin:Label("What colour is your name in the Roblox chat?")
    bin:Label("你聊天框友发言的颜色")
    bin:Label("When was Slap Battles first published to Roblox?")
    bin:Label("16/2/2021")
    bin:Label("Simon Says Riddle me this and speak it out. What has a bottom at the top?")
    bin:Label(" A leg (在聊天栏里输入)")
    bin:Label("simon says jump off the map to collect your reward.")
    bin:Label("直接跳虚空")
    bin:Label("Do you know who I am?")
    bin:Label("A forgotten memory")
    bin:Label("We'll play simon says at the end. Do you understand ?")
    bin:Label("是")
    bin:Label("Whom ultimately controls this realm?")
    bin:Label("Tencell")
    bin:Label("How many gloves stands are in Slap Battles right now?")
    bin:Label("目前的手套数，现在213")
    bin:Label("1=3, 2=3, 3=5,4=4,5=4, what does 6=?")
    bin:Label("3")
    bin:Label("What is the chance of getting bob from")
    bin:Label("1/7500")
    bin:Label("How many slaps do you have?")
    bin:Label("你的耳光数量")
    bin:Label("hat glove can't you hit when it isin't there?")
    bin:Label("elude")       
  local credits = creds:section("传送",false)
  credits:Button("出生点", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-904.4163208007812, 328.17510986328125, -5.1554718017578125)end)
  credits:Button("默认巴掌竞技场", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.99984741210938, 359.9842224121094, -21.03009605407715)end)
  credits:Button("巴掌竞技场", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10.45071792602539, -5.172852039337158, 22.651708602905273)end)
  credits:Button("云朵岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-121.70960998535156, -4.560846328735352, 119.67999267578125)end)
  credits:Button("锁链上", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(122.4448013305664, 255.3001251220703, 2.022616386413574) end)
  credits:Button("城堡", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(255.76210021972656, 33.68462371826172, 193.67286682128906) end)
  credits:Button("水果岛大树上", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-426.56439208984375, 107.91242218017578, -23.84156036376953)end)
  credits:Button("水果岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-390.4613342285156, 50.764225006103516, -12.147822380065918)end)
  credits:Button("水果岛小树里面", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-357.81512451171875, 67.47888946533203, 12.336100578308105) end)
  credits:Button("迷宫", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(235.1599884033203, -15.716064453125, -3.7118053436279297) end)
   local credits = creds:section("梦之境",false)
   credits:Button(",黑暗小球", function()
   game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(68.31228637695312, 3.5756828784942627, 124.31849670410156))
   end)
   credits:Button("终点", function()
   game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(58.005775451660156, 44.20683670043945, 175.5221710205078))
   end)
   local creds = window:Tab("巴掌2",'106133116600295')
    local credits = creds:section("防",false)
    credits:Toggle("反板砖","Toggle", false, function(Value)
AntiBrick = Value
while AntiBrick do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Union" then
                        v.CanTouch = false
                    end
                end
task.wait()
end
end)
credits:Toggle("防踢","Toggle", false, function(Value)
AntiKick = Value
while AntiKick do
for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
AK:Set(false)
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
task.wait()
end
end)
credits:Toggle("防击飞","Toggle", false, function(Value)
AntiRagdoll = Value
if AntiRagdoll then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.CharacterAdded:Connect(function()
game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
game.Players.LocalPlayer.Character.Torso.Anchored = false
end
end)
end)
end
end)
    credits:Toggle("反Null","Toggle", false, function(Value)
AntiNull = Value
while AntiNull do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
end
end
task.wait()
end
end)
credits:Toggle("反上帝技能","Toggle", false, function(Value)
AntiTimestop = Value
while AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
task.wait()
end
end)

credits:Toggle("反鱿鱼","Toggle", false, function(Value)
AntiSquid = Value
if AntiSquid == false then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
        end
while AntiSquid do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
end
task.wait()
end
end)

credits:Toggle("反神圣杰克","Toggle", false, function(Value)
game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
end)

credits:Toggle("反传送带","Toggle", false, function(Value)
game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
end)
credits:Toggle("反虚空(锦标赛也有效果)","Toggle", false, function(Value)
game.Workspace.dedBarrier.CanCollide = Value
game.Workspace.TAntiVoid.CanCollide = Value
end)
credits:Toggle("防死亡屏障","Toggle", false, function(Value)
if Value == true then
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = false
                    end
                end
workspace.DEATHBARRIER.CanTouch = false
workspace.DEATHBARRIER2.CanTouch = false
workspace.dedBarrier.CanTouch = false
workspace.ArenaBarrier.CanTouch = false
workspace.AntiDefaultArena.CanTouch = false
else
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = true
                    end
                end
workspace.DEATHBARRIER.CanTouch = true
workspace.DEATHBARRIER2.CanTouch = true
workspace.dedBarrier.CanTouch = true
workspace.ArenaBarrier.CanTouch = true
workspace.AntiDefaultArena.CanTouch = true
end
end)

credits:Toggle("反巴西","Toggle", false, function(Value)
if Value == true then
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = false
                end
else
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = true
                end
end
end)

credits:Toggle("反死亡方块","Toggle", false, function(Value)
if Value == true then
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end
end)

    local credits = creds:section("自动",false)
    credits:Toggle("自动刷砖块","Toggle", false, function(Value)
ReplicaFarm = Value
while ReplicaFarm do
for i, v in pairs(workspace:GetChildren()) do
                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                end
            end
task.wait()
game:GetService("ReplicatedStorage").lbrick:FireServer()
task.wait(4)
end
end)
credits:Toggle("自动刷bob","Toggle", false, function(Value)
ReplicaFarm = Value
while ReplicaFarm do
for i, v in pairs(workspace:GetChildren()) do
                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                end
            end
task.wait()
game:GetService("ReplicatedStorage").Duplicate:FireServer()
task.wait(7)
end
end)
credits:Button("自动刷bob快速(配上上帝效果更好)",function(Value)
ReplicaFarm = Value
while ReplicaFarm do
for i, v in pairs(workspace:GetChildren()) do
                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                end
            end
task.wait()
game:GetService("ReplicatedStorage").Duplicate:FireServer()
task.wait()
end
end)
credits:Toggle("一下加10个枕头","Toggle",false, function(Value)
zidongzhengtou = Value
while zidongzhengtou do
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer(unpack(args))
task.wait(0.2)
end
end)
credits:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
Jetfarm = Value
while Jetfarm do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
task.wait()
end
end)
credits:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
SlappleFarm = Value
while SlappleFarm do
for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
task.wait()
end
end)
credits:Toggle("自动捡相位球","Toggle", false, function(Value)
Phasefarm = Value
while Phasefarm do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
task.wait()
end
end)
credits:Toggle("自动捡糖果","Toggle",false, function(Value)
CandyCornFarm = Value
while CandyCornFarm do
for i, v in pairs(workspace.CandyCorns:GetChildren()) do
                if v:FindFirstChildWhichIsA("TouchTransmitter") then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
task.wait()
end
end)

credits:Toggle("获取炼金术师材料","Toggle", false, function(Value)
AlchemistIngredients = Value
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
while AlchemistIngredients do
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
task.wait()
end
end
end)

credits:Toggle("自动加入竞技场","Toggle", false, function(Value)
AutoEnterArena = Value
while AutoEnterArena do
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
    end
task.wait()
end
end)

credits:Toggle("自动光波球","Toggle", false, function(Value)
if Person == nil then
Person = game.Players.LocalPlayer.Name
end
_G.RojoSpam = Value
while _G.RojoSpam do
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
task.wait()
end
end)

 local credits = creds:section("杂项",false)
 credits:Button("获取计数器手套", function()
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(121)
for i,v in pairs(workspace.Maze:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end)

credits:Toggle("地牢亮度","Toggle" ,false, function(Value)
 Light = Value
    if not Light then
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

credits:Toggle("无限反转","Toggle", false, function(Value)
_G.InfReverse = Value
while _G.InfReverse do
game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
wait(6)
end
end)

credits:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
_G.Rainbow = Value
while _G.Rainbow do
for i = 0,1,0.001*25 do
game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
task.wait()
end
end
end)
 local creds = window:Tab("力量传奇",'106133116600295')
 local credits = creds:section("力量传奇脚本",false)    
 credits:Button("力量传奇",function()    loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()end)
 
 local credits = creds:section("宝箱传送",false)
 credits:Button("群组宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41.69497299194336, 3.6662418842315674, 408.0653991699219) 
 end)
 credits:Button("金色宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-139.77784729003906, 3.6662497520446777, -278.7207946777344) 
 end)
 credits:Button("冰霜宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2573.37939453125, 3.6662492752075195, -550.3751831054688) 
 end)
 credits:Button("神话宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2216.820068359375, 3.6662495136260986, 913.1431884765625)
 end)
 credits:Button("永恒宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6709.8916015625, 3.6662497520446777, -1461.99169921875)
 end)
 credits:Button("传说宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4665.52197265625, 997.3848876953125, -3698.990234375)
 end)
 credits:Button("丛林宝箱", function()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7904.09326171875, 0.6366544365882874, 2996.31298828125)
 end)
 
 local credits = creds:section("健身房传送",false)
 credits:Button("传送到出生点", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
end)

credits:Button("传送到冰霜健身房", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
end)
 
credits:Button("传送到神话健身房", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
end)
 
credits:Button("传送到永恒健身房", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
end)
 
credits:Button("传送到传说健身房", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
end)
 
credits:Button("传送到肌肉之王健身房", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
end)
 
credits:Button("传送到安全岛", function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
end)
credits:Button("丛林岛", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8793.79296875, 23.214065551757812, 2391.373046875)
end)
 local creds = window:Tab("GB",'106133116600295')local credits = creds:section("内容",true)
 credits:Button("内脏与黑火药脚本", function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()end)
 credits:Button("清风GB", function()
 local SCC_CharPool={[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,55,116,67,82,116,117,109})end)()))} end)
 credits:Button("老大版", function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")() end)
 local creds = window:Tab("压力",'106133116600295')
local credits = creds:section("内容",true)
credits:Button("压力情云", function()
loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
end)
 local creds = window:Tab("死铁轨（全力开发中）",'106133116600295')
local credits = creds:section("更改数值",true)
-- 直接修改自己的 Wins
credits:Textbox("赢得胜场", "输入数字", "0", function(Value)
    game:GetService("Players").LocalPlayer.leaderstats.Wins.Value = tonumber(Value) or 0
end)


local weldingButton
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://3848738542"
clickSound.Volume = 0.5

-- 改进后的提示函数
local function showPrompt(message)
    local tweenService = game:GetService("TweenService")
    
    -- 创建提示GUI
    local promptGui = Instance.new("ScreenGui")
    promptGui.Name = "PromptGUI"
    promptGui.ResetOnSpawn = false
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 40)
    mainFrame.Position = UDim2.new(0.5, 0, 1, -50) -- 初始位置在屏幕底部外
    mainFrame.AnchorPoint = Vector2.new(0.5, 1)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BackgroundTransparency = 1 -- 初始完全透明
    mainFrame.ClipsDescendants = true

    -- 圆角效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = mainFrame

    -- 文字标签
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Text = message
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.GothamMedium
    textLabel.Parent = mainFrame

    mainFrame.Parent = promptGui
    promptGui.Parent = game:GetService("CoreGui")

    -- 淡入动画
    local fadeIn = tweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0.5,
            Position = UDim2.new(0.5, 0, 1, -60) -- 上移显示
        }
    )
    
    -- 淡出动画
    local fadeOut = tweenService:Create(
        mainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 1, -30)
        }
    )

    -- 动画序列
    fadeIn:Play()
    fadeIn.Completed:Wait()
    wait(2.4) -- 保持显示时间
    fadeOut:Play()
    fadeOut.Completed:Connect(function()
        promptGui:Destroy()
    end)
end

credits:Button("创建焊接按钮", function()
    if weldingButton then weldingButton:Destroy() end

    -- 创建按钮
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WeldingButtonGUI"
    screenGui.ResetOnSpawn = false
    
    weldingButton = Instance.new("TextButton")
    weldingButton.Size = UDim2.new(0, 120, 0, 40)
    weldingButton.Position = UDim2.new(1, -10, 0.5, -20)
    weldingButton.AnchorPoint = Vector2.new(1, 0.5)
    weldingButton.BackgroundColor3 = Color3.new(1, 1, 1)
    weldingButton.BackgroundTransparency = 0.8
    weldingButton.Text = "焊接按钮"
    weldingButton.TextColor3 = Color3.new(1, 1, 1)
    weldingButton.TextSize = 16
    
    -- 圆角效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.3, 0)
    corner.Parent = weldingButton

    -- 点击事件
    weldingButton.MouseButton1Click:Connect(function()
        clickSound:Play()
        showPrompt("焊接成功")
        
        local args = {
            [1] = workspace:WaitForChild("RuntimeItems"):WaitForChild("GoldBar"),
            [2] = workspace:WaitForChild("Train"):WaitForChild("Platform"):WaitForChild("Part")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("RequestWeld"):FireServer(unpack(args))
    end)

    weldingButton.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui")
end)

credits:Button("删除焊接按钮", function()
    if weldingButton then
        weldingButton.Parent:Destroy()
        weldingButton = nil
    end
end)

clickSound.Parent = game:GetService("SoundService")


-- 配置参数（已修改为3x3x3）
local TARGET_SIZE = Vector3.new(3, 3, 3)  -- 调整为3倍
local POSITION_OFFSET = 1.2               -- 同步缩小位置偏移量
local ZOMBIE_TYPES = { "Runner", "Walker" }
local originalSizes = {}
local isActive = false

-- 增强版头部检测
local function findZombieHeads()
    local heads = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Head" and obj:IsA("BasePart") then
            local parentName = obj.Parent.Name:lower()
            if parentName:find("runner") or parentName:find("walker") then
                table.insert(heads, obj)
            end
        end
    end
    return heads
end

-- 智能缩放控制（优化位置补偿）
local function scaleHeads(scale)
    for head, data in pairs(originalSizes) do
        if head and head.Parent then
            head.Size = scale and TARGET_SIZE or data.size
            head.CFrame = scale and data.cframe * CFrame.new(0, POSITION_OFFSET, 0) or data.cframe
        else
            originalSizes[head] = nil
        end
    end
end

credits:Toggle("放大头部", "Toggle", false, function(state)
    isActive = state
    
    if state then
        -- 初始扫描
        local heads = findZombieHeads()
        for _, head in ipairs(heads) do
            if not originalSizes[head] then
                originalSizes[head] = {
                    size = head.Size,
                    cframe = head.CFrame
                }
                head.Size = TARGET_SIZE
                head.CFrame = head.CFrame * CFrame.new(0, POSITION_OFFSET, 0)  -- 调整后的偏移量
            end
        end
        
        -- 持续检测
        coroutine.wrap(function()
            while isActive do
                local newHeads = findZombieHeads()
                for _, head in ipairs(newHeads) do
                    if not originalSizes[head] then
                        originalSizes[head] = {
                            size = head.Size,
                            cframe = head.CFrame
                        }
                        head.Size = TARGET_SIZE
                        head.CFrame = head.CFrame * CFrame.new(0, POSITION_OFFSET, 0)
                    end
                end
                task.wait(0.3)
            end
        end)()
    else
        scaleHeads(false)
        originalSizes = {}
    end
end)
local credits = creds:section("透视",true)

-- 配置参数
local HIGHLIGHT_COLOR = Color3.new(0.8, 0.2, 0.2)
local HIGHLIGHT_TRANSPARENCY = 0.5
local SCAN_INTERVAL = 0.1  -- 更短的检测间隔

-- 状态管理
local trackedBanks = {}
local activeCoroutine = nil  -- 协程引用
local isActive = false

-- 增强版银行检测
local function deepScan()
    local found = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("Model") and obj.Name:lower():find("bank") then
                table.insert(found, obj)
            end
            scan(obj)  -- 递归搜索
        end
    end
    scan(workspace)
    scan(game:GetService("ReplicatedStorage"))
    return found
end

-- 即时创建高亮
local function createInstantHighlight(bank)
    if not trackedBanks[bank] then
        local highlight = Instance.new("Highlight")
        highlight.Name = "InstantBankHighlight"
        highlight.FillColor = HIGHLIGHT_COLOR
        highlight.OutlineColor = HIGHLIGHT_COLOR
        highlight.FillTransparency = HIGHLIGHT_TRANSPARENCY
        highlight.OutlineTransparency = HIGHLIGHT_TRANSPARENCY
        highlight.Adornee = bank
        highlight.Parent = bank
        
        trackedBanks[bank] = {
            instance = highlight,
            connection = bank.AncestryChanged:Connect(function()
                highlight:Destroy()
                trackedBanks[bank] = nil
            end)
        }
    end
end

-- 主控制逻辑
credits:Toggle("启用银行高亮", "toggle_esp", false, function(state)
    isActive = state
    
    if state then
        -- 立即执行首次扫描
        for _, bank in ipairs(deepScan()) do
            createInstantHighlight(bank)
        end
        
        -- 启动优化循环
        activeCoroutine = coroutine.create(function()
            while isActive do
                -- 清理无效实例
                for bank, data in pairs(trackedBanks) do
                    if not bank:IsDescendantOf(game) then
                        data.instance:Destroy()
                        data.connection:Disconnect()
                        trackedBanks[bank] = nil
                    end
                end
                
                -- 增量检测
                for _, bank in ipairs(deepScan()) do
                    if not trackedBanks[bank] then
                        createInstantHighlight(bank)
                    end
                end
                
                task.wait(SCAN_INTERVAL)
            end
        end)
        coroutine.resume(activeCoroutine)
    else
        -- 强制终止循环
        if activeCoroutine and coroutine.status(activeCoroutine) == "running" then
            coroutine.close(activeCoroutine)
        end
        
        -- 立即清理所有实例
        for bank, data in pairs(trackedBanks) do
            data.instance:Destroy()
            data.connection:Disconnect()
        end
        trackedBanks = {}
    end
end)
local weldingButton
local clickSound = Instance.new("Sound")
clickSound.SoundId = ""
clickSound.Volume = 0.5

-- 改进后的提示函数
local function showPrompt(message)
    local tweenService = game:GetService("TweenService")
    
    -- 创建提示GUI
    local promptGui = Instance.new("ScreenGui")
    promptGui.Name = "PromptGUI"
    promptGui.ResetOnSpawn = false
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 40)
    mainFrame.Position = UDim2.new(0.5, 0, 0.7, 20) -- 初始在中心下方偏移位置
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BackgroundTransparency = 1 -- 初始完全透明
    mainFrame.ClipsDescendants = true

    -- 圆角效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = mainFrame

    -- 文字标签
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Text = message
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.GothamMedium
    textLabel.Parent = mainFrame

    mainFrame.Parent = promptGui
    promptGui.Parent = game:GetService("CoreGui")

    -- 淡入动画
    local fadeIn = tweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 0.5,
            Position = UDim2.new(0.5, 0, 0.7, 0) -- 最终位于屏幕中心正下方
        }
    )
    
    -- 淡出动画
    local fadeOut = tweenService:Create(
        mainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad),
        {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.7, 40)
        }
    )

    -- 动画序列
    fadeIn:Play()
    fadeIn.Completed:Wait()
    wait(2.4)
    fadeOut:Play()
    fadeOut.Completed:Connect(function()
        promptGui:Destroy()
    end)
end

credits:Button("创建焊接按钮", function()
    if weldingButton then weldingButton:Destroy() end

    -- 创建按钮
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WeldingButtonGUI"
    screenGui.ResetOnSpawn = false
    
    weldingButton = Instance.new("TextButton")
    weldingButton.Size = UDim2.new(0, 120, 0, 40)
    weldingButton.Position = UDim2.new(1, 0, 0.5, -20)
    weldingButton.AnchorPoint = Vector2.new(1, 0.5)
    weldingButton.BackgroundColor3 = Color3.new(1, 1, 1)
    weldingButton.BackgroundTransparency = 0.8
    weldingButton.Text = "焊接按钮"
    weldingButton.TextColor3 = Color3.new(1, 1, 1)
    weldingButton.TextSize = 16
    
    -- 圆角效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.3, 0)
    corner.Parent = weldingButton

    -- 点击事件
    weldingButton.MouseButton1Click:Connect(function()
        clickSound:Play()
        showPrompt("焊接成功")
        
        local args = {
            [1] = workspace:WaitForChild("RuntimeItems"):WaitForChild("GoldBar"),
            [2] = workspace:WaitForChild("Train"):WaitForChild("Platform"):WaitForChild("Part")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("RequestWeld"):FireServer(unpack(args))
    end)

    weldingButton.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui")
end)

credits:Button("删除焊接按钮", function()
    if weldingButton then
        weldingButton.Parent:Destroy()
        weldingButton = nil
    end
end)

clickSound.Parent = game:GetService("SoundService")
 local creds = window:Tab("愚蠢的boss战",'106133116600295')
local credits = creds:section("内容",true)
credits:Toggle("重复选择地图1", "Toggle", false,function(Value)
Tui = Value
while Tui do
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Voting"):WaitForChild("AddVote"):FireServer(unpack(args))

task.wait(0.1)
end
end)
credits:Toggle("重复选择地图2", "Toggle", false,function(Value)
Tui2 = Value
while Tui2 do
local args = {
    [1] = 2
}

game:GetService("ReplicatedStorage"):WaitForChild("Voting"):WaitForChild("AddVote"):FireServer(unpack(args))

task.wait(0.1)
end
end)
credits:Toggle("重复选择地图3", "Toggle", false,function(Value)
Tui3 = Value
while Tui3 do
local args = {
    [1] = 3
}

game:GetService("ReplicatedStorage"):WaitForChild("Voting"):WaitForChild("AddVote"):FireServer(unpack(args))

task.wait(0.1)
end
end)
credits:Button("自动拿剑", function()
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-277.4253234863281, -190.99954223632812, 4584.76025390625))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(0.6678761839866638, 385.0029602050781, 4068.994384765625))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(281.1895751953125, -231.7993621826172, 4485.98681640625))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-83.74762725830078, -1.400247573852539, 4696.58935546875))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-314.7559814453125, 95.80094146728516, 4214.927734375))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-556.3639526367188, 137.80137634277344, 4439.85791015625))
wait(0.5)
game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(98.12287902832031, -30.200422286987305, 4419.1708984375))
end)
 local creds = window:Tab("穷小子打工记",'106133116600295')
local credits = creds:section("内容",true)
-- 传送系统配置
local teleportPoints = {
    ["矿物售卖点"] = Vector3.new(-41.5818, 3.5000, 25.7670),
    ["饭盒售卖点"] = Vector3.new(-190.9192, 3.9995, -52.3112),
    ["矿洞(顶部)"] = Vector3.new(-66.3164, 3.5000, 56.8189),
    ["矿洞(深处)"] = Vector3.new(61.1772, -108.1145, -119.4801),
    ["买稿子处"] = Vector3.new(-69.0856, 4.0000, 31.4245),
    ["小区"] = Vector3.new(76.5418, 4.0000, -65.5413),
    ["蜜雪冰城"] = Vector3.new(190.7056, 3.5000, 14.7399),
    ["买车处"] = Vector3.new(227.7959, 3.5000, 19.9525),
    ["买水果处"] = Vector3.new(250.1062, 3.5000, 19.7398),
    ["小吃街"] = Vector3.new(87.2112, 3.5000, 48.0347)
}

local selectedPoint = nil  -- 存储当前选择的坐标

-- 创建下拉菜单
credits:Dropdown("设置传送位置", "请选择目标点", 
    {"矿物售卖点", "饭盒售卖点", "矿洞(顶部)", "矿洞(深处)", "买稿子处", 
     "小区", "蜜雪冰城", "买车处", "买水果处", "小吃街"}, 
    function(selected)
        selectedPoint = teleportPoints[selected]
        print("已选择:", selected)
    end)

-- 添加独立传送按钮
credits:Button("确认传送", function()
    if selectedPoint then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character:MoveTo(selectedPoint)
            library:Notification("传送成功", "已到达："..tostring(selectedPoint))
        end
    else
        library:Notification("传送失败", "请先选择目标位置！")
    end
end)
credits:Textbox("输入绿宝石","Textbox","0", function(Value)
Zhidinyi = Value   
 end)
credits:Toggle("执行无限绿宝石(娱乐)", "Toggle", false,function(Value)
lubaoshi = Value
while lubaoshi do
game.Players.LocalPlayer.leaderstats.Emerald.Value = Zhidinyi
task.wait(0.0001)
end
end)
 Notification:Notify( 
     {Title = "提示", Description = "已全部加载好"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 3, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
  local musicId = "rbxassetid://3848738542"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
    