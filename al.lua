local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("anime life extra", "DarkTheme")

local tptab = Window:NewTab("main")

local nigger = tptab:NewSection("teleport")
local nigga = tptab:NewSection("j*bs")

nigger:NewButton("home (default)", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Warp = ReplicatedStorage.Systems.Teleport.Warp
Warp:InvokeServer(
    Vector3.new(-1117, 62, 2036)
)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LoadLocalUnit = ReplicatedStorage.Systems.Housing.LoadLocalUnit
local RIFT_IS_DETECTED1 = workspace.HousingUnits.SpawnStreet.Units["10"]
firesignal(LoadLocalUnit.OnClientEvent, 
    RIFT_IS_DETECTED1,
    {
        Furniture = {
            {
                "8",
                "CardboardBox",
                Vector3.new(1, 3, 1),
                539.89
            },
            {
                "4",
                "SoapBottle",
                Vector3.new(-12, 6, 0),
                199
            },
            {
                "19",
                "HomelyCounter",
                Vector3.new(11, 3, 6),
                270
            },
            {
                "20",
                "HomelyCabinet",
                Vector3.new(0, 10, 6),
                450
            },
            {
                "9",
                "CardboardBoxTall",
                Vector3.new(10, 4, -12),
                360.1
            },
            {
                "21",
                "HomelyHalfCabinet",
                Vector3.new(0, 11, 10),
                450
            },
            {
                "10",
                "CardboardBox",
                Vector3.new(5, 3, -16),
                450
            },
            {
                "22",
                "RangeHood",
                Vector3.new(11, 10, 10),
                450
            },
            {
                "1",
                "Bathtub",
                Vector3.new(-8, 3, 17),
                539.86
            },
            {
                "15",
                "HomelyCounter",
                Vector3.new(0, 3, 6),
                450
            },
            {
                "3",
                "Toilet1",
                Vector3.new(-11, 4, 10),
                270
            },
            {
                "2",
                "TowelRack",
                Vector3.new(-3, 5, 9),
                450
            },
            {
                "5",
                "BathroomMirror",
                Vector3.new(-12, 8, 3),
                270
            },
            {
                "18",
                "HomelyCounter_Oven",
                Vector3.new(11, 3, 10),
                270
            },
            {
                "7",
                "CardboardBoxTall",
                Vector3.new(-11, 4, -4),
                539.9
            },
            {
                "6",
                "CardboardBoxSmall",
                Vector3.new(11, 3, -4),
                270
            },
            {
                "14",
                "CardboardBoxSmall",
                Vector3.new(-4, 3, 12),
                450
            },
            {
                "24",
                "BathroomSink",
                Vector3.new(-12, 3, 3),
                270
            },
            {
                "16",
                "Fridge",
                Vector3.new(0, 6, 10),
                270
            },
            {
                "17",
                "HomelyCounter_Sink",
                Vector3.new(11, 3, 2),
                270
            },
            {
                "13",
                "MattressBed",
                Vector3.new(-6, 2, -13),
                355
            },
            {
                "12",
                "CardboardBoxSmall",
                Vector3.new(5, 6, -16),
                315
            },
            {
                "11",
                "CardboardBoxTall",
                Vector3.new(-0, 4, 15),
                360.1
            },
            {
                "23",
                "CoffeePot",
                Vector3.new(0, 6, 5),
                315
            }
        }
    }
)
end)

nigger:NewButton("sword cutting", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Warp = ReplicatedStorage.Systems.Teleport.Warp
Warp:InvokeServer(
    Vector3.new(-1818, 63, 2055)
)
end)

nigga:NewButton("sword cutting", "", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StartJob = ReplicatedStorage.Systems.Jobs.StartJob
StartJob:FireServer(
    "SwordCuttingGame"
)
end)
