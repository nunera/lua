local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Hog Rider Farmer", HidePremium = true, SaveConfig = true, ConfigFolder = "HogRiderFarmer",IntroText = "Hog Rider Farmer Loading..."})
local plr = game.Players.LocalPlayer.Name
local del = .8
local bdel = .1
local hdel = .1
local Farmer = Window:MakeTab({
    Name = "Autofarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
_G.heh = false
local farm = Farmer:AddToggle({
    Name = "Farm",
    Default = false,
    Callback = function(we)
        if we then
            _G.heh = true
            while _G.heh do 
                workspace.Characters[plr].CharacterHandler.M1:FireServer("Down", false)
                task.wait(del)
                workspace.Characters[plr].CharacterHandler.F:FireServer("Down")
                workspace.Characters[plr].CharacterHandler.F:FireServer("Up")
                task.wait(bdel)
            end
        else
            _G.heh = false
        end
    end
})

local bind = Farmer:AddBind({
    Name = "Keybind",
    Default = "",
    Hold = false,
    Callback = function()
        if _G.heh then
            farm:Set(false)
        else
            farm:Set(true)
        end
    end
})

local hdelay = Farmer:AddSlider({
    Name = "Hit Delay",
    Min = 0,
    Max = 3,
    Default = .8,
    Color = Color3.fromRGB(75,75,75),
    Increment = .1,
    ValueName = "Seconds",
    Callback = function(val)
        del = val
    end
})

local bdelay = Farmer:AddSlider({
    Name = "Block Delay",
    Min = 0,
    Max = 3,
    Default = .1,
    Color = Color3.fromRGB(120,80,120),
    Increment = .1,
    ValueName = "Seconds",
    Callback = function(val)
        bdel = val
    end
})

OrionLib:Init()
