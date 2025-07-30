print("done")
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
Title = "条脚本v2",
Icon = "rbxassetid://129260712070622",
Size = UDim2.fromOffset(400, 300),
Theme = "Dark"
})
local Player = Window:Tab({
Title = "玩家",
Icon = "user"
})

local FPS = Window:Tab({
Title = "FPS/透视",
Icon = "eye"
})
local TS Window:Tab({
Tittle = "怪物提示",
Icon = "eye"
})
Player:Slider({
Title = "移动速度",
Desc = "调整角色移动速度",
Value = {
Min = 0,
Max = 100,
Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
},
Callback = function(Speed)

   spawn(function()
   while task.wait() do
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
   end
   end)

end
})


local nightVisionConn = nil
Player:Toggle({
Title = "夜视",
Value = false,
Callback = function(Value)
if nightVisionConn then
nightVisionConn:Disconnect()
nightVisionConn = nil
end

if Value then
nightVisionConn = game:GetService("RunService").Heartbeat:Connect(function()
game.Lighting.Ambient = Color3.new(1, 1, 1)
end)
else
game.Lighting.Ambient = Color3.new(0, 0, 0)
end
end
})

local enabled = false
local connections = {}
Player:Toggle({
Title = "快速互动",
Value = false,
Callback = function(Value)
enabled = Value

for _, conn in pairs(connections) do
conn:Disconnect()
end
connections = {}

if enabled then
local function processPrompt(prompt)
prompt.HoldDuration = 0
prompt.Enabled = true

local conn = prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
if prompt.HoldDuration ~= 0 then
prompt.HoldDuration = 0
end
end)
table.insert(connections, conn)
end

for _, prompt in ipairs(workspace:GetDescendants()) do
if prompt:IsA("ProximityPrompt") then
processPrompt(prompt)
end
end

local newPromptConn = workspace.DescendantAdded:Connect(function(descendant)
if descendant:IsA("ProximityPrompt") then
processPrompt(descendant)
end
end)
table.insert(connections, newPromptConn)
end
end
})
local doorESPEnabled = false
local doorHighlightConnections = {}

-- 创建基础高亮实例
local baseHighlight = Instance.new("Highlight")
baseHighlight.Name = "DoorHighlight"
baseHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
baseHighlight.FillTransparency = 1
baseHighlight.OutlineTransparency = 0
baseHighlight.OutlineColor = Color3.new(1, 1, 0) -- 黄色边框

-- 创建基础文字标签模板
local baseBillboard = Instance.new("BillboardGui")
baseBillboard.Name = "RoomLabel"
baseBillboard.Size = UDim2.new(0, 60, 0, 30)
baseBillboard.AlwaysOnTop = true
baseBillboard.ExtentsOffset = Vector3.new(0, 2, 0)

local baseLabel = Instance.new("TextLabel")
baseLabel.Parent = baseBillboard
baseLabel.Size = UDim2.new(1, 0, 1, 0)
baseLabel.BackgroundTransparency = 1
baseLabel.TextScaled = true
baseLabel.TextColor3 = Color3.new(1, 1, 0)
baseLabel.Font = Enum.Font.SourceSansBold

-- 存储已处理的元素
local doorElements = {}

-- 处理单个房间门的高亮和文字
local function processDoor(roomNumber)
    local GeneratedRooms = workspace:FindFirstChild("GeneratedRooms")
    if not GeneratedRooms then return end
    
    local room = GeneratedRooms:FindFirstChild("Room_" .. roomNumber)
    if not room then return end
    
    local door = room:FindFirstChild("Door_Model")
    if not door then return end
    
    -- 清理已存在的元素
    if doorElements[roomNumber] then
        doorElements[roomNumber].highlight:Destroy()
        doorElements[roomNumber].billboard:Destroy()
    end
    
    -- 创建高亮
    local highlight = baseHighlight:Clone()
    highlight.Adornee = door
    highlight.Parent = door
    
    -- 创建文字标签
    local billboard = baseBillboard:Clone()
    billboard.TextLabel.Text = "Room " .. roomNumber
    billboard.Parent = door
    
    -- 存储引用
    doorElements[roomNumber] = {
        highlight = highlight,
        billboard = billboard
    }
end

-- 监听新生成的房间
local function listenForNewRooms()
    local GeneratedRooms = workspace:FindFirstChild("GeneratedRooms")
    if not GeneratedRooms then return end
    
    -- 监听新增的房间
    local newRoomConnection = GeneratedRooms.DescendantAdded:Connect(function(descendant)
        if not doorESPEnabled then return end -- 功能关闭时不处理
        
        -- 检测是否为房间（命名格式：Room_数字）
        local roomNumber = tonumber(descendant.Name:match("Room_(%d+)"))
        if roomNumber and descendant:IsA("Model") then
            task.wait(0.2) -- 等待门加载完成
            processDoor(roomNumber) -- 给新房间的门上高亮
        end
    end)
    table.insert(doorHighlightConnections, newRoomConnection)
end

-- 门透视开关
FPS:Toggle({
    Title = "门透视",
    Value = false,
    Callback = function(Value)
        doorESPEnabled = Value
        
        -- 清理旧连接和高亮
        for _, conn in ipairs(doorHighlightConnections) do
            conn:Disconnect()
        end
        doorHighlightConnections = {}
        for _, elements in pairs(doorElements) do
            elements.highlight:Destroy()
            elements.billboard:Destroy()
        end
        doorElements = {}
        
        if Value then
            -- 处理已存在的房间（1-1000）
            spawn(function()
                for roomNumber = 1, 1000 do
                    if not doorESPEnabled then break end
                    processDoor(roomNumber)
                    task.wait(0.3)
                end
            end)
            
            -- 启动新房间监听（核心：新门出现时自动上高亮）
            listenForNewRooms()
        end
    end
})
FPS:Toggle({
Title = "拉杆透视",
Value = false,
Callback = function(Value)
enabled = Value
while Value do
loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/main/Rooms%20%E5%BC%80%E5%85%B3"))()
task.wait(1)
end
end
})
TS:Toggle({
Title = "A-60检测",
Value = false,
Callback = function(Value)
enabled = Value
while Value do
local getNil = function(name, class)
for _, v in next, getnilinstances() do
if v.ClassName == class and v.Name == name then
return v
end
end
end

if getNil("APoopy", "Part") then
WindUI:Notify({
Title = "警告",
Text = "A-60来了！",
Duration = 3,
Type = "Warning"
})
task.wait(2)
end
task.wait(0.5)
end
end
})