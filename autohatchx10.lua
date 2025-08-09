--// AUTO HATCH x10 BY RISCKYAW - ULTRA FAST VERSION
--// Services (pre-cached for maximum speed)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Variables
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local delayTime = 0
local running = false
local connection

-- Ultra-fast optimization variables
local drawHeroRemote = ReplicatedStorage:WaitForChild("Tool"):WaitForChild("DrawUp"):WaitForChild("Msg"):WaitForChild("DrawHero")
local args = {7000033, 10}
local spawn = task.spawn
local defer = task.defer
local invokeServer = drawHeroRemote.InvokeServer

-- Multiple connection types for maximum speed
local heartbeatConnection = nil
local renderSteppedConnection = nil

--// CLEANUP OLD GUI INSTANCES
local oldGui = playerGui:FindFirstChild("DrawHeroLoopGUI")
if oldGui then
    oldGui:Destroy()
end

--// ULTRA FAST DRAW HERO FUNCTION (NO DELAYS)
local function DrawHero()
    -- Multiple parallel calls for extreme speed
    spawn(function()
        invokeServer(drawHeroRemote, unpack(args))
    end)
    defer(function()
        invokeServer(drawHeroRemote, unpack(args))
    end)
    spawn(function()
        invokeServer(drawHeroRemote, unpack(args))
    end)
end

--// EXTREME SPEED LOOP (NO DELAYS, MULTIPLE CALLS PER FRAME)
local function FastLoop()
    -- Execute multiple times per frame for maximum speed
    DrawHero()
    DrawHero()
    DrawHero()
    DrawHero()
    DrawHero()
end

--// GUI
local MainFrame = Instance.new("ScreenGui")
MainFrame.Name = "DrawHeroLoopGUI"
MainFrame.Parent = playerGui
MainFrame.ResetOnSpawn = false
MainFrame.IgnoreGuiInset = true

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 180, 0, 110)
Frame.Position = UDim2.new(0.5, -90, 0.5, -55)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 0.1
Frame.Parent = MainFrame
Frame.Draggable = true
Frame.Active = true
Frame.Selectable = true
Frame.BorderSizePixel = 0

-- Rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.BackgroundTransparency = 0.2
TitleBar.Parent = Frame
TitleBar.Active = false
TitleBar.BorderSizePixel = 0

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "AUTO HATCH x10 ULTRA FAST!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = TitleBar
Title.Active = false

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -22, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 12
CloseButton.Parent = TitleBar

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 3)
CloseButtonCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    MainFrame:Destroy()
end)

-- Auto Hatch Checkbox
local AutoHatchFrame = Instance.new("Frame")
AutoHatchFrame.Size = UDim2.new(1, -10, 0, 25)
AutoHatchFrame.Position = UDim2.new(0, 5, 0, 40)
AutoHatchFrame.BackgroundTransparency = 1
AutoHatchFrame.Parent = Frame

local AutoHatchCheckbox = Instance.new("Frame")
AutoHatchCheckbox.Size = UDim2.new(0, 20, 0, 20)
AutoHatchCheckbox.Position = UDim2.new(1, -25, 0, 2)
AutoHatchCheckbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoHatchCheckbox.BorderSizePixel = 1
AutoHatchCheckbox.BorderColor3 = Color3.fromRGB(100, 100, 100)
AutoHatchCheckbox.Parent = AutoHatchFrame

local AutoHatchCorner = Instance.new("UICorner")
AutoHatchCorner.CornerRadius = UDim.new(0, 3)
AutoHatchCorner.Parent = AutoHatchCheckbox

-- Checkmark background (red/black square like in screenshot)
local AutoHatchCheck = Instance.new("Frame")
AutoHatchCheck.Size = UDim2.new(0.8, 0, 0.8, 0)
AutoHatchCheck.Position = UDim2.new(0.1, 0, 0.1, 0)
AutoHatchCheck.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AutoHatchCheck.BorderSizePixel = 0
AutoHatchCheck.Parent = AutoHatchCheckbox
AutoHatchCheck.Visible = false

local AutoHatchCheckCorner = Instance.new("UICorner")
AutoHatchCheckCorner.CornerRadius = UDim.new(0, 2)
AutoHatchCheckCorner.Parent = AutoHatchCheck

-- White checkmark symbol
local AutoHatchSymbol = Instance.new("TextLabel")
AutoHatchSymbol.Size = UDim2.new(1, 0, 1, 0)
AutoHatchSymbol.BackgroundTransparency = 1
AutoHatchSymbol.Text = "✓"
AutoHatchSymbol.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoHatchSymbol.Font = Enum.Font.SourceSansBold
AutoHatchSymbol.TextSize = 14
AutoHatchSymbol.Parent = AutoHatchCheck

local AutoHatchLabel = Instance.new("TextLabel")
AutoHatchLabel.Size = UDim2.new(1, -30, 1, 0)
AutoHatchLabel.Position = UDim2.new(0, 0, 0, 0)
AutoHatchLabel.BackgroundTransparency = 1
AutoHatchLabel.Text = "Auto Hatch"
AutoHatchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoHatchLabel.Font = Enum.Font.SourceSans
AutoHatchLabel.TextSize = 14
AutoHatchLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoHatchLabel.Parent = AutoHatchFrame

-- Speed Section
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.6, 0, 0, 20)
SpeedLabel.Position = UDim2.new(0, 5, 0, 70)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Hatch Speed"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = Frame

local SpeedValue = Instance.new("TextLabel")
SpeedValue.Size = UDim2.new(0.4, -5, 0, 20)
SpeedValue.Position = UDim2.new(0.6, 0, 0, 70)
SpeedValue.BackgroundTransparency = 1
SpeedValue.Text = "MAX"
SpeedValue.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedValue.Font = Enum.Font.SourceSansBold
SpeedValue.TextSize = 14
SpeedValue.TextXAlignment = Enum.TextXAlignment.Right
SpeedValue.Parent = Frame

-- Credit
local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(1, -10, 0, 15)
Credit.Position = UDim2.new(0, 5, 1, -20)
Credit.BackgroundTransparency = 1
Credit.Text = "BY: RISCKYAW"
Credit.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit.Font = Enum.Font.SourceSans
Credit.TextSize = 12
Credit.TextXAlignment = Enum.TextXAlignment.Center
Credit.Parent = Frame

--// CHECKBOX FUNCTIONS
AutoHatchCheckbox.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        running = not running
        AutoHatchCheck.Visible = running
        
        if running then
            AutoHatchCheckbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            -- Ultra-fast burst when starting
            for i = 1, 15 do
                spawn(function()
                    DrawHero()
                end)
            end
            -- Connect multiple events for maximum speed
            connection = RunService.Heartbeat:Connect(FastLoop)
            renderSteppedConnection = RunService.RenderStepped:Connect(FastLoop)
            -- Additional continuous loop for extreme speed
            spawn(function()
                while running do
                    DrawHero()
                    task.wait()
                end
            end)
        else
            AutoHatchCheckbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            if connection then
                connection:Disconnect()
                connection = nil
            end
            if renderSteppedConnection then
                renderSteppedConnection:Disconnect()
                renderSteppedConnection = nil
            end
        end
    end
end)

-- Title bar drag functionality
local UserInputService = game:GetService("UserInputService")

-- Manual drag implementation
local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Hover effects
AutoHatchCheckbox.MouseEnter:Connect(function()
    if not running then
        AutoHatchCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

AutoHatchCheckbox.MouseLeave:Connect(function()
    if not running then
        AutoHatchCheckbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)
