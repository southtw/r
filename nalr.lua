--/ 2.693.960

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local JobEnded = ReplicatedStorage.Systems.Jobs.JobEnded
local BuyItem = ReplicatedStorage.Systems.Shop.BuyItem
local ConsumeFood = ReplicatedStorage.Systems.Food.ConsumeFood
local Warp = ReplicatedStorage.Systems.Teleport.Warp
local StartJob = ReplicatedStorage.Systems.Jobs.StartJob

local autoFarmEnabled = false
local isProcessing = false

local Window = Library.CreateLib("kamidere", "DarkTheme")

local MainTab = Window:NewTab("main")
local MainSection = MainTab:NewSection("auto farm")

MainSection:NewToggle("sword cutting", "Automatically farm sword cutting job", function(state)
    autoFarmEnabled = state
    if state then
    else
    end
end)

local ControlSection = MainTab:NewSection("misc")

ControlSection:NewButton("buy 4 sports drinks", "Purchase 4 sports drinks", function()
    for i = 1, 4 do
        BuyItem:InvokeServer("SportsDrink")
        wait(0.1)
    end
end)

ControlSection:NewButton("consume 4 sports drinks", "Consume 4 sports drinks", function()
    for i = 1, 4 do
        ConsumeFood:FireServer("SportsDrink")
        wait(0.1)
    end
end)


ControlSection:NewButton("TP to Sword Cutting", "Teleport to sword cutting location", function()
    Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
end)

ControlSection:NewButton("Start Sword Cutting Job", "Start the sword cutting job", function()
    StartJob:FireServer("SwordCuttingGame")
end)

local function onJobEnded()
    if not autoFarmEnabled or isProcessing then return end
    
    isProcessing = true

    wait(1)

    for i = 1, 4 do
        local success, err = pcall(function()
            BuyItem:InvokeServer("SportsDrink")
        end)
        if not success then
        end
        wait(0.2)
    end

    for i = 1, 4 do
        local success, err = pcall(function()
            ConsumeFood:FireServer("SportsDrink")
        end)
        if not success then
        end
        wait(0.2)
    end

    wait(0.5)
    local success, err = pcall(function()
        Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    end)
    if not success then
    end

    wait(1)

    local success, err = pcall(function()
        StartJob:FireServer("SwordCuttingGame")
    end)
    if not success then
    end

    isProcessing = false
end

JobEnded.OnClientEvent:Connect(onJobEnded)

local nigga = Window:NewTab("info")
local nisec = nigga:NewSection("settings")
nisec:NewKeybind("toggle ui", "kys", Enum.KeyCode.H, function()
	Library:ToggleUI()
end)