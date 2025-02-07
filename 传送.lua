local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/block/main/UI/%E5%BD%A9%E8%99%B9UI.lua"))()
local window = library:new("条脚本v2")
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
    "后面"
}

credits:Dropdown("选择方向", 'DirectionDropdown', directionDropdown, function(v)
    selectedDirection = v
    print("选择的方向: ", selectedDirection)
end)

local function getDirectionOffset(direction)
    local offset = Vector3.new()
    if direction == "上面" then
        offset = Vector3.new(0, 3, 0)
    elseif direction == "下面" then
        offset = Vector3.new(0, -3, 0)
    elseif direction == "左边" then
        offset = Vector3.new(-3, 0, 0)
    elseif direction == "右边" then
        offset = Vector3.new(3, 0, 0)
    elseif direction == "前面" then
        offset = Vector3.new(0, 0, 3)
    elseif direction == "后面" then
        offset = Vector3.new(0, 0, -3)
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