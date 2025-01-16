local library = loadstring(game:HttpGet("https://pastebin.com/raw/nBq2D86q"))()
local window = library:new("逆天了，老弟")

local creds = window:Tab("信息",'16060333448')

local bin = creds:section("玩家信息",true)

    bin:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
    bin:Label("你的注入器:"..identifyexecutor())
    
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
    credits:Dropdown("选择玩家到传送", "Player Name", AllPlayers, function(Value)
    TeleportToPlayer(Value)
end)
local function tp(position)
    game.Players.LocalPlayer.Character:PivotTo(position)
end
credits:Button("刷新列表", function()
    refreshPlayerList()
    credits:SetOptions(AllPlayers)
end)
local creds = window:Tab("通用2",'16060333448')
local credits = creds:section("内容",true)    
credits:Button("传送", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(39.674766540527344, 5016.0483984375, 24.1953226743164) end)