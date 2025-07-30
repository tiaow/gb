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
FPS:Toggle({
Title = "门透视",
Value = false,
Callback = function(Value)
enabled = Value
while Value do
loadstring(game:HttpGet("https://github.com/tiaow/gb/blob/main/Rooms%20eye"))()
task.wait(1)
end
end
})
