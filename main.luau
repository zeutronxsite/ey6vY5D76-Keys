local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============ CONFIG ============
local KEY_SCRIPT_URL = "https://raw.githubusercontent.com/zeutronxsite/hrZyx4kUT-KeyG/refs/heads/main/Generator.luau"
local VERIFY_SCRIPT_URL = "https://raw.githubusercontent.com/zeutronxsite/F4DiY9yZ9Safety/refs/heads/main/yXLHkaN70yMain"
local PASTEBIN_LINK = "https://pastebin.com/YourPastebin"
local SAVE_FILE = "KeySystem_Save.txt"
-- =================================

-- Check saved key
local savedKey = nil
if isfile and isfile(SAVE_FILE) then
    savedKey = readfile(SAVE_FILE)
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 580, 0, 360)
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Stroke
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(45, 45, 45)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

-- Dark Overlay
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4
Overlay.Parent = MainFrame

-- ============ PARTICLE CONTAINER ============
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "Particles"
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.ClipsDescendants = true
ParticleContainer.Parent = MainFrame

-- Partikel GARIS PUTIH TURUN
for i = 1, 20 do
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(0, 1, 0, math.random(30, 70))
    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Line.BorderSizePixel = 0
    Line.AnchorPoint = Vector2.new(0.5, 0)
    Line.Position = UDim2.new(math.random() * 0.95 + 0.025, 0, -0.15, 0)
    Line.BackgroundTransparency = 0.6
    Line.Parent = ParticleContainer
    
    spawn(function()
        while Line.Parent do
            local duration = math.random(5, 10)
            local tween = TweenService:Create(Line, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
                Position = UDim2.new(Line.Position.X.Scale, 0, 1.2, 0)
            })
            tween:Play()
            tween.Completed:Wait()
            Line.Position = UDim2.new(math.random() * 0.95 + 0.025, 0, -0.15, 0)
        end
    end)
end

-- Partikel TITIK UNGU
for i = 1, 15 do
    local Particle = Instance.new("Frame")
    Particle.Size = UDim2.new(0, 2, 0, 2)
    Particle.BackgroundColor3 = Color3.fromRGB(150, 100, 255)
    Particle.BorderSizePixel = 0
    Particle.AnchorPoint = Vector2.new(0.5, 0.5)
    Particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    Particle.Parent = ParticleContainer
    
    local ParticleCorner = Instance.new("UICorner")
    ParticleCorner.CornerRadius = UDim.new(1, 0)
    ParticleCorner.Parent = Particle
    
    spawn(function()
        while Particle.Parent do
            local tween = TweenService:Create(Particle, TweenInfo.new(math.random(4, 7), Enum.EasingStyle.Linear), {
                Position = UDim2.new(math.random(), 0, math.random(), 0),
                BackgroundTransparency = math.random(0, 6) / 10
            })
            tween:Play()
            tween.Completed:Wait()
        end
    end)
end

-- ============ LOGO (PROFILE AVATAR PLAYER) ============
local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(0, 80, 0, 80)
LogoFrame.Position = UDim2.new(0, 20, 0, 55)
LogoFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
LogoFrame.BorderSizePixel = 0
LogoFrame.Visible = false -- Sembunyikan dulu sampai gambar load
LogoFrame.Parent = MainFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoFrame

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(70, 70, 70)
LogoStroke.Thickness = 1.5
LogoStroke.Parent = LogoFrame

-- Logo Image - Menggunakan Avatar Player
local LogoImage = Instance.new("ImageLabel")
LogoImage.Size = UDim2.new(1, -10, 1, -10)
LogoImage.Position = UDim2.new(0, 5, 0, 5)
LogoImage.BackgroundTransparency = 1
LogoImage.ScaleType = Enum.ScaleType.Crop
LogoImage.Parent = LogoFrame

-- Dapatkan thumbnail avatar player
local success, thumbnailUrl = pcall(function()
    local url, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
    return url
end)

if success and thumbnailUrl then
    LogoImage.Image = thumbnailUrl
    LogoFrame.Visible = true
else
    -- Fallback jika gagal mengambil thumbnail
    LogoImage.Image = "rbxassetid://0"
    LogoFrame.Visible = true
end

-- ============ TITLE & SUBTITLE ============
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 350, 0, 32)
Title.Position = UDim2.new(0, 115, 0, 20)
Title.BackgroundTransparency = 1
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 350, 0, 18)
Subtitle.Position = UDim2.new(0, 115, 0, 52)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Enter or generate your key to access scripts"
Subtitle.TextColor3 = Color3.fromRGB(140, 140, 140)
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = MainFrame

