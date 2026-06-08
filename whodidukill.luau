--made by mox
local cloneref = cloneref or getgenv().cloneref

if not cloneref then
    error("cloneref is not available in this env or doesnt work, rip")
end

local Pla = cloneref(game:GetService("Players"))
local p = Pla.LocalPlayer

local function hookpl(otherpl) --hookfunction() doesnt work smhw :<
    local function onCharacter(char)
        local humanoid = char:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            local tag = humanoid:FindFirstChild("creator")
            if tag and tag.Value == p then
                print("you killed: " .. otherpl.Name)
            end
        end)
    end

    otherpl.CharacterAdded:Connect(onCharacter)
    if otherpl.Character then
        onCharacter(otherpl.Character)
    end
end

for _, otherpl in ipairs(Pla:GetPlayers()) do
    if otherpl ~= p then
        hookpl(otherpl)
    end
end

--for new players
Pla.PlayerAdded:Connect(function(otherpl)
    hookpl(otherpl)
end)

print("loaded :v")
