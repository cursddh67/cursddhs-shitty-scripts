--made by mox lol
local cloneref = cloneref or getgenv().cloneref
local Players = cloneref(game:GetService("Players"))
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hui = gethui()
local Tservice = cloneref(game:GetService("TweenService"))
local Sservice = cloneref(game:GetService("SoundService"))
local checkpoint
local deaths = 0
--volume
local SavedVolumes = {}
local function MuteAll()
    table.clear(SavedVolumes)

    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("Sound") and v ~= bfdaudio and v ~= UEUaudio then
            SavedVolumes[v] = v.Volume
            v.Volume = 0
        end
    end
end
local function RestoreAll()
    for sound, volume in pairs(SavedVolumes) do
        if sound and sound.Parent then
            sound.Volume = volume
        end
    end
end

--properties + audio
writefile("UEU.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/UEU.mp3"))
writefile("bfdaudio.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/bfdaudio.mp3"))

local ttgui = Instance.new("ScreenGui")
ttgui.Parent = hui
ttgui.IgnoreGuiInset = true
ttgui.DisplayOrder = 999999

local dframe = Instance.new("Frame")
local bfdframe = Instance.new("Frame")
local bfdaudio = Instance.new("Sound")
local UEUaudio = Instance.new("Sound")
local savebutton = Instance.new("TextButton")

bfdaudio.SoundId = getcustomasset("bfdaudio.mp3")
bfdaudio.Volume = 3
bfdaudio.Parent = Sservice

UEUaudio.SoundId = getcustomasset("UEU.mp3")
UEUaudio.Volume = 5
UEUaudio.Parent = Sservice

bfdaudio.Loaded:Wait()
UEUaudio.Loaded:Wait()

savebutton.Size = UDim2.new(0, 100, 0, 50)
savebutton.AnchorPoint = Vector2.new(1, 0.5)
savebutton.Position = UDim2.new(1, -10, 0.5, 0)
savebutton.Text = "Save yourself"
savebutton.Parent = ttgui

dframe.Size = UDim2.new(1, 0, 1, 0)
dframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dframe.Visible = false
dframe.BackgroundTransparency = 1
dframe.Parent = ttgui

bfdframe.Size = UDim2.new(1, 0, 1, 0)
bfdframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bfdframe.Parent = ttgui
bfdframe.Visible = false

dframe.ZIndex = 999999
bfdframe.ZIndex = 999999

local deathTween = Tservice:Create(
    dframe,
    TweenInfo.new(0.1),
    {
        BackgroundTransparency = 0
    }
)

--save pos every 90 seconds
task.spawn(function()
    while true do

        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if hrp then
            checkpoint = hrp.CFrame
            print("possaved")
        end

        task.wait(90)
    end
end)

local hrp = character:FindFirstChild("HumanoidRootPart")

if hrp then
    checkpoint = hrp.CFrame
end

savebutton.MouseButton1Click:Connect(function()

    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if hrp then
        checkpoint = hrp.CFrame
        print("checkpoint saved")
    end

end)

local function SetupCharacter(char)

    local humanoid = char:WaitForChild("Humanoid")

    humanoid.Died:Connect(function()

        deaths += 1

        MuteAll()

        deathTween:Cancel()

        dframe.Visible = true
        dframe.BackgroundTransparency = 1

        deathTween:Play()

    end)

end

local flashTween = Tservice:Create(
    bfdframe,
    TweenInfo.new(1),
    {
        BackgroundTransparency = 1
    }
)

flashTween.Completed:Connect(function()
    bfdframe.Visible = false
    bfdframe.BackgroundTransparency = 0
end)

SetupCharacter(player.Character or player.CharacterAdded:Wait())

player.CharacterAdded:Connect(function(char)

    SetupCharacter(char)

    if checkpoint then

        local hrp = char:WaitForChild("HumanoidRootPart")

        task.wait(0.1)

        hrp.CFrame = checkpoint

        task.wait(1.9)

        RestoreAll()

        bfdaudio:Stop()
        bfdaudio:Play()

        print(deaths)

        if deaths >= 10 then
            UEUaudio:Stop()
            task.wait(0.9)
            UEUaudio:Play()
            deaths = 0
        end

        dframe.Visible = false
        dframe.BackgroundTransparency = 1

        flashTween:Cancel()

        bfdframe.Visible = true
        bfdframe.BackgroundTransparency = 0

        flashTween:Play()

    end

end)