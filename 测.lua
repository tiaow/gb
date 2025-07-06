local args = {
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Shovel"),
	1751615072.037301,
	vector.create(0.5085581541061401, -0.18179628252983093, -0.8416168093681335)
}
game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemoteEvent"):WaitForChild("SwingMelee"):FireServer(unpack(args))