local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "MeepCity: " .. identifyexecutor(),
   LoadingTitle = "im love meepcity",
   LoadingSubtitle = "by atvepeng01",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
})

_G.AutoFarm = true

function AutoFarm() 
    while _G.AutoFarm == true do 
        game:GetService("ReplicatedStorage").Connection:InvokeServer(11,{
            ["Power"] = 1,
            ["FishingZonePos"] = Vector3.new(0,0,0),
            ["Face"] =  Vector3.new(0,0,0),
            ["PlayerPos"] = Vector3.new(0,0,0),
            ["FishingPolePos"] = Vector3.new(0,0,0),
        })
        game:GetService("ReplicatedStorage").Connection:InvokeServer(49)
        game:GetService("ReplicatedStorage").Connection:InvokeServer(51)
        wait(1)
    end
end

local Tab = Window:CreateTab("Home")

local Paragraph = Tab:CreateParagraph({Title = "My Coins", Content = "Coins"})

local Toggle = Tab:CreateToggle({
   Name = "Free GamePass",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	    game.Players.LocalPlayer:SetAttribute("PLUS",Value)
	    game.Players.LocalPlayer:SetAttribute("BoomBox",Value)    
   end,
})

local Tab = Window:CreateTab("AutoFarm")

local Toggle = Tab:CreateToggle({
   Name = "AutoFarm",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        _G.AutoFarm = Value 
        AutoFarm()
   end,
})

local Button = Tab:CreateButton({
   Name = "Получить удочку",
   Callback = function()
        game:GetService("ReplicatedStorage").Connection:InvokeServer(9)
   end,
})

local Button = Tab:CreateButton({
   Name = "Убрать удочку",
   Callback = function()
        game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(12)
   end,
})

local Button = Tab:CreateButton({
   Name = "StarBall",
   Callback = function()
        local playerId = game.Players.LocalPlayer.UserId
        local ballId = "Ball_" .. tostring(playerId)
        local ball = game.Workspace:FindFirstChild(ballId)
        local finishModel = game.Workspace.MapObject:FindFirstChild("FinishModel")
        local finishUnion = finishModel and finishModel:FindFirstChild("Union")
        local backupFinish = game.Workspace.MapObject:FindFirstChild("FINISH")
        local backupUnion = backupFinish and backupFinish:FindFirstChild("Union")

        if not ball then
            warn("Объект " .. ballId .. " не найден в Workspace!")
            return
        end

        while true do
            local stars = game.Workspace.MapObject:GetChildren()
            local starFound = false

            for _, obj in ipairs(stars) do
                if obj.Name == "STAR" then
                    starFound = true
                    ball.Position = obj.Position
                    wait()
                    obj.Position = ball.Position
                    wait()
                end
            end

            if not starFound then
                wait()
                if finishUnion then
                    ball.Position = finishUnion.Position
                elseif backupUnion then
                    ball.Position = backupUnion.Position
                end
                break
            end

            wait()
        end
   end,
})

local Tab = Window:CreateTab("Fun")

local Button = Tab:CreateButton({
   Name = "Infinite-Yield",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "добавить себя в друзя",
   Callback = function()
        game:GetService("ReplicatedStorage").Connection:InvokeServer(158,3,game.Players.LocalPlayer.UserId)
   end,
})

local Tab = Window:CreateTab("Spy")

local Label = Tab:CreateLabel("Label Example")

