-- made by mox
-- stuff
local players = cloneref(game:GetService("Players"))
local rservice = cloneref(game:GetService("RunService"))
local cam = workspace.CurrentCamera
local p = players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local hrp = c:WaitForChild("HumanoidRootPart")
local evilcat = Instance.new("Part")
local hitbox = Instance.new("Part")
local sservice = cloneref(game:GetService("SoundService"))
local humanoid = c:WaitForChild("Humanoid")

if not isfile("scream2") then
    writefile("scream2", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/Wilhelm%20Scream%20-%20Sound%20Effect%20(HD).mp3"))
end

if not isfile("uncannycat.png") then
    writefile("uncannycat.png", game:HttpGet("https://raw.githubusercontent.com/cursddh67/cursddhs-shitty-scripts/refs/heads/main/assets/uncannycat.png"))
end

if not isfile("scream.mp3") then
    writefile("scream.mp3", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/Half%20Life%202%20Stalker%20Scream%20Sound%20Effect.mp3"))
end

if not isfile("music") then
    writefile("music", game:HttpGet("https://github.com/cursddh67/cursddhs-shitty-scripts/raw/refs/heads/main/assets/19.%20The%20Final%20Frontier%20(introless%20ver.)%20(World%204).mp3"))
end

print("loaded")

music = Instance.new("Sound")
music.SoundId = getcustomasset("music")
music.Volume = 5
music.Looped = true
music.Parent = sservice
music:Play()


local gui = Instance.new("ScreenGui")
gui.Parent = gethui()
gui.IgnoreGuiInset = true
local img = Instance.new("ImageLabel")
img.Size = UDim2.fromScale(1, 1)
img.Position = UDim2.fromScale(0, 0)
img.Visible = false
img.ScaleType = Enum.ScaleType.Crop
img.Image = getcustomasset("uncannycat.png")
img.ZIndex = 999
img.Parent = gui


local scream = Instance.new("Sound")
scream.SoundId = getcustomasset("scream.mp3")
scream.Volume = 10
scream.Parent = sservice

local scream2 = Instance.new("Sound")
scream2.SoundId = getcustomasset("scream2")
scream2.Volume = 10
scream2.Parent = sservice

local cat = getcustomasset("uncannycat.png")
local front = Instance.new("Decal")
local back = Instance.new("Decal")

--part props
evilcat.Name = "jokesonyouimalreadygay"
evilcat.Size = Vector3.new(8, 8, 0)
evilcat.Color = Color3.fromRGB(0, 0, 0)
evilcat.Anchored = true
evilcat.CanCollide = false
evilcat.CanTouch = false
evilcat.CanQuery = false
evilcat.Material = Enum.Material.SmoothPlastic
evilcat.Position = hrp.Position + Vector3.new(0, 5, -50)
evilcat.Parent = workspace

hitbox.Transparency = 1
hitbox.Size = Vector3.new(8, 8, 0.5)
hitbox.Anchored = true
hitbox.CanCollide = false
hitbox.CanTouch = true
hitbox.CanQuery = false
hitbox.Parent = workspace


--decals
for _, face in ipairs({Enum.NormalId.Front, Enum.NormalId.Back}) do
    local dc = Instance.new("Decal")
    dc.Face = face
    dc.Texture = cat
    dc.Parent = evilcat
end

local vt = 12

rservice.Heartbeat:Connect(function(dt)
    if not c.Parent then
        c = p.Character or p.CharacterAdded:Wait()
        hrp = c:WaitForChild("HumanoidRootPart")
    end
    local dir = hrp.Position - evilcat.Position
    local dis = dir.Magnitude
    if dis > 0 then
        local step = math.min(vt * dt, dis)
        evilcat.Position += dir.Unit * step
        hitbox.CFrame = evilcat.CFrame
    
        evilcat.CFrame = CFrame.lookAt(evilcat.Position, cam.CFrame.Position)
    end
end)

hitbox.Touched:Connect(function(hit)
    if hit.Parent == p.Character then
        scream:Play()
        img.Visible = true
        task.wait(2.2)
        gui:Destroy()
        scream:Destroy()
        evilcat:Destroy()
        scream2:Play()
        img.Visible = false
        local hum = c:WaitForChild("Humanoid")
        hum:ChangeState(Enum.HumanoidStateType.Physics)
        hrp.AssemblyLinearVelocity = Vector3.new(math.random(-80, 80),80,math.random(-80, 80))
        hrp.AssemblyAngularVelocity = Vector3.new(math.random(-25, 25),math.random(-25, 25),math.random(-25, 25)
        task.wait(5)
        p:Kick("dont let the cat catch you")
    end
end)
