local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "The Battle Brick Script",
            ["WELCOME"] = "作者：条纹",
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
            ["LOCKED_TAB"] = "Locked Tab"
        }
    }
})

WindUI.TransparencyValue = 1
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
    Title = "loc:WINDUI_EXAMPLE",
    Icon = "",
    Author = "loc:WELCOME",
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
            WindUI:Notify({
                Title = "User Profile",
                Content = "User profile clicked!",
                Duration = 3
            })
        end
    },
    Acrylic = false,
    HideSearchBar = false,
    SideBarWidth = 200,
    
})
Window.User:SetAnonymous(false)
--Window.User:Disable()
Window:SetIconSize(48)

Window:Tag({
    Title = "版本：测试",
    Color = Color3.fromHex("#302b63")
})
local Window = Window:Tag({
    Title = "时间：" .. os.date("%H:%M:%S"),
    Color = Color3.fromHex("#302b63")
})

spawn(function()
    while true do
        Window:SetTitle("时间：" .. os.date("%H:%M:%S"))
        task.wait(1)
    end
end)
