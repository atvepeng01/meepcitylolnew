local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "atvepeng01 Legacy",
    LoadingTitle = "MeepCity – My World, My Realm, My Legacy!",
    LoadingSubtitle = "by atvepeng01",
})

local function service(...) return game:GetService(...) end

local function getUsername()
    local player = service("Players").LocalPlayer
    local playerGui = player and player.PlayerGui
    local playerDialogGui = playerGui and playerGui:FindFirstChild("PlayerDialogGui")
    local container = playerDialogGui and playerDialogGui:FindFirstChild("Container")
    local playerHeader = container and container:FindFirstChild("PlayerHeader")
    local playerUsername = playerHeader and playerHeader:FindFirstChild("PlayerUsername")
    
    return playerUsername and playerUsername.Text:gsub("@", "") or "Unknown"
end

local function getCharacter(username)
    local player = service("Players"):FindFirstChild(username)
    return player and (player.Character or player.CharacterAdded:Wait()) or nil
end

local function getHumanoidDescription(character)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid:FindFirstChild("HumanoidDescription") or nil
end

local function saveAvatarData(humanoidDescription)
    local function toColorString(color)
        return string.format("[%d,%d,%d]", color.R * 255, color.G * 255, color.B * 255)
    end
    
    return humanoidDescription and {
        SwimAnimation = humanoidDescription.SwimAnimation,
        Torso = humanoidDescription.Torso,
        ProportionScale = humanoidDescription.ProportionScale,
        ClimbAnimation = humanoidDescription.ClimbAnimation,
        Shirt = humanoidDescription.Shirt,
        FaceAccessory = humanoidDescription.FaceAccessory,
        RightArmColor = toColorString(humanoidDescription.RightArmColor),
        HairAccessory = humanoidDescription.HairAccessory,
        RightArm = humanoidDescription.RightArm,
        Head = humanoidDescription.Head,
        FallAnimation = humanoidDescription.FallAnimation,
        TorsoColor = toColorString(humanoidDescription.TorsoColor),
        DepthScale = humanoidDescription.DepthScale,
        LeftArm = humanoidDescription.LeftArm,
        HeightScale = humanoidDescription.HeightScale,
        LeftLeg = humanoidDescription.LeftLeg,
        RightLegColor = toColorString(humanoidDescription.RightLegColor),
        LeftLegColor = toColorString(humanoidDescription.LeftLegColor),
        WidthScale = humanoidDescription.WidthScale,
        BodyTypeScale = humanoidDescription.BodyTypeScale,
        RunAnimation = humanoidDescription.RunAnimation,
        LeftArmColor = toColorString(humanoidDescription.LeftArmColor),
        Emotes = {},
        Pants = humanoidDescription.Pants,
        HeadAccessory = humanoidDescription.HatAccessory,
        Face = humanoidDescription.Face,
        WaistAccessory = humanoidDescription.WaistAccessory,
        GraphicTShirt = humanoidDescription.GraphicTShirt,
        HeadColor = toColorString(humanoidDescription.HeadColor),
        JumpAnimation = humanoidDescription.JumpAnimation,
        NeckAccessory = humanoidDescription.NeckAccessory,
        WalkAnimation = humanoidDescription.WalkAnimation,
        IdleAnimation = humanoidDescription.IdleAnimation,
        FrontAccessory = humanoidDescription.FrontAccessory,
        HeadScale = humanoidDescription.HeadScale,
        BackAccessory = humanoidDescription.BackAccessory,
        RightLeg = humanoidDescription.RightLeg,
        ShouldersAccessory = humanoidDescription.ShouldersAccessory
    } or {}
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local connection = ReplicatedStorage:WaitForChild("Connection")
local connectionEvent = ReplicatedStorage:WaitForChild("ConnectionEvent")

local heartbeatConnection = nil

