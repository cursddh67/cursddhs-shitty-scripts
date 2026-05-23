-- version 0.69
-- im not a skid, have fun
--wgui
if gethui():FindFirstChild("GUI") then
    gethui().GUI:Destroy()
end

local cloneref = cloneref or getgenv().cloneref
local Players, UIS = cloneref(game:GetService("Players")), cloneref(game:GetService("UserInputService"))
local player = Players.LocalPlayer
local hui = gethui()

local wgui = Instance.new("ScreenGui")
wgui.Parent = hui
wgui.Name = "GUI"

local WFrame = Instance.new("Frame")
WFrame.Name = "Frame"
WFrame.Size = UDim2.new(0, 417, 0, 228)
WFrame.Position = UDim2.new(0, 204, 0, 357)
WFrame.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
WFrame.Parent = wgui

local WFrame_corner = Instance.new("UICorner")
WFrame_corner.CornerRadius = UDim.new(0, 100)
WFrame_corner.Parent = WFrame

--israel flag (might want to use later)

writefile("ugfhfa.png", game:HttpGet("https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/9652ae84e3b176b061c591d9f4e44df61fc32b4f/ugfhfa.png"))
local Israflag = Instance.new("ImageLabel")
Israflag.Name = "ImageLabel"
Israflag.Size = UDim2.new(0, 300, 0, 170)
Israflag.Position = UDim2.new(0, 60, 0, 30)
Israflag.BackgroundColor3 = Color3.fromRGB(212, 212, 216)
Israflag.Image = getcustomasset("ugfhfa.png")
Israflag.Parent = WFrame

local Wname = Instance.new("TextLabel")
Wname.Name = "TextLabel"
Wname.Size = UDim2.new(0, 369, 0, 188)
Wname.Position = UDim2.new(0, 30, 0, 25)
Wname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Wname.BackgroundTransparency = 1
Wname.Text = "Made by moxlvn (￣﹃￣)"
Wname.TextSize = 30
Wname.Font = Enum.Font.Fantasy
Wname.Parent = WFrame

local Wname_corner = Instance.new("UICorner")
Wname_corner.CornerRadius = UDim.new(0, 100)
Wname_corner.Parent = Wname

--disable wgui
task.wait(3)
wgui.Enabled = false

--mgui

local mgui = Instance.new("ScreenGui")
mgui.Parent = hui
mgui.Name = "GUI"

local MFrame = Instance.new("Frame")
MFrame.Name = "Frame"
MFrame.Size = UDim2.new(0, 552, 0, 292)
MFrame.Position = UDim2.new(0, 123, 0, 94)
MFrame.BackgroundColor3 = Color3.fromRGB(3, 59, 73)
MFrame.Parent = mgui

writefile("israfloyd.jfif", game:HttpGet("https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/refs/heads/main/israfloyd.jfif"))
local jorgito = Instance.new("ImageLabel")
jorgito.Name = "ImageLabel"
jorgito.Size = UDim2.new(0, 532, 0, 271)
jorgito.Position = UDim2.new(0, 10, 0, 10)
jorgito.BackgroundColor3 = Color3.fromRGB(212, 212, 216)
jorgito.Image = getcustomasset("israfloyd.jfif")
jorgito.Parent = MFrame

local title = Instance.new("TextLabel")
title.Name = "TextLabel"
title.Size = UDim2.new(0, 273, 0, 43)
title.Position = UDim2.new(0, 11, 0, 9)
title.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
title.BackgroundTransparency = 0.5
title.Text = "George Israel I can't genocide Exploit GUI"
title.Parent = MFrame

local kgui = Instance.new("TextButton")
kgui.Name = "TextButton"
kgui.Size = UDim2.new(0, 57, 0, 22)
kgui.Position = UDim2.new(0, 472, 0, 19)
kgui.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
kgui.Text = "X"
kgui.Parent = MFrame

local max = Instance.new("TextButton")
max.Name = "TextButton"
max.Size = UDim2.new(0, 32, 0, 22)
max.Position = UDim2.new(0, 439, 0, 19)
max.BackgroundColor3 = Color3.fromRGB(145, 141, 141)
max.Text = "+"
max.Parent = MFrame

local min = Instance.new("TextButton")
min.Name = "TextButton"
min.Size = UDim2.new(0, 29, 0, 22)
min.Position = UDim2.new(0, 410, 0, 19)
min.BackgroundColor3 = Color3.fromRGB(145, 141, 141)
min.Text = "-"
min.Parent = MFrame

