-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Settings
local settings = {
    guiDuration = 5,  -- Total duration for the entire GUI before it gets destroyed
    mainText = "Evolution.cc",  -- Custom main text
    loadingText = "Executing Evolution",  -- Custom loading text
    loadedText = "Executed Evolution",  -- Custom loaded text
    creditsText = "STILL ON BETA",  -- Custom credits text
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

local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local client = players.LocalPlayer
local camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local Locking = false
local Plr = nil
local strafing = false
local cframing = false
local auto_shooting = false

local playerData = {}
local SMOOTHNESS_FACTOR = 2

local function GetEvent()
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" or v.Name == ".gg/flamehood" then
            return v
        end
    end
end

local function GetArgs()
    local PlaceId = game.PlaceId
    if PlaceId == 2788229376 or PlaceId == 4106313503 or PlaceId == 11143225577 or PlaceId == 17319408836 or PlaceId == 18110728826 then
        return "UpdateMousePosI"
    elseif PlaceId == 5602055394 or PlaceId == 7951883376 then
        return "MousePos"
    elseif PlaceId == 10100958808 or PlaceId == 12645617354 or PlaceId == 14171242539 or PlaceId == 14412436145 or PlaceId == 14412355918 or PlaceId == 14413720089 or PlaceId == 17403265390 or PlaceId == 17403166075 or PlaceId == 17403262882 or PlaceId == 15186202290 or PlaceId == 15763494605 then
        return "MOUSE"
    elseif PlaceId == 9825515356 then
        return "MousePosUpdate"
    elseif PlaceId == 15166543806 then
        return "MoonUpdateMousePos"
    elseif PlaceId == 16033173781 or PlaceId == 7213786345 then
        return "UpdateMousePosI"
    else
        return "UpdateMousePos"
    end
end

local mainEvent = GetEvent()

function GetClosestToCenter()
    local closestDist = math.huge
    local closestPlr = nil
    local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= client and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local screenPos, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if onScreen then
                local distToCenter = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                if distToCenter < closestDist then
                    closestPlr = v
                    closestDist = distToCenter
                end
            end
        end
    end
    return closestPlr
end

local function getPart()
    if not Plr or not Plr.Character then
        return nil
    end

    local humanoid = Plr.Character:FindFirstChild("Humanoid")
    if not humanoid then
        return nil
    end

    if humanoid:GetState() == Enum.HumanoidStateType.Freefall and getgenv().Evolution['Camlock']['Airshot Function']['Enabled'] then
        local airshotPart = Plr.Character:FindFirstChild(getgenv().Evolution['Camlock']['Airshot Function']['Part'])
        if airshotPart then
            return airshotPart
        end
    end

    local targetPart = Plr.Character:FindFirstChild(getgenv().Evolution['Camlock']['Target Part'])
    if targetPart then
        return targetPart
    end

    return Plr.Character:FindFirstChild("HumanoidRootPart")
end

local function getPredictionValue()
    if getgenv().Evolution['Camlock']['Auto Prediction']['Enabled'] then
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        local pingTable = getgenv().Evolution['Camlock']['Auto Prediction']['Ping']
        
        for i = ping, 0, -1 do
            if pingTable[tostring(i)] then
                return pingTable[tostring(i)]
            end
        end
        
        return pingTable['100']
    else
        return getgenv().Evolution['Camlock']['Manual Prediction']
    end
end

local function calculatePosition(victim, velocity)
    local prediction = getPredictionValue()
    local jumpOffset = getgenv().Evolution['Camlock']['Offset']['Jump']
    local fallOffset = getgenv().Evolution['Camlock']['Offset']['Fall']
    
    local playerData = playerData[victim.Parent.Parent]
    if not playerData then
        playerData = {
            SmoothedVelocity = velocity
        }
        playerData[victim.Parent.Parent] = playerData
    end
    
    playerData.SmoothedVelocity = playerData.SmoothedVelocity:Lerp(velocity, 0.5)
    
    local pos = victim.Position + playerData.SmoothedVelocity * prediction

    if victim.Parent and victim.Parent:FindFirstChild("Humanoid") then
        local humanoid = victim.Parent.Humanoid
        if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
            pos = pos + Vector3.new(0, jumpOffset, 0)
        elseif humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            pos = pos + Vector3.new(0, fallOffset, 0)
        end
    end

    return pos
end

local function CharAdded()
    if Locking and Plr and Plr.Character and playerData[Plr] then
        local Part = getPart()
        if Part then
            local Position = calculatePosition(Part, playerData[Plr].Velocity)
            mainEvent:FireServer(GetArgs(), Position)
        end
    end
end

client.Character.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        child.Activated:Connect(CharAdded)
    end
end)

client.CharacterAdded:Connect(function(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            child.Activated:Connect(CharAdded)
        end
    end)
end)

local function Process(player, dT)
    if not player or not player.Character then
        return
    end

    local PrimaryPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not PrimaryPart then
        return
    end

    -- Ensure playerData[player] is initialized
    if not playerData[player] then
        playerData[player] = {
            PreviousPosition = PrimaryPart.Position,
            Velocity = Vector3.new(0, 0, 0),
            OnScreen = false,
            ScreenPosition = Vector2.new(0, 0)
        }
    end

    local CurrentPosition = PrimaryPart.Position
    local PreviousPosition = playerData[player].PreviousPosition
    local Displacement = CurrentPosition - PreviousPosition

    local targetVelocity = Displacement / dT
    playerData[player].Velocity = playerData[player].Velocity:Lerp(targetVelocity, 0.5)
    playerData[player].PreviousPosition = CurrentPosition
    
    local ScreenPosition, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(CurrentPosition)

    playerData[player].OnScreen = OnScreen
    playerData[player].ScreenPosition = Vector2.new(ScreenPosition.X, ScreenPosition.Y)
