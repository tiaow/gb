


espe = true

            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")

            local enemyFolder = workspace.Units.Blue

            local function createNameTag(npc)
                local head = npc:FindFirstChild("Head")
                local humanoid = npc:FindFirstChildOfClass("Humanoid")
                
                if not head or not humanoid then
                    return false
                end
                
                local existingTag = head:FindFirstChild("NameTag")
                if existingTag then
                    existingTag:Destroy()
                end
                
                if espe == true then
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "NameTag"
                    billboardGui.Adornee = head
                    billboardGui.Size = GGGexp
                    billboardGui.ExtentsOffset = Vector3.new(0, 3, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Enabled = true
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Name = "NameLabel"
                    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    nameLabel.Position = UDim2.new(0, 0, 0, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = npc.Name
                    nameLabel.TextColor3 = Color3.new(1, 0.3, 0.3)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    
                    local healthLabel = Instance.new("TextLabel")
                    healthLabel.Name = "HealthLabel"
                    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
                    healthLabel.BackgroundTransparency = 1
                    healthLabel.TextColor3 = Color3.new(1, 0, 0)
                    healthLabel.TextScaled = true
                    healthLabel.Font = Enum.Font.Gotham
                    healthLabel.TextStrokeTransparency = 0
                    healthLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    
                    nameLabel.Parent = billboardGui
                    healthLabel.Parent = billboardGui
                    billboardGui.Parent = head
                    
                    local function updateHealth()
                        if humanoid and humanoid.Parent and head and head.Parent then
                            local currentHealth = math.floor(humanoid.Health)
                            local maxHealth = math.floor(humanoid.MaxHealth)
                            healthLabel.Text = "HP: " .. currentHealth .. " / " .. maxHealth
                            
                            local healthPercent = currentHealth / maxHealth
                            if healthPercent > 0.7 then
                                healthLabel.TextColor3 = Color3.new(0, 1, 0)
                            elseif healthPercent > 0.3 then
                                healthLabel.TextColor3 = Color3.new(1, 1, 0)
                            else
                                healthLabel.TextColor3 = Color3.new(1, 0, 0)
                            end
                            
                            return true
                        else
                            return false
                        end
                    end
                    
                    local connection = RunService.Heartbeat:Connect(function()
                        if not updateHealth() then
                            if connection then
                                connection:Disconnect()
                                enemyNpcConnections[npc] = nil
                            end
                            if billboardGui and billboardGui.Parent then
                                billboardGui:Destroy()
                            end
                        end
                    end)
                    
                    enemyNpcConnections[npc] = connection
                    updateHealth()
                    
                    return true
                end
            end

            local function initializeFolder()
                for _, npc in ipairs(enemyFolder:GetChildren()) do
                    if npc:IsA("Model") then
                        spawn(function()
                            wait(0.1)
                            createNameTag(npc)
                        end)
                    end
                end
            end

            local function monitorFolder()
                enemyFolder.ChildAdded:Connect(function(child)
                    if child:IsA("Model") then
                        wait(0.1)
                        createNameTag(child)
                    end
                end)
                
                enemyFolder.ChildRemoved:Connect(function(child)
                    if enemyNpcConnections[child] then
                        enemyNpcConnections[child]:Disconnect()
                        enemyNpcConnections[child] = nil
                    end
                end)
            end

            if enemyFolder then
                initializeFolder()
                monitorFolder()
            end
espf = true

            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")

            local friendlyFolder = workspace.Units.Red and workspace.Units.red

            local function createNameTag(npc)
                local head = npc:FindFirstChild("Head")
                local humanoid = npc:FindFirstChildOfClass("Humanoid")
                
                if not head or not humanoid then
                    return false
                end
                
                local existingTag = head:FindFirstChild("NameTag")
                if existingTag then
                    existingTag:Destroy()
                end
                
                if espf == true then
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = "NameTag"
                    billboardGui.Adornee = head
                    billboardGui.Size = GGGexp
                    billboardGui.ExtentsOffset = Vector3.new(0, 3, 0)
                    billboardGui.AlwaysOnTop = true
                    billboardGui.Enabled = true
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Name = "NameLabel"
                    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    nameLabel.Position = UDim2.new(0, 0, 0, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = npc.Name
                    nameLabel.TextColor3 = Color3.new(0.3, 0.8, 1)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    
                    local healthLabel = Instance.new("TextLabel")
                    healthLabel.Name = "HealthLabel"
                    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
                    healthLabel.BackgroundTransparency = 1
                    healthLabel.TextColor3 = Color3.new(1, 0, 0)
                    healthLabel.TextScaled = true
                    healthLabel.Font = Enum.Font.Gotham
                    healthLabel.TextStrokeTransparency = 0
                    healthLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                    
                    nameLabel.Parent = billboardGui
                    healthLabel.Parent = billboardGui
                    billboardGui.Parent = head
                    
                    local function updateHealth()
                        if humanoid and humanoid.Parent and head and head.Parent then
                            local currentHealth = math.floor(humanoid.Health)
                            local maxHealth = math.floor(humanoid.MaxHealth)
                            healthLabel.Text = "HP: " .. currentHealth .. " / " .. maxHealth
                            
                            local healthPercent = currentHealth / maxHealth
                            if healthPercent > 0.7 then
                                healthLabel.TextColor3 = Color3.new(0, 1, 0)
                            elseif healthPercent > 0.3 then
                                healthLabel.TextColor3 = Color3.new(1, 1, 0)
                            else
                                healthLabel.TextColor3 = Color3.new(1, 0, 0)
                            end
                            
                            return true
                        else
                            return false
                        end
                    end
                    
                    local connection = RunService.Heartbeat:Connect(function()
                        if not updateHealth() then
                            if connection then
                                connection:Disconnect()
                                friendlyNpcConnections[npc] = nil
                            end
                            if billboardGui and billboardGui.Parent then
                                billboardGui:Destroy()
                            end
                        end
                    end)
                    
                    friendlyNpcConnections[npc] = connection
                    updateHealth()
                    
                    return true
                end
            end

            local function initializeFolder()
                for _, npc in ipairs(friendlyFolder:GetChildren()) do
                    if npc:IsA("Model") then
                        spawn(function()
                            wait(0.1)
                            createNameTag(npc)
                        end)
                    end
                end
            end

            local function monitorFolder()
                friendlyFolder.ChildAdded:Connect(function(child)
                    if child:IsA("Model") then
                        wait(0.1)
                        createNameTag(child)
                    end
                end)
                
                friendlyFolder.ChildRemoved:Connect(function(child)
                    if friendlyNpcConnections[child] then
                        friendlyNpcConnections[child]:Disconnect()
                        friendlyNpcConnections[child] = nil
                    end
                end)
            end

            if friendlyFolder then
                initializeFolder()
                monitorFolder()
            end
