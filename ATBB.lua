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
local TY = Window:Tab({ Title = "玩家", Icon = "user", Desc = "UI Elements Example" })
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

TY:Input({
    Title = "输入时间",
    Desc = "格式 时：分：秒",
    Placeholder = "",
    Callback = function(Value)
    TimeText = Value   
end
})
local We = false
TY:Toggle({
    Title = "设置时间",
    Desc = "设置你上面输入的时间",
    Value = false,
    Callback = function(V)
if V  then

We = true
  spawn(function()
    while We do
game:GetService("Lighting").TimeOfDay = TimeText
task.wait(0.01)
end
end)  
else
We = false
end
end
})
local yyin = false
TY:Toggle({
    Title = "去除阴影",
    Desc = "去除游戏阴影",
    Value = false,
    Callback = function(V)
if V  then

yyin = true
  spawn(function()
    while yyin do
game:GetService("Lighting").Brightness = 0
task.wait(0.01)
end
end)  
else
yyin = false
end
end
})
local srldu = 0
TY:Input({
    Title = "输入亮度",
    Desc = "可以负数",
    Placeholder = "",
    Callback = function(Value)
    srldu = Value   
end
})
local ldu = false
TY:Toggle({
    Title = "设置亮度",
    Desc = "设置你输入的亮度",
    Value = false,
    Callback = function(V)
if V  then

ldu = true
  spawn(function()
    while ldu do
game:GetService("Lighting").ExposureCompensation = srldu
task.wait(0.01)
end
end)  
else
ldu = false
end
end
})
local fg = false
TY:Toggle({
    Title = "去除光线反射",
    Desc = "",
    Value = false,
    Callback = function(V)
if V  then

fg = true
  spawn(function()
    while fg do
game:GetService("Lighting").EnvironmentSpecularScale = 0
task.wait(0.01)
end
end)  
else
fg = false
end
end
})

local TBB = Window:Tab({ Title = "tbb功能", Icon = "hand", Desc = "只针对于tbb游戏的功能" })



XPSection = Window:Section({
        Title = "自动刷经验",
        Icon = "hand",
        Opened = false
    })
ch1317 = XPSection:Tab({ 
        Title = "速17(无用)", 
        Icon = "", 
        Desc = "速刷ch1 3星 17", 
        ShowTabTitle = true 
    })
