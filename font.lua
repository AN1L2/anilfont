local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Anil_Elite_V5_6"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- ★ STYLES TABLE ★ (25 PERFECT FONTS - ALL FIXED)
local Styles = {
    {name="🕷️ Spider", text="🕷️[NAME]🕷️", map={A="Λ",B="Б",C="C",D="D",E="Ξ",F="Ғ",G="G",H="Ή",I="I",J="J",K="Ҡ",L="ᄂ",M="M",N="П",O="Ø",P="P",Q="Q",R="Я",S="S",T="T",U="Ц",V="V",W="Щ",X="X",Y="Y",Z="Z"}},
    {name="♨️ Royal", text="[NAME]≈", map={A="ค",B="บ",C="ς",D="ԃ",E="є",F="ғ",G="ɠ",H="ђ",I="เ",J="ן",K="к",L="ℓ",M="๓",N="ภ",O="๏",P="ρ",Q="ợ",R="г",S="ร",T="Շ",U="ย",V="۷",W="ฬ",X="א",Y="ץ",Z="չ"}},
    {name="彡 Slash", text="彡[NAME]彡", map={A="ค",B="บ",C="ς",D="ԃ",E="є",F="ғ",G="ɠ",H="ђ",I="เ",J="ן",K="к",L="ℓ",M="๓",N="ภ",O="๏",P="ρ",Q="ợ",R="г",S="ร",T="Շ",U="ย",V="۷",W="ฬ",X="א",Y="ץ",Z="չ"}},
    {name="〆 Katana", text="〆[NAME]〆", map={A="ค",B="บ",C="ς",D="ԃ",E="є",F="ғ",G="ɠ",H="ђ",I="เ",J="ן",K="к",L="ℓ",M="๓",N="ภ",O="๏",P="ρ",Q="ợ",R="г",S="ร",T="Շ",U="ย",V="۷",W="ฬ",X="א",Y="ץ",Z="չ"}},
    {name="🌑 Void", text="[NAME]", map={A="Ⱥ",B="Ƀ",C="Ȼ",D="Đ",E="Ɇ",F="₣",G="Ǥ",H="Ħ",I="Ɨ",J="Ɉ",K="Ҝ",L="Ł",M="M",N="₦",O="Ø",P="₱",Q="Ɋ",R="Ɍ",S="S",T="Ŧ",U="Ʉ",V="V",W="₩",X="Ӿ",Y="Ɏ",Z="Ƶ"}},
    {name="🕯️ Gothic", text="† [NAME] †", map={A="Ä",B="ß",C="Ç",D="Ð",E="Ë",F="₣",G="Ġ",H="Ħ",I="Ï",J="Ĵ",K="Ķ",L="Ł",M="M",N="Ñ",O="Ö",P="Þ",Q="Q",R="Ŗ",S="Ş",T="Ţ",U="Ü",V="V",W="Ŵ",X="Ẍ",Y="Ÿ",Z="Ž"}},
    {name="🎀 Pookie", text="🎀 [NAME] 🎀", map={A="ⓐ",B="ⓑ",C="ⓒ",D="ⓓ",E="ⓔ",F="ⓕ",G="ⓖ",H="ⓗ",I="ⓘ",J="ⓙ",K="ⓚ",L="ⓛ",M="ⓜ",N="ⓝ",O="ⓞ",P="ⓟ",Q="ⓠ",R="ⓡ",S="ⓢ",T="ⓣ",U="ⓤ",V="ⓥ",W="ⓦ",X="ⓧ",Y="ⓨ",Z="ⓩ"}},
    {name="🌸 Flower", text="🌸 [NAME] 🌸", map={A="α",B="в",C="¢",D="∂",E="є",F="ƒ",G="g",H="н",I="ι",J="נ",K="к",L="ℓ",M="м",N="и",O="σ",P="ρ",Q="q",R="я",S="ѕ",T="т",U="υ",V="ν",W="ω",X="χ",Y="у",Z="z"}},
    {name="⚡ Glitch", text="⚡ [NAME] ⚡", map={A="Д",B="Б",C="C",D="D",E="Ξ",F="F",G="G",H="H",I="I",J="J",K="K",L="L",M="M",N="И",O="Ф",P="P",Q="Q",R="Я",S="S",T="T",U="Ц",V="V",W="Ш",X="X",Y="Y",Z="Z"}},
    {name="💎 Diamond", text="💎 [NAME] 💎", map={A="α",B="β",C="γ",D="δ",E="ε",F="ζ",G="η",H="θ",I="ι",J="κ",K="λ",L="ℓ",M="μ",N="η",O="ο",P="π",Q="ρ",R="σ",S="τ",T="υ",U="φ",V="χ",W="ω",X="ψ",Y="υ",Z="ω"}},
    {name="💥 Comet", text="💥[NAME]💥", map={A="Å",B="฿",C="¢",D="Đ",E="Є",F="Ŧ",G="Ǥ",H="Ħ",I="Ĩ",J="J",K="Ҡ",L="Ł",M="M",N="Ň",O="Ø",P="₽",Q="Ǫ",R="Ř",S="Ş",T="Ţ",U="Ų",V="Ṿ",W="Ŵ",X="Ӿ",Y="Ỷ",Z="Ż"}},
    {name="🚀 Rocket", text="🚀[NAME]🚀", map={A="🄰",B="🄱",C="🄲",D="🄳",E="🄼",F="🄵",G="🄶",H="🄷",I="🄸",J="🄹",K="🄺",L="🄻",M="🄼",N="🄽",O="🄾",P="🄿",Q="🅀",R="🅁",S="🅂",T="🅃",U="🅄",V="🅅",W="🅆",X="🅇",Y="🅈",Z="🅉"}}
}


