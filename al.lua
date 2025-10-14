--

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("$10000 script", "Sentinel")

local maintab = Window:NewTab("main")
local auto = Window:NewTab("autofarm")

local nigger = maintab:NewSection("teleport")
local nigga = maintab:NewSection("jobs")
--local misc = maintab:NewSection("misc")
local afs = auto:NewSection("main")

nigger:NewButton("home (default)", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Warp = ReplicatedStorage.Systems.Teleport.Warp
Warp:InvokeServer(
    Vector3.new(-1117, 62, 2036)
)
end)

nigger:NewButton("shop (default)", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Warp = ReplicatedStorage.Systems.Teleport.Warp
Warp:InvokeServer(
    Vector3.new(-1179, 63, 1982)
)
end)

nigger:NewButton("sword cutting", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Warp = ReplicatedStorage.Systems.Teleport.Warp
Warp:InvokeServer(
    Vector3.new(-1818, 63, 2055)
)
end)

nigga:NewButton("sword cutting", "you need to teleport first", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StartJob = ReplicatedStorage.Systems.Jobs.StartJob
StartJob:FireServer(
    "SwordCuttingGame"
)
end)

--[[
misc:NewButton("sleep (default)", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Use = ReplicatedStorage.Systems.Objects.Members.Bed.Use 

local SpawnStreet = workspace.HousingUnits.SpawnStreet
local --random = SpawnStreet.Units["%s"] --nigger developer
local Furniture = --random.Home.Furniture
local Seat = Furniture["13"].Server.Seat

Use:FireServer(
    Furniture["13"],
    Seat
)
end)
--]]