local Button = Tab:CreateButton({
   Name = "Coins Spy",
   Callback = function()
        Label:Set(game.Players:FindFirstChild(game.Players.LocalPlayer.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")):GetAttribute("Coins"))
   end,
})

local Tab = Window:CreateTab("Visuals")

local Button = Tab:CreateButton({
   Name = "ADBlock",
   Callback = function()
        game.Workspace.RobloxAds:Destroy()
   end,
})

local Button = Tab:CreateButton({
   Name = "Visible ButtonServerBrowser",
   Callback = function()
        game.Players.LocalPlayer.PlayerGui.MapGui.Map.Container.ButtonServerBrowser.Visible = true
   end,
})

local Button = Tab:CreateButton({
   Name = "Anti Snowball Screen",
   Callback = function()
        game.Workspace.RobloxAds:Destroy()
   end,
})

local Button = Tab:CreateButton({
   Name = "Золотая удочка",
   Callback = function()
        local fishing = game.Players.LocalPlayer.Character:WaitForChild("Fishing")

        local existingHighlight = fishing:FindFirstChildOfClass("Highlight")
        if existingHighlight then
            existingHighlight:Destroy()
        end

        local highlight = Instance.new("Highlight", fishing)
        highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        highlight.FillColor = Color3.new(1, 1, 0)
        highlight.OutlineTransparency = 1
   end,
})

local ColorPicker = Tab:CreateColorPicker({
    Name = "Кастомная потсветка удочки",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local fishing = game.Players.LocalPlayer.Character:WaitForChild("Fishing")

        local existingHighlight = fishing:FindFirstChildOfClass("Highlight")
        if existingHighlight then
            existingHighlight:Destroy()
        end

        local highlight = Instance.new("Highlight", fishing)
        highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        highlight.FillTransparency = 0.15
        highlight.FillColor = Value
        highlight.OutlineTransparency = 1
    end
})

local Button = Tab:CreateButton({
   Name = "Удалить потсветку удочки",
   Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Fishing"):FindFirstChildOfClass("Highlight"):Destroy()
   end,
})

local Button = Tab:CreateButton({
   Name = "UnButtonBuyCoins",
   Callback = function()
        game.Players.atvepeng01.PlayerGui.MainGui.CoinsContainer.ButtonBuyCoins.Visible = false
   end,
})

local Tab = Window:CreateTab("Dev")

local Button = Tab:CreateButton({
   Name = "Make Offsale Assets Available",
   Callback = function()
        for _, shopName in ipairs({"Furniture", "Toys", "HomeImprovement", "PetShop"}) do
            local shop = require(game:GetService("ReplicatedStorage"):WaitForChild(string.format("Shop_%s", shopName)))
            shop.Categories[666] = {CategoryId = 666, Image = 5277185610, CatTitle = "offsale ;)"}
            for _, asset in pairs(shop.Assets) do
                asset.ForSale, asset.CatId, asset.Desc = true, 666, "This is an offsale item!"
                asset.Details.Price.HalloweenCandy = nil
            end
        end
   end,
})

local Tab = Window:CreateTab("Teleports")

local Button = Tab:CreateButton({
   Name = "Winter Neighborhood",
   Callback = function()
        game:GetService("TeleportService"):Teleport(4543770840)
   end,
})

local Button = Tab:CreateButton({
   Name = "Neighborhood",
   Callback = function()
        game:GetService("TeleportService"):Teleport(3345157534)
   end,
})

local Button = Tab:CreateButton({
   Name = "Classic Neighborhood",
   Callback = function()
        game:GetService("TeleportService"):Teleport(4543727449)
   end,
})

local Button = Tab:CreateButton({
   Name = "School",
   Callback = function()
        game:GetService("TeleportService"):Teleport(3272055484)
   end,
})

local Button = Tab:CreateButton({
   Name = "Pizza Shack",
   Callback = function()
        game:GetService("TeleportService"):Teleport(3345269329)
   end,
})

local Button = Tab:CreateButton({
   Name = "Ice Cream Parlor",
   Callback = function()
        game:GetService("TeleportService"):Teleport(8021083545)
   end,
})


local Button = Tab:CreateButton({
   Name = "Cafe",
   Callback = function()
        game:GetService("TeleportService"):Teleport(8089223830)
   end,
})

local Button = Tab:CreateButton({
   Name = "Kart Racing",
   Callback = function()
        game:GetService("TeleportService"):Teleport(12732623906)
   end,
})

local Button = Tab:CreateButton({
   Name = "Loading",
   Callback = function()
        game:GetService("TeleportService"):Teleport(1130478639)
   end,
})

while wait() do 
    Paragraph:Set({Title = "My Coins", Content = game.Players.LocalPlayer:GetAttribute("Coins")})
end

Rayfield:LoadConfiguration()