local ACCENT = Color3.fromRGB(0, 255, 200)
local MAIN_BG = Color3.fromRGB(10, 10, 15)

-- 🎡 LOGO
local LogoBtn = Instance.new("TextButton")
LogoBtn.Size = UDim2.new(0, 55, 0, 55)
LogoBtn.Position = UDim2.new(0.5, -27.5, 0, 100)
LogoBtn.BackgroundColor3 = MAIN_BG
LogoBtn.Text = "A"
LogoBtn.TextColor3 = ACCENT
LogoBtn.Font = Enum.Font.GothamBold
LogoBtn.TextSize = 22
LogoBtn.Parent = ScreenGui
Instance.new("UICorner", LogoBtn).CornerRadius = UDim.new(1, 0)
local LogoStroke = Instance.new("UIStroke", LogoBtn)
LogoStroke.Color = ACCENT
LogoStroke.Thickness = 1.8

-- 🖥️ MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 420)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -210)
MainFrame.BackgroundColor3 = MAIN_BG
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(45, 45, 65)
MainStroke.Thickness = 1.2

-- 🛡️ SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 200, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 12)

local StyleScroll = Instance.new("ScrollingFrame")
StyleScroll.Size = UDim2.new(1, -20, 1, -130)
StyleScroll.Position = UDim2.new(0, 10, 0, 55)
StyleScroll.BackgroundTransparency = 1
StyleScroll.CanvasSize = UDim2.new(0, 0, 0, 550)
StyleScroll.ScrollBarThickness = 0
StyleScroll.Parent = Sidebar
Instance.new("UIListLayout", StyleScroll).Padding = UDim.new(0, 6)

-- 🏷️ CREATOR FOOTER
local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Size = UDim2.new(1, -20, 0, 30)
CreatorLabel.Position = UDim2.new(0, 10, 1, -40)
CreatorLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
CreatorLabel.Text = "Creator - Anil and Ayu"
CreatorLabel.TextColor3 = ACCENT
CreatorLabel.Font = Enum.Font.GothamBold
CreatorLabel.TextSize = 11
CreatorLabel.Parent = Sidebar
Instance.new("UICorner", CreatorLabel)

