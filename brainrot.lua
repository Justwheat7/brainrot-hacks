-- ✅ Player ESP + SpeedHack for Steal a Brainrot
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Очистка старых ESP (если перезапущен)
for _, p in pairs(Players:GetPlayers()) do
    if p.Character and p.Character:FindFirstChild("Head") then
        local old = p.Character.Head:FindFirstChild("NameESP")
        if old then old:Destroy() end
    end
end

-- 📍 Создаем ESP над игроками
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Name = "NameESP"
        BillboardGui.Size = UDim2.new(0, 100, 0, 40)
        BillboardGui.Adornee = player.Character.Head
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Parent = player.Character.Head

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Text = player.Name
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.TextScaled = true
        TextLabel.Parent = BillboardGui
    end
end

-- 🏃 SpeedHack (увеличивает скорость)
local speedValue = 100 -- можешь изменить на 50, 80 и т.д.

local function applySpeed()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = speedValue
end

-- Применить спид при загрузке
applySpeed()

-- Повторять при респавне
LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    applySpeed()
end)