local function createbutton(parent, text, posx, posy, color)
    local button = Instance.new("TextButton")
    button.Name = text
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = UDim2.new(0, posx, 0, posy)
    button.BackgroundColor3 = color or Color3.fromRGB(59, 130, 246)
    button.Text = text
    button.Parent = parent

    return button
end

local speed = createbutton(MFrame, "Speed", 23, 64)
local noclip = createbutton(MFrame, "Noclip", 201, 64)
local desync = createbutton(MFrame, "Desync", 379, 64)
local fly = createbutton(MFrame, "Fly", 23, 120)


-- min and max (yip and yap hehehe)
local minimizar = min
local maximizar = max
local originalSize = MFrame.Size
local minimizedSize = UDim2.new(0, 552, 0, 77)
local minimized = false
local exceptions = {
    [kgui] = true,
	[title] = true,
    [max] = true,
    [min] = true
}
minimizar.MouseButton1Click:Connect(function()

    if not minimized then
        MFrame.Size = minimizedSize
        for _, obj in ipairs(MFrame:GetDescendants()) do
            if obj:IsA("GuiObject") and not exceptions[obj] then
                obj.Visible = false
            end
        end
        minimized = true
    end

end)
maximizar.MouseButton1Click:Connect(function()
    if minimized then
        MFrame.Size = originalSize
        for _, obj in ipairs(MFrame:GetDescendants()) do
            if obj:IsA("GuiObject") then
                obj.Visible = true
            end

        end
        minimized = false
    end
end)

local function OaddHover(button)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(240, 240, 240) 
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(145, 141, 141)
    end)
    
end
local function XaddHover(button)
	button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(240, 240, 240) 
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    end)
end
local function killgui(button, gui)
	button.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)


end
local function makeDraggable(frame)
    local dragging = false
    local offset = Vector2.new()

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true

            local mousePos = UIS:GetMouseLocation()
            offset = mousePos - frame.AbsolutePosition
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UIS:GetMouseLocation()

            frame.Position = UDim2.new(
                0,
                mousePos.X - offset.X,
                0,
                mousePos.Y - offset.Y
            )
        end
    end)
end

killgui(kgui, mgui)
XaddHover(kgui)
OaddHover(max)
OaddHover(min)
makeDraggable(MFrame)

--speedgui shit
local function csgui()

	local speedgui = Instance.new("ScreenGui")
	speedgui.Parent = hui
	speedgui.Name = "SGUI"

	local sFrame = Instance.new("Frame")
    sFrame.Name = "sFrame"
    sFrame.Size = UDim2.new(0, 173, 0, 98)
    sFrame.Position = UDim2.new(0, 0, 0, 0)
    sFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sFrame.Parent = speedgui

    local setspeed = Instance.new("TextButton")
    setspeed.Name = "setspeed"
    setspeed.Size = UDim2.new(0, 173, 0, 25)
    setspeed.Position = UDim2.new(0, 0, 0, 73)
    setspeed.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
    setspeed.Text = "Set Speed"
    setspeed.Parent = sFrame

    local tspeed = Instance.new("TextBox")
    tspeed.Name = "tspeed"
    tspeed.Size = UDim2.new(0, 173, 0, 62)
    tspeed.Position = UDim2.new(0, 0, 0, 17)
    tspeed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tspeed.Text = ""
    tspeed.PlaceholderText = "Set your speed bro"
    tspeed.Parent = sFrame

    local dsgui = Instance.new("TextButton")
    dsgui.Name = "dsgui"
    dsgui.Size = UDim2.new(0, 33, 0, 17)
    dsgui.Position = UDim2.new(0, 140, 0, 0)
    dsgui.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    dsgui.Text = "X"
    dsgui.Parent = sFrame

    local dragplace = Instance.new("TextLabel")
    dragplace.Name = "dragplace"
    dragplace.Size = UDim2.new(0, 140, 0, 17)
    dragplace.Position = UDim2.new(0, 0, 0, 0)
    dragplace.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    dragplace.BorderSizePixel = 0
    dragplace.Text = "drag me from here twin"
    dragplace.TextSize = 6
    dragplace.Parent = sFrame

    makeDraggable(sFrame)
    killgui(dsgui, speedgui)
    XaddHover(dsgui)

	setspeed.MouseButton1Click:Connect(function()

    local speed = tonumber(tspeed.Text)
    if speed then
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        humanoid.WalkSpeed = speed
        tspeed.Text = "speed: " .. speed
    else
        tspeed.Text = "put a number dude"
    end

end)
end
speed.MouseButton1Click:Connect(function()
	if gethui():FindFirstChild("SGUI") then
    	return
	end
	csgui()
end)

