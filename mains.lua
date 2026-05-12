-- im not a skid, have fun
--wgui
local cloneref = cloneref or getgenv().cloneref
local Players = cloneref(game:GetService("Players"))
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local hui = gethui() :: (BasePlayerGui | Folder)

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

writefile("ihl28v.png", game:HttpGet("https://files.catbox.moe/ihl28v.png"))
local Israflag = Instance.new("ImageLabel")
Israflag.Name = "ImageLabel"
Israflag.Size = UDim2.new(0, 300, 0, 170)
Israflag.Position = UDim2.new(0, 60, 0, 30)
Israflag.BackgroundColor3 = Color3.fromRGB(212, 212, 216)
Israflag.Image = getcustomasset("ihl28v.png")
Israflag.Parent = WFrame

local Wname = Instance.new("TextLabel")
Wname.Name = "TextLabel"
Wname.Size = UDim2.new(0, 369, 0, 188)
Wname.Position = UDim2.new(0, 60, 0, 30)
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

writefile("s8ejxp.jfif", game:HttpGet("https://files.catbox.moe/s8ejxp.jfif"))
local jorgito = Instance.new("ImageLabel")
jorgito.Name = "ImageLabel"
jorgito.Size = UDim2.new(0, 532, 0, 271)
jorgito.Position = UDim2.new(0, 10, 0, 10)
jorgito.BackgroundColor3 = Color3.fromRGB(212, 212, 216)
jorgito.Image = getcustomasset("s8ejxp.jfif")
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

local speed = Instance.new("TextButton")
speed.Name = "speed"
speed.Size = UDim2.new(0, 150, 0, 40)
speed.Position = UDim2.new(0, 23, 0, 64)
speed.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
speed.Text = "Speed"
speed.Parent = MFrame

local noclip = Instance.new("TextButton")
noclip.Name = "noclip"
noclip.Size = UDim2.new(0, 150, 0, 40)
noclip.Position = UDim2.new(0, 201, 0, 64)
noclip.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
noclip.Text = "Noclip"
noclip.Parent = MFrame

local invisible = Instance.new("TextButton")
invisible.Name = "invisible"
invisible.Size = UDim2.new(0, 150, 0, 40)
invisible.Position = UDim2.new(0, 379, 0, 64)
invisible.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
invisible.Text = "Invisible (Local)"
invisible.Parent = MFrame

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
    sFrame.Position = UDim2.new(0, 252, 0, 491)
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
    nframe.Position = UDim2.new(0, 0, 0, 0)
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
    
    local yesclip = Instance.new("TextButton")
    yesclip.Name = "yesclip"
    yesclip.Size = UDim2.new(0, 187, 0, 40)
    yesclip.Position = UDim2.new(0, 0, 0, 60)
    yesclip.BackgroundColor3 = Color3.fromRGB(145, 141, 141)
    yesclip.Text = "yesclip"
    yesclip.Parent = nframe

    local noclip = Instance.new("TextButton")
    noclip.Name = "noclip"
    noclip.Size = UDim2.new(0, 187, 0, 40)
    noclip.Position = UDim2.new(0, 0, 0, 20)
    noclip.BackgroundColor3 = Color3.fromRGB(145, 141, 141)
    noclip.Text = "noclip"
    noclip.Parent = nframe

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

    local function enableNoclip()
        local char = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end

    local function disableNoclip()
        local char = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end

    noclip.MouseButton1Click:Connect(enableNoclip)
    yesclip.MouseButton1Click:Connect(disableNoclip)
    
    OaddHover(yesclip)
    OaddHover(noclip)
        
end
noclip.MouseButton1Click:Connect(function()
    if gethui():FindFirstChild("NCGUI") then
    	return
    end
    ncgui()
end)

--invisible shit
local function invgui() 
    local invisiblegui = Instance.new("ScreenGui")
    invisiblegui.Parent = hui
    invisiblegui.Name = "IGUI"
    
    local inframe = Instance.new("Frame")
    inframe.Name = "inframe"
    inframe.Size = UDim2.new(0, 201, 0, 141)
    inframe.Position = UDim2.new(0, 0, 0, 0)
    inframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    inframe.Parent = invisiblegui

    local visible = Instance.new("TextButton")
    visible.Name = "visible"
    visible.Size = UDim2.new(0, 201, 0, 56)
    visible.Position = UDim2.new(0, 0, 0, 85)
    visible.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    visible.Text = "Visible"
    visible.Parent = inframe

    local invisible = Instance.new("TextButton")
    invisible.Name = "invisible"
    invisible.Size = UDim2.new(0, 201, 0, 55)
    invisible.Position = UDim2.new(0, 0, 0, 31)
    invisible.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    invisible.Text = "Invisible"
    invisible.Parent = inframe

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

    makeDraggable(inframe)
    killgui(kinframe, invisiblegui)
    XaddHover(kinframe)
    OaddHover(invisible)
	OaddHover(visible)

end
invisible.MouseButton1Click:Connect(function()
    if gethui():FindFirstChild("IGUI") then
    	return
    end
    invgui()
end)
