local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

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

MainTab:CreateSlider({
    Name = "Speed",
    Range = {1,999},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        local hum = game.Players.LocalPlayer.Character
        and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = Value
        end
    end
})

MainTab:CreateButton({
    Name = "Fix Lag 100%",
    Callback = function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end
})

MainTab:CreateButton({
    Name = "Fly Gui",
    Callback = function()
        loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

MainTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false
})

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false
})

MainTab:CreateToggle({
    Name = "Float",
    CurrentValue = false
})


-- TAB 2: SPIN
local SpinTab = Window:CreateTab("Spin",4483362458)

SpinTab:CreateToggle({
    Name = "Spin 50%",
    CurrentValue = false
})

SpinTab:CreateToggle({
    Name = "Spin 100%",
    CurrentValue = false
})

SpinTab:CreateToggle({
    Name = "Spin 200%",
    CurrentValue = false
})


-- TAB 3: VISUAL
local VisualTab = Window:CreateTab("Visual",4483362458)

VisualTab:CreateToggle({
    Name = "Guilty Longinus 🐉",
    CurrentValue = false
})

VisualTab:CreateToggle({
    Name = "Tempest Dragon 🐲",
    CurrentValue = false
})

VisualTab:CreateToggle({
    Name = "Ultimate Valkyrie ⚡",
    CurrentValue = false
})


-- TAB 4: INFO
local InfoTab = Window:CreateTab("Info",4483362458)

InfoTab:CreateParagraph({
    Title = "🇪🇦 Tay Ban Nha 🇪🇦",
    Content =
    "TikTok: @yuya_lwo\n"..
    "Roblox chính: Phong_DZo\n"..
    "Roblox phụ: vyyeuchi2\n"..
    "Free Fire: basan_k36;)"
})
