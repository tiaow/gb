
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "TW脚本/条脚本",
    Icon = "rbxassetid://129260712070622",
    Size = UDim2.fromOffset(400, 500),
    Theme = "Dark"
})

local AllFeaturesTab = Window:Tab({
    Title = "通用",
    Icon = "grid"
})

-- 1. 步行速度
AllFeaturesTab:Slider({
    Title = "步行速度",
    Desc = "调整角色移动速度",
    Value = {
        Min = 16,
        Max = 1000,
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

-- 2. 跳跃高度
AllFeaturesTab:Slider({
    Title = "跳跃高度",
    Desc = "调整角色跳跃高度",
    Value = {
        Min = 50,
        Max = 100000000,
        Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
    },
    Callback = function(Jump)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump
    end
})

-- 3. 设置重力
AllFeaturesTab:Slider({
    Title = "设置重力",
    Desc = "默认196.2",
    Value = {
        Min = 0.1,
        Max = 1000,
        Default = 196.2,
    },
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

-- 4. 缩放距离
AllFeaturesTab:Slider({
    Title = "缩放距离",
    Desc = "默认128",
    Value = {
        Min = 128,
        Max = 100000,
        Default = 128,
    },
    Callback = function(value)
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end
})

-- 5. 视界设置
AllFeaturesTab:Slider({
    Title = "视界设置",
    Desc = "默认70",
    Value = {
        Min = 0.1,
        Max = 120,
        Default = 70,
    },
    Callback = function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
    end
})

-- 6. 最大血量
AllFeaturesTab:Slider({
    Title = "最大血量",
    Desc = "调整角色最大生命值",
    Value = {
        Min = 1,
        Max = 999999999,
        Default = 100,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
    end
})

-- 7. 当前血量
AllFeaturesTab:Slider({
    Title = "当前血量",
    Desc = "调整角色当前生命值",
    Value = {
        Min = 1,
        Max = 999999999,
        Default = 100,
    },
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Health = Value
    end
})

-- 8. 快速跑步
AllFeaturesTab:Input({
    Title = "快速跑步",
    Desc = "死后重置，建议值2",
    Placeholder = "输入速度值",
    Callback = function(king)
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
    end
})

-- 9. 穿墙
AllFeaturesTab:Toggle({
    Title = "穿墙",
    Desc = "开启后可以穿过墙壁",
    Value = false,
    Callback = function(NC)
        local Workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        if NC then
            Clipon = true
        else
            Clipon = false
        end
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Clipon == false then
                for a, b in pairs(Workspace:GetChildren()) do
                    if b.Name == Players.LocalPlayer.Name then
                        for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    end
})

-- 10. 夜视
local nightVisionConn = nil
AllFeaturesTab:Toggle({
Title = "夜视",
Desc = "立即互动",
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
-- 11. 自动零延迟交互
local enabled = false
local connections = {}
AllFeaturesTab:Toggle({
    Title = "自动零延迟交互",
    Desc = "立即互动",
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

-- 12. 智能自动交互
local autoInteract = false
local trackedPrompts = {}
local connections = {}
AllFeaturesTab:Toggle({
    Title = "智能自动交互",
    Desc = "建议搭配立即互动",
    Value = false,
    Callback = function(value)
        autoInteract = value
        
        for _, conn in pairs(connections) do
            conn:Disconnect()
        end
        trackedPrompts = {}
        connections = {}
        
        if autoInteract then
            local function processPrompt(prompt)
                if not trackedPrompts[prompt] then
                    trackedPrompts[prompt] = true
                    
                    local conn = game:GetService("RunService").Heartbeat:Connect(function()
                        if autoInteract and prompt.Enabled then
                            local char = game.Players.LocalPlayer.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                local distance = (char.HumanoidRootPart.Position - prompt.Parent.Position).Magnitude
                                if distance <= prompt.MaxActivationDistance then
                                    prompt:InputHoldBegin()
                                    prompt:InputHoldEnd()
                                end
                            end
                        end
                    end)
                    table.insert(connections, conn)
                end
            end
            
            for _, prompt in ipairs(workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    processPrompt(prompt)
                end
            end
            
            local newPromptConn = workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("ProximityPrompt") then
                    processPrompt(obj)
                end
            end)
            table.insert(connections, newPromptConn)
        end
    end
})

-- 13. 灵魂出窍按钮
AllFeaturesTab:Button({
    Title = "灵魂出窍",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ahK5jRxM"))()
    end
})

-- 14. 动作变卡按钮
AllFeaturesTab:Button({
    Title = "动作变卡",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Fe%20Fake%20Lag%20Obfuscator'))()
    end
})

-- 15. 认真反复横跳按钮
AllFeaturesTab:Button({
    Title = "认真反复横跳",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end
})

-- 16. 定住自己按钮
AllFeaturesTab:Button({
    Title = "定住自己",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YrfBSuWw"))()
    end
})

-- 17. 帽子旋转按钮
AllFeaturesTab:Button({
    Title = "帽子旋转",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fe-Spinning-Hat-Script/refs/heads/main/Fe%20Spinning%20Hats%20Script"))()
    end
})

-- 18. 无头和kor按钮
AllFeaturesTab:Button({
    Title = "无头和kor",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
    end
})

-- 19. R15变R6按钮
AllFeaturesTab:Button({
    Title = "R15变R6",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()
    end
})

-- 20. 铁拳按钮
AllFeaturesTab:Button({
    Title = "铁拳",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

-- 21. 单个甩人按钮
AllFeaturesTab:Button({
    Title = "单个甩人",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20fling%20script'))()
    end
})

-- 22. 碰到就飞按钮
AllFeaturesTab:Button({
    Title = "碰到就飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
    end
})

-- 23. 时间设置
local TimeText = "0"
local Timexunhuan = false
AllFeaturesTab:Input({
    Title = "输入时间",
    Desc = "格式：时:分:秒",
    Placeholder = "0",
    Callback = function(Value)
        TimeText = Value
    end
})

AllFeaturesTab:Toggle({
    Title = "启用时间设置",
    Value = false,
    Callback = function(Value)
        Timexunhuan = Value
        while Timexunhuan do
            game:GetService("Lighting").TimeOfDay = TimeText
            task.wait(0.01)
        end
    end
})

-- 24. 去雾按钮
AllFeaturesTab:Button({
    Title = "去雾",
    Callback = function()
        game:GetService("Lighting").FogEnd = 9999999
    end
})

-- 25. 人物显示
AllFeaturesTab:Toggle({
    Title = "人物显示",
    Desc = "高亮显示其他玩家",
    Value = false,
    Callback = function(RWXS)
        getgenv().enabled = RWXS
        getgenv().filluseteamcolor = true
        getgenv().outlineuseteamcolor = true
        getgenv().fillcolor = Color3.new(1, 0, 0)
        getgenv().outlinecolor = Color3.new(1, 1, 1)
        getgenv().filltrans = 0.5
        getgenv().outlinetrans = 0.5
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
    end
})

-- 26. 无敌按钮
AllFeaturesTab:Button({
    Title = "无敌(可能不适用)",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
    end
})

-- 27. 死亡笔记按钮
AllFeaturesTab:Button({
    Title = "死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/dfhj/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.txt"))()
    end
})

-- 28. 黑洞脚本按钮
AllFeaturesTab:Button({
    Title = "黑洞脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/XSK/refs/heads/main/HeiDongscript.lua"))()
    end
})

-- 29. 飞行v3按钮
AllFeaturesTab:Button({
    Title = "飞行v3",
    Callback = function()
        loadstring(game:HttpGet'https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt')()
    end
})

-- 30. 上帝模式
AllFeaturesTab:Toggle({
    Title = "上帝模式",
    Desc = "开启后可能无法死亡",
    Value = false,
    Callback = function(Value)
        local LP = game:GetService("Players").LocalPlayer
        local character = LP.Character
        if not character then return end
        
        if Value then
            local HRP = character.HumanoidRootPart
            local clone = HRP:Clone()
            clone.Parent = character
        else
            for i, child in ipairs(character:GetChildren()) do
                if child:IsA("BasePart") and child.Name == "HumanoidRootPart" and child ~= character.HumanoidRootPart then
                    child:Destroy()
                end
            end
        end
    end
})

-- 31. 第三人称按钮
AllFeaturesTab:Button({
    Title = "第三人称(需手动缩放)",
    Callback = function()
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
    end
})

-- 32. 显示聊天框
local lolkkk = false
AllFeaturesTab:Toggle({
    Title = "显示聊天框",
    Value = false,
    Callback = function(V)
        lolkkk = V
        while lolkkk do
            game.TextChatService.ChatWindowConfiguration.Enabled = true
            task.wait(0.1)
        end
    end
})

-- 33. 隐身道具按钮
AllFeaturesTab:Button({
    Title = "隐身道具",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
    end
})

-- 34. 加速回血按钮
AllFeaturesTab:Button({
    Title = "加速回血",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
    end
})

-- 35. 无限跳跃
local InfJ = false
AllFeaturesTab:Toggle({
    Title = "无限跳跃",
    Desc = "开启后可无限跳跃",
    Value = false,
    Callback = function(s)
        InfJ = s
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
})

-- 36. 工具包按钮
AllFeaturesTab:Button({
    Title = "工具包",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})

-- 37. 子弹追踪按钮
AllFeaturesTab:Button({
    Title = "子弹追踪",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()
    end
})

-- 38. 飞车按钮
AllFeaturesTab:Button({
    Title = "飞车",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/63T0fkBm"))()
    end
})

-- 39. 吸人按钮
AllFeaturesTab:Button({
    Title = "吸人",
    Callback = function()
        loadstring(game:HttpGet("https://shz.al/~HHAKS"))()
    end
})

-- 40. 反挂机v2按钮
AllFeaturesTab:Button({
    Title = "反挂机v2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
    end
})

-- 41. 透视按钮
AllFeaturesTab:Button({
    Title = "透视",
    Callback = function()
        local Players = game:GetService("Players"):GetChildren()
        local RunService = game:GetService("RunService")
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if v.Character:FindFirstChild("HumanoidRootPart") and not v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character.HumanoidRootPart
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
            end
        end
        
        game.Players.PlayerAdded:Connect(function(player)
            repeat wait() until player.Character
            if player.Character:FindFirstChild("HumanoidRootPart") and not player.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = player.Character
                highlightClone.Parent = player.Character.HumanoidRootPart
                highlightClone.Name = "Highlight"
            end
        end)
        
        game.Players.PlayerRemoving:Connect(function(playerRemoved)
            if playerRemoved.Character and playerRemoved.Character:FindFirstChild("HumanoidRootPart") and playerRemoved.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                playerRemoved.Character.HumanoidRootPart.Highlight:Destroy()
            end
        end)
        
        RunService.Heartbeat:Connect(function()
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and not v.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = v.Character
                    highlightClone.Parent = v.Character.HumanoidRootPart
                    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlightClone.Name = "Highlight"
                    task.wait()
                end
            end
        end)
    end
})

-- 42. 音乐脚本按钮
AllFeaturesTab:Button({
    Title = "音乐脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E5%8A%A0%E7%8F%AD%20(1).lua"))()
    end
})

-- 43. 阿尔宙斯自瞄按钮
AllFeaturesTab:Button({
    Title = "阿尔宙斯自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
    end
})

-- 44. 爬墙按钮
AllFeaturesTab:Button({
    Title = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

-- 45. 立即死亡按钮
AllFeaturesTab:Button({
    Title = "立即死亡",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

-- 46. 传送功能
local k = ""
AllFeaturesTab:Input({
    Title = "输入传送地点",
    Desc = "格式: x,y,z",
    Placeholder = "输入坐标",
    Callback = function(Gc)
        k = Gc
    end
})

AllFeaturesTab:Button({
    Title = "传送",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(k))
    end
})

-- 47. 复制当前位置按钮
AllFeaturesTab:Button({
    Title = "复制当前位置",
    Callback = function()
        setclipboard('game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new('..tostring(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)..'))')
    end
})

-- 48. 位置实时显示按钮
AllFeaturesTab:Button({
    Title = "位置实时显示",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E4%BD%8D%E7%BD%AE%E5%AE%9E%E6%97%B6%E6%98%BE%E7%A4%BA(%E5%BD%A9%E8%89%B2%E7%89%88).lua"))()
    end
})

-- 49. 踏空行走按钮
AllFeaturesTab:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

-- 50. 键盘按钮
AllFeaturesTab:Button({
    Title = "键盘⌨️",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

-- 51. 甩人按钮
AllFeaturesTab:Button({
    Title = "甩人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

-- 52. iw指令按钮
AllFeaturesTab:Button({
    Title = "iw指令",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

-- 53. 玩家加入游戏提示按钮
AllFeaturesTab:Button({
    Title = "玩家加入游戏提示",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

-- 54. 撸🥵🥵🥵(R6)按钮
AllFeaturesTab:Button({
    Title = "撸🥵🥵🥵(R6)",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})

-- 55. 撸🥵🥵(R15)按钮
AllFeaturesTab:Button({
    Title = "撸🥵🥵(R15)",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})

-- 56. 旋转功能标签
AllFeaturesTab:Button({
    Title = "旋转",
    Callback = function()
end
})

-- 57. 旋转0按钮
AllFeaturesTab:Button({
    Title = "旋转0",
    Callback = function()
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
    end
})

-- 58. 旋转10按钮
AllFeaturesTab:Button({
    Title = "旋转10",
    Callback = function()
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
    end
})

-- 59. 旋转50按钮
AllFeaturesTab:Button({
    Title = "旋转50",
    Callback = function()
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
    end
})

-- 60. 旋转100按钮
AllFeaturesTab:Button({
    Title = "旋转100",
    Callback = function()
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
    end
})

-- 61. 旋转300按钮
AllFeaturesTab:Button({
    Title = "旋转300",
    Callback = function()
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
    end
})

-- 62. 旋转500按钮
AllFeaturesTab:Button({
    Title = "旋转500",
    Callback = function()
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
    end
})

-- 63. 范围功能标签
AllFeaturesTab:Button({
    Title = "范围",
    Callback = function()
end
})
-- 64. 范围按钮
AllFeaturesTab:Button({
    Title = "范围(小)",
    Callback = function()
        _G.HeadSize = 20
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Character then
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
})

-- 65. 中级范围按钮
AllFeaturesTab:Button({
    Title = "范围(中)",
    Callback = function()
        _G.HeadSize = 100
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Character then
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
})

-- 66. 高级范围按钮
AllFeaturesTab:Button({
    Title = "范围(大)",
    Callback = function()
        _G.HeadSize = 500
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Character then
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
})

-- 67. 音乐播放按钮
AllFeaturesTab:Button({
    Title = "🗿🗿🗿",
    Callback = function()
        local musicId = "rbxassetid://18103562975"
        local music = Instance.new("Sound", game.Workspace)
        music.SoundId = musicId
        music:Play()
    end
})
-- 创建音频标签页
local AudioTab = Window:Tab({
    Title = "音频",
    Icon = "music"  -- 使用音乐图标
})

-- 音乐播放系统初始化
local SoundService = game:GetService("SoundService")
local currentSound
local isPaused = false

-- 播放功能
AudioTab:Input({
    Title = "音乐",
    Desc = "输入音乐ID",
    Placeholder = "输入音乐ID",
    Callback = function(Value)
        local musicID = Value:match("%d+")
        
        -- 输入验证
        if not musicID or musicID == "" then
            WindUI:Notify({
            Title = "错误",
            Content = "输入有效音乐ID",
            Duration = 1,
        })
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
            WindUI:Notify({
            Title = "播放成功",
            Content = "正在播放 ID: "..musicID,
            Duration = 1,
        })
        end)
        
        -- 处理错误
        if not success then
            cleanupSound()
            WindUI:Notify({
            Title = "播放失败",
            Content = "错误: "..tostring(err),
            Duration = 1,
        })
            
        end
    end
})
-- 暂停功能
AudioTab:Button({
    Title = "暂停音乐",
    Callback = function()
        if not currentSound then
            WindUI:Notify({
            Title = "错误",
            Content = "没有正在播放音乐",
            Duration = 1,
        })
            return
        end
        
        if isPaused then
            WindUI:Notify({
            Title = "提示",
            Content = "音乐已经处于暂停状态",
            Duration = 1,
        })
            return
        end
        
        local success, err = pcall(function()
            currentSound:Pause()
            isPaused = true
            WindUI:Notify({
            Title = "已暂停",
            Content = "",
            Duration = 1,
        })
        end)
        
        if not success then
            WindUI:Notify({
            Title = "暂停失败",
            Content = "错误: "..tostring(err),
            Duration = 1,
        })
        end
    end
})

-- 继续功能
AudioTab:Button({
    Title = "继续播放",
    Callback = function()
        if not currentSound then
   
            WindUI:Notify({
            Title = "操作失败",
            Content = "没有可播放的音乐",
            Duration = 1,
        })
            return
        end
        
        if not isPaused then
            WindUI:Notify({
            Title = "提示",
            Content = "音乐正在正常播放",
            Duration = 1,
        })
            return
        end
        
        local success, err = pcall(function()
            currentSound:Resume()
            isPaused = false
            WindUI:Notify({
            Title = "提示",
            Content = "音乐已继续播放",
            Duration = 1,
        })
        end)
        
        if not success then
            WindUI:Notify({
            Title = "继续播放失败",
            Content = "错误: "..tostring(err),
            Duration = 1,
        })
        end
    end
})

-- 特定音效按钮
AudioTab:Button({
    Title = "彩虹瀑布",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1837879082"
        sound.Parent = game.Workspace
        sound:Play()
        
    end
})

AudioTab:Button({
    Title = "防空警报",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://792323017"
        sound.Parent = game.Workspace
        sound:Play()
        
    end
})

-- 创建抓包标签页
local SpyTab = Window:Tab({
    Title = "抓包",
    Icon = "eye"  -- 使用眼睛图标
})

-- 抓包工具
SpyTab:Button({
    Title = "spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/Spy.lua"))()
        
    end
})

SpyTab:Button({
    Title = "spy改版",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/48Killer/Fixed-Simple-spy-function-info-/blob/main/1.lua"))()
        
    end
})

SpyTab:Button({
    Title = "Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
        
    end
})

SpyTab:Button({
    Title = "nb的dex",
    Callback = function()
        getgenv().Key = "Bash" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/crceck123/roblox-script/main/MC_IY%20Dex.txt"))()
        
    end
})

SpyTab:Button({
    Title = "redz",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/DEX-Explorer/refs/heads/main/Mobile.lua"))()
        
    end
})

SpyTab:Button({
    Title = "小云翻译dex",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/XiaoYunCN/VIP/raw/main/DexV2%20Mobile", true))()
        
    end
})

-- 辅助函数（放在外部）
local function cleanupSound()
    if currentSound then
        pcall(function()
            currentSound:Stop()
            currentSound:Destroy()
        end)
        currentSound = nil
        isPaused = false
    end
end