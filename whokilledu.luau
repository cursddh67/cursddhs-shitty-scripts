--made by mox
local cloneref = cloneref or getgenv().cloneref --cloneref smhw doesnt work with loadstrings 

if not cloneref then
    error("cloneref is not available in this env or doesnt work, rip")
end

local Pla = cloneref(game:GetService("Players"))
local p = Pla.LocalPlayer

local function onCharacterAdded(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        local tag = humanoid:FindFirstChild("creator") --btw creator isnt always it
        if tag and tag.Value and tag.Value ~= p then
            print("you were killed by: " .. tag.Value.Name)
        end
    end)
end

p.CharacterAdded:Connect(onCharacterAdded) --fut spawns
if p.Character then 
    onCharacterAdded(p.Character) 
end
print("loaded")
