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
    Icon = "rbxassetid://92667274604625",
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


local TW = Window:Tab({ Title = "玩家", Icon = "user", Desc = "UI Elements Example" })
TW:Code({
    Title = "example-code.luau",
    Code = [[-- Example Luau code to test syntax highlighting
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local function factorial(n)
    if n <= 1 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

local result = factorial(5)
print("Factorial of 5 is:", result)

local playerName = "Player"
local score = 100

if score >= 100 then
    print(playerName .. " earned an achievement!")
else
    warn("Need more points.")
end

-- Table with nested values
local playerStats = {
    name = "Player",
    health = 100,
    inventory = {"sword", "shield", "potion"}
}

for i, item in ipairs(playerStats.inventory) do
    print("Item in inventory:", item)
end]],
})

local L = ""  -- 存储输入的内容
local HHH = ""  -- 存储格式化后的内容

-- 创建代码显示元素，但初始为空
local codeDisplay = CodeTab:Code({
    Title = "用户脚本",
    Code = HHH  -- 初始为空
})

-- 输入框
TW:Input({
    Title = "输入脚本",
    Desc = "",
    Placeholder = "输入Lua代码...",
    Callback = function(Value)
        L = Value  -- 保存输入的内容
    end
})

-- 按钮
TW:Button({
    Title = "更新显示",
    Callback = function()
        -- 更新 HHH 变量
        HHH = "[[" .. L .. "]]"
        
        -- 更新代码显示
        codeDisplay:Update({
            Code = HHH
        })
    end
})