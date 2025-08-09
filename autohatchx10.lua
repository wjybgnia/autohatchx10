--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

--// Variables
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local delayTime = 0 -- Set to 0 for maximum speed (no delay)

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

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Frame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 20)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BackgroundTransparency = 0.3
TitleBar.Parent = Frame

-- Rounded corners for title bar
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 6)
TitleBarCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "AUTO HATCH"
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

--// Function to run the loop - ULTRA OPTIMIZED
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tool = ReplicatedStorage:WaitForChild("Tool")
local DrawUp = Tool:WaitForChild("DrawUp")
local Msg = DrawUp:WaitForChild("Msg")
local DrawHero = Msg:WaitForChild("DrawHero")

-- Pre-cache the args table for maximum speed
local args = {7000033, 10}

local function DrawHeroFunction()
    DrawHero:InvokeServer(unpack(args))
end

-- ULTRA FAST LOOP - No delay checking when delayTime is 0
local function UltraFastLoop()
    if delayTime == 0 then
        -- MAXIMUM SPEED: Execute multiple times per frame for ultra speed
        for i = 1, 3 do -- Execute 3 times per frame for 180+ hatches per second
            task.spawn(DrawHeroFunction)
        end
    else
        -- Use optimized timing only when delay is needed
        local currentTime = tick()
        if currentTime - lastExecution >= delayTime then
            DrawHeroFunction()
            lastExecution = currentTime
        end
    end
end

-- Optimized loop using RunService for maximum speed
local lastExecution = 0

--// Start/Stop button function
StartStopButton.MouseButton1Click:Connect(function()
    running = not running
    if running then
        StartStopButton.Text = "Stop"
        StartStopButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        -- Use RunService for MAXIMUM performance
        connection = RunService.Heartbeat:Connect(UltraFastLoop)
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
