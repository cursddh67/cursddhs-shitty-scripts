local players = cloneref(game:GetService("Players"))
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local head = character:FindFirstChild("Head")
local RP = character:WaitForChild("HumanoidRootPart")
local hui = gethui()
local gui = Instance.new("ScreenGui")
gui.Parent = hui
local frame = Instance.new("Frame")
frame.Transparency = 0.4
frame.Size = UDim2.new(1, 1, 1, 1)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Position = UDim2.new(0, 0, 0, 0)

local maxsize = 10

local function randomScale()
    return math.random(5, 100) / 10
end

local function THELOOP(char)
    while true do
        frame.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1)
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Color = Color3.fromRGB(
                    math.random(0,255),
                    math.random(0,255),
                    math.random(0,255)
                )

                v.Material = Enum.Material:GetEnumItems()[math.random(1, #Enum.Material:GetEnumItems())]
            end
        end

        for _, part in ipairs(char:GetChildren()) do
             if part:IsA("BasePart") then
                part.Size = Vector3.new(math.random(5, maxsize), math.random(5, maxsize), math.random(5, maxsize))
                part.CanCollide = false
                head.CanCollide = true
            end
        end

        for _, v in ipairs(character:GetChildren()) do
            if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
                v:Destroy()
            end
        end
        for _, m in ipairs(char:GetDescendants()) do
            if m:IsA("Motor6D") then
                m.C0 = CFrame.Angles(
                    math.rad(math.random(-180,180)),
                    math.rad(math.random(-180,180)),
                    math.rad(math.random(-180,180))
                )
            end
        end

        for _, acc in ipairs(character:GetChildren()) do
            if acc:IsA("Accessory") then
                local handle = acc:FindFirstChild("Handle")
                 if handle and handle:IsA("BasePart") then
                    handle.Size = Vector3.new(
                    math.random(5,100)/10,
                    math.random(5,100)/10,
                    math.random(5,100)/10
                    )
                end
            end
        end
        print("WE ARE NOT DONE YET YOU ARE IN THE FRAUD WATCH")
        task.wait(0.001)
    end

end
THELOOP(character)