-- ============ KEY INPUT (TextBox) ============
local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(0, 430, 0, 38)
InputFrame.Position = UDim2.new(0, 115, 0, 95)
InputFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
InputFrame.BorderSizePixel = 0
InputFrame.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 7)
InputCorner.Parent = InputFrame

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(55, 55, 55)
InputStroke.Thickness = 1
InputStroke.Parent = InputFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -20, 1, 0)
KeyInput.Position = UDim2.new(0, 10, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter your key here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(90, 90, 90)
KeyInput.TextColor3 = Color3.fromRGB(220, 220, 220)
KeyInput.TextSize = 13
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = InputFrame

-- Input focus effects
KeyInput.Focused:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(120, 60, 220)
    }):Play()
end)

KeyInput.FocusLost:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(55, 55, 55)
    }):Play()
    
    if KeyInput.Text ~= "" then
        savedKey = KeyInput.Text
        if writefile then
            writefile(SAVE_FILE, savedKey)
        end
    end
end)

-- ============ STATUS LABEL ============
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 22)
StatusLabel.Position = UDim2.new(0, 20, 0, 143)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame

-- ============ BUTTON CONTAINER ============
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -40, 0, 42)
ButtonContainer.Position = UDim2.new(0, 20, 0, 175)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyBtn.Position = UDim2.new(0, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
GetKeyBtn.Text = "🔑 GET KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 14
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.Parent = ButtonContainer

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 7)
GetKeyCorner.Parent = GetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(75, 75, 75)
GetKeyStroke.Thickness = 1
GetKeyStroke.Parent = GetKeyBtn

-- Verify Button
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.48, 0, 1, 0)
VerifyBtn.Position = UDim2.new(0.52, 0, 0, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(55, 25, 110)
VerifyBtn.Text = "✅ VERIFY"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 14
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Parent = ButtonContainer

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 7)
VerifyCorner.Parent = VerifyBtn

local VerifyStroke = Instance.new("UIStroke")
VerifyStroke.Color = Color3.fromRGB(90, 50, 170)
VerifyStroke.Thickness = 1
VerifyStroke.Parent = VerifyBtn

-- Pastebin Link Button
local PastebinBtn = Instance.new("TextButton")
PastebinBtn.Size = UDim2.new(1, -40, 0, 38)
PastebinBtn.Position = UDim2.new(0, 20, 0, 230)
PastebinBtn.BackgroundColor3 = Color3.fromRGB(25, 70, 110)
PastebinBtn.Text = "📋 PASTEBIN LINK"
PastebinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PastebinBtn.TextSize = 13
PastebinBtn.Font = Enum.Font.GothamBold
PastebinBtn.BorderSizePixel = 0
PastebinBtn.Parent = MainFrame

local PastebinCorner = Instance.new("UICorner")
PastebinCorner.CornerRadius = UDim.new(0, 7)
PastebinCorner.Parent = PastebinBtn

local PastebinStroke = Instance.new("UIStroke")
PastebinStroke.Color = Color3.fromRGB(45, 100, 150)
PastebinStroke.Thickness = 1
PastebinStroke.Parent = PastebinBtn

-- Created by Text
local CreatedByText = Instance.new("TextLabel")
CreatedByText.Size = UDim2.new(1, -40, 0, 18)
CreatedByText.Position = UDim2.new(0, 20, 0, 280)
CreatedByText.BackgroundTransparency = 1
CreatedByText.Text = "Created By Exterminate0"
CreatedByText.TextColor3 = Color3.fromRGB(255, 255, 255)
CreatedByText.TextSize = 11
CreatedByText.Font = Enum.Font.GothamBold
CreatedByText.TextXAlignment = Enum.TextXAlignment.Center
CreatedByText.Parent = MainFrame

-- Close Button (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(45, 25, 25)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 15
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = Color3.fromRGB(90, 45, 45)
CloseStroke.Thickness = 1
CloseStroke.Parent = CloseBtn

-- ============ HOVER & CLICK EFFECTS ============
local function addHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = hoverColor
        }):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = normalColor
        }):Play()
    end)
end

addHoverEffect(GetKeyBtn, Color3.fromRGB(55, 55, 55), Color3.fromRGB(38, 38, 38))
addHoverEffect(VerifyBtn, Color3.fromRGB(75, 35, 140), Color3.fromRGB(55, 25, 110))
addHoverEffect(PastebinBtn, Color3.fromRGB(35, 90, 140), Color3.fromRGB(25, 70, 110))
addHoverEffect(CloseBtn, Color3.fromRGB(70, 35, 35), Color3.fromRGB(45, 25, 25))

local function addClickEffect(button)
    button.MouseButton1Click:Connect(function()
        local originalSize = button.Size
        TweenService:Create(button, TweenInfo.new(0.08), {
            Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset - 4, originalSize.Y.Scale, originalSize.Y.Offset - 4)
        }):Play()
        task.wait(0.08)
        TweenService:Create(button, TweenInfo.new(0.08), {
            Size = originalSize
        }):Play()
    end)
end

