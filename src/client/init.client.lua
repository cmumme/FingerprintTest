--[[
    init.client.lua
     - typechecked
    All rights reserved
]]--

-- Services
local Players = game:GetService("Players")

-- Modules
local Fingerprint = require(script.Fingerprint)

-- Variables
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local FingerprintUI = PlayerGui:WaitForChild("FingerprintUI")

FingerprintUI.Fingerprint.Text = "<b>"..string.upper(Fingerprint()).."</b>"