--[[
    Fingerprint.lua
     - typechecked
    All rights reserved
]]--

-- Services
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local World = game:GetService("Workspace")

-- Modules
local SHA1 = require(ReplicatedStorage:WaitForChild("Common").SHA1)

return function ()
    local DataPoints = {
        CPUStart = math.floor(tick() - os.clock()),
        Timezone = os.date("%Z"),
        DST = os.date("*t").isdst,
        ResolutionX = World.CurrentCamera.ViewportSize.X,
        ResolutionY = World.CurrentCamera.ViewportSize.Y,
        HasAccelerometer = UserInputService.AccelerometerEnabled,
        HasTouch = UserInputService.TouchEnabled,
        HasGyro = UserInputService.GyroscopeEnabled,
        HasGamepad = UserInputService.GamepadEnabled
    }
    local DataHash = SHA1(HttpService:JSONEncode(DataPoints))

    for Index, Value in pairs(DataPoints) do
        print(Index..":    "..tostring(Value))
    end

    return DataHash
end