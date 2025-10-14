local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local JobEnded = ReplicatedStorage.Systems.Jobs.JobEnded
local BuyItem = ReplicatedStorage.Systems.Shop.BuyItem
local ConsumeFood = ReplicatedStorage.Systems.Food.ConsumeFood
local Warp = ReplicatedStorage.Systems.Teleport.Warp
local StartJob = ReplicatedStorage.Systems.Jobs.StartJob

local autoFarmEnabled = false
local isProcessing = false

local Window = Library.CreateLib("$10000 script", "Midnight")

local MainTab = Window:NewTab("main")
local MainSection = MainTab:NewSection("auto farm")

local labelaf = MainSection:NewLabel("af state: ")
MainSection:NewToggle("sword cutting", "Automatically farm sword cutting job", function(state)
    autoFarmEnabled = state
    if state then
        labelaf:UpdateLabel("af state: Enabled")
    else
        labelaf:UpdateLabel("af state: Disabled")
    end
end)

--[[
local ControlSection = MainTab:NewSection("misc")
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

ControlSection:NewButton("TP to Sword Cutting", "Teleport to sword cutting location", function()
    Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    labelml:UpdateLabel("log: Teleported to Sword Cutting")
end)

ControlSection:NewButton("TP to home (default)", "Teleport to sword cutting location", function()
    Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    labelml:UpdateLabel("log: Teleported to Sword Cutting")
end)

ControlSection:NewButton("Start Sword Cutting Job", "Start the sword cutting job", function()
    StartJob:FireServer("SwordCuttingGame")
    labelml:UpdateLabel("log: Started Sword Cutting Job")
end)
--]]

-- Info Section
local InfoTab = Window:NewTab("logs")
local InfoSection = InfoTab:NewSection("lowk useless since i added notification z")
InfoSection:NewLabel("log:")
local labelafstate = InfoSection:NewLabel("")
InfoSection:NewLabel("warn:")
local labelafwarn = InfoSection:NewLabel("")

-- Function to handle job completion
local function onJobEnded()
    if not autoFarmEnabled or isProcessing then return end
    
    isProcessing = true
    labelafstate:UpdateLabel("Job Ended - Starting Auto Process")
    
    -- Wait a moment for safety
    wait(1)
    
    -- Cash Out
    labelafstate:UpdateLabel("Cashing Out...")
    local success, err = pcall(function()
        ClaimBank:FireServer()
    end)
    if not success then
        labelafwarn:UpdateLabel("Failed to cash out:", err)
    end
    wait(0.5)

    -- Buy 4 Sports Drinks
    labelafstate:UpdateLabel("Buying 4 Sports Drinks...")
    for i = 1, 4 do
        local success, err = pcall(function()
            BuyItem:InvokeServer("SportsDrink")
        end)
        if not success then
            labelafwarn:UpdateLabel("Failed to buy sports drink:", err)
        end
        wait(0.2)
    end
    
    -- Consume 4 Sports Drinks
    print("Consuming 4 Sports Drinks...")
    for i = 1, 4 do
        local success, err = pcall(function()
            ConsumeFood:FireServer("SportsDrink")
        end)
        if not success then
            labelafwarn:UpdateLabel("Failed to consume sports drink:", err)
        end
        wait(0.2)
    end
    
    -- Teleport to Sword Cutting
    labelafstate:UpdateLabel("Teleporting to Sword Cutting...")
    wait(0.5)
    local success, err = pcall(function()
        Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    end)
    if not success then
        labelafwarn:UpdateLabel("Failed to teleport:", err)
    end
    
    -- Wait for teleport to complete
    wait(1)
    
    -- Start Sword Cutting Job
    labelafstate:UpdateLabel("Starting Sword Cutting Job...")
    local success, err = pcall(function()
        StartJob:FireServer("SwordCuttingGame")
    end)
    if not success then
        labelafwarn:UpdateLabel("Failed to start job:", err)
    end
    
    labelafstate:UpdateLabel("witing for next job end")
    isProcessing = false
end

JobEnded.OnClientEvent:Connect(onJobEnded)

local nigga = Window:NewTab("info")
local nisec = nigga:NewSection("start a job first")
nisec:NewLabel("make sure it 0 enegry")
nisec:NewKeybind("toggle ui", "kys", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

Library.createnoti("script loaded", "nigga", 3)