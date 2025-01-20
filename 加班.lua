if _G.LoadedA then
    warn("请勿重复加载")
    return
else
    _G.LoadedA = true
end
local library = loadstring(game:HttpGet("https://pastebin.com/raw/nBq2D86q"))()
local window = library:new("逆天了，老弟")

local creds = window:Tab("信息",'16060333448')

local bin = creds:section("玩家信息",true)
  
    bin:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
    bin:Label("你的注入器:"..identifyexecutor())
    bin:Label("你的账号注册时间:"..game:GetService.("Players").LocalPlayer.AccountAge
idenifyexecutor())
    bin:Label("服务器ID"game.PlaceId)
-- 服务器ID
    bin:Label("服务器名字"game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
-- 服务器名字
    bin:Label("用户名ID")game:GetService("Players").LocalPlayer.UserId
    game:GetService("Players").LocalPlayer.CharacterAppearanceId)
-- 用户ID，注册时分配的，不可变
    bin:Label("客户端ID")game:GetService("RbxAnalyticsService"):GetClientd())
-- 客户端ID，删除再下载游戏就会变
    local bin = creds:section("作者信息",true)
    bin:Label("作者:条纹大地")
    bin:Label("缝合脚本")
    bin:Label("QQ:1023929190")
local credits = creds:section("关闭",true)

credits:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    credits:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)
local creds = window:Tab("通用",'16060333448')

local credits = creds:section("内容",true)                                                           
    credits:Slider("跳跃高度!", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 1000, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)
    credits:Slider("步行速度!", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 1000, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)
    credits:Toggle("穿墙", "NoClip", false, function(NC)
  local Workspace = game:GetService("Workspace") local Players = game:GetService("Players") if NC then Clipon = true else Clipon = false end Stepped = game:GetService("RunService").Stepped:Connect(function() if not Clipon == false then for a, b in pairs(Workspace:GetChildren()) do if b.Name == Players.LocalPlayer.Name then for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end end else Stepped:Disconnect() end end)
end)

   credits:Button("隐身道具", function()
  loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
end)                                                                                            
   credits:Button("飞行v3",function()
  loadstring(game:HttpGet'https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt')()
end)                                                                                            credits:Button("无限跳跃",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)                                                                                            credits:Button("爬墙",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)                                                                                            credits:Button("立即死亡",function()
  game.Players.LocalPlayer.Character.Humanoid.Health=0
end) 
    credits:Button("复制当前位置", function()
    setclipboard(tostring(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame))
        end)                                                                        
local creds = window:Tab("通用2",'16060333448')
local credits = creds:section("内容",true)      
credits:Toggle("夜视", "Light", false, function(Light)
  spawn(function() while task.wait() do if Light then game.Lighting.Ambient = Color3.new(1, 1, 1) else game.Lighting.Ambient = Color3.new(0, 0, 0) end end end)
end)
    credits:Slider('设置重力（正常196.2）', 'Sliderflag', 196.2, 0.1, 1000,false, function(Value)
    game.Workspace.Gravity = Value
end)
    credits:Slider('缩放距离', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
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
    credits:Button("iw指令", function()  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()end)
    

   local creds = window:Tab("传送",'16060333448')                  
local credits = creds:section("传送功能",true)
    if getgenv().ED_AntiKick then
	return
end

getgenv().ED_AntiKick = {
	Enabled = true, -- Set to false if you want to disable the Anti-Kick.
	SendNotifications = true, -- Set to true if you want to get notified for every event
	CheckCaller = true -- Set to true if you want to disable kicking by other executed scripts
}

local dropdown = {}
local playernamedied = ""
local teleportConnection

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
    Players:AddOption(player.Name)
end)

game.Players.ChildRemoved:Connect(function(player)
    Players:RemoveOption(player.Name)
    for k, v in pairs(dropdown) do
        if v == player.Name then
            dropdown[k] = nil
        end
    end
end)