-- 🖋️ CONTENT AREA
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -200, 1, 0)
Content.Position = UDim2.new(0, 200, 0, 0)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local PreviewLabel = Instance.new("TextLabel")
PreviewLabel.Size = UDim2.new(1, -40, 0, 80)
PreviewLabel.Position = UDim2.new(0, 20, 0, 20)
PreviewLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
PreviewLabel.TextColor3 = ACCENT
PreviewLabel.Font = Enum.Font.SourceSansBold
PreviewLabel.TextSize = 22
PreviewLabel.TextWrapped = true
PreviewLabel.Parent = Content
Instance.new("UICorner", PreviewLabel)

local NameInput = Instance.new("TextBox")
NameInput.Size = UDim2.new(1, -40, 0, 50)
NameInput.Position = UDim2.new(0, 20, 0, 110)
NameInput.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
NameInput.PlaceholderText = "Type Name..."
NameInput.Text = "anil"
NameInput.TextColor3 = Color3.new(1, 1, 1)
NameInput.Font = Enum.Font.GothamBold
NameInput.Parent = Content
Instance.new("UICorner", NameInput)

local HuToggle = Instance.new("TextButton")
HuToggle.Size = UDim2.new(1, -40, 0, 45)
HuToggle.Position = UDim2.new(0, 20, 0, 170)
HuToggle.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
HuToggle.Text = "HU YAAWR: ON"
HuToggle.TextColor3 = ACCENT
HuToggle.Font = Enum.Font.GothamBold
HuToggle.Parent = Content
Instance.new("UICorner", HuToggle)

local RGBBtn = Instance.new("TextButton")
RGBBtn.Size = UDim2.new(1, -40, 0, 45)
RGBBtn.Position = UDim2.new(0, 20, 0, 225)
RGBBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
RGBBtn.Text = "RGB MODE: OFF"
RGBBtn.TextColor3 = Color3.new(1, 1, 1)
RGBBtn.Font = Enum.Font.GothamBold
RGBBtn.Parent = Content
Instance.new("UICorner", RGBBtn)

local CycleBtn = Instance.new("TextButton")
CycleBtn.Size = UDim2.new(1, -40, 0, 45)
CycleBtn.Position = UDim2.new(0, 20, 0, 280)
CycleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
CycleBtn.Text = "AUTO CYCLE: OFF"
CycleBtn.TextColor3 = Color3.new(1, 1, 1)
CycleBtn.Font = Enum.Font.GothamBold
CycleBtn.Parent = Content
Instance.new("UICorner", CycleBtn)

local ApplyBtn = Instance.new("TextButton")
ApplyBtn.Size = UDim2.new(1, -40, 0, 55)
ApplyBtn.Position = UDim2.new(0, 20, 0, 335)
ApplyBtn.BackgroundColor3 = ACCENT
ApplyBtn.Text = "APPLY TO SERVER"
ApplyBtn.TextColor3 = Color3.fromRGB(10, 30, 25)
ApplyBtn.Font = Enum.Font.GothamBold
ApplyBtn.Parent = Content
Instance.new("UICorner", ApplyBtn)

-- ⚙️ LOGIC
local currentStyle = 1
local rgbActive = false
local huActive = true
local cycleActive = false

local function mapString(str, styleIndex)
    local style = Styles[styleIndex]
    local mapped = ""
    for char in str:lower():gmatch(".") do
        mapped = mapped .. (style.map[char:upper()] or char)
    end
    return mapped
end

local function refresh()
    local namePart = NameInput.Text ~= "" and NameInput.Text or "anil"
    local fullText = namePart
    if huActive then fullText = namePart .. " hu yaawr" end
    local styledName = mapString(fullText, currentStyle)
    PreviewLabel.Text = Styles[currentStyle].text:gsub("%[NAME%]", styledName)
    
    for _, child in ipairs(StyleScroll:GetChildren()) do
        if child:IsA("TextButton") then
            if child.LayoutOrder == currentStyle then
                TweenService:Create(child, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 60), TextColor3 = ACCENT}):Play()
                child.Indicator.Visible = true
            else
                TweenService:Create(child, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 32), TextColor3 = Color3.fromRGB(180, 180, 190)}):Play()
                child.Indicator.Visible = false
            end
        end
    end
