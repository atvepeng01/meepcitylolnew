local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Window = Rayfield:CreateWindow({
    Name = MarketplaceService:GetProductInfo(game.PlaceId).Name .. ": " .. (identifyexecutor() or "Unknown"),
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by atvepeng01",
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

_G.UnVisibleButtonServerBrowser = true

function UnVisibleButtonServerBrowser() 
    while _G.UnVisibleButtonServerBrowser == true do 
        game.Players.LocalPlayer.PlayerGui.MapGui.Map.Container.ButtonServerBrowser.Visible = true
        wait()
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
        game.Players.LocalPlayer:SetAttribute("CandyPack",Value)  
   end,
})

local Avatar = Window:CreateTab("Avatar", 4483362458)

local SelectCharacter = Avatar:CreateParagraph({
    Title = "Select Character",
    Content = "Paragraph Example"
})

local Button = Avatar:CreateButton({
    Name = "Load Avatar",
    Callback = function()
        local function service(...) return game:GetService(...) end
        local Players = service("Players")
        local ReplicatedStorage = service("ReplicatedStorage")

        local player = Players.LocalPlayer
        local username = player and player.PlayerGui and player.PlayerGui.PlayerDialogGui and
                         player.PlayerGui.PlayerDialogGui.Container and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")

        if username then
            local targetPlayer = Players:FindFirstChild(username)
            if targetPlayer then
                local character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
                if character then
                    local humanoidDescription = character.Humanoid.HumanoidDescription

                    local args = {
                        "[0,\"" .. username .. "\",{" ..
                        "\"SwimAnimation\":" .. humanoidDescription.SwimAnimation ..
                        ",\"Face\":" .. humanoidDescription.Face ..
                        ",\"ProportionScale\":" .. humanoidDescription.ProportionScale ..
                        ",\"ClimbAnimation\":" .. humanoidDescription.ClimbAnimation ..
                        ",\"Shirt\":" .. humanoidDescription.Shirt ..
                        ",\"FaceAccessory\":\"" .. humanoidDescription.FaceAccessory ..
                        "\",\"RightArmColor\":[\"" ..
                        tostring(humanoidDescription.RightArmColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.RightArmColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.RightArmColor.B * 255) .. "\"]" ..
                        ",\"HairAccessory\":\"" .. humanoidDescription.HairAccessory ..
                        "\",\"RightArm\":" .. humanoidDescription.RightArm ..
                        ",\"Head\":" .. humanoidDescription.Head ..
                        ",\"FallAnimation\":" .. humanoidDescription.FallAnimation ..
                        ",\"TorsoColor\":[\"" ..
                        tostring(humanoidDescription.TorsoColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.TorsoColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.TorsoColor.B * 255) .. "\"]" ..
                        ",\"DepthScale\":" .. humanoidDescription.DepthScale ..
                        ",\"RightLeg\":" .. humanoidDescription.RightLeg ..
                        ",\"HeightScale\":" .. humanoidDescription.HeightScale ..
                        ",\"LeftLeg\":" .. humanoidDescription.LeftLeg ..
                        ",\"RightLegColor\":[\"" ..
                        tostring(humanoidDescription.RightLegColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.RightLegColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.RightLegColor.B * 255) .. "\"]" ..
                        ",\"LeftLegColor\":[\"" ..
                        tostring(humanoidDescription.LeftLegColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.LeftLegColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.LeftLegColor.B * 255) .. "\"]" ..
                        ",\"WidthScale\":" .. humanoidDescription.WidthScale ..
                        ",\"BodyTypeScale\":" .. humanoidDescription.BodyTypeScale ..
                        ",\"BackAccessory\":\"" .. humanoidDescription.BackAccessory ..
                        "\",\"LeftArmColor\":[\"" ..
                        tostring(humanoidDescription.LeftArmColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.LeftArmColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.LeftArmColor.B * 255) .. "\"]" ..
                        ",\"Emotes\":[],\"GraphicTShirt\":" .. humanoidDescription.GraphicTShirt ..
                        ",\"Pants\":" .. humanoidDescription.Pants ..
                        ",\"Torso\":" .. humanoidDescription.Torso ..
                        ",\"LeftArm\":" .. humanoidDescription.LeftArm ..
                        ",\"HeadColor\":[\"" ..
                        tostring(humanoidDescription.HeadColor.R * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.HeadColor.G * 255) .. "\"," ..
                        "\"" .. tostring(humanoidDescription.HeadColor.B * 255) .. "\"]" ..
                        ",\"RunAnimation\":" .. humanoidDescription.RunAnimation ..
                        ",\"IdleAnimation\":" .. humanoidDescription.IdleAnimation ..
                        ",\"HatAccessory\":\"" .. humanoidDescription.HatAccessory ..
                        "\",\"HeadScale\":" .. humanoidDescription.HeadScale ..
                        ",\"JumpAnimation\":" .. humanoidDescription.JumpAnimation ..
                        ",\"WalkAnimation\":" .. humanoidDescription.WalkAnimation ..
                        ",\"ShouldersAccessory\":\"" .. humanoidDescription.ShouldersAccessory .. "\"}]"
                    }

                    ReplicatedStorage:WaitForChild("FunctionConnections"):WaitForChild("NewAEWearTemporaryOutfit"):InvokeServer(unpack(args))

                    print("Avatar data saved successfully!")

                else
                    print("Couldn't find the target player's character!")
                end
            else
                print("Couldn't find the target player!")
            end
        else
            print("Couldn't get the username from the player's GUI!")
        end
    end,
})

