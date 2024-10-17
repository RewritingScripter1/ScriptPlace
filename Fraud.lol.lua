-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Settings
local settings = {
    guiDuration = 5,  -- Total duration for the entire GUI before it gets destroyed
    mainText = "Fraud.lua",  -- Custom main text
    loadingText = "Executing Fraud.lua",  -- Custom loading text
    loadedText = "Loaded Fraud.lua",  -- Custom loaded text
    creditsText = "LegitLol😯",  -- Custom credits text
    fontSettings = {
        mainTextFont = Enum.Font.Arcade,  -- Font for main text
        creditsFont = Enum.Font.Arcade,  -- Font for credits text
        countdownFont = Enum.Font.Arcade  -- Font for countdown text
    }
}

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlurGui"
screenGui.Parent = PlayerGui

-- Create BlurEffect
local blurEffect = Instance.new("BlurEffect")
blurEffect.Name = "BlurEffect"
blurEffect.Size = 0
blurEffect.Parent = game:GetService("Lighting")

-- Create Main TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Parent = screenGui
textLabel.BackgroundTransparency = 1
textLabel.Position = UDim2.new(0.5, -200, 0.5, -50)
textLabel.Size = UDim2.new(0, 400, 0, 100)
textLabel.Font = settings.fontSettings.mainTextFont
textLabel.Text = settings.mainText
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.8
textLabel.TextSize = 40

-- Create Credits TextLabel
local creditsLabel = Instance.new("TextLabel")
creditsLabel.Name = "CreditsLabel"
creditsLabel.Parent = screenGui
creditsLabel.BackgroundTransparency = 1
creditsLabel.Position = UDim2.new(0.5, -200, 0.5, 60) -- Positioned below the main text
creditsLabel.Size = UDim2.new(0, 400, 0, 50)
creditsLabel.Font = settings.fontSettings.creditsFont
creditsLabel.Text = settings.creditsText
creditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsLabel.TextScaled = true
creditsLabel.TextStrokeTransparency = 0.8
creditsLabel.TextSize = 8 -- Adjusted text size to 8

-- Create Countdown TextLabel
local countdownLabel = Instance.new("TextLabel")
countdownLabel.Name = "CountdownLabel"
countdownLabel.Parent = screenGui
countdownLabel.BackgroundTransparency = 1
countdownLabel.Position = UDim2.new(0.5, -200, 0.5, -100) -- Positioned above the main text
countdownLabel.Size = UDim2.new(0, 400, 0, 50)
countdownLabel.Font = settings.fontSettings.countdownFont
countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
countdownLabel.TextScaled = true
countdownLabel.TextStrokeTransparency = 0.8
countdownLabel.TextSize = 20 -- Adjusted text size to 20
countdownLabel.Text = ""  -- Initially empty
countdownLabel.Visible = false  -- Initially hidden

-- Add a UIStroke for rainbow effect
local function ApplyRainbowEffect(label)
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Parent = label
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5
    
    -- Function to create a rainbow effect for the UIStroke and text color
    local function RainbowEffect()
        local hue = 0
        while label and label.Parent do
            hue = (hue + 1) % 360
            local color = Color3.fromHSV(hue / 360, 1, 1)
            UIStroke.Color = color
            label.TextColor3 = color
            wait(0.01)
        end
    end

    -- Start the rainbow effect
    spawn(RainbowEffect)
end

-- Apply rainbow effect to main text, credits text, and countdown text
ApplyRainbowEffect(textLabel)
ApplyRainbowEffect(creditsLabel)
ApplyRainbowEffect(countdownLabel)

-- Tweening for blur effect
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {Size = 20}
local tween = TweenService:Create(blurEffect, tweenInfo, goal)

-- Show blur and text
tween:Play()

-- Countdown effect with dots
local function Countdown()
    local countdowns = {".", "..", ".", "..", "..."}
    for i = 1, #countdowns do
        textLabel.Text = settings.loadingText .. countdowns[i]
        wait(1) -- Wait for 1 second before updating the text
    end
end

-- Function to update the countdown label
local function UpdateCountdownLabel()
    local timeLeft = settings.guiDuration
    countdownLabel.Visible = true  -- Show countdown label when starting countdown
    while timeLeft > 0 do
        countdownLabel.Text = "Please wait " .. timeLeft .. " seconds"
        wait(1)
        timeLeft = timeLeft - 1
    end
    countdownLabel.Text = "Please wait 0 seconds"  -- Display final message
