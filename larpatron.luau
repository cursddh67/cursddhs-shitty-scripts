--stuffy
local players = cloneref(game:GetService("Players"))
local Player = players.LocalPlayer
local character = Player.Character or Player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local Lighting = cloneref(game:GetService("Lighting"))
local RunService = cloneref(game:GetService("RunService"))
local soundservice = cloneref(game:GetService("SoundService"))
local contentProvider = game:GetService("ContentProvider")
local current = 1
local colorCorrection = Instance.new("ColorCorrectionEffect")
local head = character:WaitForChild("Head")
local face = head:FindFirstChild("face")
local isR6 = character:FindFirstChild("Torso") ~= nil


--files

local files = {}
    writefile("sob.jpg", game:HttpGet("https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/refs/heads/main/assets/sob.jpg"))
    writefile("LARPTEKK.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/LARPTEKK.mp3"))
    writefile("RAMPAGE.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/Number%20(rampage%20song)%20with%20low%20honor%20and%20rampage%20sound%20effect.mp3"))
    writefile("HOLYTERRA.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/HOLY%20TERRA.mp3"))
    writefile("core.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/dr3mc0r3.exp.mp3"))
print("closed")

local musicFiles = {"LARPTEKK.mp3", "RAMPAGE.mp3", "HOLYTERRA.mp3", "core.mp3"}
local music = {}
for i, file in ipairs(musicFiles) do
    local sound = Instance.new("Sound")
    sound.SoundId = getcustomasset(file)
    sound.Volume = 5
    sound.Parent = soundservice
    music[i] = sound    
end

contentProvider:PreloadAsync(music)
print("loaded music")



local ui = {}

    ui.hui = gethui()

    ui.gui = Instance.new("ScreenGui")
    ui.gui.IgnoreGuiInset = true
    ui.gui.Parent = ui.hui

    ui.frame = Instance.new("Frame")
    ui.frame.Size = UDim2.new(1, 0, 1, 0)
    ui.frame.Position = UDim2.new(0, 0, 0, 0)
    ui.frame.BackgroundTransparency = 1
    ui.frame.Parent = ui.gui

    ui.image = Instance.new("ImageLabel")
    ui.image.Size = UDim2.new(0, 100, 0, 100)
    ui.image.Position = UDim2.new(1, -100, 0, 100)
    ui.image.AnchorPoint = Vector2.new(1, 0)
    ui.image.BackgroundTransparency = 1
    ui.image.Image = getcustomasset("sob.jpg")
    ui.image.Parent = ui.frame

    ui.button = Instance.new("TextButton")
    ui.button.Size = UDim2.new(0, 100, 0, 50)
    ui.button.Position = UDim2.new(0, 10, 0.5, 0)
    ui.button.AnchorPoint = Vector2.new(0, 0.5)
    ui.button.Text = "333 DANCE"
    ui.button.Parent = ui.frame
    ui.button.BackgroundTransparency = 0

print("i just wanted to close this thing lol (look at the code)")

ui.image.BackgroundTransparency = 0
RunService.Heartbeat:Connect(function()
    ui.image.Rotation = ui.image.Rotation + 2
end)

local function playNext()
    music[current]:Play()
    music[current].Ended:Wait()
    current = (current % #music) + 1
    playNext()
end

task.spawn(playNext)

colorCorrection.Parent = Lighting
colorCorrection.Saturation = -1
colorCorrection.Contrast = 0.5
colorCorrection.Brightness = -0.2

if isR6 then
    local leftArm = character:WaitForChild("Left Arm")
    local rightArm = character:WaitForChild("Right Arm")
    
    leftArm.Size = Vector3.new(1.2, 3, 1.2)
    rightArm.Size = Vector3.new(1.2, 3, 1.2)
else
    local leftUpperArm = character:WaitForChild("LeftUpperArm")
    local rightUpperArm = character:WaitForChild("RightUpperArm")

    leftUpperArm.Size = Vector3.new(1.2, 2, 1.2)
    rightUpperArm.Size = Vector3.new(1.2, 2, 1.2)
end

for _, acc in ipairs(character:GetChildren()) do
    if acc:IsA("Accessory") then
        local handle = acc:FindFirstChild("Handle")
        if handle then
            handle.Size = Vector3.new(2, 2, 2) -- adjust size
        end
    end
end

local emotes = {
    77147532000113,
    92141667630169,
    112708855940282,
    116468071022853,
    74608751145756,
    88693910954718,
}


ui.button.MouseButton1Click:Connect(function()
    local randomemote = emotes[math.random(1, #emotes)]
    local track = humanoid:PlayEmoteAndGetAnimTrackById(randomemote)
    if track and typeof(track) ~= "boolean" then
        track:AdjustSpeed(0.65)
    end
end)
