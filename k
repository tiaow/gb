while true do
for _, room in ipairs(workspace.CurrentRooms:GetChildren()) do
    -- 检查房间是否有Doors文件夹
    local doorsFolder = room:FindFirstChild("Door")
    if doorsFolder then
        for _, door in ipairs(doorsFolder:GetChildren()) do
if doorsFolder
            local h = Instance.new("Highlight")
            h.FillColor = Color3.new(1, 0, 0)  -- 红色
            h.FillTransparency = 0
            h.OutlineColor = Color3.new(1, 1, 1)  -- 白色边框
            h.OutlineTransparency = 0
            h.Parent = door
        end
    end
end
task.wait(1)
end