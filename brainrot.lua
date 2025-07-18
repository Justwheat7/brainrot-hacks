-- 📦 Simple Base Teleport Script for "Steal a Brainrot"
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- 🧱 Найти ближайшую базу (любой части с "Base" в имени)
local function getNearestBase()
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end

    local closestBase = nil
    local shortestDistance = math.huge

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():find("base") then
            local distance = (obj.Position - myChar.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance and not obj:IsDescendantOf(myChar) then
                shortestDistance = distance
                closestBase = obj
            end
        end
    end

    return closestBase
end

-- 🚀 Телепорт в указанную точку
local function teleportTo(part)
    if not part then return end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
    end
end

-- 🧠 Найти свою базу
local function getMyBase()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():find("base") and obj:IsDescendantOf(LocalPlayer) then
            return obj
        end
    end
    -- Альтернатива: ищем базу по цвету, имени, или ближайшему объекту в команде игрока
end

-- 📋 Интерфейс
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0, 20, 0.5, -50)
Frame.Size = UDim2.new(0, 180, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2

local UICorner = Instance.new("UICorner", Frame)

local tpEnemyBtn = Instance.new("TextButton", Frame)
tpEnemyBtn.Size = UDim2.new(1, -10, 0, 40)
tpEnemyBtn.Position = UDim2.new(0, 5, 0, 5)
tpEnemyBtn.Text = "📦 К ВРАЖЕСКОЙ БАЗЕ"
tpEnemyBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
Instance.new("UICorner", tpEnemyBtn)

tpEnemyBtn.MouseButton1Click:Connect(function()
    local base = getNearestBase()
    teleportTo(base)
end)

local tpHomeBtn = Instance.new("TextButton", Frame)
tpHomeBtn.Size = UDim2.new(1, -10, 0, 40)
tpHomeBtn.Position = UDim2.new(0, 5, 0, 50)
tpHomeBtn.Text = "🏠 НА СВОЮ БАЗУ"
tpHomeBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
Instance.new("UICorner", tpHomeBtn)

tpHomeBtn.MouseButton1Click:Connect(function()
    local base = getMyBase()
    teleportTo(base)
end)
