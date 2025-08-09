--// AUTO HATCH x10 BY RISCKYAW - ERROR-FREE VERSION
--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

--// Variables
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local delayTime = 0
local running = false
local connection

--// ULTRA SAFE DRAW HERO FUNCTION
local function DrawHero()
    coroutine.wrap(function()
        pcall(function()
            local args = {7000033, 10}
            game:GetService("ReplicatedStorage").Tool.DrawUp.Msg.DrawHero:InvokeServer(unpack(args))
        end)
    end)()
end

--// FAST LOOP
local lastTime = 0
local function FastLoop()
    local currentTime = tick()
    if currentTime - lastTime >= delayTime then
        DrawHero()
        lastTime = currentTime
    end
end

--// GUI
local MainFrame = Instance.new("ScreenGui")
MainFrame.Name = "DrawHeroLoopGUI"
MainFrame.Parent = playerGui
MainFrame.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.Position = UDim2.new(0.5, -100, 0.5, -25)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BackgroundTransparency = 0.2
Frame.Parent = MainFrame
Frame.Draggable = true
Frame.Active = true
Frame.Selectable = true

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Frame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 20)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BackgroundTransparency = 0.3
TitleBar.Parent = Frame
TitleBar.Active = true

-- Rounded corners for title bar
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 6)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "AUTO HATCH x10 BY RISCKYAW"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSans
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 14
CloseButton.TextColor3 = Color3.fromRGB(220, 220, 220)
CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CloseButton.BackgroundTransparency = 0.3
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleBar

-- Rounded corners for close button
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

-- Delay TextBox (25% of width)
local DelayBox = Instance.new("TextBox")
DelayBox.Size = UDim2.new(0.25, -10, 0, 25)
DelayBox.Position = UDim2.new(0, 5, 1, -30)
DelayBox.Text = tostring(delayTime)
DelayBox.PlaceholderText = "Delay"
DelayBox.TextColor3 = Color3.fromRGB(220, 220, 220)
DelayBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DelayBox.BackgroundTransparency = 0.3
DelayBox.Font = Enum.Font.SourceSans
DelayBox.TextSize = 14
DelayBox.Parent = Frame

-- Rounded corners for delay box
local DelayBoxCorner = Instance.new("UICorner")
DelayBoxCorner.CornerRadius = UDim.new(0, 4)
DelayBoxCorner.Parent = DelayBox

local StartStopButton = Instance.new("TextButton")
StartStopButton.Size = UDim2.new(0.75, -15, 0, 25)
StartStopButton.Position = UDim2.new(0.25, 5, 1, -30)
StartStopButton.Text = "Start"
StartStopButton.Font = Enum.Font.SourceSans
StartStopButton.TextSize = 14
StartStopButton.TextColor3 = Color3.fromRGB(220, 220, 220)
StartStopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
StartStopButton.BackgroundTransparency = 0.3
StartStopButton.BorderSizePixel = 0
StartStopButton.Parent = Frame

-- Rounded corners for start/stop button
local StartStopCorner = Instance.new("UICorner")
StartStopCorner.CornerRadius = UDim.new(0, 4)
StartStopCorner.Parent = StartStopButton

--// Variables to control loop
local running = false
local connection

--// Start/Stop button function
StartStopButton.MouseButton1Click:Connect(function()
    running = not running
    if running then
        StartStopButton.Text = "Stop"
        StartStopButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        -- Use RunService for MAXIMUM performance
        connection = RunService.Heartbeat:Connect(FastLoop)
    else
        StartStopButton.Text = "Start"
        StartStopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        -- Disconnect the RunService connection
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end)

--// Close button function
CloseButton.MouseButton1Click:Connect(function()
    -- Clean up connections before destroying
    if connection then
        connection:Disconnect()
        connection = nil
    end
    MainFrame:Destroy()
end)

-- Title bar hover effects for drag indication
TitleBar.MouseEnter:Connect(function()
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

TitleBar.MouseLeave:Connect(function()
    TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

-- Button hover effects
CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

StartStopButton.MouseEnter:Connect(function()
    if running then
        StartStopButton.BackgroundColor3 = Color3.fromRGB(140, 50, 50)
    else
        StartStopButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

StartStopButton.MouseLeave:Connect(function()
    if running then
        StartStopButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
    else
        StartStopButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- Delay box input handling
DelayBox.FocusLost:Connect(function(enterPressed)
    local newDelay = tonumber(DelayBox.Text)
    if newDelay and newDelay >= 0 then -- Allow 0 for no delay
        delayTime = newDelay
    else
        DelayBox.Text = tostring(delayTime)
    end
end)
