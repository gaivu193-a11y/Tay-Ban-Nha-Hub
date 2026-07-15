local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
    Name = "🇪🇦 Tay Ban Nha 🇪🇦",
    LoadingTitle = "🇪🇦 Tay Ban Nha 🇪🇦",
    LoadingSubtitle = "Ai hỏi",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

-- TAB 1: MAIN
local MainTab = Window:CreateTab("Main", 4483362458)

-- 1. SPEED
MainTab:CreateSlider({
    Name = "Speed",
    Range = {1, 999},
    Increment = 1,
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(Value)
        local Character = LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end,
})

-- 2. FIX LAG 100%
MainTab:CreateButton({
    Name = "Fix Lag 100%",
    Callback = function()
        for _, v in ipairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter")
            or v:IsA("Trail")
            or v:IsA("Smoke")
            or v:IsA("Fire")
            or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end

        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end,
})

-- 3. PLAYER HIGHLIGHT ESP
local ESPEnabled = false

local function UpdateESP(Player)
    if Player == LocalPlayer or not Player.Character then
        return
    end

    local OldESP = Player.Character:FindFirstChild("TayBanNhaESP")
    if OldESP then
        OldESP:Destroy()
    end

    if ESPEnabled then
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "TayBanNhaESP"
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Parent = Player.Character
    end
end

MainTab:CreateToggle({
    Name = "Player Highlight ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        ESPEnabled = Value

        for _, Player in ipairs(Players:GetPlayers()) do
            UpdateESP(Player)
        end
    end,
})

for _, Player in ipairs(Players:GetPlayers()) do
    Player.CharacterAdded:Connect(function()
        task.wait(1)
        UpdateESP(Player)
    end)
end

Players.PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function()
        task.wait(1)
        UpdateESP(Player)
    end)
end)

-- 4. NOCLIP
local Noclip = false

MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(Value)
        Noclip = Value
    end,
})

RunService.Stepped:Connect(function()
    if Noclip then
        local Character = LocalPlayer.Character

        if Character then
            for _, Part in ipairs(Character:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.CanCollide = false
                end
            end
        end
    end
end)

-- 5. JUMP CONTINUOUSLY
local AutoJump = false

MainTab:CreateToggle({
    Name = "Jump Continuously",
    CurrentValue = false,
    Flag = "AutoJump",
    Callback = function(Value)
        AutoJump = Value
    end,
})

task.spawn(function()
    while task.wait(0.1) do
        if AutoJump then
            local Character = LocalPlayer.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                Humanoid.Jump = true
            end
        end
    end
end)

-- 6. FLOAT
local FloatEnabled = false
local FloatPlatform

MainTab:CreateToggle({
    Name = "Float (Walk on Air)",
    CurrentValue = false,
    Flag = "Float",
    Callback = function(Value)
        FloatEnabled = Value

        if not Value and FloatPlatform then
            FloatPlatform:Destroy()
            FloatPlatform = nil
        end
    end,
})

RunService.Heartbeat:Connect(function()
    if FloatEnabled then
        local Character = LocalPlayer.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")

        if Root then
            if not FloatPlatform or not FloatPlatform.Parent then
                FloatPlatform = Instance.new("Part")
                FloatPlatform.Name = "TayBanNhaFloat"
                FloatPlatform.Size = Vector3.new(6, 1, 6)
                FloatPlatform.Transparency = 1
                FloatPlatform.Anchored = true
                FloatPlatform.CanCollide = true
                FloatPlatform.Parent = workspace
            end

            FloatPlatform.Position = Root.Position - Vector3.new(0, 3.5, 0)
        end
    end
end)

-- TAB 2: SPIN
local SpinTab = Window:CreateTab("Spin", 4483362458)
local Spin50 = false

SpinTab:CreateToggle({
    Name = "Spin 50%",
    CurrentValue = false,
    Flag = "Spin50",
    Callback = function(Value)
        Spin50 = Value
    end,
})

RunService.Heartbeat:Connect(function()
    if Spin50 then
        local Character = LocalPlayer.Character
        local Root = Character and Character:FindFirstChild("HumanoidRootPart")

        if Root then
            Root.CFrame = Root.CFrame * CFrame.Angles(0, math.rad(5), 0)
        end
    end
end)
