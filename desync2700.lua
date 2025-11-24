local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Builders27UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 180)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0,200,255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1,0,0,42)
TitleBar.BackgroundColor3 = Color3.fromRGB(25,25,40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0,16)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1,-80,1,0)
TitleLabel.Position = UDim2.new(0,16,0,0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Builders 27:00"
TitleLabel.TextColor3 = Color3.fromRGB(0,200,255)
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1,-24,0,30)
StatusLabel.Position = UDim2.new(0,12,0,50)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "OFFLINE"
StatusLabel.TextColor3 = Color3.fromRGB(180,180,180)
StatusLabel.TextSize = 16
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0,180,0,45)
ToggleButton.Position = UDim2.new(0.5,-90,0,90)
ToggleButton.BackgroundColor3 = Color3.fromRGB(180,50,50)
ToggleButton.BorderSizePixel = 0
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.TextSize = 18
ToggleButton.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0,12)
ToggleCorner.Parent = ToggleButton

-- Discord Button
local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0,200,0,40)
DiscordButton.Position = UDim2.new(0.5,-100,0,145)
DiscordButton.BackgroundColor3 = Color3.fromRGB(0,180,255)
DiscordButton.BorderSizePixel = 0
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.Text = "Join Discord"
DiscordButton.TextColor3 = Color3.fromRGB(0,0,0)
DiscordButton.TextSize = 16
DiscordButton.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0,10)
DiscordCorner.Parent = DiscordButton

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/thHj9Nd5FY")
    StatusLabel.Text = "Discord link copied!"
    StatusLabel.TextColor3 = Color3.fromRGB(0,255,200)
    task.delay(2,function()
        StatusLabel.Text = ToggleButton.Text == "ON" and "DESYNC ACTIVE" or "OFFLINE"
        StatusLabel.TextColor3 = ToggleButton.Text == "ON" and Color3.fromRGB(0,255,100) or Color3.fromRGB(180,180,180)
    end)
end)

-- Hover Animations
ToggleButton.MouseEnter:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {Size = UDim2.new(0,190,0,50)}):Play()
end)
ToggleButton.MouseLeave:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {Size = UDim2.new(0,180,0,45)}):Play()
end)

DiscordButton.MouseEnter:Connect(function()
    TweenService:Create(DiscordButton, TweenInfo.new(0.2), {Size = UDim2.new(0,210,0,45)}):Play()
end)
DiscordButton.MouseLeave:Connect(function()
    TweenService:Create(DiscordButton, TweenInfo.new(0.2), {Size = UDim2.new(0,200,0,40)}):Play()
end)

-- UI Toggle Button (show/hide)
local UIButton = Instance.new("TextButton")
UIButton.Size = UDim2.new(0,70,0,70)
UIButton.Position = UDim2.new(0,10,0,10)
UIButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
UIButton.BorderSizePixel = 0
UIButton.Font = Enum.Font.GothamBold
UIButton.Text = "🔥"
UIButton.TextColor3 = Color3.fromRGB(255,255,255)
UIButton.TextSize = 20
UIButton.Parent = ScreenGui

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(0,12)
UICornerBtn.Parent = UIButton

local UIStrokeBtn = Instance.new("UIStroke")
UIStrokeBtn.Color = Color3.fromRGB(0,200,255)
UIStrokeBtn.Thickness = 2
UIStrokeBtn.Transparency = 0.6
UIStrokeBtn.Parent = UIButton

UIButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    TweenService:Create(UIButton, TweenInfo.new(0.2), {Size = MainFrame.Visible and UDim2.new(0,50,0,50) or UDim2.new(0,45,0,45)}):Play()
end)

-- Screen resizing
RunService.Heartbeat:Connect(function()
    local size = Camera.ViewportSize
    if size.X < 600 then
        MainFrame.Size = UDim2.new(0,280,0,160)
        MainFrame.Position = UDim2.new(0.5,-140,0.5,-80)
    else
        MainFrame.Size = UDim2.new(0,300,0,180)
        MainFrame.Position = UDim2.new(0.5,-150,0.5,-90)
    end
end)
