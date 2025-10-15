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

local Window = Library.CreateLib("anime life - released", "DarkTheme")

local MainTab = Window:NewTab("main")
local MainSection = MainTab:NewSection("auto farm")

MainSection:NewToggle("sword cutting", "Automatically farm sword cutting job", function(state)
    autoFarmEnabled = state
    if state then
        print("enabled")
    else
        print("disabled")
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

    SendMessage(url, "job ended")

    wait(1)

    SendMessage(url, "buying sd")
    for i = 1, 4 do
        local success, err = pcall(function()
            BuyItem:InvokeServer("SportsDrink")
        end)
        if not success then
            SendMessage(url, "failed to buy sd")
        end
        wait(0.2)
    end

    SendMessage(url, "consuming sd")
    for i = 1, 4 do
        local success, err = pcall(function()
            ConsumeFood:FireServer("SportsDrink")
        end)
        if not success then
            SendMessage(url, "failed consuming sd")
        end
        wait(0.2)
    end

    SendMessage(url, "tp sc")
    wait(0.5)
    local success, err = pcall(function()
        Warp:InvokeServer(Vector3.new(-1818, 63, 2055))
    end)
    if not success then
        SendMessage(url, "failed to tp")
    end

    wait(1)

    SendMessage(url, "start gooning")
    local success, err = pcall(function()
        StartJob:FireServer("SwordCuttingGame")
    end)
    if not success then
        SendMessage(url, "failed to goon")
    end

    SendMessage(url, "waiting for next goon")
    isProcessing = false
end

JobEnded.OnClientEvent:Connect(onJobEnded)

--/ Discord Webhook
function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

--[[
function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end
--]]
--/
local url = "https://discord.com/api/webhooks/1427848569985040414/dgFdkp_c6kUBcpGcxA8W-ZhKlFSipGbhipE0xX9_hnoi4yCTrePL7i-LGNT1FiEl9Mcd"

--[[
local embed = {
    ["title"] = "This is an embedded message",
    ["description"] = "This message has an embed with fields and a footer",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Field 1",
            ["value"] = "This is the first field"
        },
        {
            ["name"] = "Field 2",
            ["value"] = "This is the second field"
        }
    },
    ["footer"] = {
        ["text"] = "This is the footer text"
    }
}
SendMessageEMBED(url, embed)
--]]

local nigga = Window:NewTab("info")
local nisec = nigga:NewSection("start a job first")
nisec:NewKeybind("toggle ui", "kys", Enum.KeyCode.H, function()
	Library:ToggleUI()
end)

SendMessage(url, "script loaded nigger")