addClickEffect(GetKeyBtn)
addClickEffect(VerifyBtn)
addClickEffect(PastebinBtn)
addClickEffect(CloseBtn)

-- ============ KEY VALIDATION FUNCTION ============
-- ============ KEY VALIDATION FUNCTION ============
local function isValidKey(key)
    if not key or key == "" then 
        return false 
    end
    
    -- Pattern 1: EXTERM-123456-7890
    if string.match(key, "^EXTERM%-%d%d%d%d%d%d%-%d%d%d%d$") then
        return true
    end
    
    -- Pattern 2: KEY-XXXXXX-XXXXXX-XXXXXX (Format dari Key Generator)
    -- Menerima huruf A-Z (besar/kecil) dan angka 0-9
    if string.match(key, "^KEY%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]$") then
        return true
    end
    
    -- Pattern yang lebih sederhana untuk KEY-XXXXXX-XXXXXX-XXXXXX
    if string.match(key, "^KEY%-%w+%-%w+%-%w+$") then
        local parts = {}
        for part in string.gmatch(key, "([^%-]+)") do
            table.insert(parts, part)
        end
        
        -- Harus ada 4 parts (KEY + 3 bagian)
        if #parts == 4 then
            -- Setiap bagian harus 6 karakter
            if #parts[2] == 6 and #parts[3] == 6 and #parts[4] == 6 then
                return true
            end
        end
    end
    
    return false
end

-- ============ GET KEY FUNCTION ============
GetKeyBtn.MouseButton1Click:Connect(function()
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    
    local success, result = pcall(function()
        local keyScript = loadstring(game:HttpGet(KEY_SCRIPT_URL))()
        return keyScript
    end)
    
    if success and result and type(result) == "string" then
        local newKey = result
        savedKey = newKey
        
        if writefile then
            writefile(SAVE_FILE, newKey)
        end
        
        KeyInput.Text = newKey
        
        if setclipboard then
            setclipboard(newKey)
            StatusLabel.Text = ""
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        else
            StatusLabel.Text = ""
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        end
        
        GetKeyBtn.Text = ""
        task.wait(2)
        GetKeyBtn.Text = ""
    else
        StatusLabel.Text = ""
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        task.wait(2)
        StatusLabel.Text = ""
    end
end)

-- ============ VERIFY FUNCTION ============
VerifyBtn.MouseButton1Click:Connect(function()
    local keyToVerify = KeyInput.Text
    
    if not keyToVerify or keyToVerify == "" then
        StatusLabel.Text = "⚠️ Please enter a key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 100)
        return
    end
    
    -- VALIDASI FORMAT KEY
    if not isValidKey(keyToVerify) then
        StatusLabel.Text = "X Invalid key format!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        
        -- Shake animation
        local originalPos = InputFrame.Position
        for i = 1, 4 do
            TweenService:Create(InputFrame, TweenInfo.new(0.05), {
                Position = UDim2.new(0, 115 + (i % 2 == 0 and -5 or 5), 0, 95)
            }):Play()
            task.wait(0.05)
        end
        TweenService:Create(InputFrame, TweenInfo.new(0.05), {
            Position = originalPos
        }):Play()
        
        return
    end
    
    StatusLabel.Text = "🔄 Verifying..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    
    task.wait(1.5)
    
    StatusLabel.Text = "✓ Key verified successfully!"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    VerifyBtn.Text = "✅ VERIFIED"
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(25, 90, 25)
    
    task.wait(1)
    StatusLabel.Text = "✓ Access granted!, Please Wait...."
    task.wait(1)
    local success, result = pcall(function()
        local verifyscript = loadstring(game:HttpGet(VERIFY_SCRIPT_URL))()
        return verifyscript
    end)
end)

-- ============ PASTEBIN LINK ============
PastebinBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(PASTEBIN_LINK)
        StatusLabel.Text = "✓ Pastebin link copied!"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(2)
        StatusLabel.Text = ""
    else
        StatusLabel.Text = "Link: " .. PASTEBIN_LINK
        StatusLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
    end
end)

-- ============ CLOSE BUTTON ============
CloseBtn.MouseButton1Click:Connect(function()
    local fadeTween = TweenService:Create(MainFrame, TweenInfo.new(0.25), {
        BackgroundTransparency = 1
    })
    fadeTween:Play()
    
    for _, child in pairs(MainFrame:GetChildren()) do
        if child:IsA("GuiObject") then
            pcall(function()
                TweenService:Create(child, TweenInfo.new(0.25), {
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    ImageTransparency = 1
                }):Play()
            end)
        end
    end
    
    task.wait(0.3)
    
    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end
    
    print("✓ Key System closed!")
end)

-- ============ DRAGGABLE ============
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ============ ENTRANCE ANIMATION ============
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -230)
MainFrame.BackgroundTransparency = 1
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
    Position = UDim2.new(0.5, -290, 0.5, -180),
    BackgroundTransparency = 0
}):Play()