end

local strafeAngle = 0

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function SavePositions(positions)
    local json = HttpService:JSONEncode(positions)
    writefile("button_positions.json", json)
end

local function LoadPositions()
    if isfile("button_positions.json") then
        local json = readfile("button_positions.json")
        return HttpService:JSONDecode(json)
    end
    return {}
end

local savedPositions = LoadPositions()

local function CreateButton(name, defaultPosition, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 150, 0, 80)
    Button.Position = savedPositions[name] and UDim2.new(0, savedPositions[name].X, 0, savedPositions[name].Y) or defaultPosition
    Button.Text = name
    Button.Parent = ScreenGui
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button.BorderSizePixel = 0
    Button.Font = Enum.Font.Arcade
    Button.TextColor3 = Color3.new(255, 255, 255)
    Button.TextSize = 15
    Button.AutoButtonColor = false

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Button

    local Shadow = Instance.new("Frame")
    Shadow.Size = UDim2.new(1, 6, 1, 6)
    Shadow.Position = UDim2.new(0, -3, 0, -3)
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    Shadow.BackgroundTransparency = 0.7
    Shadow.ZIndex = -1
    Shadow.Parent = Button

    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 8)
    ShadowCorner.Parent = Shadow

    local isActive = false

    local function updateButtonState()
        local targetColor = isActive and Color3.fromRGB(170, 170, 170) or Color3.fromRGB(255, 255, 255)
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = game:GetService("TweenService"):Create(Shadow, tweenInfo, {BackgroundColor3 = targetColor})
        tween:Play()
    end

    Button.MouseButton1Click:Connect(function()
        isActive = not isActive
        updateButtonState()
        callback(isActive)
    end)

    local dragStart, startPos

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = Button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragStart = nil
                    savedPositions[name] = {X = Button.Position.X.Offset, Y = Button.Position.Y.Offset}
                    SavePositions(savedPositions)
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragStart then
                local delta = input.Position - dragStart
                Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)
    
    return Button, function() return isActive end
end

local CamlockButton, getCamlockState = CreateButton("Evolution.cc", UDim2.new(0, 10, 0, 10), function(state)
    Locking = state
    if Locking then
        Plr = GetClosestToCenter()
    else
        Plr = nil
    end
end)

if getgenv().Evolution['HvH']['Target Strafe']['Enabled'] then
    local StrafeButton, getStrafeState = CreateButton("Rage", UDim2.new(0, 10, 0, 70), function(state)
        strafing = state
    end)
end

if getgenv().Evolution['HvH']['Cframe Walk']['Enabled'] then
    local CframeButton, getCframeState = CreateButton("Tpwalk", UDim2.new(0, 10, 0, 130), function(state)
        cframing = state
    end)
end

if getgenv().Evolution['Camlock']['Auto Shoot'] then
    local AutoShootButton, getAutoShootState = CreateButton("Auto Fire", UDim2.new(0, 10, 0, 190), function(state)
        auto_shooting = state
    end)
end

local function AutoShoot()
    if Locking and Plr then
        local character = client.Character
        if character then
            local tool = character:FindFirstChildOfClass("Tool")
            if tool and tool:IsA("Tool") then
                tool:Activate()
            end
        end
    end
end

runService.Heartbeat:Connect(function(dT)
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= client then
            Process(player, dT)
        end
    end

    if getgenv().Evolution['HvH']['Target Strafe']['Enabled'] and Locking and strafing and Plr and Plr.Character then
        local targetHRP = Plr.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            strafeAngle = strafeAngle + math.rad(getgenv().Evolution['HvH']['Target Strafe']['Speed'])
            
            local distance = getgenv().Evolution['HvH']['Target Strafe']['Distance']
            local height = getgenv().Evolution['HvH']['Target Strafe']['Height']
            
            local offsetX = math.sin(strafeAngle) * distance
            local offsetZ = math.cos(strafeAngle) * distance
            local offsetY = math.sin(strafeAngle * 2) * height
            
            local predictedPosition = calculatePosition(targetHRP, playerData[Plr].Velocity)
            local strafePosition = predictedPosition + Vector3.new(offsetX, offsetY, offsetZ)
            
            if client.Character and client.Character:FindFirstChild("HumanoidRootPart") then
                client.Character.HumanoidRootPart.CFrame = CFrame.new(strafePosition, predictedPosition)
            end
        end
    end

    if cframing and getgenv().Evolution['HvH']['Cframe Walk']['Enabled'] and client.Character and client.Character:FindFirstChild("Humanoid") and client.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = client.Character.HumanoidRootPart
        local moveDirection = client.Character.Humanoid.MoveDirection
        hrp.CFrame = hrp.CFrame + (moveDirection * getgenv().Evolution['HvH']['Cframe Walk']['Amount'])
    end

    if auto_shooting then
        AutoShoot()
    end
end)

runService.RenderStepped:Connect(function()
    if Locking and Plr and Plr.Character and playerData[Plr] then
        local Part = getPart()
        if Part then
            local Position = calculatePosition(Part, playerData[Plr].Velocity)
            local Main = CFrame.new(camera.CFrame.p, Position)
            
            if getgenv().Evolution['Camlock']['Smoothing']['Enabled'] then
                camera.CFrame = camera.CFrame:Lerp(Main, getgenv().Evolution['Camlock']['Smoothing']['Value'])
            else
                camera.CFrame = Main
            end
        end
    end
end)