end

-- Render Sidebar
for i, style in ipairs(Styles) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    btn.Text = "      " .. style.name 
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.LayoutOrder = i
    btn.Parent = StyleScroll
    Instance.new("UICorner", btn)
    local ind = Instance.new("Frame")
    ind.Name = "Indicator"
    ind.Size = UDim2.new(0, 6, 0.7, 0)
    ind.Position = UDim2.new(0, 8, 0.15, 0)
    ind.BackgroundColor3 = ACCENT
    ind.Visible = false
    ind.Parent = btn
    Instance.new("UICorner", ind)
    btn.MouseButton1Click:Connect(function() currentStyle = i refresh() end)
end

local function SetRGB(state)
    rgbActive = state
    if rgbActive then
        task.spawn(function()
            while rgbActive do
                local c = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                pcall(function()
                    ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", c)
                    LogoStroke.Color = c
                    MainStroke.Color = c
                end)
                task.wait(0.1)
            end
            LogoStroke.Color = ACCENT
            MainStroke.Color = Color3.fromRGB(45, 45, 65)
        end)
    end
end

local function SetCycle(state)
    cycleActive = state
    if cycleActive then
        task.spawn(function()
            while cycleActive do
                currentStyle = (currentStyle % #Styles) + 1
                refresh()
                pcall(function()
                    ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", PreviewLabel.Text)
                end)
                task.wait(2)
            end
        end)
    end
end

-- ★ STARTUP SEQUENCE ★
task.spawn(function()
    pcall(function()
        ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "ANIL FONTS STARTED!")
    end)
    SetRGB(true)
    task.wait(5)
    SetRGB(false)
    refresh()
    pcall(function()
        ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", PreviewLabel.Text)
    end)
end)

-- Toggles
HuToggle.MouseButton1Click:Connect(function()
    huActive = not huActive
    HuToggle.Text = huActive and "HU YAAWR: ON" or "HU YAAWR: OFF"
    HuToggle.TextColor3 = huActive and ACCENT or Color3.new(1, 1, 1)
    refresh()
end)

RGBBtn.MouseButton1Click:Connect(function()
    SetRGB(not rgbActive)
    RGBBtn.Text = rgbActive and "RGB MODE: ON" or "RGB MODE: OFF"
    RGBBtn.TextColor3 = rgbActive and ACCENT or Color3.new(1,1,1)
end)

CycleBtn.MouseButton1Click:Connect(function()
    SetCycle(not cycleActive)
    CycleBtn.Text = cycleActive and "AUTO CYCLE: ON" or "AUTO CYCLE: OFF"
    CycleBtn.TextColor3 = cycleActive and ACCENT or Color3.new(1,1,1)
end)
-- ★ UNIVERSAL DRAG & TOGGLE (PC & MOBILE FIXED) ★
local UIS = game:GetService("UserInputService")

local function MakeDraggable(obj)
    local dragging, dragInput, dragStart, startPos

    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = obj.Position

            -- Ensure drag stops even if mouse/finger leaves the object
            local releaseConn
            releaseConn = UIS.InputEnded:Connect(function(endInput)
                if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                    releaseConn:Disconnect()
                end
            end)
        end
    end)

    obj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X, 
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Apply dragging to both the Main Menu and the Logo
MakeDraggable(MainFrame)
MakeDraggable(LogoBtn)

-- ★ RELIABLE TOGGLE ★
-- Using .Activated because it works better for taps on mobile than MouseButton1Click
LogoBtn.Activated:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ★ APPLY TO SERVER ★
ApplyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", PreviewLabel.Text)
    end)
end)

-- ★ LIVE REFRESH ★
NameInput:GetPropertyChangedSignal("Text"):Connect(refresh)
