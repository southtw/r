-- basically a plug for pyro hub

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function createnoti(title, message, duration)
    duration = duration or 3

    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 300, 0, 80)
    notifFrame.Position = UDim2.new(0.5, -150, 1, 100)
    notifFrame.AnchorPoint = Vector2.new(0.5, 0)
    notifFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    notifFrame.BorderSizePixel = 0
    notifFrame.ClipsDescendants = true
    notifFrame.Parent = ScreenGui

    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 3, 1, 0)
    accent.Position = UDim2.new(0, 0, 0, 0)
    accent.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    accent.BorderSizePixel = 0
    accent.Parent = notifFrame

    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1, 40, 1, 40)
    glow.Position = UDim2.new(0, -20, 0, -20)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    glow.ImageColor3 = Color3.fromRGB(100, 150, 255)
    glow.ImageTransparency = 0.8
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10, 10, 118, 118)
    glow.Parent = notifFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -15, 0, 25)
    titleLabel.Position = UDim2.new(0, 12, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.Parent = notifFrame

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -15, 0, 40)
    messageLabel.Position = UDim2.new(0, 12, 0, 32)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    messageLabel.TextSize = 13
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextWrapped = true
    messageLabel.Parent = notifFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notifFrame

    notifFrame.Position = UDim2.new(1, 20, 0, 20)
    local slideIn = TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -320, 0, 20)
    })
    slideIn:Play()

    task.delay(duration, function()
        local slideOut = TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 20, 0, 20)
        })
        slideOut:Play()
        slideOut.Completed:Connect(function()
            notifFrame:Destroy()
        end)
    end)
end

local JobEnded = ReplicatedStorage.Systems.Jobs.JobEnded
local BuyItem = ReplicatedStorage.Systems.Shop.BuyItem
local ConsumeFood = ReplicatedStorage.Systems.Food.ConsumeFood
local Warp = ReplicatedStorage.Systems.Teleport.Warp
local StartJob = ReplicatedStorage.Systems.Jobs.StartJob
--local ClaimBank = ReplicatedStorage.Systems.Jobs.ClaimBank

local autoFarmEnabled = false
local isProcessing = false

local Window = Library.CreateLib("anime life extra ($10000 script)", "Midnight")

local MainTab = Window:NewTab("main")
local MainSection = MainTab:NewSection("auto farm")

--[[
MainSection:NewButton("load pyro hub", "", function()
    shared.discord_key = "BREAKING_BAD"
loadstring(game:HttpGet("https://pyro.delivery/bundle.lua"))()
end)
--]]

local labelaf = MainSection:NewLabel("af state: ")
MainSection:NewToggle("sword cutting", "Automatically farm sword cutting job", function(state)
    autoFarmEnabled = state
    if state then
        createnoti("sword cutting: ", "Enabled", 3)
        labelaf:UpdateLabel("af state: Enabled")
    else
        createnoti("sword cutting: ", "Disabled", 3)
        labelaf:UpdateLabel("af state: Disabled")
    end
end)


local ControlSection = MainTab:NewSection("misc")
--[[
local labelml = ControlSection:NewLabel("log: ")

ControlSection:NewButton("Buy 4 Sports Drinks", "Purchase 4 sports drinks", function()
    for i = 1, 4 do
        BuyItem:InvokeServer("SportsDrink")
        wait(0.1)
    end
    labelml:UpdateLabel("log: Bought 4 Sports Drinks")
end)

ControlSection:NewButton("Consume 4 Sports Drinks", "Consume 4 sports drinks", function()
    for i = 1, 4 do
        ConsumeFood:FireServer("SportsDrink")
        wait(0.1)
    end
    labelml:UpdateLabel("log: Consumed 4 Sports Drinks")
end)
--]]

ControlSection:NewButton("TP to Sword Cutting", "Teleport to sword cutting location", function()
    Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    createnoti("tp:", "sc", 3)
    labelml:UpdateLabel("log: Teleported to Sword Cutting")
end)
--[[
ControlSection:NewButton("TP to home (default)", "Teleport to sword cutting location", function()
    Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    labelml:UpdateLabel("log: Teleported to Sword Cutting")
end)
--]]
ControlSection:NewButton("Start Sword Cutting Job", "Start the sword cutting job", function()
    StartJob:FireServer("SwordCuttingGame")
    createnoti("started:", "sc job", 3)
    labelml:UpdateLabel("log: Started Sword Cutting Job")
end)

local InfoTab = Window:NewTab("logs")
local InfoSection = InfoTab:NewSection("lowk useless since i added notification z")
InfoSection:NewLabel("log:")
local labelafstate = InfoSection:NewLabel("")
InfoSection:NewLabel("warn:")
local labelafwarn = InfoSection:NewLabel("")

local function onJobEnded()
    if not autoFarmEnabled or isProcessing then return end
    
    isProcessing = true
    createnoti("job ended - ", "starting autofarm", 3)
    labelafstate:UpdateLabel("Job Ended - Starting Auto Process")

    wait(1)
--[[
    createnoti("cashing out money", "", 3)
    labelafstate:UpdateLabel("Cashing Out...")
    local success, err = pcall(function()
        ClaimBank:FireServer()
    end)
    if not success then
        createnoti("warn: failed to cash out", "", 3)
        labelafwarn:UpdateLabel("Failed to cash out:", err)
    end
    wait(0.5)
    --]]

    createnoti("buying sd (4)", "", 3)
    labelafstate:UpdateLabel("Buying 4 Sports Drinks...")
    for i = 1, 4 do
        local success, err = pcall(function()
            BuyItem:InvokeServer("SportsDrink")
        end)
        if not success then
            createnoti("warn: failed to buy sd", "", 3)
            labelafwarn:UpdateLabel("Failed to buy sports drink:", err)
        end
        wait(0.2)
    end

    createnoti("consuming sd (4)", "", 3)
    labelafstate:UpdateLabel("Consuming 4 Sports Drinks...")
    for i = 1, 4 do
        local success, err = pcall(function()
            ConsumeFood:FireServer("SportsDrink")
        end)
        if not success then
            createnoti("warn: failed to consume", "", 3)
            labelafwarn:UpdateLabel("Failed to consume sports drink:", err)
        end
        wait(0.2)
    end

    createnoti("tping to sc", "", 3)
    labelafstate:UpdateLabel("Teleporting to Sword Cutting...")
    wait(0.5)
    local success, err = pcall(function()
        Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    end)
    if not success then
        createnoti("failed to tp", "", 3)
        labelafwarn:UpdateLabel("Failed to teleport:", err)
    end

    wait(1)

    createnoti("starting sc job", "", 3)
    labelafstate:UpdateLabel("Starting Sword Cutting Job...")
    local success, err = pcall(function()
        StartJob:FireServer("SwordCuttingGame")
    end)
    if not success then
        createnoti("warn: failed to start job", "", 3)
        labelafwarn:UpdateLabel("Failed to start job:", err)
    end
    createnoti("waiting...", "", 3)
    labelafstate:UpdateLabel("waiting for next job end")
    isProcessing = false
end

JobEnded.OnClientEvent:Connect(onJobEnded)

local nigga = Window:NewTab("info")
local nisec = nigga:NewSection("start a job first")
nisec:NewLabel("make sure it end as 0 enegry")
nisec:NewLabel("cash out is bugged")
nisec:NewKeybind("toggle ui", "kys", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

createnoti("script loaded", "only made for sword cutting cuz its ez money", 3)