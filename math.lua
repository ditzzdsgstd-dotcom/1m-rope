local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "ðŸ¤“ Math Wall Simulator",
    LoadingTitle = "YoxanXHub",
    LoadingSubtitle = "Please, Join discord for more scripts!",
    KeySystem = false,
    KeySettings = {
        Title = "YoxanXHub",
        Subtitle = "Key System",
        Note = "https://discord.gg/edsBT9Vy",
        SaveKey = true,
        GrabKeyFromSite = true,
        FileName = "yoxanxhub",
        Key = { "YOXANXHUB_Ep9vXa3NtLjQwZ" }
    },
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "YoxanXhub",
        FileName = "KhSaeedHub"
    },
    Discord = {
        Enabled = true,
        Invite = "https://discord.gg/edsBT9Vy",
        RememberJoins = true
    }
})

local MainTab = Window:CreateTab("Main")
local StarsSection = MainTab:CreateSection("Stars")

MainTab:CreateButton({
    Name = "Infinite Stars",
    Callback = function()
        giveStars(1000000000)
    end
})

MainTab:CreateToggle({
    Name = "Auto Infinite Stars",
    CurrentValue = false,
    Flag = "AutoStars",
    Callback = function(state)
        autoStars = state
        if autoStars then
            task.spawn(function()
                while autoStars do
                    giveStars(1000000000)
                    task.wait(2) -- adjust delay if needed
                end
            end)
        end
    end
})

MainTab:CreateButton({
    Name = "Fix -ve Stars",
    Callback = function()
        local stars = game.Players.LocalPlayer.leaderstats.Stars
        giveStars(-stars.Value)
    end
})

local SpinsSection = MainTab:CreateSection("Spins")

MainTab:CreateButton({
    Name = "Infinite Spins",
    Callback = function()
        giveSpins()
    end
})

MainTab:CreateToggle({
    Name = "Auto Spin Wheel",
    CurrentValue = false,
    Flag = "AutoSpin",
    Callback = function(state)
        autoSpin = state
        if autoSpin then
            task.spawn(function()
                while autoSpin do
                    getSpin()
                    task.wait(0.1)
                end
            end)
        end
    end
})

local WinTab = Window:CreateTab("Win")
local WinSection = WinTab:CreateSection("Win")

for i = 1, 20 do
    WinTab:CreateButton({
        Name = "Instant Win Class " .. i,
        Callback = function()
            winClass(i)
        end
    })
end

local CreditsTab = Window:CreateTab("Credits", 14848261712)
CreditsTab:CreateSection("Credits to: KhSaeedHub")

CreditsTab:CreateButton({
    Name = "Scriptblox Profile",
    Callback = function()
        setclipboard("https://scriptblox.com/u/KhSaeed90")
        Rayfield:Notify({
            Image = 14848261712,
            Duration = 5,
            Title = "Link is copied",
            Content = "Check scriptblox profile page for more Scripts!"
        })
    end
})

CreditsTab:CreateButton({
    Name = "Discord Server",
    Callback = function()
        setclipboard("https://controlc.com/5572471c")
        Rayfield:Notify({
            Image = 14848261712,
            Duration = 5,
            Title = "Link is copied",
            Content = "Join discord server for more Scripts!"
        })
    end
})

-- === Functional Definitions ===

function giveStars(amount)
    game.ReplicatedStorage.Events.Player.treasureChestCollection:FireServer(amount)
end

function winClass(classIndex)
    for _, part in ipairs(workspace.Map.SpecialParts.Finishes:GetChildren()) do
        if tonumber(part.Name:match("%d+")) == classIndex then
            game.Players.LocalPlayer.Character:PivotTo(part.CFrame)
            break
        end
    end
end

function giveSpins()
    for i = 1, 80 do
        game.ReplicatedStorage.Events.Gui.Quests:FireServer("gaL5")
    end
end

function clearPopups()
    local gui = game.Players.LocalPlayer.PlayerGui
    gui.PopUps.InfoHolder:ClearAllChildren()
    gui.PopUps.Stats:ClearAllChildren()
end

function teleportToSpawn()
    for _, spawn in ipairs(workspace.Map.SpecialParts.Spawns:GetChildren()) do
        tonumber(spawn.Name:match("%d+"))
    end
end

function giveBadge()
    local badgeIds = {
        "spins", "wins", "rebirths", "speed", "jumps", "donations",
        "eggs", "pets", "taps", "gems", "strength", "luck", "rebirth2",
        "trophies", "stars", "mathwalls"
    }

    for _, badge in ipairs(badgeIds) do
        game.ReplicatedStorage.Events.Badges:FireServer(badge)
        wait(0.5)
    end
end

function buyAllGears()
    for _, gear in ipairs(game:GetService("ReplicatedStorage").Gears:GetChildren()) do
        game.ReplicatedStorage.Events.BuyGear:FireServer(gear.Name)
    end
end

local autoSpin = false

function getSpin()
    for i = 1, 80 do
        game.ReplicatedStorage.Events.Gui.Quests:FireServer("gaL5")
    end
end

local autoStars = false

function giveStars(amount)
    game.ReplicatedStorage.Events.Player.treasureChestCollection:FireServer(amount)
end