local function findClosestTempFish(rootPart)
    local closestObject = nil
    local closestDistance = math.huge

    for _, obj in ipairs(Workspace.VW:GetChildren()) do
        if obj.Name == "TempFish" and obj:IsA("BasePart") then
            local distance = (obj.Position - rootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestObject = obj
            end
        end
    end
    return closestObject
end

function startAutoFarm()
    connection:InvokeServer(9)

    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if _G.safeAutoFarm then
            if player and player.Character then
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")

                if rootPart then
                    local closestObject = findClosestTempFish(rootPart)

                    if closestObject then
                        local fishingParams = {
                            Power = 1,
                            FishingZonePos = closestObject.Position,
                            Face = Vector3.new(0, 0, 0),
                            PlayerPos = closestObject.Position,
                            FishingPolePos = closestObject.Position
                        }
                        connection:InvokeServer(11, fishingParams)
                        connection:InvokeServer(49)
                        connection:InvokeServer(50)
                        connection:InvokeServer(51)
                    end
                else
                    warn("HumanoidRootPart not found.")
                end
            else
                warn("Player or character not found.")
            end
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
                connectionEvent:FireServer(12)
            end
        end
    end)
end

function startFanAutoFarm()
    connection:InvokeServer(9)
    fanHeartbeatConnection = RunService.Heartbeat:Connect(function()
        if _G.FanAutoFarm then
            local playerName = player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")
            local targetPlayer = Players:FindFirstChild(playerName)

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                local targetPosition = targetPlayer.Character.Head.Position

                local fishingParams = {
                    Power = 1,
                    FishingZonePos = targetPosition,
                    Face = Vector3.new(0, 0, 0),
                    PlayerPos = targetPosition,
                    FishingPolePos = targetPosition
                }
                connection:InvokeServer(11, fishingParams)
                connection:InvokeServer(49)
                connection:InvokeServer(51)
            else
                warn("Target player or player head not found.")
            end
        else
            if fanHeartbeatConnection then
                fanHeartbeatConnection:Disconnect()
                fanHeartbeatConnection = nil
                connectionEvent:FireServer(12)
            end
        end
    end)
end


_G.UnVisibleButtonServerBrowser = true

function UnVisibleButtonServerBrowser() 
    while _G.UnVisibleButtonServerBrowser == true do 
        game.Players.LocalPlayer.PlayerGui.MapGui.Map.Container.ButtonServerBrowser.Visible = true
        task.wait()
    end
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local throwItemEvent = ReplicatedStorage:WaitForChild("EventConnections"):WaitForChild("ThrowItem")

local snowballConnection = nil

local function startAFKSpamSnowball()
    snowballConnection = RunService.Heartbeat:Connect(function()
        if _G.AFKSpamSnowball then
            local value1 = 932
            local playerName = player.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")
            local targetPlayer = Players:FindFirstChild(playerName)

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                local headPosition = targetPlayer.Character.Head.Position
                local value2 = 73

                local args = string.format("[%d, [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], %d]",
                    value1, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, value2)

                throwItemEvent:FireServer(args)
            else
                warn("Target player or player head not found.")
            end
        else
            if snowballConnection then
                snowballConnection:Disconnect()
                snowballConnection = nil
            end
        end
    end)
end

_G.SpamBallone = true

function SpamBallone() 
    while _G.SpamBallone == true do
        game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1311, {})
        game:GetService("ReplicatedStorage").Connection:InvokeServer(202)

        game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1312, {})
        game:GetService("ReplicatedStorage").Connection:InvokeServer(202)

        game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1313, {})
        game:GetService("ReplicatedStorage").Connection:InvokeServer(202)

        game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1314, {})
        game:GetService("ReplicatedStorage").Connection:InvokeServer(202)

        game:GetService("ReplicatedStorage").Connection:InvokeServer(201, 1315, {})
        game:GetService("ReplicatedStorage").Connection:InvokeServer(202)
        task.wait()
    end
end

_G.AFKSpamSnowball = true

function AFKSpamSnowball() 
    while _G.AFKSpamSnowball == true do 
        local value1 = 932
        local playerName = game.Players.LocalPlayer.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")
        local headPosition = game.Players:FindFirstChild(playerName).Character.Head.Position
        local value2 = 73

        local args = string.format("[%d, [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], %d]",
            value1, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, value2)

        game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("ThrowItem"):FireServer(args)
        task.wait()
    end
end

_G.AntiSpamBallone = true

function AntiSpamBallone() 
    while _G.AntiSpamBallone == true do 
        for _, object in ipairs(game.Workspace:GetChildren()) do
            if object.Name == "Balloon" then 
                object:Destroy()
            end
        end
        task.wait()
    end
