--WE LOVE CHATGPT CODE YAYAYAYGSFAFASFGYFSA
local p = game:GetService("Players").LocalPlayer
local mick = Instance.new("ImageLabel")
local egg = Instance.new("ScreenGui")
local penisminus = 67676766
local penisplus = 67676767
local baseURL = "https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/refs/heads/main/assets/frames/"
local sservice = cloneref(game:GetService("SoundService"))

if not isfile("minie.png") then
    writefile("minie.png",game:HttpGet("https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/refs/heads/main/assets/hihihi.png"))
end
if not isfile("music67.mp3") then
    writefile("music67.mp3",game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/erm2_wpumQDER.mp3"))
end

local minie = Instance.new("ImageLabel")
local ptpb = Instance.new("Sound")
local frames = {}

for i = 1, 22 do
    local file = "frame" .. i .. ".jpg"
    local githubFile = string.format("ezgif-frame-%03d.jpg", i)
    if not isfile(file) then
        local data = game:HttpGet(baseURL .. githubFile)
        writefile(file, data)
    end
    frames[i] = getcustomasset(file)
end

local cp = game:GetService("ContentProvider")
cp:PreloadAsync(frames)


egg.IgnoreGuiInset = true
egg.ResetOnSpawn = false
egg.DisplayOrder = penisplus
egg.Parent = gethui()
mick.Size = UDim2.fromScale(1, 1)
mick.Position = UDim2.fromScale(0, 0)
mick.BackgroundTransparency = 1
mick.BorderSizePixel = 0
mick.ImageTransparency = 0
mick.ScaleType = Enum.ScaleType.Crop
mick.Visible = false
mick.ZIndex = penisplus
mick.Parent = egg
minie.Size = UDim2.fromScale(0.5, 1)
minie.AnchorPoint = Vector2.new(0.5, 0.5)
minie.Position = UDim2.fromScale(0.5, 0.5)
minie.BackgroundTransparency = 1
minie.BorderSizePixel = 0
minie.ImageTransparency = 0
minie.ScaleType = Enum.ScaleType.Crop
minie.Visible = false
minie.ZIndex = penisminus
minie.Parent = egg
minie.Image = getcustomasset("minie.png")

ptpb.SoundId = getcustomasset("music67.mp3")
ptpb.Volume = 20
ptpb.Looped = false
ptpb.Parent = sservice

function playstuff()
    ptpb:Play()
    minie.Visible = true
    
    task.wait(0.9)
    
    mick.Visible = true
    for i = 1, 22 do
        mick.Image = frames[i]
        task.wait(1 / 22)
    end
    
    task.wait(0.6)

    p:Kick("i can plant you a rat and you would never know, skid")
end


mick.Visible = true

for i = 1, 22 do
    mick.Image = frames[i]
    task.wait()
end

mick.Image = frames[1]
mick.Visible = false

playstuff()