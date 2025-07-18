for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Size = UDim2.new(0, 100, 0, 40)
        BillboardGui.Adornee = v.Character.Head
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Parent = v.Character.Head

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Text = v.Name
        TextLabel.BackgroundTransparency = 1
        TextLabel.TextColor3 = Color3.new(1, 0, 0)
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.TextScaled = true
        TextLabel.Parent = BillboardGui
    end
end
