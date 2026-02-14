local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        "en"
          }
})

WindUI.TransparencyValue = 0
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end


local Window = WindUI:CreateWindow({
    Title = "DOD脚本",
    Icon = "eye",
    Author = "作者：条纹",
    Folder = "WindUI_Example",
    Size = UDim2.fromOffset(580, 490),
    Theme = "Dark",
    
    HidePanelBackground = false,
    NewElements = false,
    -- Background = WindUI:Gradient({
    --     ["0"] = { Color = Color3.fromHex("#0f0c29"), Transparency = 1 },
    --     ["100"] = { Color = Color3.fromHex("#302b63"), Transparency = 0.9 },
    -- }, {
    --     Rotation = 45,
    -- }),
    --Background = "video:https://cdn.discordapp.com/attachments/1337368451865645096/1402703845657673878/VID_20250616_180732_158.webm?ex=68958a01&is=68943881&hm=164c5b04d1076308b38055075f7eb0653c1d73bec9bcee08e918a31321fe3058&",
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            end    },
    Acrylic = false,
    HideSearchBar = false,
    SideBarWidth = 200,
    
})


--Window.User:Disable()
Window:SetIconSize(48)

Window:Tag({
    Title = "版本：测试",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})
local W = Window:Tag({
    Title = "你的钱：",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})
local T = Window:Tag({
    Title = "你的游玩时间：",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})

spawn(function()
    while true do
        W:SetTitle("你的钱：" .. game:GetService("Players").LocalPlayer.Stats.Cash.Value)
        task.wait(1)
    end
end)


spawn(function()
    while true do
        T:SetTitle("你的游玩时间：" .. game:GetService("Players").LocalPlayer.Stats.TimePlayed.Value)
        task.wait(1)
    end
end)
local TY = Window:Tab({ Title = "通用", Icon = "user", Desc = "UI Elements Example" })
local Yeshi 
local YShi = game.Lighting.Ambient
TY:Toggle({
Title = "夜视",
Value = false,
Callback = function(Value)
if Value then
Yeshi = true
else
Yeshi = false
game.Lighting.Ambient = Color3.new(0, 0, 0)
end
end

})

spawn(function()
while true do
    if Yeshi then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = YShi
    end
task.wait(0.01)
end
end)


TY:Button({
Title = "去雾",
Value = false,
Callback = function()

game:GetService("Lighting").FogEnd = 9999999
end})
TY:Button({
Title = "反挂机",
Value = false,
Callback = function()
print("Anti Afk On")
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
      wait(1)
        local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "反挂机2已开启",
    Text = "虽然不知道有没有增强",
    Duration = 5,
})

end})



local play = Window:Tab({ Title = "玩家", Icon = "user", Desc = "LOL" })
local jN = Window:Tab({ Title = "技能选择", Icon = "user", Desc = "选择你自己的技能" })
local JLB1 = {
	"热狗",
	"冲刺",
	"治疗",
	"格挡",
	"重拳",
	"嘲讽",
	"香蕉皮",
	"左轮手枪",
	"隐形斗篷",
	"加速板",
	"肾上腺素"
}
local JLB2 = {
	["热狗"] = "Hotdog",
	["冲刺"] = "Dash",
	["治疗"] = "Caretaker",
	["格挡"] = "Block",
	["重拳"] = "Punch",
	["嘲讽"] = "Taunt",
	["香蕉皮"] = "Banana",
	["左轮手枪"] = "Revolver",
	["隐形斗篷"] = "Cloak",
	["加速板"] = "BonusPad",
	["肾上腺素"] = "Adrenaline"
}
local kC1
local kC2
TY:Dropdown({
    Title = "槽1",
    Desc = "请选择你的技能",
    Values = JLB1,
    Value = "",
    Callback = function(V) 
     kC1 = V
     print("已选槽1" .. V)
     
     if kC1 == kC2 then
     print("槽1与槽2重复")
     V = ""
     kC1 = V
     end
        
         
    end
})
TY:Dropdown({
    Title = "槽2",
    Desc = "请选择你的技能",
    Values = JLB1,
    Value = "",
    Callback = function(V) 
    kC2 = V
     print("已选槽2" .. V)
     if kC2 == kC1 then
     print("槽2与槽1重复")
     V = ""
     kC2 = V
     end
    end
})