--noclip shit
local function ncgui()

    local noclipgui = Instance.new("ScreenGui")
    noclipgui.Parent = hui
    noclipgui.Name = "NCGUI"

    local nframe = Instance.new("Frame")
    nframe.Name = "nframe"
    nframe.Size = UDim2.new(0, 187, 0, 100)
    nframe.Position = UDim2.new(0, 0, 0, 400)
    nframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    nframe.Parent = noclipgui

    local drag = Instance.new("TextLabel")
    drag.Name = "drag"
    drag.Size = UDim2.new(0, 112, 0, 21)
    drag.Position = UDim2.new(0, 0, 0, -1)
    drag.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
    drag.BorderSizePixel = 0
    drag.Text = "drag me from here twin"
    drag.TextSize = 7
    drag.Parent = nframe

    local noclipb = Instance.new("TextButton")
    noclipb.Name = "noclipb"
    noclipb.Size = UDim2.new(0, 187, 0, 80)
    noclipb.Position = UDim2.new(0, 0, 0, 20)
    noclipb.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    noclipb.Text = "Noclip: OFF"
    noclipb.Parent = nframe

    local dngui = Instance.new("TextButton")
    dngui.Name = "dngui"
    dngui.Size = UDim2.new(0, 75, 0, 21)
    dngui.Position = UDim2.new(0, 112, 0, -1)
    dngui.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    dngui.Text = "X"
    dngui.Parent = nframe

    makeDraggable(nframe)
    killgui(dngui, noclipgui)
    XaddHover(dngui)

    local RunService = game:GetService("RunService")
    local noclipEnabled = false
    local noclipConnection
    noclipb.MouseButton1Click:Connect(function()
        noclipEnabled = not noclipEnabled
        if noclipEnabled then
            noclipb.Text = "Noclip: On"
            noclipb.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
            noclipConnection = RunService.Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            noclipb.Text = "Noclip: OFF"
            noclipb.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end)
end 
noclip.MouseButton1Click:Connect(function()
    if gethui():FindFirstChild("NCGUI") then
    	return
    end
    ncgui()
end)