end

local HomeTab = Window:CreateTab("Home")

HomeTab:CreateToggle({
    Name = "Free GamePass",
    CurrentValue = false,
    Flag = "GamePass",
    Callback = function(Value)
        local player = service("Players").LocalPlayer
        if player then
            player:SetAttribute("PLUS", Value)
            player:SetAttribute("BoomBox", Value)  
            player:SetAttribute("CandyPack", Value)  
        end
    end,
})

local AvatarTab = Window:CreateTab("Avatar")

AvatarTab:CreateButton({
    Name = "Load Avatar",
    Callback = function()
        local username = getUsername()
        local character = getCharacter(username)
        local humanoidDescription = getHumanoidDescription(character)
        
        if humanoidDescription then
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

            local functionConnections = service("ReplicatedStorage"):WaitForChild("FunctionConnections")
            local newAEWearTemporaryOutfit = functionConnections:FindFirstChild("NewAEWearTemporaryOutfit")
            
            if newAEWearTemporaryOutfit then
                newAEWearTemporaryOutfit:InvokeServer(unpack(args))
                print("Avatar data loaded successfully!")
            else
                print("NewAEWearTemporaryOutfit function not found.")
            end
        else
            print("Humanoid description not found.")
        end
    end
})

AvatarTab:CreateButton({
    Name = "Save Avatar",
    Callback = function()
        local username = getUsername()
        local character = getCharacter(username)
        local humanoidDescription = getHumanoidDescription(character)
        
        if humanoidDescription then
            local avatarData = saveAvatarData(humanoidDescription)
            local functionConnections = service("ReplicatedStorage"):WaitForChild("FunctionConnections")
            local newAESaveOutfit = functionConnections:FindFirstChild("NewAESaveOutfit")
            local connection = service("ReplicatedStorage"):WaitForChild("Connection")
            
            if newAESaveOutfit and connection then
                connection:InvokeServer(65, username) 
                newAESaveOutfit:InvokeServer(avatarData)
                print("Avatar data saved successfully!")
            else
                print("Function connections not found.")
            end
        else
            print("Humanoid description not found.")
        end
    end
})

AvatarTab:CreateDropdown({
    Name = "Select Size",
    Options = {"Normal Size", "Kid Size", "Teem Size"},
    CurrentOption = {"Normal Size"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Option)
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local functionConnections = replicatedStorage:WaitForChild("FunctionConnections")
        local effectFunction = functionConnections:WaitForChild("NewAERequestSetCheesyEffect")
        
        local sizeMapping = {
            ["Normal Size"] = 1,
            ["Kid Size"] = 2,
            ["Teem Size"] = 3
        }
        effectFunction:InvokeServer(sizeMapping[Option[1]], true)
    end,
})

local AutoFarm = Window:CreateTab("AutoFarm")

AutoFarm:CreateToggle({
    Name = "auto-fishing",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.safeAutoFarm = Value
        if Value then
            startAutoFarm()
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
                connectionEvent:FireServer(12)
            end
        end
    end,
})

AutoFarm:CreateToggle({
    Name = "auto-fishing-player",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        _G.FanAutoFarm = Value
        if Value then
            startFanAutoFarm()
        else
            if fanHeartbeatConnection then
                fanHeartbeatConnection:Disconnect()
                fanHeartbeatConnection = nil
                connectionEvent:FireServer(12)
            end
        end
    end,
})

AutoFarm:CreateButton({
    Name = "auto-starball",
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
                    task.wait()
                    obj.Position = ball.Position
                    task.wait()
                 end
             end
 
             if not starFound then
                task.wait()
                if finishUnion then
                    ball.Position = finishUnion.Position
                elseif backupUnion then
                    ball.Position = backupUnion.Position
                end
                break
             end
 
            task.wait()
         end
    end,
})

local Fun = Window:CreateTab("Fun")

Label = Fun:CreateLabel("Label Example")

