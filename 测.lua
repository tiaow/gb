local args = {
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Shovel"),
	1751615072.037301,
	vector.create(0.5085581541061401, -0.18179628252983093, -0.8416168093681335)
}
game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("SwingMelee"):FireServer(unpack(args))
local teleportPoints = {
    ["矿物售卖点"] = Vector3.new(-41.5818, 3.5000, 25.7670),
    ["饭盒售卖点"] = Vector3.new(-190.9192, 3.9995, -52.3112),
    ["矿洞(顶部)"] = Vector3.new(-66.3164, 3.5000, 56.8189),
    ["矿洞(深处)"] = Vector3.new(61.1772, -108.1145, -119.4801),
    ["买稿子处"] = Vector3.new(-69.0856, 4.0000, 31.4245),
    ["小区"] = Vector3.new(76.5418, 4.0000, -65.5413),
    ["蜜雪冰城"] = Vector3.new(190.7056, 3.5000, 14.7399),
    ["买车处"] = Vector3.new(227.7959, 3.5000, 19.9525),
    ["买水果处"] = Vector3.new(250.1062, 3.5000, 19.7398),
    ["小吃街"] = Vector3.new(87.2112, 3.5000, 48.0347)
}

local selectedPoint = nil  -- 存储当前选择的坐标