local ditu1 = false
ch1317:Toggle({
    Title = "地图刷新",
    PlaceholderText = "",
    Value = false,
    Callback = function(V)
if V  then
ditu1 = true
while ditu1 do
local args = {
	"Chapter1",
	17,
	2,
	3,
	false,
	{},
  true 
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunction"):WaitForChild("StartBattle"):InvokeServer(unpack(args))
task.wait(0.01)
end
else
ditu1 = false
end
end

})
local djc1 = false
ch1317:Toggle({
    Title = "点击槽",
    Icon = "check",
    Value = false,
    Callback = function(state)
if state then
djc1 = true
while djc1 do
local args = {
	"Slot1" 
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunction"):WaitForChild("PlayerSpawn"):InvokeServer(unpack(args))
task.wait(0.01)
end
else
djc1 = false
end
end
})

--game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Units["7"]







local ZB = Window:Tab({ Title = "开发工具", Icon = "user", Desc = "Are you hacker？" })
ZB:Button({
Title = "Dex",
Value = false,
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
    

end})
ZB:Button({
Title = "Dex++",
Value = false,
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dex-plus-plus-52563"))()

    

end})
ZB:Button({
Title = "rspy",
Value = false,
Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/Spy.lua"))()
end})



local ZCB = {"普通战斗者", "铲斗者", "剑斗士", "弹弓战士", "baller战士", "火箭战士", "炸弹斗士", "泰坦战士"}
local ZCB2 = {
    ["普通战斗者"] = 1,
    ["铲斗者"] = 2,
    ["剑斗士"] = 3,
    ["弹弓战士"] = 4,
    ["baller战士"] = 5,
    ["火箭战士"] = 6,
    ["炸弹斗士"] = 7,
    ["泰坦战士"] = 8
}



local BD = Window:Tab({ Title = "本地", Icon = "user", Desc = "bro以为有无限xp了😂" })
local XP = 0
BD:Input({
    Title = "改xp",
    PlaceholderText = "更改你的XP数量🤑🤑",
    Callback = function(Value)
 XP = Value
        
    end
})
BD:Toggle({
    Title = "启用",
    PlaceholderText = "",
    Value = false,
    Callback = function(V)
if V then 
game:GetService("Players").LocalPlayer.PlayerData.Currency.Experience.Value = XP
else
end
    end
})

local Bricks = 0
BD:Input({
    Title = "改砖块",
    PlaceholderText = "更改你的砖块数量🤑",
    Callback = function(Value)
 Bricks = Value
        
    end
})
BD:Toggle({
    Title = "启用",
    PlaceholderText = "",
    Value = false,
    Callback = function(V)
if V then 
         game:GetService("Players").LocalPlayer.PlayerData.Currency.Bricks.Value = Bricks
     
        
else
end
    end
})
local CHD = ""
local ZCBV = 0
local DJ = 0
BD:Dropdown({
    Title = "选择角色",
    Values = ZCB,
    SearchBarEnabled = true,
    MenuWidth = 280,
    Callback = function(V)
     CHD = V
        ZCBV = ZCB2[V]
        print("已选择角色:", ZCBV)
    end
})


BD:Input({
    Title = "更改等级",
    PlaceholderText = "更改你选择角色的等级",
    Callback = function(V)
    DJ = V or 0
     print("等级设置为:", DJ)
     
    end
})
BD:Button({
    Title = "更改",
    Callback = function()
   print("角色:", ZCBV )     
   print("等级:", DJ)

game:GetService("Players").LocalPlayer.PlayerData.Upgrades.Units["" .. ZCBV].Value = DJ

WindUI:Notify({
            Title = "已更改！",
            
            Icon = "hand",
            Duration = 1
        })
    end
})





local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
makefolder(folderPath)

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

local Sections = {
    WindowSection = Window:Section({
        Title = "UI界面设置",
        Icon = "app-window-mac",
        Opened = true
    })
    
}

local Tabs = {
    WindowTab = Sections.WindowSection:Tab({ 
        Title = "界面和保存", 
        Icon = "settings", 
        Desc = "Manage window settings and file configurations.", 
        ShowTabTitle = true 
    })
}    


Tabs.WindowTab:Section({ Title = "界面", Icon = "app-window-mac" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end
local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)
local themeDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择主题",
    Values = themes,
    SearchBarEnabled = true,
    MenuWidth = 280,
    Value = "Dark",
    Callback = function(theme)
        canchangedropdown = false
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "应用主题",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
        canchangedropdown = true
    end
})

local transparencySlider = Tabs.WindowTab:Slider({
    Title = "透明度调节",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        WindUI.TransparencyValue = tonumber(value)
        Window:ToggleTransparency(tonumber(value) > 0)
    end
})


themeDropdown:Select(WindUI:GetCurrentTheme())

local ThemeToggle = Tabs.WindowTab:Toggle({
    Title = "启用黑色主题",
    Desc = "",
    Value = true,
    Callback = function(state)
        if canchangetheme then
            WindUI:SetTheme(state and "Dark" or "Light")
        end
        if canchangedropdown then
            themeDropdown:Select(state and "Dark" or "Light")
        end
    end
})
Tabs.WindowTab:Toggle({
    Title = "隐藏玩家",
    Desc = "隐藏ui左下角玩家",
    Value = true,
    Callback = function(V)
        if V then
        Window.User:SetAnonymous(true)
            WindUI:Notify({
            Title = "已隐藏！",
            
            Icon = "palette",
            Duration = 1
      })
        else
        
         Window.User:SetAnonymous(false)
            WindUI:Notify({
            Title = "已取消隐藏",
            
            Icon = "palette",
            Duration = 1
        })
        end

    end
})

WindUI:OnThemeChange(function(theme)
    canchangetheme = false
    ThemeToggle:Set(theme == "Dark")
    canchangetheme = true
end)

Tabs.WindowTab:Section({ Title = "保存" })

local fileNameInput = ""
Tabs.WindowTab:Input({
    Title = "写文件名",
    PlaceholderText = "输入",
    Callback = function(text)
        fileNameInput = text
    end
})

Tabs.WindowTab:Button({
    Title = "保存配置",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Section({ Title = "加载" })

local filesDropdown
local files = ListFiles()

filesDropdown = Tabs.WindowTab:Dropdown({
    Title = "选择配置",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

Tabs.WindowTab:Button({
    Title = "加载配置",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "已加载",
                    Content = "配置数据: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})

Tabs.WindowTab:Button({
    Title = "覆盖配置",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Button({
    Title = "刷新列表",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})



local canchangetheme = true
local canchangedropdown = true