--desync shit
local function desgui() 
    local Desyncgui = Instance.new("ScreenGui")
    Desyncgui.Parent = hui
    Desyncgui.Name = "IGUI"
    
    local inframe = Instance.new("Frame")
    inframe.Name = "inframe"
    inframe.Size = UDim2.new(0, 201, 0, 141)
    inframe.Position = UDim2.new(0, 0, 0, 200)
    inframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    inframe.Parent = Desyncgui

    local sync = Instance.new("TextButton")
    sync.Name = "sync"
    sync.Size = UDim2.new(0, 201, 0, 56)
    sync.Position = UDim2.new(0, 0, 0, 85)
    sync.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    sync.Text = "Sync"
    sync.Parent = inframe

    local Desync = Instance.new("TextButton")
   	Desync.Name = "Desync"
    Desync.Size = UDim2.new(0, 201, 0, 55)
    Desync.Position = UDim2.new(0, 0, 0, 31)
    Desync.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    Desync.Text = "Desync"
    Desync.Parent = inframe

    local kinframe = Instance.new("TextButton")
    kinframe.Name = "kinframe"
    kinframe.Size = UDim2.new(0, 67, 0, 31)
    kinframe.Position = UDim2.new(0, 134, 0, 0)
    kinframe.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    kinframe.Text = "X"
    kinframe.Parent = inframe

    local draginf = Instance.new("TextLabel")
    draginf.Name = "draginf"
    draginf.Size = UDim2.new(0, 134, 0, 31)
    draginf.Position = UDim2.new(0, 0, 0, 0)
    draginf.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
    draginf.BorderSizePixel = 0
    draginf.Text = "drag me from here twin"
    draginf.TextSize = 11
    draginf.Parent = inframe

    local daframe = Instance.new("Frame")
    daframe.Name = "daframe"
    daframe.Size = UDim2.new(0, 100, 0, 100)
    daframe.Position = UDim2.new(0, 584, 0, 0)
    daframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    daframe.Parent = hui

    local warndes = Instance.new("TextLabel")
    warndes.Name = "warn des"
    warndes.Size = UDim2.new(0, 200, 0, 101)
    warndes.Position = UDim2.new(0, -50, 0, 0)
    warndes.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    warndes.BorderSizePixel = 0
    warndes.Text = "WARNING! THIS IS A DESYNC, IT DOESNT ACTUALLY MAKE YOU INVISIBLE, SO FIND A WAY TO USE IT"
    warndes.TextSize = 16
    warndes.TextWrapped = true
    warndes.RichText = true
    warndes.Parent = daframe

    local kil = Instance.new("TextButton")
    kil.Name = "kil"
    kil.Size = UDim2.new(0, 34, 0, 16)
    kil.Position = UDim2.new(0, 116, 0, 84)
    kil.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    kil.Text = "x"
    kil.Parent = daframe


    makeDraggable(inframe)
    killgui(kinframe, Desyncgui)
    XaddHover(kinframe)
    OaddHover(sync)
    OaddHover(Desync)
    killgui(kil, daframe)

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer
    local heartbeatConnection
    local renderConnection
    local desyncEnabled = false
    local function stopDesync()

        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end

        if renderConnection then
            renderConnection:Disconnect()
            renderConnection = nil
        end

        local char = player.Character

        if char then
            local root = char:FindFirstChild("HumanoidRootPart")

            if root then
                root.Anchored = false
            end
        end
    end

    local function startDesync()

        local char = player.Character or player.CharacterAdded:Wait()
        local root = char:WaitForChild("HumanoidRootPart")
        stopDesync()
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            root.Anchored = true
        end)
        renderConnection = RunService.RenderStepped:Connect(function()
            root.Anchored = false
        end)
    end
    Desync.MouseButton1Click:Connect(function()
        desyncEnabled = true
        startDesync()
    end)
    sync.MouseButton1Click:Connect(function()
        desyncEnabled = false
        stopDesync()
    end)
    player.CharacterAdded:Connect(function()
        if desyncEnabled then
            task.wait(1)
            startDesync()
        end
    end)
end
desync.MouseButton1Click:Connect(function()
    if gethui():FindFirstChild("IGUI") then
        return
    end
    desgui()
end)