credits:Button("传送到玩家旁边一次", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Notify("提示", "成功", "rbxassetid://", 5)
    else
        Notify("提示", "没有目标", "rbxassetid://", 5)
    end
end)

credits:Button("把玩家传送过来", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        tp_player.Character.HumanoidRootPart.CFrame = HumRoot.CFrame + Vector3.new(0, 3, 0)
        Notify("提示", "已传送过来", "rbxassetid://", 5)
    else
        Notify("提示", "没有目标", "rbxassetid://", 5)
    end
end)

credits:Toggle("查看玩家", 'Toggleflag', false, function(state)
    if state then
        game:GetService('Workspace').CurrentCamera.CameraSubject =
            game:GetService('Players'):FindFirstChild(playernamedied).Character.Humanoid
            Notify("提示", "已查看", "rbxassetid://", 5)
    else
        Notify("提示", "已关闭", "rbxassetid://", 5)
        local lp = game.Players.LocalPlayer
        game:GetService('Workspace').CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)
credits:Toggle("循环传送玩家", "Toggle", false, function(Value)
    if Value then
        local localPlayer = game.Players.LocalPlayer
        local targetPlayer = game.Players:FindFirstChild(playernamedied)
        if localPlayer and targetPlayer and localPlayer.Character and targetPlayer.Character then
            local function doTeleport()
                local HumRoot = localPlayer.Character.HumanoidRootPart
                local tp_player = targetPlayer.Character.HumanoidRootPart
                HumRoot.CFrame = tp_player.CFrame + Vector3.new(0, 3, 0)
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
            Notify("提示", "玩家或角色不存在，无法启动循环传送", "rbxassetid://", 5)
        end
    else
        
        if teleportConnection then
            teleportConnection:Disconnect()
            teleportConnection = nil
        end
        Notify("提示", "已停止循环传送玩家", "rbxassetid://", 5)
    end
end)
local creds = window:Tab("伐木大亨2",'16060333448')
local credits = creds:section("伐木大亨",true)
  credits:Button("LuaWareL", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
   end)
   credits:Button("伐木大亨脚本", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
   end)
   local creds = window:Tab("Doors",'16060333448')
local credits = creds:section("Doors脚本",true)
    credits:Button("Ms", function()
    getgenv().Spy="mspaint" loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuAnZang/XKscript/refs/heads/main/DOORS.txt"))()
    end)
    credits:Button("BoBHub汉化", function()
 loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
    end)
    credits:Button("Doors硬核模式(仅自己可见)", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\104\117\121\104\111\97\110\112\104\117\99\47\103\102\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\104\99\104\102\99\103\100\99\121\102\103\102\34\41\41\40\41")()
    end)
    local creds = window:Tab("巴掌",'16060333448')
    local credits = creds:section("巴掌",true)
    credits:Button("巴掌", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/Dusty1234567890/NewGloves/refs/heads/main/Clock')()
    end)
    credits:Button("刷终极bob", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Rob/main/Rob"))()
    end)
    credits:Button("刷可爱的向导😭", function()
    loadstring(game:HttpGet("https://pastefy.app/Ty7G6BXs/raw"))()end)--[[This is the new script that work for all executors,Free free to looking around the source code]]-- 
    credits:Button("国外巴掌超级好用", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
    end)
  local credits = creds:section("传送",true)
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
 local creds = window:Tab("力量传奇",'16060333448')
 local credits = creds:section("力量传奇脚本",true)    
 credits:Button("力量传奇",function()    loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()end)
 
 local credits = creds:section("宝箱传送",true)
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
 
 local credits = creds:section("健身房传送",true)
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
 local creds = window:Tab("GB",'16060333448')local credits = creds:section("内容",true)
 credits:Button("内脏与黑火药脚本", function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()end)
 credits:Button("清风GB", function()
 local SCC_CharPool={[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,55,116,67,82,116,117,109})end)()))} end)
 credits:Button("老大版", function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")() end)