local Button = Avatar:CreateButton({ -- Use Avatar as the tab reference
    Name = "Save Avatar",
    Callback = function()
        local function service(...) return game:GetService(...) end
        local Players = service("Players")
        local ReplicatedStorage = service("ReplicatedStorage")

        local Connection = ReplicatedStorage:WaitForChild("Connection")
        
        -- Get the target player's username
        local player = Players.LocalPlayer
        local username = player and player.PlayerGui and player.PlayerGui.PlayerDialogGui and
                         player.PlayerGui.PlayerDialogGui.Container and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername and
                         player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")

        if username then
            -- Find the target player
            local targetPlayer = Players:FindFirstChild(username)

            if targetPlayer then
                -- Wait for the player's character to load
                local character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()

                if character then
                    -- Extract the avatar data
                    local humanoidDescription = character.Humanoid.HumanoidDescription
                    local avatarData = {
                        SwimAnimation = humanoidDescription.SwimAnimation,
                        Torso = humanoidDescription.Torso,
                        ProportionScale = humanoidDescription.ProportionScale,
                        ClimbAnimation = humanoidDescription.ClimbAnimation,
                        Shirt = humanoidDescription.Shirt,
                        FaceAccessory = humanoidDescription.FaceAccessory,
                        RightArmColor = {
                            [1] = tostring(humanoidDescription.RightArmColor.R * 255),
                            [2] = tostring(humanoidDescription.RightArmColor.G * 255),
                            [3] = tostring(humanoidDescription.RightArmColor.B * 255)
                        },
                        HairAccessory = humanoidDescription.HairAccessory,
                        RightArm = humanoidDescription.RightArm,
                        Head = humanoidDescription.Head,
                        FallAnimation = humanoidDescription.FallAnimation,
                        TorsoColor = {
                            [1] = tostring(humanoidDescription.TorsoColor.R * 255),
                            [2] = tostring(humanoidDescription.TorsoColor.G * 255),
                            [3] = tostring(humanoidDescription.TorsoColor.B * 255)
                        },
                        DepthScale = humanoidDescription.DepthScale,
                        LeftArm = humanoidDescription.LeftArm,
                        HeightScale = humanoidDescription.HeightScale,
                        LeftLeg = humanoidDescription.LeftLeg,
                        RightLegColor = {
                            [1] = tostring(humanoidDescription.RightLegColor.R * 255),
                            [2] = tostring(humanoidDescription.RightLegColor.G * 255),
                            [3] = tostring(humanoidDescription.RightLegColor.B * 255)
                        },
                        LeftLegColor = {
                            [1] = tostring(humanoidDescription.LeftLegColor.R * 255),
                            [2] = tostring(humanoidDescription.LeftLegColor.G * 255),
                            [3] = tostring(humanoidDescription.LeftLegColor.B * 255)
                        },
                        WidthScale = humanoidDescription.WidthScale,
                        BodyTypeScale = humanoidDescription.BodyTypeScale,
                        RunAnimation = humanoidDescription.RunAnimation,
                        LeftArmColor = {
                            [1] = tostring(humanoidDescription.LeftArmColor.R * 255),
                            [2] = tostring(humanoidDescription.LeftArmColor.G * 255),
                            [3] = tostring(humanoidDescription.LeftArmColor.B * 255)
                        },
                        Emotes = {}, -- Adjust if needed
                        Pants = humanoidDescription.Pants,
                        HeadAccessory = humanoidDescription.HatAccessory,
                        Face = humanoidDescription.Face,
                        WaistAccessory = humanoidDescription.WaistAccessory,
                        GraphicTShirt = humanoidDescription.GraphicTShirt,
                        HeadColor = {
                            [1] = tostring(humanoidDescription.HeadColor.R * 255),
                            [2] = tostring(humanoidDescription.HeadColor.G * 255),
                            [3] = tostring(humanoidDescription.HeadColor.B * 255)
                        },
                        JumpAnimation = humanoidDescription.JumpAnimation,
                        NeckAccessory = humanoidDescription.NeckAccessory,
                        WalkAnimation = humanoidDescription.WalkAnimation,
                        IdleAnimation = humanoidDescription.IdleAnimation,
                        FrontAccessory = humanoidDescription.FrontAccessory,
                        HeadScale = humanoidDescription.HeadScale,
                        BackAccessory = humanoidDescription.BackAccessory,
                        RightLeg = humanoidDescription.RightLeg,
                        ShouldersAccessory = humanoidDescription.ShouldersAccessory
                    }

                    -- Save the avatar data
                    Connection:InvokeServer(65, username) -- Save the avatar with the name "meepcity"
                    ReplicatedStorage:WaitForChild("FunctionConnections"):WaitForChild("NewAESaveOutfit"):InvokeServer(avatarData)

                    print("Avatar data saved successfully!")

                else
                    print("Couldn't find the target player's character!")
                end

            else
                print("Couldn't find the target player!")
            end
        else
            print("Couldn't get the username from the player's GUI!")
        end
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

local Visuals = Window:CreateTab("Visuals")

local Toggle = Visuals:CreateToggle({
    Name = "Visible ButtonServerBrowser",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.UnVisibleButtonServerBrowser = Value 
        UnVisibleButtonServerBrowser()
    end,
 })

local Button = Visuals:CreateButton({
   Name = "UnButtonBuyCoins",
   Callback = function()
        game.Players.atvepeng01.PlayerGui.MainGui.CoinsContainer.ButtonBuyCoins.Visible = false
   end,
})

local Dev = Window:CreateTab("Dev")

local Button = Dev:CreateButton({
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

-- Create labels for displaying object information
local Label1 = Dev:CreateLabel("Name: ")
local Label2 = Dev:CreateLabel("Asset ID: ")
local Label3 = Dev:CreateLabel("Serial ID: ")

-- Variables to store object information
local GlobalChild = nil
local ObjectSerialId = nil
local FPosition = nil
local FRotation = nil

-- Create inputs for position and rotation
local Input1 = Dev:CreateInput({
    Name = "Position",
    PlaceholderText = "Enter position (x, y, z)",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        FPosition = Text
    end,
})

local Input2 = Dev:CreateInput({
    Name = "Rotation",
    PlaceholderText = "Enter rotation value",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        FRotation = tonumber(Text)
    end,
})

-- Function to update BoomBox information
local function updateBoomBoxInfo(child)
    if child:GetAttribute("ObjectAssetId") or child:GetAttribute("ObjectSerialId") then
        Label1:Set("Name: " .. child.Name)
        Label2:Set("Asset ID: " .. (child:GetAttribute("ObjectAssetId") or "N/A"))
        ObjectSerialId = child:GetAttribute("ObjectSerialId")
        Label3:Set("Serial ID: " .. (ObjectSerialId or "N/A"))

        if child:FindFirstChild("ObjectAnchor") then
            FPosition = tostring(child.ObjectAnchor.Position)
            Input1:Set(FPosition)
            FRotation = tostring(child.ObjectAnchor.Rotation.X + child.ObjectAnchor.Rotation.Z)
            Input2:Set(FRotation)
        end
    end
end

-- Function to handle mouse click events
local function onMouseClick(hit)
    local parent = hit.Parent
    if parent then
        updateBoomBoxInfo(parent)
    end
end

-- Connect mouse click event to function
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target then
        onMouseClick(target)
    end
end)

-- Create button for updating object information
local Button1 = Dev:CreateButton({
    Name = "Обновить",
    Callback = function()
        local x, y, z = string.match(FPosition, "([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)")
        x, y, z = tonumber(x), tonumber(y), tonumber(z)

        if x and y and z then
            local positionVector = Vector3.new(x, y, z)

            game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("UpdateEstateEditObject"):FireServer({{
                ["ObjectSerialId"] = ObjectSerialId,
                ["NormalFace"] = Vector3.yAxis,
                ["FloorLevel"] = 1,
                ["RotationValue"] = FRotation,
                ["WorldPosition"] = positionVector
            }})
        end
    end,
})

-- Create button for deleting object
local Button2 = Dev:CreateButton({
    Name = "Удалить",
    Callback = function()
        if ObjectSerialId then
            game:GetService("ReplicatedStorage").FunctionConnections.RequestEstateEditSendToAttic:InvokeServer(ObjectSerialId)
        else
            warn("No Object Serial ID found.")
        end
    end,
})

-- Variable to track if click position logging is enabled
local clickPositionLoggingEnabled = false

-- Function to print click position in world
local function printClickPosition(position)
    FPosition = tostring(position)  -- Convert Vector3 to string
    Input1:Set(FPosition)  -- Set string value to Input1
    local x, y, z = string.match(FPosition, "([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)")
    x, y, z = tonumber(x), tonumber(y), tonumber(z)

    if x and y and z then
        local positionVector = Vector3.new(x, y, z)

        game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("UpdateEstateEditObject"):FireServer({{
            ["ObjectSerialId"] = ObjectSerialId,
            ["NormalFace"] = Vector3.yAxis,
            ["FloorLevel"] = 1,
            ["RotationValue"] = tonumber(FRotation),
            ["WorldPosition"] = positionVector
        }})
    end
end

-- Function to handle mouse click events
local function onMouseClick(hit, position)
    local parent = hit.Parent
    if parent then
        -- Call function to print click position if logging is enabled
        if clickPositionLoggingEnabled then
            printClickPosition(position)
        end
    end
end

-- Toggle button to enable/disable click position logging
local ToggleButton = Dev:CreateToggle({
    Name = "Click Tp",
    Enabled = clickPositionLoggingEnabled,
    Callback = function(enabled)
        clickPositionLoggingEnabled = enabled
    end,
})

-- Connect mouse click event to function
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target then
        local hitPosition = mouse.Hit.p  -- Get the position where the mouse clicked
        onMouseClick(target, hitPosition)
    end
end)

while wait() do 
    Paragraph:Set({Title = "My Coins", Content = game.Players.LocalPlayer:GetAttribute("Coins")})
    local player = Players.LocalPlayer
    local username = player and player.PlayerGui and player.PlayerGui.PlayerDialogGui and
                     player.PlayerGui.PlayerDialogGui.Container and
                     player.PlayerGui.PlayerDialogGui.Container.PlayerHeader and
                     player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername and
                     player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text
    if username then
        SelectCharacter:Set({
            Title = "Select Character",
            Content = username:gsub("@", "")
        })
    end
end

Rayfield:LoadConfiguration()