--fly shit
local function flygui()
    local flFrame = Instance.new("Frame")
    flFrame.Name = "flFrame"
    flFrame.Size = UDim2.new(0, 198, 0, 232)
    flFrame.Position = UDim2.new(0, 1000, 0, 44)
    flFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    flFrame.Parent = hui

    local dragaguiga = Instance.new("TextLabel")
    dragaguiga.Name = "dragaguiga"
    dragaguiga.Size = UDim2.new(0, 91, 0, 15)
    dragaguiga.Position = UDim2.new(0, 0, 0, 0)
    dragaguiga.BackgroundColor3 = Color3.fromRGB(245, 158, 11)
    dragaguiga.BorderSizePixel = 0
    dragaguiga.Text = "Drag me from here twin"
    dragaguiga.TextSize = 8
    dragaguiga.Parent = flFrame

    local mini = Instance.new("TextButton")
    mini.Name = "mini"
    mini.Size = UDim2.new(0, 41, 0, 16)
    mini.Position = UDim2.new(0, 91, 0, -1)
    mini.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    mini.Text = "-"
    mini.Parent = flFrame

    local maxi = Instance.new("TextButton")
    maxi.Name = "maxi"
    maxi.Size = UDim2.new(0, 41, 0, 16)
    maxi.Position = UDim2.new(0, 132, 0, -1)
    maxi.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    maxi.Text = "+"
    maxi.Parent = flFrame

    local kfifr = Instance.new("TextButton")
    kfifr.Name = "kfifr"
    kfifr.Size = UDim2.new(0, 25, 0, 16)
    kfifr.Position = UDim2.new(0, 173, 0, -1)
    kfifr.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    kfifr.Text = "X"
    kfifr.Parent = flFrame

    local FB = Instance.new("TextButton")
    FB.Name = "FB"
    FB.Size = UDim2.new(0, 198, 0, 66)
    FB.Position = UDim2.new(0, 0, 0, 15)
    FB.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    FB.Text = "Fly: Off"
    FB.Parent = flFrame

    local NB = Instance.new("TextButton")
    NB.Name = "NB"
    NB.Size = UDim2.new(0, 198, 0, 66)
    NB.Position = UDim2.new(0, 0, 0, 81)
    NB.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    NB.Text = "Noclip: Off"
    NB.Parent = flFrame

    local lesped = Instance.new("TextButton")
    lesped.Name = "lesped"
    lesped.Size = UDim2.new(0, 30, 0, 85)
    lesped.Position = UDim2.new(0, 0, 0, 147)
    lesped.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    lesped.Text = "-"
    lesped.TextSize = 30
    lesped.Parent = flFrame

    local morsped = Instance.new("TextButton")
    morsped.Name = "morsped"
    morsped.Size = UDim2.new(0, 30, 0, 85)
    morsped.Position = UDim2.new(0, 168, 0, 147)
    morsped.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    morsped.Text = "+"
    morsped.TextSize = 30
    morsped.Parent = flFrame

    local spedem = Instance.new("TextBox")
    spedem.Name = "spedem"
    spedem.Size = UDim2.new(0, 138, 0, 66)
    spedem.Position = UDim2.new(0, 30, 0, 166)
    spedem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    spedem.Text = ""
    spedem.PlaceholderText = "CLICK ME"
    spedem.Parent = flFrame

    local spedtitle = Instance.new("TextButton")
    spedtitle.Name = "spedtitle"
    spedtitle.Size = UDim2.new(0, 138, 0, 19)
    spedtitle.Position = UDim2.new(0, 30, 0, 147)
    spedtitle.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
    spedtitle.BorderSizePixel = 0
    spedtitle.Text = "Set Speed"
    spedtitle.Parent = flFrame

    makeDraggable(flFrame)
    killgui(kfifr, flFrame)
    XaddHover(kfifr)

    for _, button in pairs({mini, maxi, lesped, morsped}) do
        OaddHover(button)
    end

    local minimizedsizediseble = UDim2.new(0, 198, 0, 15)
    local maximizese = UDim2.new(0, 198, 0, 232)
    local minimized = false
    local minsizebutton = mini
    local maxsizebutton = maxi

    local exceptions = {
        [dragaguiga] = true,
        [mini] = true,
        [maxi] = true,
        [kfifr] = true
    }

    minsizebutton.MouseButton1Click:Connect(function()
        if not minimized then
            flFrame.Size = minimizedsizediseble
            for _, obj in pairs(flFrame:GetDescendants()) do
                if obj:IsA("GuiObject") and not exceptions[obj] then
                    obj.Visible = false
                end
            end
            minimized = true
        end
    end)

    maxsizebutton.MouseButton1Click:Connect(function()
    if minimized then
        flFrame.Size = maximizese
        for _, obj in pairs(flFrame:GetDescendants()) do
            if obj:IsA("GuiObject") then
                obj.Visible = true
            end
        end
        minimized = false
    end
    end)
    
    local flying = false

    FB.MouseButton1Click:Connect(function()
            flying = not flying
            if flying then
                FB.Text = "Fly ON"
                FB.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
            else
                FB.Text = "Fly OFF"
                FB.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
            end
    end)

    local RunService = game:GetService("RunService")
    local noclipEnabled = false
    local noclipConnection

    NB.MouseButton1Click:Connect(function()
        noclipEnabled = not noclipEnabled
        if noclipEnabled then
            NB.Text = "Noclip: ON"
            NB.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
            noclipConnection = RunService.Stepped:Connect(function()
                local char = player.Character
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)

        else
            NB.Text = "Noclip: OFF"
            NB.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end)
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")

    spedtitle.MouseButton1Click:Connect(function()
            local speed = tonumber(spedem.Text)
        if speed then
            humanoid.WalkSpeed = speed
            spedem.Text = speed
        else
            spedem.Text = "put a number dude"
        end
    end)

    morsped.MouseButton1Click:Connect(function()    
        local char = player.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        humanoid.WalkSpeed += 1
        spedem.Text = humanoid.WalkSpeed
    end)

    lesped.MouseButton1Click:Connect(function()
        local char = player.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        humanoid.WalkSpeed -= 1
        spedem.Text = humanoid.WalkSpeed
    end)
end
fly.MouseButton1Click:Connect(function()
    if gethui():FindFirstChild("FLGUI") then
        return
    end
    flygui()
end)
