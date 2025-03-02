function Notify(Title1, Text1, Icon1)
  game:GetService("StarterGui"):SetCore("SendNotification", {    Title = Title1,    Text = Text1,    Icon = Icon1})
  end
Notify("提示", "检测更新中","rbxassetid://17360377302",3)
  local musicId = "rbxassetid://18103562975"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
  wait(0.8)
  Notify("更新完毕", "祝你玩的开心","rbxassetid://17360377302",3)
  local musicId = "rbxassetid://18103562975"
    local music = Instance.new("Sound", game.Workspace)
    music.SoundId = musicId
    music:Play()
  wait(0.5)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/%E4%B8%BB%E8%84%9A%E6%9C%AC.lua"))()
  