end

-- Run countdown for loading text and countdown label
Countdown()
UpdateCountdownLabel()

-- Update text to loaded message and clean up
textLabel.Text = settings.loadedText
wait(1) -- Wait for 1 second before destroying

-- Destroy blur effect and text label
screenGui:Destroy()
blurEffect:Destroy()

--put that code on top of your script
wait(2)
-- paste your code below this

loadstring(game: HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://421058925"
sound.Volume = 5
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
NotifyLib.prompt('Update Logs', 'Updates On Emperium.cc Server', 2)
NotifyLib.prompt('😯 dawg', 'Lets get locking', 2) 
NotifyLib.prompt('Better Camlock', 'Fraud.lua On Top', 2)
wait(0.1) 
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = game.Players.LocalPlayer:GetMouse()
local CamlockState = true
local Prediction = 0.16581
local HorizontalPrediction = 0.165
local VerticalPrediction = 0.165
local XPrediction = 0.13
local YPrediction = 0.12
local Players = game:GetService("Players")	
local LP = Players.LocalPlayer	
local Mouse = LP:GetMouse()	
local Locked = true
SmoothingFactor = 0.001
getgenv().Key = "q"

function FindNearestEnemy()
    local ClosestDistance, ClosestPlayer = math.huge, nil
    local CenterPosition = Vector2.new(game:GetService("GuiService"):GetScreenResolution().X / 2, game:GetService("GuiService"):GetScreenResolution().Y / 2)

    for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
                local Position, IsVisibleOnViewport = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
                if IsVisibleOnViewport then
                    local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Character
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end

    return ClosestPlayer
end

local enemy = nil
local highlight = Instance.new("Highlight")
highlight.FillColor = Color3.fromRGB(255, 65, 105)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.2
highlight.OutlineTransparency = 0

RunService.Heartbeat:Connect(function()
    if CamlockState then
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            local camera = workspace.CurrentCamera
            local predictedPosition = enemy.HumanoidRootPart.Position + (enemy.HumanoidRootPart.Velocity * Prediction) + Vector3.new(HorizontalPrediction, VerticalPrediction, 0)
            camera.CFrame = CFrame.new(camera.CFrame.p, predictedPosition)
        end
    end
end)

Mouse.KeyDown:Connect(function(k)
    if k == getgenv().Key then
        Locked = not Locked
        if Locked then
            enemy = FindNearestEnemy()
            if enemy then
                highlight.Parent = enemy
            end
            CamlockState = true
        else
            if enemy then
                highlight.Parent = nil
                enemy = nil
                CamlockState = false
                FOVCircle.Visible = false
            end
        end
    end
end)


local gui = Instance.new("ScreenGui")
gui.Name = "Dukeshadow"
gui.Parent = game.CoreGui
local TextButton = Instance.new("TextButton")
TextButton.Text = "Fraud.lol"
TextButton.TextSize = 25
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Dark shade of black
TextButton.BorderColor3 = Color3.new(0.3, 0.3, 0.3) -- Slightly lighter shade of black
TextButton.BorderSizePixel = 4
TextButton.BackgroundTransparency = 1
TextButton.Font = Enum.Font.Arcade
TextButton.Size = UDim2.new(0.2, 0, 0.2, 0)
TextButton.Position = UDim2.new(0, 0.9, 0.3, 1)
local state = true
TextButton.MouseButton1Click:Connect(function()
    state = not state
    if not state then
        TextButton.Text = "Fraud.lua"
TextButton.TextColor3 = Color3.new(255, 0, 0)
        getgenv().SilentAimEnabled = true
        CamlockState = true
        enemy = FindNearestEnemy()
        if enemy then
            highlight.Parent = enemy
            Air.Parent = true
            enabled = true
            Plr = LockToPlayer()
        end
    else
        TextButton.Text = "Fraud.lua"
TextButton.TextColor3 = Color3.new(1, 1, 1)
        getgenv().SilentAimEnabled = false
        CamlockState = false
        enabled = false
        if AutoAir then
            AirMaterial(Material.Auto.Air)
            Airshot = nil
            enemyair = nil
        end
        enemy = nil
        highlight.Parent = nil
    end
end)
TextButton.Parent = gui
TextButton.Draggable = true
local cornerUI = Instance.new("UICorner")
cornerUI.CornerRadius = UDim.new(0, 5)
cornerUI.Parent = TextButton

local state = true

getgenv().HitPart = "UpperTorso"
getgenv().Prediction_SilentAim = 0.1201
getgenv().SilentAimEnabled = false  -- Default to disabled
getgenv().SilentAimShowFOV = false  -- Default to showing FOV
getgenv().SilentAimFOVSize = 90
getgenv().SilentAimFOVTransparency = 1
getgenv().SilentAimFOVThickness = 2.0
getgenv().SilentAimFOVColor = Color3.new(255, 0, 0)
local SilentAimFOVCircle = Drawing.new("Circle")
SilentAimFOVCircle.Color = getgenv().SilentAimFOVColor
SilentAimFOVCircle.Visible = getgenv().SilentAimShowFOV
SilentAimFOVCircle.Filled = false
SilentAimFOVCircle.Radius = getgenv().SilentAimFOVSize
SilentAimFOVCircle.Transparency = getgenv().SilentAimFOVTransparency
SilentAimFOVCircle.Thickness = getgenv().SilentAimFOVThickness
local function updateFOVCirclePosition()
    local centerScreenPosition = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    SilentAimFOVCircle.Position = centerScreenPosition
end
local function getClosestPlayerToCenter()
    local centerScreenPosition = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local closestPlayer
    local closestDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("UpperTorso") then
            local playerRootPart = player.Character.UpperTorso
            local screenPosition, onScreen = camera:WorldToViewportPoint(playerRootPart.Position)
            if onScreen then
                local KOd = player.Character:FindFirstChild("BodyEffects") and player.Character.BodyEffects["K.O"].Value
                local Grabbed = player.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                if not KOd and not Grabbed then
                    local ray = Ray.new(camera.CFrame.Position, playerRootPart.Position - camera.CFrame.Position)
                    local part, position = workspace:FindPartOnRay(ray, localPlayer.Character, false, true)
                    if part and part:IsDescendantOf(player.Character) then
                        local distance = (centerScreenPosition - Vector2.new(screenPosition.X, screenPosition.Y)).Magnitude
                        if distance < closestDistance and distance <= SilentAimFOVCircle.Radius then
                            closestPlayer = player
                            closestDistance = distance
                        end
                    end
                end
            end
        end
    end
    return closestPlayer
end
local SilentAimTarget = nil
game:GetService("RunService").RenderStepped:Connect(function()
    SilentAimTarget = getClosestPlayerToCenter()
end)
game:GetService("RunService").RenderStepped:Connect(function()
    updateFOVCirclePosition()
end)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if getgenv().SilentAimEnabled and SilentAimTarget ~= nil and SilentAimTarget.Character and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
    args[3] = SilentAimTarget.Character[getgenv().HitPart].Position + (SilentAimTarget.Character[getgenv().HitPart].Velocity * getgenv().Prediction_SilentAim)
        return old(unpack(args))
    end
    return old(...)
end)
setreadonly(mt, true)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if getgenv().SilentAimEnabled and SilentAimTarget ~= nil and SilentAimTarget.Character and getnamecallmethod() == "FireServer" then
        if args[2] == "UpdateMousePos" or args[2] == "MOUSE" or args[2] == "UpdateMousePosI" or args[2] == "MousePosUpdate" then
            args[3] = SilentAimTarget.Character[getgenv().HitPart].Position + (SilentAimTarget.Character[getgenv().HitPart].Velocity * getgenv().Prediction_SilentAim)
            return old(unpack(args))
        end
    end
    return old(...)
end)
setreadonly(mt, true)
-- expand hitbox by xr/pamcles/airhitpart
local function randomizeHitbox(player)
    local character = player.Character
    if character and character:FindFirstChild("UpperTorso") then
        local HitBoxGram = character.UpperTorso
        local randomSize = Vector3.new(math.random(7, 30), math.random(7, 30), math.random(7, 30))
        HitBoxGram.Size = randomSize
        HitBoxGram.Massless = true
        HitBoxGram.CanCollide = false
        HitBoxGram.Anchored = true  
        wait(0.1)
        hrp.Anchored = false
    end
end

-- Function to hide the loading screen after a certain duration
local function HideLoadingScreen()
    LoadingScreen:Destroy()
end
UICorner.CornerRadius = UDim.new(0.5, 0)