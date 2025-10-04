local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "The Battle Brick Script",
            ["WELCOME"] = "Author:Tiaowen",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency",
            ["LOCKED_TAB"] = "Locked Tab",
            ["ADOUT_XP"] = "Adout Xp",
             ["VERSION"] = "version:",
             ["TEST"] = "test"
        }
         
        

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
    Title = "战斗砖脚本",
    Icon = "",
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
Window.User:SetAnonymous(false)
--Window.User:Disable()
Window:SetIconSize(48)

Window:Tag({
    Title = "版本：测试",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})
local W = Window:Tag({
    Title = "你的XP：",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})
local T = Window:Tag({
    Title = "你的砖块：",
    Color =  Color3.new(0.12,0.12,0.12), Transparency = 1
})

spawn(function()
    while true do
        W:SetTitle("你的XP：" .. game:GetService("Players").LocalPlayer.PlayerData.Currency.Experience.Value)
        task.wait(0.1)
    end
end)


spawn(function()
    while true do
        T:SetTitle("你的砖块：" .. game:GetService("Players").LocalPlayer.PlayerData.Currency.Bricks.Value)
        task.wait(0.1)
    end
end)
local TY = Window:Tab({ Title = "通用", Icon = " ", Desc = "UI Elements Example" })
TY:Toggle({
Title = "夜视",
Value = false,
Callback = function(Value)
if Value then
game.Lighting.Ambient = Color3.new(1, 1, 1)
else
game.Lighting.Ambient = Color3.new(0, 0, 0)
end
end
})
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

loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))
end})

TY:Input({
    Title = "输入时间",
    Desc = "格式 时：分：秒",
    Placeholder = "",
    Callback = function(Value)
    TimeText = Value   
end
})
TY:Toggle({
    Title = "设置时间",
    Desc = "设置你上面输入的时间",
    Placeholder = "",
    Callback = function(Value)
  spawn(function()
    while Value do
game:GetService("Lighting").TimeOfDay = TimeText
task.wait(0.01)
end
end)  
end
})

Window:Tab({ Title = "经验", Icon = "", Desc = "UI Elements Example" })

