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

local Label = Tab:CreateLabel("Label Example")

local Button = Tab:CreateButton({
   Name = "Coins Spy",
   Callback = function()
   Label:Set(game.Players:FindFirstChild(game.Players.LocalPlayer.PlayerGui.PlayerDialogGui.Container.PlayerHeader.PlayerUsername.Text:gsub("@", "")):GetAttribute("Coins"))
   end,
})

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

local Toggle = Tab:CreateToggle({
   Name = "Free GamePass",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	game.Players.LocalPlayer:SetAttribute("PLUS",Value)
	game.Players.LocalPlayer:SetAttribute("BoomBox",Value)    
   end,
})

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

while wait() do 
    Paragraph:Set({Title = "My Coins", Content = game.Players.LocalPlayer:GetAttribute("Coins")})
end



Rayfield:LoadConfiguration()
