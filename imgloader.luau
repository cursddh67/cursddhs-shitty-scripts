local players = cloneref(game:GetService("Players"))
local player = players.LocalPlayer

local ui = {}

ui.hui = gethui()

ui.gui = Instance.new("ScreenGui")
ui.gui.IgnoreGuiInset = true
ui.gui.Parent = ui.hui

local function makeInput(placeholder, posY)
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.6, 0, 0, 35)
    input.Position = UDim2.new(0.2, 0, posY, 0)
    input.PlaceholderText = placeholder
    input.Text = ""
    input.Parent = ui.gui
    return input
end

ui.url         = makeInput("image url...",    0.25)
ui.sizex       = makeInput("size x (0-1)",   0.32)
ui.sizey       = makeInput("size y (0-1)",   0.39)
ui.posx        = makeInput("position x",     0.46)
ui.posy        = makeInput("position y",     0.53)
ui.transparency = makeInput("transparency (0-1)", 0.60)

ui.button = Instance.new("TextButton")
ui.button.Size = UDim2.new(0.2, 0, 0, 35)
ui.button.Position = UDim2.new(0.4, 0, 0.68, 0)
ui.button.Text = "commit"
ui.button.Parent = ui.gui

ui.image = Instance.new("ImageLabel")
ui.image.BackgroundTransparency = 1
ui.image.Visible = false
ui.image.Parent = ui.gui
ui.image.Size = UDim2.new(0, sizex, 0, sizey)         -- pixels
ui.image.Position = UDim2.new(0, posx, 0, posy)

ui.button.MouseButton1Click:Connect(function()
    local url          = ui.url.Text
    local sizex        = tonumber(ui.sizex.Text) or 0.5
    local sizey        = tonumber(ui.sizey.Text) or 0.5
    local posx         = tonumber(ui.posx.Text) or 0
    local posy         = tonumber(ui.posy.Text) or 0
    local transparency = tonumber(ui.transparency.Text) or 0

    if url == "" then return end

    local response = request({
        Url = url,
        Method = "GET",
    })

    if response.Success then
        writefile("tempimage.png", response.Body)
        ui.image.Image = getcustomasset("tempimage.png")
        ui.image.Size = UDim2.new(sizex, 0, sizey, 0)
        ui.image.Position = UDim2.new(posx, 0, posy, 0)
        ui.image.ImageTransparency = transparency
        ui.image.Visible = true
    else
        ui.button.Text = "failed! check url"
        task.wait(2)
        ui.button.Text = "commit"
    end
end)
