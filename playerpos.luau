--the code is mine, but i was too lazy to make a design so i lowk js asked ai to make a design :P
--made by mox and israelgpt
local ps = cloneref(game:GetService("Players"))
local rservice = cloneref(game:GetService("RunService"))
local gui = Instance.new("ScreenGui")
local mfra = Instance.new("Frame")
local scrfr = Instance.new("ScrollingFrame")
local layout = Instance.new("UIListLayout")
local close = Instance.new("TextButton")
local closecorner = Instance.new("UICorner")
local mfracorner = Instance.new("UICorner")

gui.Parent = gethui()
mfra.Parent = gui
scrfr.Parent = mfra
layout.Parent = scrfr
close.Parent = mfra
closecorner.Parent = close
mfracorner.Parent = mfra

mfra.Name = "mfra"
mfra.Size = UDim2.new(0,620,0,350)
mfra.Position = UDim2.new(0.5,-310,0.5,-175)
mfra.BackgroundColor3 = Color3.fromRGB(24,24,24)
mfra.BorderSizePixel = 0

scrfr.Name = "scrfr"
scrfr.Size = UDim2.new(1,-20,1,-60)
scrfr.Position = UDim2.new(0,10,0,50)
scrfr.BackgroundColor3 = Color3.fromRGB(34,34,34)
scrfr.BorderSizePixel = 0

scrfr.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrfr.CanvasSize = UDim2.new()

layout.Padding = UDim.new(0,8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder

close.Size = UDim2.new(0,90,0,30)
close.Position = UDim2.new(1,-100,0,10)
close.BackgroundColor3 = Color3.fromRGB(210,60,60)
close.Text = "X"
close.TextColor3 = Color3.new(0, 0, 0)
close.BorderSizePixel = 0

local labels = {}

local function addp(p)

    if labels[p] then
        return
    end

    local fra = Instance.new("Frame")
    local fracorner = Instance.new("UICorner")
    local namel = Instance.new("TextLabel")
    local posl = Instance.new("TextLabel")

    fra.Parent = scrfr
    fracorner.Parent = fra
    namel.Parent = fra
    posl.Parent = fra

    fra.Size = UDim2.new(1,-10,0,55)
    fra.BackgroundColor3 = Color3.fromRGB(48,48,48)
    fra.BorderSizePixel = 0

    namel.Size = UDim2.new(1,-10,0,22)
    namel.Position = UDim2.new(0,5,0,4)
    namel.BackgroundTransparency = 1
    namel.Text = p.Name
    namel.TextColor3 = Color3.new(1,1,1)
    namel.TextXAlignment = Enum.TextXAlignment.Left
    namel.Font = Enum.Font.GothamBold
    namel.TextSize = 16

    posl.Size = UDim2.new(1,-10,0,20)
    posl.Position = UDim2.new(0,5,0,28)
    posl.BackgroundTransparency = 1
    posl.Text = "let it load a bit"
    posl.TextColor3 = Color3.fromRGB(200,200,200)
    posl.TextXAlignment = Enum.TextXAlignment.Left
    posl.Font = Enum.Font.Code
    posl.TextSize = 14

    labels[p] = {
        fra = fra,
        posl = posl
    }
end

local function remp(p)
    if labels[p] then
        labels[p].fra:Destroy()
        labels[p] = nil
    end

end

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

for _, p in ipairs(ps:GetPlayers()) do
    addp(p)
end

ps.PlayerAdded:Connect(addp)
ps.PlayerRemoving:Connect(remp)

rservice.RenderStepped:Connect(function()

    for p, data in pairs(labels) do
        local c = p.Character
        if c then
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                data.posl.Text = string.format(
                    "X: %.1f | Y: %.1f | Z: %.1f",
                    pos.X,
                    pos.Y,
                    pos.Z
                )
            else
                data.posl.Text = "no hrp"
            end
        else
            data.posl.Text = "no character"

        end
    end
end)