Fun:CreateButton({
   Name = "Coins Spy",
   Callback = function()
        Label:Set(game.Players:FindFirstChild(game.Players.LocalPlayer.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")):GetAttribute("Coins"))
   end,
})

Fun:CreateButton({
   Name = "Infinite-Yield",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

Fun:CreateButton({
    Name = "Dark Dex",
    Callback = function()
        local decompsrc = game:HttpGet("https://raw.githubusercontent.com/w-a-e/Advanced-Decompiler-V3/main/init.lua", true)
        local function loaddecomp(decomptimeout)
            local CONSTANTS = [[
        local ENABLED_REMARKS = {
            NATIVE_REMARK = false,
            INLINE_REMARK = false
        }
        local DECOMPILER_TIMEOUT = ]] .. decomptimeout .. [[
            
        local READER_FLOAT_PRECISION = 99
        local SHOW_INSTRUCTION_LINES = false
        local SHOW_REFERENCES = false
        local SHOW_OPERATION_NAMES = false
        local SHOW_MISC_OPERATIONS = false
        local LIST_USED_GLOBALS = false
        local RETURN_ELAPSED_TIME = false
        ]]
        
            loadstring(string.gsub(decompsrc, ";;CONSTANTS HERE;;", CONSTANTS), "Advanced-Decompiler-V3")()
        end
        loaddecomp(1)
        
        loadstring(game:HttpGet('https://raw.githubusercontent.com/t1ware/DexV5/main/dex-v2.lua'))()
    end,
})

Fun:CreateButton({
   Name = "добавить себя в друзя",
   Callback = function()
        game:GetService("ReplicatedStorage").Connection:InvokeServer(158,3,game.Players.LocalPlayer.UserId)
   end,
})

Fun:CreateToggle({
    Name = "Visible ButtonServerBrowser",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.UnVisibleButtonServerBrowser = Value 
        UnVisibleButtonServerBrowser()
    end,
})

local Spam = Window:CreateTab("Spam")

Spam:CreateToggle({
   Name = "Spam Ballone",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
        _G.SpamBallone = Value 
        SpamBallone()
   end,
})

Spam:CreateButton({
   Name = "Snowball",
   Callback = function()
        local value1 = 932
        local playerName = game.Players.LocalPlayer.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")
        local headPosition = game.Players:FindFirstChild(playerName).Character.Head.Position
        local value2 = 73

        local args = string.format("[%d, [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], [\"%f\", \"%f\", \"%f\"], %d]",
            value1, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, headPosition.X, headPosition.Y, headPosition.Z, value2)

        game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("ThrowItem"):FireServer(args)
   end,
})

Spam:CreateToggle({
    Name = "AFK Spam Snowball",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
         _G.AFKSpamSnowball = Value
         if Value then
             startAFKSpamSnowball()
         else
             if snowballConnection then
                 snowballConnection:Disconnect()
                 snowballConnection = nil
             end
         end
    end,
})

Spam:CreateButton({
    Name = "Spam Teleport Notification",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
            game:GetService("ReplicatedStorage").Connection:InvokeServer(154,player.UserId,{})
        end
    end,
})

local AntiSpam = Window:CreateTab("AntiSpam")

AntiSpam:CreateButton({
    Name = "Anti Snowball Screen",
    Callback = function()
        game.Players.LocalPlayer.PlayerGui.ThrowingItemGui:Destroy()
    end,
})

local Toggle = AntiSpam:CreateToggle({
    Name = "Anti Spam Ballone",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
         _G.AntiSpamBallone = Value 
         AntiSpamBallone()
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

-- Создание меток для отображения информации об объекте
local Label1 = Dev:CreateLabel("Name: ")
local Label2 = Dev:CreateLabel("Asset ID: ")
local Label3 = Dev:CreateLabel("Serial ID: ")

-- Переменные для хранения информации об объекте
local ObjectSerialId
local FPosition
local FRotation

-- Создание полей ввода для позиции и вращения
local Input1 = Dev:CreateInput({
    Name = "Position",
    PlaceholderText = "Enter position (x, y, z)",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        FPosition = Text
        updateObjectInfo()
    end,
})

local Input2 = Dev:CreateInput({
    Name = "Rotation",
    PlaceholderText = "Enter rotation value",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        FRotation = tonumber(Text)
        updateObjectInfo()
    end,
})

-- Функция для обновления информации об объекте
local function updateObjectInfo()
    if FPosition and FRotation and ObjectSerialId then
        local x, y, z = string.match(FPosition, "([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)")
        x, y, z = tonumber(x), tonumber(y), tonumber(z)

        if x and y and z then
            local positionVector = Vector3.new(x, y, z)
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("UpdateEstateEditObject"):FireServer({
                    {
                        ["ObjectSerialId"] = ObjectSerialId,
                        ["NormalFace"] = Vector3.yAxis,
                        ["FloorLevel"] = 1,
                        ["RotationValue"] = FRotation,
                        ["WorldPosition"] = positionVector
                    }
                })
            end)

            if not success then
                warn("Failed to update object info: " .. err)
            end
        else
            warn("Invalid position format.")
        end
    end
end

-- Функция для обновления информации о BoomBox
local function updateBoomBoxInfo(child)
    if child:GetAttribute("ObjectAssetId") or child:GetAttribute("ObjectSerialId") then
        Label1:Set("Name: " .. child.Name)
        Label2:Set("Asset ID: " .. (child:GetAttribute("ObjectAssetId") or "N/A"))
        ObjectSerialId = child:GetAttribute("ObjectSerialId")
        Label3:Set("Serial ID: " .. (ObjectSerialId or "N/A"))

        if child:FindFirstChild("ObjectAnchor") then
            FPosition = tostring(child.ObjectAnchor.Position)
            Input1:Set(FPosition)
            FRotation = child.ObjectAnchor.Rotation.X + child.ObjectAnchor.Rotation.Z
            Input2:Set(tostring(FRotation))
        end
    end
end

-- Функция для обработки кликов мыши
local function onMouseClick(hit, position)
    local parent = hit.Parent
    if parent then
        updateBoomBoxInfo(parent)

        if clickPositionLoggingEnabled then
            printClickPosition(position)
        end

        if clickToDeleteEnabled and ObjectSerialId then
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").FunctionConnections.RequestEstateEditSendToAttic:InvokeServer(ObjectSerialId)
            end)

            if not success then
                warn("Failed to delete object: " .. err)
            end
        end
    end
end

-- Создание кнопок для обновления и удаления информации об объекте
local Button1 = Dev:CreateButton({
    Name = "Обновить",
    Callback = function()
        updateObjectInfo()
    end,
})

local Button3 = Dev:CreateButton({
    Name = "Удалить",
    Callback = function()
        if ObjectSerialId then
            local args = {
                [1] = 200,
                [2] = 10001,
                [3] = ObjectSerialId,
                [4] = 0
            }

            local success, err = pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Connection"):InvokeServer(unpack(args))
            end)

            if not success then
                warn("Failed to delete object: " .. err)
            end
        else
            warn("No Object Serial ID found.")
        end
    end,
})

-- Переменные для отслеживания состояния функционала
local clickPositionLoggingEnabled = false
local clickToDeleteEnabled = false

-- Функция для печати позиции клика
local function printClickPosition(position)
    FPosition = tostring(position)
    Input1:Set(FPosition)
    local x, y, z = string.match(FPosition, "([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)")
    x, y, z = tonumber(x), tonumber(y), tonumber(z)

    if x and y and z then
        local positionVector = Vector3.new(x, y, z)
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("EventConnections"):WaitForChild("UpdateEstateEditObject"):FireServer({
                {
                    ["ObjectSerialId"] = ObjectSerialId,
                    ["NormalFace"] = Vector3.yAxis,
                    ["FloorLevel"] = 1,
                    ["RotationValue"] = FRotation,
                    ["WorldPosition"] = positionVector
                }
            })
        end)

        if not success then
            warn("Failed to print click position: " .. err)
        end
    end
end

-- Кнопки переключателей для функционала
local ToggleButton = Dev:CreateToggle({
    Name = "Click Tp",
    Enabled = clickPositionLoggingEnabled,
    Callback = function(enabled)
        clickPositionLoggingEnabled = enabled
    end,
})

local ClickToDeleteToggle = Dev:CreateToggle({
    Name = "Click to Delete",
    Enabled = clickToDeleteEnabled,
    Callback = function(enabled)
        clickToDeleteEnabled = enabled
    end,
})

-- Подключение события клика мыши
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target then
        local hitPosition = mouse.Hit.p
        onMouseClick(target, hitPosition)
    end
end)

Rayfield:LoadConfiguration()
