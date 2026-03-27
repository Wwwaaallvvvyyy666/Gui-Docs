-- module created by triplesixxx.
repeat task.wait() until game:IsLoaded()

return function()
    local player = game:GetService("Players").LocalPlayer
    local rs = game:GetService("ReplicatedStorage")

    local sprintRemote = rs:WaitForChild("RemoteEvents"):WaitForChild("SprintToggle")

    local function enableSprint()
        sprintRemote:FireServer(true)
    end

    if player.Character then
        task.spawn(function()
            task.wait(0.5)
            enableSprint()
        end)
    end

    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        enableSprint()
    end)

    task.spawn(function()
        while true do
            task.wait(2)
            pcall(function()
                sprintRemote:FireServer(true)
            end)
        end
    end)
end
