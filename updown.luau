--hardcoded bs
local players = game:GetService("Players")
local p = players.LocalPlayer
local char = p.Character or p.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
hrp.Anchored = true
rs.Heartbeat:Connect(function()
    if uis:IsKeyDown(Enum.KeyCode.E) then
        hrp.CFrame = hrp.CFrame + Vector3.new(0,3,0)
    end
    if uis:IsKeyDown(Enum.KeyCode.Q) then
        hrp.CFrame = hrp.CFrame - Vector3.new(0,3,0)
    end
end)

if uis:InputBegan(Enum.KeyCode.N) then
    hrp.Anchored = false
end
