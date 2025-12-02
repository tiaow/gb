

while true do
game:GetService("Players").LocalPlayer.PlayerGui.BattleScreen
local GH = "Teapots of Utopia"
game:GetService("Players").LocalPlayer.PlayerGui.BattleScreen.StageName.Text = ("[X6]" .. GH)
game:GetService("Players").LocalPlayer.PlayerGui.BattleScreen.StageName.Stars.Star2.Visible = true
game:GetService("Players").LocalPlayer.PlayerGui.BattleScreen.StageName.Stars.Star3.Visible = true
end
task.wait(0.1)
end

