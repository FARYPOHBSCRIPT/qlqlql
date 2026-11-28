local Config = {
    Title = "TURNsakenV4.1",
    Subtitle = "AETHER V4.1",
    ToggleKey = Enum.KeyCode.RightShift,
    ThemeImages = { Sunlit = "", Mist = "", Sakura = "" },
    LicenseKey = "TURNhub",
    ConfigFolder = "TURNsakenV4.1",
    ConfigFile = "TURNsakenV4.1/config.json",
    AvatarAsset = "",
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Input = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then error("SAKEN requires the Roblox client") end
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

local function playIntro()
    local introGui = nil
    local okAll = pcall(function()
        local sg = Instance.new("ScreenGui")
        introGui = sg
        sg.Name = "TURNsakenV4_Intro"
        sg.ResetOnSpawn = false
        sg.IgnoreGuiInset = true
        sg.DisplayOrder = 9999
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        local okCore = pcall(function() sg.Parent = game:GetService("CoreGui") end)
        if not okCore or not sg.Parent then sg.Parent = playerGui end

        local veil = Instance.new("Frame")
        veil.Name = "Veil"
        veil.Size = UDim2.fromScale(1, 1)
        veil.BackgroundColor3 = Color3.fromRGB(3, 6, 8)
        veil.BackgroundTransparency = 1
        veil.BorderSizePixel = 0
        veil.Active = true
        veil.ZIndex = 1
        veil.Parent = sg

        local glow = Instance.new("Frame")
        glow.Name = "Glow"
        glow.Size = UDim2.fromScale(1, 1)
        glow.BackgroundColor3 = Color3.fromRGB(73, 217, 196)
        glow.BackgroundTransparency = 1
        glow.BorderSizePixel = 0
        glow.ZIndex = 1
        glow.Parent = sg
        local gg = Instance.new("UIGradient")
        gg.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 217, 196)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 60, 80)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(73, 217, 196)),
        })
        gg.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.55),
            NumberSequenceKeypoint.new(1, 1),
        })
        gg.Rotation = 90
        gg.Parent = glow

        local holder = Instance.new("Frame")
        holder.Name = "Holder"
        holder.AnchorPoint = Vector2.new(0.5, 0.5)
        holder.Position = UDim2.fromScale(0.5, 0.5)
        holder.Size = UDim2.fromOffset(760, 120)
        holder.BackgroundTransparency = 1
        holder.BorderSizePixel = 0
        holder.ZIndex = 5
        holder.Parent = sg

        local TweenService = game:GetService("TweenService")
        local TEXT = "TURNsakenV4.1"
        local SIZE = 72
        local SLOT = 46
        local accent = Color3.fromRGB(238, 247, 246)
        local letters = {}
        local totalW = #TEXT * SLOT
        for i = 1, #TEXT do
            local ch = string.sub(TEXT, i, i)
            local lb = Instance.new("TextLabel")
            lb.Name = "L" .. i
            lb.AnchorPoint = Vector2.new(0.5, 0.5)
            lb.Size = UDim2.fromOffset(SLOT + 14, SIZE + 26)
            lb.BackgroundTransparency = 1
            lb.BorderSizePixel = 0
            lb.Text = ch
            lb.TextSize = SIZE
            lb.Font = Enum.Font.GothamBlack
            lb.TextColor3 = accent
            lb.TextTransparency = 1
            lb.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            lb.TextStrokeTransparency = 1
            lb.Rotation = math.random(-170, 170)
            lb.ZIndex = 6
            local ang = math.rad(math.random(0, 359))
            local rad = math.random(900, 1500)
            local sx = math.cos(ang) * rad
            local sy = math.sin(ang) * rad * 0.7
            lb.Position = UDim2.new(0.5, sx, 0.5, sy)
            lb.Parent = holder
            local tx = -totalW / 2 + (i - 0.5) * SLOT
            letters[i] = { node = lb, target = tx }
        end

        local sub = Instance.new("TextLabel")
        sub.Name = "Sub"
        sub.AnchorPoint = Vector2.new(0.5, 0)
        sub.Position = UDim2.fromScale(0.5, 1)
        sub.Size = UDim2.fromOffset(760, 40)
        sub.BackgroundTransparency = 1
        sub.BorderSizePixel = 0
        sub.Text = "MADE WITH DEEPSEEK"
        sub.TextSize = 20
        sub.Font = Enum.Font.GothamBold
        sub.TextColor3 = Color3.fromRGB(73, 217, 196)
        sub.TextTransparency = 1
        sub.ZIndex = 6
        sub.Parent = holder
        local ls = Instance.new("UIGradient")
        ls.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 235, 215)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(73, 217, 196)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 235, 215)),
        })
        ls.Parent = sub

        local hint = Instance.new("TextLabel")
        hint.Name = "Hint"
        hint.AnchorPoint = Vector2.new(0.5, 0)
        hint.Position = UDim2.new(0.5, 0, 1, 62)
        hint.Size = UDim2.fromOffset(760, 26)
        hint.BackgroundTransparency = 1
        hint.BorderSizePixel = 0
        hint.Text = "CLICK ANYWHERE TO CONTINUE"
        hint.TextSize = 13
        hint.Font = Enum.Font.GothamBold
        hint.TextColor3 = Color3.fromRGB(150, 172, 178)
        hint.TextTransparency = 1
        hint.ZIndex = 6
        hint.Parent = holder

        TweenService:Create(veil, TweenInfo.new(0.5), { BackgroundTransparency = 0.18 }):Play()
        TweenService:Create(glow, TweenInfo.new(0.9), { BackgroundTransparency = 0.86 }):Play()

        local dismissed = false
        local ready = false
        task.wait(0.3)
        for i, item in ipairs(letters) do
            local delay = (i - 1) * 0.045
            task.delay(delay, function()
                local ti = TweenInfo.new(1.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                TweenService:Create(item.node, ti, {
                    Position = UDim2.new(0.5, item.target, 0.5, 0),
                    Rotation = 0,
                    TextTransparency = 0,
                    TextStrokeTransparency = 0.82,
                }):Play()
            end)
        end
        task.wait(#letters * 0.045 + 1.2)

        ready = true
        TweenService:Create(sub, TweenInfo.new(0.7), { TextTransparency = 0 }):Play()
        task.wait(0.45)
        TweenService:Create(hint, TweenInfo.new(0.6), { TextTransparency = 0.15 }):Play()
        task.spawn(function()
            while sg.Parent do
                task.wait(0.9)
                if sg.Parent then
                    TweenService:Create(hint, TweenInfo.new(0.45), { TextTransparency = 0.8 }):Play()
                end
                task.wait(0.9)
                if sg.Parent then
                    TweenService:Create(hint, TweenInfo.new(0.45), { TextTransparency = 0.15 }):Play()
                end
            end
        end)

        local function dismiss()
            if dismissed or not ready then return end
            dismissed = true
            local fade = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
            TweenService:Create(veil, fade, { BackgroundTransparency = 1 }):Play()
            TweenService:Create(glow, fade, { BackgroundTransparency = 1 }):Play()
            for _, item in ipairs(letters) do
                TweenService:Create(item.node, fade, { TextTransparency = 1, TextStrokeTransparency = 1 }):Play()
            end
            TweenService:Create(sub, fade, { TextTransparency = 1 }):Play()
            TweenService:Create(hint, fade, { TextTransparency = 1 }):Play()
            task.wait(0.85)
            pcall(function() sg:Destroy() end)
        end

        veil.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dismiss()
            end
        end)
        holder.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dismiss()
            end
        end)
        local uis = game:GetService("UserInputService")
        local conn = uis.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dismiss()
            end
        end)
        task.delay(14, dismiss)

        while not dismissed do task.wait(0.05) end
        conn:Disconnect()
        task.wait(0.9)
    end)
    if not okAll and introGui then
        pcall(function() introGui:Destroy() end)
    end
end
pcall(playIntro)

local NET = { Module = nil, Remote = nil }
local function netNode()
    local mods = ReplicatedStorage:FindFirstChild("Modules")
    local nf = mods and mods:FindFirstChild("Network")
    return nf and nf:FindFirstChild("Network")
end
local function netInit()
    if NET.Module then return end
    local ni = netNode()
    if not ni then return end
    local ok, mod = pcall(require, ni)
    if ok and type(mod) == "table" then
        NET.Module = mod
        local r = mod.RemoteEvent
        if r ~= nil and typeof(r) == "Instance" then NET.Remote = r end
    end
    if not NET.Remote and ni then
        local r = ni:FindFirstChildOfClass("RemoteEvent")
        if r then NET.Remote = r end
    end
end
pcall(netInit)
local function netRemote()
    if NET.Remote and NET.Remote.Parent then return NET.Remote end
    netInit()
    if NET.Remote and NET.Remote.Parent then return NET.Remote end
    local ni = netNode()
    local r = ni and ni:FindFirstChildOfClass("RemoteEvent")
    if r then NET.Remote = r end
    return NET.Remote
end
local function netFireConnection(name, ...)
    if not NET.Module or type(NET.Module.FireServerConnection) ~= "function" then return false end
    local args = { ... }
    local n = #args
    local ok = pcall(function()
        if n == 0 then
            NET.Module:FireServerConnection(name, "REMOTE_EVENT")
        else
            NET.Module:FireServerConnection(name, "REMOTE_EVENT", unpack(args, 1, n))
        end
    end)
    return ok
end
local function netFireRemote(name, ...)
    local r = netRemote()
    if not r then return false end
    local args = { ... }
    local n = #args
    local ok = pcall(function()
        if n == 0 then
            r:FireServer(name)
        else
            r:FireServer(name, unpack(args, 1, n))
        end
    end)
    return ok
end
local function netFireAbility(kind)
    local k = tostring(kind)
    local r = netRemote()
    if r then
        local okBuf = pcall(function()
            r:FireServer("UseActorAbility", { buffer.fromstring("\3\5\0\0\0" .. k) })
        end)
        if okBuf then return true end
        local okRaw = pcall(function()
            r:FireServer("UseActorAbility", buffer.fromstring("\3\5\0\0\0" .. k))
        end)
        if okRaw then return true end
        if netFireRemote("UseActorAbility", { k }) then return true end
    end
    return netFireConnection("UseActorAbility", k)
end

local env = shared
pcall(function() env = getgenv() end)
if type(env) ~= "table" then env = shared end
if env.TURNsakenV4 and type(env.TURNsakenV4.Destroy) == "function" then
    pcall(env.TURNsakenV4.Destroy)
end

local alive = true
local connections = {}
local UNLOAD_HOOKS = {}
local cfgFlush
local animations = setmetatable({}, { __mode = "k" })
local accents, strokes, textNodes = {}, {}, {}
local WHITE = Color3.fromRGB(255, 255, 255)
local MUTED = Color3.fromRGB(140, 162, 172)
local CARD_BG = Color3.fromRGB(13, 20, 24)
local CARD_LINE = Color3.fromRGB(27, 42, 50)
local OFF_BG = Color3.fromRGB(22, 35, 43)
local themes = {
    { key = "Sunlit", name = "TEAL", en = "TEAL", accent = Color3.fromRGB(73, 217, 196), base = Color3.fromRGB(9, 15, 19), hair = Color3.fromRGB(232, 153, 91) },
    { key = "Mist", name = "MIST", en = "MIST", accent = Color3.fromRGB(163, 194, 255), base = Color3.fromRGB(57, 66, 88), hair = Color3.fromRGB(193, 184, 210) },
    { key = "Sakura", name = "SAKURA", en = "SAKURA", accent = Color3.fromRGB(255, 173, 206), base = Color3.fromRGB(79, 58, 75), hair = Color3.fromRGB(246, 191, 210) },
}
local state = {
    accent = themes[1].accent, theme = 1, page = 1, scale = 1, font = 1,
    opacity = 0.94, motion = 1, depth = false, particles = true, rain = false,
    follow = true, glass = true, open = false, uiLocked = false,
    unlocked = false, licenseAttempts = 0, licenseCooldown = 0,
}
local guardedSignals = {}
local function connect(signal, fn)
    if not signal then return nil end
    local ok, conn = pcall(function() return signal:Connect(fn) end)
    if ok and conn then connections[#connections + 1] = conn end
    return ok and conn or nil
end
local function make(class, props, parent)
    local obj = Instance.new(class)
    if props then
        for key, value in pairs(props or {}) do obj[key] = value end
    end
    if class == "TextLabel" or class == "TextButton" or class == "TextBox" then
        local size = obj.TextSize or 14
        textNodes[#textNodes + 1] = { obj, math.max(12, size) }
    end
    if parent then obj.Parent = parent end
    return obj
end
local function rounded(obj, radius)
    make("UICorner", { CornerRadius = UDim.new(0, radius or 8) }, obj)
    return obj
end
local function tween(obj, duration, props, style, direction)
    local ok, tw = pcall(function()
        return TweenService:Create(obj, TweenInfo.new(duration or 0.25, style or Enum.EasingStyle.Quint, direction or Enum.EasingDirection.Out), props)
    end)
    if ok and tw then
        tw:Play()
        animations[obj] = animations[obj] or {}
        animations[obj][#animations[obj] + 1] = tw
    end
    return ok and tw or nil
end
local function accent(obj, property)
    accents[#accents + 1] = { obj, property }
    obj[property] = state.accent
    return obj
end
local function outline(obj, transparency, thickness, themed)
    local stroke = make("UIStroke", {
        Color = themed and state.accent or Color3.fromRGB(196, 224, 232),
        Transparency = transparency == nil and 0.6 or transparency,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, obj)
    strokes[#strokes + 1] = stroke
    return stroke
end
local function frame(parent, name, pos, size, color, transparency, radius)
    local obj = make("Frame", {
        Name = name, Position = pos, Size = size,
        BackgroundColor3 = color or WHITE,
        BackgroundTransparency = transparency or 0,
        BorderSizePixel = 0,
    }, parent)
    if radius and radius > 0 then rounded(obj, radius) end
    return obj
end
local function label(parent, value, pos, size, textSize, color, bold)
    local obj = make("TextLabel", {
        Position = pos, Size = size, BackgroundTransparency = 1, BorderSizePixel = 0,
        Text = value or "", TextSize = math.max(13, (textSize or 14) + 1), TextColor3 = color or WHITE,
        Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd, BorderSizePixel = 0,
    }, parent)
    textNodes[#textNodes + 1] = { obj, math.max(12, textSize or 14) }
    return obj
end
local function button(parent, value, pos, size)
    local obj = rounded(make("TextButton", {
        Position = pos, Size = size, BackgroundColor3 = OFF_BG,
        BackgroundTransparency = 0.35, BorderSizePixel = 0, AutoButtonColor = false,
        Text = value, TextColor3 = WHITE, TextSize = 15, Font = Enum.Font.GothamBold,
    }, parent), 10)
    return obj
end

local gui = make("ScreenGui", {
    Name = "TURNsakenV4", ResetOnSpawn = false, IgnoreGuiInset = true,
    DisplayOrder = 120, ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, nil)
local parented = pcall(function() gui.Parent = game:GetService("CoreGui") end)
if not parented then gui.Parent = playerGui end

local surfacePart, surfaceGui
local renderDensity = 1
local API = {}
env.TURNsakenV4 = API
local function destroy()
    if not alive then return end
    alive = false
    if cfgFlush then pcall(cfgFlush, true) end
    for _, hook in ipairs(UNLOAD_HOOKS or {}) do pcall(hook) end
    for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
    for _, tracks in pairs(animations) do
        for _, t in pairs(tracks) do pcall(function() t:Cancel() end) end
    end
    if env.TURNsakenV4 == API then env.TURNsakenV4 = nil end
    pcall(function() gui:Destroy() end)
    if surfaceGui then pcall(function() surfaceGui:Destroy() end) end
    if surfacePart then pcall(function() surfacePart:Destroy() end) end
end
API.Destroy = destroy
API.Net = NET
API.IsAlive = function() return alive end

local root = frame(gui, "WindowRoot", UDim2.fromScale(0.5, 0.52), UDim2.fromOffset(980, 624), WHITE, 1)
root.AnchorPoint = Vector2.new(0.5, 0.5)
root.Visible = false
local rootScale = make("UIScale", { Scale = 1 }, root)
local shell = frame(root, "PerspectiveShell", UDim2.fromScale(0.5, 0.5), UDim2.fromScale(1, 1), WHITE, 1)
shell.AnchorPoint = Vector2.new(0.5, 0.5)
local shadows = {}
for i = 5, 1, -1 do
    local shadow = frame(shell, "SoftShadow", UDim2.new(0, -i * 5, 0, 8 - i * 3), UDim2.new(1, i * 10, 1, i * 8), Color3.new(0, 0, 0), 0.91, 28 + i * 2)
    shadow.ZIndex = 1
    shadows[#shadows + 1] = shadow
end
local edge = frame(shell, "DepthEdge", UDim2.fromOffset(3, 7), UDim2.fromScale(1, 1), state.accent, 0.48, 26)
accent(edge, "BackgroundColor3")
local panel = rounded(make("Frame", {
    Name = "GlassPanel", Size = UDim2.fromScale(1, 1), BackgroundColor3 = themes[1].base,
    BackgroundTransparency = 0.02, BorderSizePixel = 0,
    ClipsDescendants = true, ZIndex = 2, Active = true,
}, shell), 10)
local border = outline(panel, 0.5, 1.2, false)
border.Color = CARD_LINE
make("UIGradient", { Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 20, 25)),
    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(8, 14, 18)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 11, 14)),
}), Rotation = 28 }, frame(panel, "BackgroundTint", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), WHITE, 0.05))

local viewport = make("ViewportFrame", {
    Name = "Real3DBackground", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
    ImageTransparency = 0.58, Ambient = Color3.fromRGB(125, 158, 164),
    LightColor = Color3.fromRGB(210, 255, 239), LightDirection = Vector3.new(-1, -1, -2),
}, panel)
viewport.Visible = false
local world = make("WorldModel", {}, viewport)
local camera = make("Camera", { FieldOfView = 40, CFrame = CFrame.lookAt(Vector3.new(0, 0, 19), Vector3.new(0, 0, 0)) }, viewport)
viewport.CurrentCamera = camera
local sculpture = make("Model", { Name = "Crystal" }, world)
local crystalParts = {}
for i = 1, 7 do
    local a = i * math.pi * 2 / 7
    local part = make("Part", {
        Name = "Prism", Anchored = true, CanCollide = false, CanTouch = false, CanQuery = false,
        Material = Enum.Material.Glass, Color = state.accent, Transparency = 0.33,
        Size = Vector3.new(1.15, 5 + (i % 3), 1.15),
        CFrame = CFrame.new(math.cos(a) * 2.9 + 3.4, math.sin(a) * 1.7, -2) * CFrame.Angles(0.3, a, 0.5),
    }, sculpture)
    crystalParts[#crystalParts + 1] = part
end
local rings = {}
for i = 1, 3 do
    local ring = make("Model", { Name = "Orbit" }, world)
    for j = 1, 36 do
        local a = j * math.pi * 2 / 36
        make("Part", {
            Anchored = true, CanCollide = false, CanTouch = false, CanQuery = false,
            Size = Vector3.new(0.62, 0.045, 0.045), Color = state.accent,
            Material = Enum.Material.Neon, Transparency = 0.55,
            CFrame = CFrame.new(math.cos(a) * (3.3 + i * 0.4), math.sin(a) * (3.3 + i * 0.4), 0) * CFrame.Angles(0, 0, a + math.pi / 2),
        }, ring)
    end
    rings[#rings + 1] = ring
end
local particlesLayer = frame(panel, "Atmosphere", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), WHITE, 1)
particlesLayer.ClipsDescendants = true
local particles, rain = {}, {}
local random = Random.new(42)
for i = 1, 18 do
    local d = frame(particlesLayer, "Mote", UDim2.fromScale(random:NextNumber(), random:NextNumber()), UDim2.fromOffset(i % 3 + 2, i % 3 + 2), state.accent, 0.7, 8)
    accent(d, "BackgroundColor3")
    particles[#particles + 1] = { node = d, x = random:NextNumber(), y = random:NextNumber(), speed = random:NextNumber(0.01, 0.035), phase = random:NextNumber(0, 6) }
end
for i = 1, 24 do
    local d = frame(particlesLayer, "Rain", UDim2.fromScale(random:NextNumber(), random:NextNumber()), UDim2.fromOffset(1, random:NextInteger(12, 28)), WHITE, 0.87)
    d.Rotation = 12
    d.Visible = false
    rain[#rain + 1] = { node = d, x = random:NextNumber(), y = random:NextNumber(), speed = random:NextNumber(0.22, 0.5) }
end


local notify
local island = rounded(make("TextButton", {
    Name = "DynamicIsland", AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 16),
    Size = UDim2.fromOffset(164, 28), BackgroundColor3 = Color3.fromRGB(20, 29, 36),
    BackgroundTransparency = 0.02, BorderSizePixel = 0, Text = "", AutoButtonColor = false, ZIndex = 20,
}, gui), 14)
local islandScale = make("UIScale", { Scale = 1 }, island)
outline(island, 0.6)
local islandDot = accent(frame(island, "LiveDot", UDim2.fromOffset(11, 11), UDim2.fromOffset(6, 6), state.accent, 0, 8), "BackgroundColor3")
local islandTitle = label(island, "TURNsakenV4.1", UDim2.fromOffset(26, 3), UDim2.fromOffset(78, 22), 10, WHITE, true)
local islandStatus = accent(label(island, "Open", UDim2.new(1, -42, 0, 3), UDim2.fromOffset(32, 22), 10, state.accent, true), "TextColor3")
islandStatus.TextXAlignment = Enum.TextXAlignment.Right
local bars = {}
for i = 1, 4 do
    local b = accent(frame(island, "Wave", UDim2.fromOffset(88 + i * 4, 10), UDim2.fromOffset(2, 8), state.accent, 0.1, 2), "BackgroundColor3")
    bars[#bars + 1] = b
end
local toast = rounded(make("Frame", {
    Name = "IslandToast", AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 53),
    Size = UDim2.fromOffset(310, 32), BackgroundColor3 = Color3.fromRGB(30, 42, 54),
    BackgroundTransparency = 1, BorderSizePixel = 0, Visible = false, ZIndex = 22,
}, gui), 16)
local toastStroke = outline(toast, 1)
local toastDot = accent(frame(toast, "Dot", UDim2.fromOffset(13, 13), UDim2.fromOffset(6, 6), state.accent, 1, 6), "BackgroundColor3")
local toastText = label(toast, "", UDim2.fromOffset(27, 0), UDim2.new(1, -38, 1, 0), 11, WHITE)
toastText.TextTransparency = 1
local toastSerial = 0
notify = function(text)
    if not alive then return end
    toastSerial = toastSerial + 1
    local token = toastSerial
    toast.Visible = true
    toastText.Text = tostring(text)
    toast.Position = UDim2.new(0.5, 0, 0, 47)
    tween(toast, 0.32, { BackgroundTransparency = 0.02, Position = UDim2.new(0.5, 0, 0, 53) })
    tween(toastText, 0.3, { TextTransparency = 0 })
    tween(toastStroke, 0.3, { Transparency = 0.65 })
    tween(toastDot, 0.3, { BackgroundTransparency = 0 })
    tween(island, 0.36, { Size = UDim2.fromOffset(180, 28) }, Enum.EasingStyle.Back)
    task.delay(2.6, function()
        if not alive or token ~= toastSerial then return end
        local fadeDuration = 0.25 * state.motion
        tween(toast, 0.25, { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0, 47) })
        tween(toastText, 0.25, { TextTransparency = 1 })
        tween(toastStroke, 0.25, { Transparency = 1 })
        tween(toastDot, 0.25, { BackgroundTransparency = 1 })
        tween(island, 0.4, { Size = UDim2.fromOffset(164, 28) }, Enum.EasingStyle.Back)
        task.delay(fadeDuration + 0.04, function() if alive and token == toastSerial then toast.Visible = false end end)
    end)
end
API.Notify = notify


local avatarTexture = ""
do
    local preset = tostring(Config.AvatarAsset or "")
    if preset ~= "" then avatarTexture = preset end
end
API.AvatarStatus = (avatarTexture ~= "" and "asset" or "fallback")
API.AvatarTexture = avatarTexture
local function drawAvatarArt(parent)
    local bg = frame(parent, "Art", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), Color3.fromRGB(240, 243, 246), 0)
    make("UIGradient", { Color = ColorSequence.new(Color3.fromRGB(250, 251, 253), Color3.fromRGB(206, 212, 220)), Rotation = 120 }, bg)
    local hair = frame(bg, "Hair", UDim2.fromScale(-0.08, -0.14), UDim2.fromScale(1.08, 0.90), Color3.fromRGB(40, 40, 46), 0, 24)
    make("UIGradient", { Color = ColorSequence.new(Color3.fromRGB(62, 62, 70), Color3.fromRGB(20, 20, 24)), Rotation = 90 }, hair)
    local face = frame(bg, "Face", UDim2.fromScale(0.28, 0.28), UDim2.fromScale(0.46, 0.44), Color3.fromRGB(253, 241, 239), 0, 20)
    for i, x in ipairs({ 0.30, 0.56 }) do
        frame(face, "Eye" .. i, UDim2.fromScale(x, 0.40), UDim2.fromScale(0.14, 0.17), Color3.fromRGB(44, 42, 48), 0, 6)
    end
    frame(face, "Blush1", UDim2.fromScale(0.10, 0.62), UDim2.fromScale(0.20, 0.09), Color3.fromRGB(248, 190, 200), 0.35, 6)
    frame(face, "Blush2", UDim2.fromScale(0.70, 0.62), UDim2.fromScale(0.20, 0.09), Color3.fromRGB(248, 190, 200), 0.35, 6)
    local cat = frame(bg, "Cat", UDim2.fromScale(0.00, 0.54), UDim2.fromScale(0.50, 0.36), Color3.fromRGB(26, 26, 30), 0, 14)
    for i, x in ipairs({ 0.06, 0.26 }) do
        local ear = frame(cat, "Ear" .. i, UDim2.fromScale(x, -0.24), UDim2.fromScale(0.18, 0.36), Color3.fromRGB(26, 26, 30), 0)
        ear.Rotation = (i == 1) and -18 or 18
    end
    for i, x in ipairs({ 0.22, 0.52 }) do
        frame(cat, "CatEye" .. i, UDim2.fromScale(x, 0.32), UDim2.fromScale(0.14, 0.20), Color3.fromRGB(228, 234, 238), 0, 4)
    end
    local body = frame(bg, "Body", UDim2.fromScale(0.32, 0.70), UDim2.fromScale(0.76, 0.44), Color3.fromRGB(232, 236, 240), 0, 14)
    make("UIGradient", {
        Color = ColorSequence.new(Color3.fromRGB(250, 251, 253), Color3.fromRGB(148, 154, 162)),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.15),
            NumberSequenceKeypoint.new(0.5, 0.45),
            NumberSequenceKeypoint.new(1, 0.15),
        }),
        Rotation = 0,
    }, body)
end

local SIDEBAR_W = 200
local sidebar = frame(panel, "Sidebar", UDim2.fromOffset(0, 0), UDim2.new(0, SIDEBAR_W, 1, 0), Color3.fromRGB(8, 13, 17), 0, 8)
frame(sidebar, "Divider", UDim2.new(1, -1, 0, 0), UDim2.new(0, 1, 1, 0), CARD_LINE, 0.15)
local logo = rounded(make("ImageLabel", { Position = UDim2.fromOffset(14, 16), Size = UDim2.fromOffset(70, 70), BackgroundColor3 = Color3.fromRGB(20, 33, 39), Image = avatarTexture, ScaleType = Enum.ScaleType.Crop, BorderSizePixel = 0 }, sidebar), 6)
logo.ClipsDescendants = true
if avatarTexture == "" then
    drawAvatarArt(logo)
    if typeof and typeof(warn) == "function" then
        warn("[TURNsakenV4.1] avatar fallback: set Config.AvatarAsset to an rbxassetid for your own icon")
    elseif warn then
        pcall(warn, "[TURNsakenV4.1] avatar fallback: executor has no writefile/getcustomasset")
    end
end
outline(logo, 0.45, 1.5, false).Color = CARD_LINE
label(sidebar, "TURNsaken", UDim2.fromOffset(92, 28), UDim2.new(1, -100, 0, 24), 16, WHITE, true)
accent(label(sidebar, "v4.1", UDim2.fromOffset(92, 52), UDim2.fromOffset(100, 18), 12, state.accent, true), "TextColor3")
label(sidebar, "FORSAKEN", UDim2.fromOffset(14, 96), UDim2.fromOffset(170, 16), 11, MUTED, true)
local navData = {
    { id = "license", title = "License", en = "LICENSE", icon = "◈" },
    { id = "ab", title = "Auto Block", en = "AUTO BLOCK", icon = "⛨" },
    { id = "aim", title = "Aimbot", en = "AIMBOT", icon = "✛" },
    { id = "hbd", title = "Hitbox Drag", en = "HITBOX DRAG", icon = "◎" },
    { id = "surv", title = "Survivor", en = "SURVIVOR", icon = "✦" },
    { id = "killer", title = "Killer", en = "KILLER", icon = "✜" },
    { id = "esp", title = "ESP", en = "VISUALS", icon = "◉" },
    { id = "stam", title = "Stamina", en = "STAMINA", icon = "⚡" },
    { id = "gen", title = "Generator", en = "GENERATOR", icon = "☲" },
    { id = "cam", title = "Camera", en = "CAMERA", icon = "◎" },
    { id = "misc", title = "Misc", en = "MISC", icon = "✦" },
    { id = "theme", title = "Theme", en = "THEME", icon = "✧" },
    { id = "settings", title = "Settings", en = "SETTINGS", icon = "◎" },
}
local NAV_STEP = 42
local navScroll = make("ScrollingFrame", {
    Position = UDim2.fromOffset(10, 122), Size = UDim2.new(1, -20, 1, -196),
    BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    CanvasSize = UDim2.fromOffset(0, #navData * NAV_STEP),
    ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, ZIndex = 5,
}, sidebar)
accent(navScroll, "ScrollBarImageColor3")
local selection = rounded(frame(navScroll, "SlidingSelection", UDim2.fromOffset(0, 0), UDim2.new(1, -4, 0, 40), state.accent, 0.9), 4)
accent(selection, "BackgroundColor3")
local function navTick(px, flip)
    local g = frame(selection, "Tick", UDim2.fromOffset(px, 10), UDim2.fromOffset(9, 20), WHITE, 1)
    accent(frame(g, "V", UDim2.fromOffset(flip and 7 or 0, 0), UDim2.fromOffset(2, 20), state.accent, 0, 1), "BackgroundColor3")
    accent(frame(g, "T", UDim2.fromOffset(flip and 3 or 0, 0), UDim2.fromOffset(6, 2), state.accent, 0, 1), "BackgroundColor3")
    accent(frame(g, "B", UDim2.fromOffset(flip and 3 or 0, 18), UDim2.fromOffset(6, 2), state.accent, 0, 1), "BackgroundColor3")
end
navTick(3, false)
navTick(-11, true)
local navButtons, navLabels = {}, {}
for i, item in ipairs(navData) do
    local b = button(navScroll, "", UDim2.fromOffset(0, (i - 1) * NAV_STEP), UDim2.new(1, -4, 0, 40))
    b.BackgroundTransparency = 1
    b.ZIndex = 6
    local title = label(b, item.title, UDim2.fromOffset(22, 0), UDim2.new(1, -30, 1, 0), 16, WHITE, true)
    title.ZIndex = 7
    navButtons[i], navLabels[i] = b, title
end
local depthLabel = label(sidebar, "", UDim2.new(0, 14, 1, -96), UDim2.fromOffset(170, 16), 9, MUTED)
depthLabel.Visible = false
local statusLight = frame(sidebar, "ReadyLight", UDim2.new(0, 14, 1, -58), UDim2.fromOffset(6, 6), state.accent, 0, 6)
accent(statusLight, "BackgroundColor3")
accent(label(sidebar, "TURNhub", UDim2.new(0, 26, 1, -64), UDim2.fromOffset(160, 20), 13, state.accent, true), "TextColor3")
label(sidebar, "OFFICIAL CHANNEL", UDim2.new(0, 14, 1, -38), UDim2.fromOffset(170, 16), 9, MUTED)


local header = frame(panel, "DragHeader", UDim2.fromOffset(SIDEBAR_W + 6, 0), UDim2.new(1, -(SIDEBAR_W + 12), 0, 58), WHITE, 1)
header.Active = true
local pageTitle = accent(label(header, "License", UDim2.fromOffset(14, 16), UDim2.fromOffset(360, 30), 21, state.accent, true), "TextColor3")
local homeBtn = button(header, "Home", UDim2.new(1, -116, 0, 17), UDim2.fromOffset(56, 24))
homeBtn.TextSize = 14
homeBtn.BackgroundTransparency = 1
homeBtn.TextColor3 = MUTED
local fpsLabel = label(header, "", UDim2.new(1, -238, 0, 40), UDim2.fromOffset(120, 14), 9, Color3.fromRGB(96, 122, 132), true)
fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
local minimize = button(header, "×", UDim2.new(1, -50, 0, 14), UDim2.fromOffset(30, 30))
minimize.TextSize = 20
minimize.BackgroundTransparency = 1
frame(panel, "HeaderLine", UDim2.fromOffset(SIDEBAR_W + 6, 58), UDim2.new(1, -(SIDEBAR_W + 12), 0, 1), CARD_LINE, 0.15)
local content = frame(panel, "PageClip", UDim2.fromOffset(SIDEBAR_W + 8, 70), UDim2.new(1, -(SIDEBAR_W + 22), 1, -84), WHITE, 1)
content.ClipsDescendants = true


local pages = {}
local pageGroups = {}
local function page(name, fixedHeight)
    local group = make("Frame", {
        Name = name .. "Transition", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
        BorderSizePixel = 0, Visible = false,
    }, content)
    local scrolling = make("ScrollingFrame", {
        Name = name, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollBarThickness = 3, ScrollBarImageColor3 = state.accent,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize = UDim2.fromOffset(0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, Visible = true,
        ScrollingEnabled = true,
    }, group)
    accent(scrolling, "ScrollBarImageColor3")
    make("UIPadding", { PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 10) }, scrolling)
    local list = make("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8), HorizontalAlignment = Enum.HorizontalAlignment.Left,
    }, scrolling)
    pages[#pages + 1] = group
    pageGroups[name] = group
    return scrolling
end
local function heading(parent, title, en, description)
    local holder = frame(parent, "Heading", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 20), WHITE, 1)
    holder.LayoutOrder = 1
    if description and description ~= "" then
        label(holder, description, UDim2.fromOffset(2, 0), UDim2.new(1, -8, 0, 20), 11, MUTED)
    end
    return holder
end

local licensePage = page("Page_license")

local featurePages = {}
for _, item in ipairs({ { "ab" }, { "aim" }, { "hbd" }, { "surv" }, { "killer" }, { "esp" }, { "stam" }, { "gen" }, { "cam" }, { "misc" } }) do
    featurePages[item[1]] = page("Page_" .. item[1])
end
heading(featurePages.ab, "Auto Block", "AUTO BLOCK", "fix_v2 AbilityLastUsed / AbilitiesUsed · hitbox-only detection")
heading(featurePages.aim, "Aimbot", "AIMBOT", "Character-based aim lock with prediction")
heading(featurePages.hbd, "Hitbox Drag", "HITBOX DRAG", "Auto-dash to the nearest killer when block/attack animations play")
heading(featurePages.surv, "Survivor", "SURVIVOR", "Guest 1337 / Jane Doe / Veeronica ability sets")
heading(featurePages.killer, "Killer", "KILLER", "General combat + Noli / Nosferatu / Azure abilities")
heading(featurePages.esp, "ESP", "VISUALS", "Characters · player tags · ability icons · objects")
heading(featurePages.stam, "Stamina", "STAMINA", "Infinite Stamina")
heading(featurePages.gen, "Generator", "GENERATOR", "Generator ESP + Flow/Lock/Connect/Gear solvers")
heading(featurePages.cam, "Camera", "CAMERA", "FOV / MaxZoom / Free Camera")
heading(featurePages.misc, "Misc", "MISC", "Resist / Graphics / Privacy / Chat")
local themePage = page("Page_theme", 720)
local settingsPage = page("Page_settings", 420)


local screenToCanvas
local configData = {}
local autoSaveEnabled, autoLoadEnabled = true, true
local cfgDirty, cfgFlushQueued = false, false
cfgFlush = function(force)
    cfgFlushQueued = false
    if not writefile or (not force and not autoSaveEnabled) then return end
    pcall(function()
        if isfolder and makefolder and not isfolder(Config.ConfigFolder) then pcall(makefolder, Config.ConfigFolder) end
        writefile(Config.ConfigFile, game:GetService("HttpService"):JSONEncode(configData))
        cfgDirty = false
    end)
end
local function cfgSchedule()
    if not autoSaveEnabled then return end
    cfgDirty = true
    if cfgFlushQueued then return end
    cfgFlushQueued = true
    task.delay(0.25, function() cfgFlush(false) end)
end
local function cfgReadIntoCurrent()
    if not (isfile and readfile and isfile(Config.ConfigFile)) then return false end
    local okRead, raw = pcall(readfile, Config.ConfigFile)
    if not okRead or type(raw) ~= "string" or #raw < 2 then return false end
    local okJson, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode(raw) end)
    if not okJson or type(decoded) ~= "table" then return false end
    autoSaveEnabled = decoded._ui_auto_save ~= false
    autoLoadEnabled = decoded._ui_auto_load ~= false
    configData._ui_auto_save, configData._ui_auto_load = autoSaveEnabled, autoLoadEnabled
    if autoLoadEnabled then
        for k, v in pairs(decoded) do configData[k] = v end
    end
    return autoLoadEnabled
end
function SAKEN_CFG_GET(key)
    return configData[key]
end
function SAKEN_CFG_SET(key, value)
    configData[key] = value
    if key == "_ui_auto_save" then autoSaveEnabled = value ~= false end
    if key == "_ui_auto_load" then autoLoadEnabled = value ~= false end
    cfgSchedule()
end
cfgReadIntoCurrent()


local uiDrag = nil
local captureKeybind = nil
local Section = {}
Section.__index = Section
local ORDER = setmetatable({}, { __mode = "k" })
local function nextOrder(parent)
    ORDER[parent] = (ORDER[parent] or 0) + 1
    return ORDER[parent]
end
local function uiRow(section, height, order)
    section.col = (section.col or 0) + 1
    local parent = (section.col % 2 == 1) and section.left or section.right
    local card = frame(parent, "Row", UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, height), CARD_BG, 0, 4)
    local st = outline(card, 0.55, 1, false)
    st.Color = CARD_LINE
    card.LayoutOrder = nextOrder(parent)
    return card
end
local function makeSection(pageObj, title, en, desc)
    local group = frame(pageObj, "Section", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 24), WHITE, 1)
    group.LayoutOrder = nextOrder(pageObj) + 100
    group.AutomaticSize = Enum.AutomaticSize.Y
    local head = frame(group, "SectionHead", UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, 22), WHITE, 1)
    accent(label(head, tostring(title), UDim2.fromOffset(2, 0), UDim2.fromOffset(200, 20), 13, state.accent, true), "TextColor3")
    if en and en ~= "" then
        label(head, tostring(en), UDim2.fromOffset(2 + math.min(190, #tostring(title) * 14 + 10), 3), UDim2.fromOffset(170, 16), 9, Color3.fromRGB(88, 112, 122), true)
    end
    local body = frame(group, "SectionBody", UDim2.fromOffset(0, 24), UDim2.new(1, 0, 0, 0), WHITE, 1)
    local left = frame(body, "ColL", UDim2.fromOffset(0, 0), UDim2.new(0.5, -4, 0, 0), WHITE, 1)
    left.AutomaticSize = Enum.AutomaticSize.Y
    make("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) }, left)
    local right = frame(body, "ColR", UDim2.new(0.5, 4, 0, 0), UDim2.new(0.5, -4, 0, 0), WHITE, 1)
    right.AutomaticSize = Enum.AutomaticSize.Y
    make("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) }, right)
    local function fitBody()
        local lh = left.AbsoluteSize.Y
        local rh = right.AbsoluteSize.Y
        body.Size = UDim2.new(1, 0, 0, math.max(lh, rh))
    end
    local section = setmetatable({ card = group, body = body, left = left, right = right, page = pageObj, desc = desc, col = 0 }, Section)
    connect(left:GetPropertyChangedSignal("AbsoluteSize"), fitBody)
    connect(right:GetPropertyChangedSignal("AbsoluteSize"), fitBody)
    return section
end
function Section:Label(text)
    local str = tostring(text)
    local lines = math.max(1, math.ceil(#str / 46))
    local height = math.max(22, lines * 17 + 6)
    local row = uiRow(self, height)
    local t = label(row, str, UDim2.fromOffset(8, 2), UDim2.new(1, -16, 1, -4), 12, MUTED)
    t.TextWrapped = true
    return t
end
function Section:Divider()
end
function Section:Toggle(key, title, default, cb)
    local value = SAKEN_CFG_GET(key)
    if value == nil then value = default end
    local row = uiRow(self, 46)
    local lbl = label(row, tostring(title), UDim2.fromOffset(14, 0), UDim2.new(1, -90, 1, 0), 13, WHITE)
    local sw = button(row, "", UDim2.new(1, -66, 0, 10), UDim2.fromOffset(52, 26))
    rounded(sw, 13)
    local swLine = outline(sw, 0.72, 1, false)
    swLine.Color = CARD_LINE
    local knob = frame(sw, "Knob", UDim2.fromOffset(value and 29 or 3, 3), UDim2.fromOffset(20, 20), WHITE, 0, 20)
    local function paint(animated)
        local color = value and state.accent or OFF_BG
        if animated then
            tween(sw, 0.2, { BackgroundColor3 = color })
            tween(knob, 0.28, { Position = UDim2.fromOffset(value and 29 or 3, 3) }, Enum.EasingStyle.Back)
        else
            sw.BackgroundColor3 = color
            knob.Position = UDim2.fromOffset(value and 29 or 3, 3)
        end
    end
    paint(false)
    connect(sw.Activated, function()
        value = not value
        paint(true)
        SAKEN_CFG_SET(key, value)
        if cb then pcall(cb, value) end
    end)
    if cb then pcall(cb, value) end
    return nil
end
local function fmtNum(v)
    if v == math.floor(v) then return tostring(math.floor(v)) end
    return string.format("%.2f", v)
end
function Section:Slider(key, title, low, high, default, suffix, cb)
    local range = math.abs(high - low)
    local step = 1
    if range <= 3 then step = 0.01
    elseif range <= 20 then step = 0.05 end
    local value = SAKEN_CFG_GET(key)
    if type(value) ~= "number" then value = default end
    value = math.clamp(value, low, high)
    local row = uiRow(self, 62)
    label(row, tostring(title), UDim2.fromOffset(14, 8), UDim2.new(1, -96, 0, 20), 12, WHITE)
    local num = accent(label(row, "", UDim2.new(1, -86, 0, 8), UDim2.fromOffset(72, 20), 12, state.accent, true), "TextColor3")
    num.TextXAlignment = Enum.TextXAlignment.Right
    local track = frame(row, "Track", UDim2.fromOffset(14, 42), UDim2.new(1, -28, 0, 4), Color3.fromRGB(38, 54, 63), 0, 6)
    local fill = accent(frame(track, "Fill", UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), state.accent, 0, 6), "BackgroundColor3")
    local knob = accent(frame(track, "Handle", UDim2.fromScale(0.5, 0.5), UDim2.fromOffset(10, 10), state.accent, 0, 12), "BackgroundColor3")
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    outline(knob, 0.55, 2, false).Color = CARD_LINE
    local hit = button(row, "", UDim2.fromOffset(8, 28), UDim2.new(1, -20, 0, 30))
    hit.BackgroundTransparency = 1
    local function set(v, animate)
        v = math.clamp(math.floor(v / step + 0.5) * step, low, high)
        value = v
        local p = (v - low) / math.max(0.0001, (high - low))
        num.Text = fmtNum(v) .. (suffix or "")
        if animate then
            tween(fill, 0.08, { Size = UDim2.fromScale(p, 1) })
            tween(knob, 0.08, { Position = UDim2.fromScale(p, 0.5) })
        else
            fill.Size = UDim2.fromScale(p, 1)
            knob.Position = UDim2.fromScale(p, 0.5)
        end
    end
    local function progressAt(x)
        local trackX = track.AbsolutePosition.X
        return (x - trackX) / math.max(1, track.AbsoluteSize.X)
    end
    
    local useCanvas = nil
    local function resolveX(x, y, curP)
        if not screenToCanvas then return x end
        local pt = screenToCanvas(x, y)
        if not pt then return x end
        local pRaw, pCanvas = progressAt(x), progressAt(pt.X)
        local dRaw, dCanvas = math.abs(pRaw - curP), math.abs(pCanvas - curP)
        useCanvas = dCanvas <= dRaw
        return useCanvas and pt.X or x
    end
    local function update(x, y)
        local curP = (value - low) / math.max(0.0001, (high - low))
        local px
        if useCanvas == nil then
            px = resolveX(x, y, curP)
        elseif useCanvas then
            local pt = screenToCanvas and screenToCanvas(x, y)
            px = pt and pt.X or x
        else
            px = x
        end
        local p = math.clamp(progressAt(px), 0, 1)
        set(low + p * (high - low), true)
        SAKEN_CFG_SET(key, value)
        if cb then pcall(cb, value) end
    end
    connect(hit.InputBegan, function(input)
        if state.uiLocked or uiDrag then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            useCanvas = nil
            uiDrag = { input = input, update = update }
            
            local curP = (value - low) / math.max(0.0001, (high - low))
            resolveX(input.Position.X, input.Position.Y, curP)
        end
    end)
    set(value, false)
    if cb then pcall(cb, value) end
end
function Section:Button(title, cb)
    local row = uiRow(self, 44)
    local b = button(row, tostring(title), UDim2.fromOffset(8, 6), UDim2.new(1, -16, 0, 32))
    connect(b.Activated, function() if cb then pcall(cb) end end)
end
function Section:Input(key, title, default, placeholder, cb)
    local value = SAKEN_CFG_GET(key)
    if type(value) ~= "string" then value = default or "" end
    local row = uiRow(self, 62)
    label(row, tostring(title), UDim2.fromOffset(8, 0), UDim2.new(1, -16, 0, 20), 12, WHITE, true)
    local box = rounded(make("TextBox", {
        Position = UDim2.fromOffset(8, 24), Size = UDim2.new(1, -22, 0, 32),
        BackgroundColor3 = Color3.fromRGB(9, 18, 27), BackgroundTransparency = 0.2,
        BorderSizePixel = 0, Text = tostring(value), PlaceholderText = placeholder or "",
        PlaceholderColor3 = MUTED, TextColor3 = WHITE, TextSize = 12, Font = Enum.Font.Gotham,
        ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Left,
    }, row), 9)
    make("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 8) }, box)
    outline(box, 0.85)
    connect(box.FocusLost, function()
        value = box.Text
        SAKEN_CFG_SET(key, value)
        if cb then pcall(cb, value) end
    end)
    if cb then pcall(cb, value) end
end
function Section:Segmented(key, title, values, default, cb)
    local value = SAKEN_CFG_GET(key)
    if value == nil then value = default end
    local row = uiRow(self, 56)
    label(row, tostring(title), UDim2.fromOffset(14, 5), UDim2.new(1, -28, 0, 18), 11, MUTED, true)
    local holder = frame(row, "Seg", UDim2.fromOffset(14, 26), UDim2.new(1, -28, 0, 24), WHITE, 1)
    local list = make("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 4), VerticalAlignment = Enum.VerticalAlignment.Center }, holder)
    local btns = {}
    local function paint()
        for i, b in ipairs(btns) do
            tween(b, 0.15, { BackgroundTransparency = (values[i] == value) and 0.05 or 0.55 })
            b.TextColor3 = (values[i] == value) and Color3.new(1, 1, 1) or MUTED
        end
    end
    for i, v in ipairs(values) do
        local b = button(holder, tostring(v), UDim2.fromOffset(0, 0), UDim2.new(1 / #values, -4, 0, 22))
        b.TextSize = 10
        b.LayoutOrder = i
        btns[i] = b
        connect(b.Activated, function()
            value = v
            paint()
            SAKEN_CFG_SET(key, value)
            if cb then pcall(cb, value) end
        end)
    end
    paint()
    if cb then pcall(cb, value) end
end
function Section:MultiSegmented(key, title, values, default, cb)
    local stored = SAKEN_CFG_GET(key)
    local value
    if type(stored) == "table" then
        value = {}
        for _, v in ipairs(stored) do value[#value + 1] = v end
    else
        value = {}
        if type(default) == "table" then
            for _, v in ipairs(default) do value[#value + 1] = v end
        end
    end
    local function has(v) for _, x in ipairs(value) do if x == v then return true end end return false end
    local row = uiRow(self, 56)
    label(row, tostring(title), UDim2.fromOffset(14, 5), UDim2.new(1, -28, 0, 18), 11, MUTED, true)
    local holder = frame(row, "Seg", UDim2.fromOffset(14, 26), UDim2.new(1, -28, 0, 24), WHITE, 1)
    make("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 4), VerticalAlignment = Enum.VerticalAlignment.Center }, holder)
    local btns = {}
    local function paint()
        for i, b in ipairs(btns) do
            tween(b, 0.15, { BackgroundTransparency = has(values[i]) and 0.05 or 0.55 })
        end
    end
    for i, v in ipairs(values) do
        local b = button(holder, tostring(v), UDim2.fromOffset(0, 0), UDim2.new(1 / #values, -4, 0, 22))
        b.TextSize = 9
        b.LayoutOrder = i
        btns[i] = b
        connect(b.Activated, function()
            if has(v) then
                for idx = #value, 1, -1 do if value[idx] == v then table.remove(value, idx) end end
            else
                value[#value + 1] = v
            end
            paint()
            SAKEN_CFG_SET(key, value)
            if cb then pcall(cb, value) end
        end)
    end
    paint()
    if cb then pcall(cb, value) end
end
function Section:Keybind(key, title, default, cb)
    local value = SAKEN_CFG_GET(key)
    if type(value) ~= "string" then value = default or "None" end
    local row = uiRow(self, 40)
    local lbl = label(row, tostring(title), UDim2.fromOffset(14, 0), UDim2.new(1, -140, 0, 22), 11, MUTED, true)
    lbl.Size = UDim2.new(1, -150, 1, 0)
    local b = button(row, tostring(value), UDim2.new(1, -134, 0, 7), UDim2.fromOffset(120, 26))
    b.TextSize = 11
    connect(b.Activated, function()
        captureKeybind = { btn = b, key = key, cb = cb }
        b.Text = "Press any key..."
        notify("Press a key for: " .. tostring(title))
    end)
    if cb then pcall(cb, value) end
end
function Section:Color(key, title, defaultHex, cb)
    local hex = SAKEN_CFG_GET(key)
    if type(hex) ~= "string" then hex = defaultHex or "#FFFFFF" end
    local function toColor(h)
        local ok, c = pcall(Color3.fromHex, h)
        return ok and c or Color3.fromRGB(255, 255, 255)
    end
    local row = uiRow(self, 62)
    label(row, tostring(title), UDim2.fromOffset(14, 5), UDim2.new(1, -28, 0, 18), 11, MUTED, true)
    local palette = { "#FF6B8A", "#FFB067", "#FFE066", "#75FAD3", "#69E187", "#63B3FF", "#B58CFF", "#FFFFFF", "#EB5F5F" }
    local swatches = {}
    local selected = nil
    for i, h in ipairs(palette) do
        local c = toColor(h)
        local s = button(row, "", UDim2.fromOffset(14 + (i - 1) * 26, 30), UDim2.fromOffset(20, 20))
        s.BackgroundColor3 = c
        s.BackgroundTransparency = 0
        rounded(s, 20)
        if h:lower() == tostring(hex):lower() then selected = s end
        connect(s.Activated, function()
            if selected and selected.Parent then
                local st = selected:FindFirstChildOfClass("UIStroke")
                if st then st:Destroy() end
            end
            selected = s
            outline(s, 0.1, 2, true)
            hex = h
            SAKEN_CFG_SET(key, hex)
            if cb then pcall(cb, c) end
        end)
    end
    if selected then outline(selected, 0.1, 2, true) end
    if cb then pcall(cb, toColor(hex)) end
end
local function M_Page(id)
    local p = featurePages[id] or pages[id]
    if not p then return nil end
    return {
        ScrollingFrame = p,
        Section = function(self, title, en, desc) return makeSection(p, title, en, desc) end,
    }
end


local themeCards, themeChecks = {}, {}
local function portrait(parent, theme)
    local art = frame(parent, "Portrait", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), theme.base, 0)
    make("UIGradient", { Color = ColorSequence.new(theme.accent:Lerp(Color3.new(1, 1, 1), 0.15), theme.base), Rotation = 110 }, art)
    for j = 1, 9 do
        frame(art, "Bokeh", UDim2.fromScale((j * 0.173) % 1, (j * 0.271) % 0.8), UDim2.fromOffset(12 + j * 3, 12 + j * 3), theme.accent, 0.91, 70)
    end
    local hair = frame(art, "Hair", UDim2.fromScale(0.30, 0.08), UDim2.fromScale(0.50, 0.99), theme.hair, 0, 70)
    make("UIGradient", { Color = ColorSequence.new(theme.hair:Lerp(WHITE, 0.25), theme.hair:Lerp(theme.base, 0.4)), Rotation = 85 }, hair)
    frame(art, "Body", UDim2.fromScale(0.30, 0.69), UDim2.fromScale(0.48, 0.47), Color3.fromRGB(43, 53, 69), 0, 45)
    frame(art, "Neck", UDim2.fromScale(0.49, 0.57), UDim2.fromScale(0.12, 0.23), Color3.fromRGB(245, 205, 182), 0, 10)
    frame(art, "Face", UDim2.fromScale(0.375, 0.22), UDim2.fromScale(0.35, 0.46), Color3.fromRGB(255, 224, 207), 0, 55)
    for j = 1, 5 do
        local bang = frame(art, "Fringe", UDim2.fromScale(0.355 + j * 0.052, 0.125), UDim2.fromScale(0.09, 0.28 - (j % 2) * 0.05), theme.hair, 0, 16)
        bang.Rotation = -22 + j * 6
    end
    for _, x in ipairs({ 0.426, 0.604 }) do
        frame(art, "EyeWhite", UDim2.fromScale(x, 0.428), UDim2.fromScale(0.072, 0.078), WHITE, 0, 15)
        frame(art, "Iris", UDim2.fromScale(x + 0.017, 0.436), UDim2.fromScale(0.04, 0.067), theme.accent:Lerp(Color3.fromRGB(79, 57, 71), 0.5), 0, 12)
        frame(art, "Catchlight", UDim2.fromScale(x + 0.026, 0.442), UDim2.fromScale(0.013, 0.02), WHITE, 0, 8)
        frame(art, "Lash", UDim2.fromScale(x - 0.005, 0.423), UDim2.fromScale(0.08, 0.012), Color3.fromRGB(67, 47, 55), 0, 2)
    end
    frame(art, "Mouth", UDim2.fromScale(0.536, 0.575), UDim2.fromScale(0.036, 0.009), Color3.fromRGB(207, 124, 132), 0, 3)
    local bow = frame(art, "Ribbon", UDim2.fromScale(0.465, 0.77), UDim2.fromScale(0.17, 0.09), theme.accent:Lerp(Color3.fromRGB(123, 51, 79), 0.5), 0, 5)
    bow.Rotation = -8
    return art
end
heading(themePage, "Theme", "THEME", "Pick a mood for the whole overlay.")
heading(settingsPage, "Settings", "SETTINGS", "Window interaction and appearance.")
local themeHolder = frame(themePage, "ThemeRow", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 150), WHITE, 1)
for i, th in ipairs(themes) do
    local b = button(themeHolder, "", UDim2.new((i - 1) / 3, 5 + 4, 0, 0), UDim2.new(1 / 3, -12, 1, 0))
    b.Name = th.key
    b.ClipsDescendants = true
    rounded(b, 14)
    portrait(b, th)
    local shade = frame(b, "Shade", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1), Color3.fromRGB(7, 14, 24), 0)
    make("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.45, 0.85), NumberSequenceKeypoint.new(1, 0.12) }), Rotation = 90 }, shade)
    label(b, th.name, UDim2.new(0, 14, 1, -54), UDim2.fromOffset(100, 29), 22, WHITE, true)
    label(b, th.en, UDim2.new(0, 15, 1, -26), UDim2.fromOffset(100, 17), 9, WHITE, true)
    local check = label(b, "✓", UDim2.new(1, -35, 0, 10), UDim2.fromOffset(23, 23), 14, th.accent, true)
    check.TextXAlignment = Enum.TextXAlignment.Center
    check.BackgroundTransparency = 0.3
    check.BackgroundColor3 = themes[i].base
    rounded(check, 20)
    local s = outline(b, i == 1 and 0.05 or 0.85, 1.7, false)
    s.Color = th.accent
    local badge = label(b, "IN USE", UDim2.new(1, -65, 1, -30), UDim2.fromOffset(53, 21), 10, th.base, true)
    badge.TextXAlignment = Enum.TextXAlignment.Center
    badge.BackgroundColor3 = th.accent
    badge.BackgroundTransparency = 0
    rounded(badge, 14)
    themeCards[i] = b
    themeChecks[i] = { check, badge, s }
end
local appearanceCard = frame(themePage, "Appearance", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 320), CARD_BG, 0, 8)
outline(appearanceCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(appearanceCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
label(appearanceCard, "Appearance", UDim2.fromOffset(23, 10), UDim2.fromOffset(200, 26), 16, WHITE, true)
accent(label(appearanceCard, "APPEARANCE", UDim2.fromOffset(125, 15), UDim2.fromOffset(160, 15), 8, state.accent, true), "TextColor3")
local swatches = {}
for i, c in ipairs({ Color3.fromRGB(117, 250, 211), Color3.fromRGB(91, 220, 177), Color3.fromRGB(184, 255, 229) }) do
    local b = button(appearanceCard, "", UDim2.fromOffset(92 + (i - 1) * 37, 57), UDim2.fromOffset(23, 23))
    b.BackgroundColor3 = c
    b.BackgroundTransparency = 0
    rounded(b, 20)
    swatches[i] = b
end
local applyAccent, applyTheme, updateFit
local setScale = function(v) end
local setFont = function(v) end
local setOpacity = function(v) end
local themeList = make("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, 0) }, themePage)
themeList.SortOrder = Enum.SortOrder.LayoutOrder
themeHolder.LayoutOrder = 2
appearanceCard.LayoutOrder = 3

local configCard = frame(settingsPage, "ConfigCard", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 188), CARD_BG, 0, 8)
outline(configCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(configCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
label(configCard, "Config", UDim2.fromOffset(23, 10), UDim2.fromOffset(200, 26), 16, WHITE, true)
accent(label(configCard, "CONFIG", UDim2.fromOffset(118, 15), UDim2.fromOffset(160, 15), 8, state.accent, true), "TextColor3")
label(configCard, "Auto-saves config; loads last saved settings on start.", UDim2.fromOffset(18, 43), UDim2.new(1, -36, 0, 20), 10, MUTED)
local saveNowBtn = button(configCard, "Save Now", UDim2.fromOffset(18, 72), UDim2.fromOffset(120, 30))
local loadNowBtn = button(configCard, "Reload", UDim2.fromOffset(148, 72), UDim2.fromOffset(120, 30))
local autoSaveBtn = button(configCard, "Auto Save: On", UDim2.fromOffset(278, 72), UDim2.fromOffset(150, 30))
local autoLoadBtn = button(configCard, "Auto Load On Start: On", UDim2.fromOffset(18, 112), UDim2.fromOffset(180, 30))
local configPathLabel = label(configCard, Config.ConfigFile, UDim2.fromOffset(210, 112), UDim2.new(1, -225, 0, 30), 9, MUTED)
configPathLabel.TextTruncate = Enum.TextTruncate.AtEnd
local function refreshConfigButtons()
    autoSaveBtn.Text = autoSaveEnabled and "Auto Save: On" or "Auto Save: Off"
    autoLoadBtn.Text = autoLoadEnabled and "Auto Load On Start: On" or "Auto Load On Start: Off"
    autoSaveBtn.BackgroundColor3 = autoSaveEnabled and state.accent or Color3.fromRGB(61, 76, 84)
    autoLoadBtn.BackgroundColor3 = autoLoadEnabled and state.accent or Color3.fromRGB(61, 76, 84)
end
connect(saveNowBtn.Activated, function() cfgFlush(true); notify("Config saved") end)
connect(loadNowBtn.Activated, function()
    if not cfgReadIntoCurrent() then notify("No config to load") else notify("Config reloaded; re-execute the script for all modules to take effect") end
end)
connect(autoSaveBtn.Activated, function() autoSaveEnabled = not autoSaveEnabled; SAKEN_CFG_SET("_ui_auto_save", autoSaveEnabled); cfgFlush(true); refreshConfigButtons() end)
connect(autoLoadBtn.Activated, function() autoLoadEnabled = not autoLoadEnabled; SAKEN_CFG_SET("_ui_auto_load", autoLoadEnabled); refreshConfigButtons() end)
refreshConfigButtons()
configCard.LayoutOrder = 1

local settingsCard = frame(settingsPage, "SettingsCard", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 150), CARD_BG, 0, 8)
outline(settingsCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(settingsCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
label(settingsCard, "Window", UDim2.fromOffset(23, 10), UDim2.fromOffset(200, 26), 16, WHITE, true)
accent(label(settingsCard, "WINDOW", UDim2.fromOffset(120, 15), UDim2.fromOffset(160, 15), 8, state.accent, true), "TextColor3")
label(settingsCard, "Show / Hide", UDim2.fromOffset(18, 52), UDim2.fromOffset(200, 26), 12, WHITE)
local keyPill = button(settingsCard, "RIGHT SHIFT", UDim2.new(1, -158, 0, 51), UDim2.fromOffset(137, 28))
connect(keyPill.Activated, function() notify("Right Shift on PC; tap the island on mobile") end)
local resetPosition = button(settingsCard, "Center Window", UDim2.fromOffset(18, 95), UDim2.fromOffset(132, 30))
local resetStyle = button(settingsCard, "Reset Appearance", UDim2.fromOffset(162, 95), UDim2.fromOffset(153, 30))
local sessionCard = frame(settingsPage, "SessionCard", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 92), CARD_BG, 0, 8)
outline(sessionCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(sessionCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
label(sessionCard, "Session", UDim2.fromOffset(23, 10), UDim2.fromOffset(120, 26), 16, WHITE, true)
label(sessionCard, "Re-execute the script to restore", UDim2.fromOffset(18, 48), UDim2.new(1, -200, 0, 27), 11, MUTED)
local exitButton = button(sessionCard, "Unload UI", UDim2.new(1, -147, 0, 46), UDim2.fromOffset(127, 30))
connect(exitButton.Activated, destroy)
local settingsList = make("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, Padding = UDim.new(0, 8) }, settingsPage)
settingsList.SortOrder = Enum.SortOrder.LayoutOrder
settingsCard.LayoutOrder = 2
sessionCard.LayoutOrder = 3


heading(licensePage, "License", "LICENSE", "License gate · enter to unlock all pages")
local licenseCard = frame(licensePage, "LicenseCard", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 210), CARD_BG, 0, 8)
outline(licenseCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(licenseCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
label(licenseCard, "License Verification", UDim2.fromOffset(23, 10), UDim2.new(1, -46, 0, 26), 16, WHITE, true)
accent(label(licenseCard, "LICENSE · SECURE", UDim2.fromOffset(23, 36), UDim2.new(1, -46, 0, 16), 9, state.accent, true), "TextColor3")
local licenseStatus = label(licenseCard, "Enter license to continue", UDim2.fromOffset(23, 62), UDim2.new(1, -46, 0, 20), 11, MUTED)
local licenseInput = rounded(make("TextBox", {
    Position = UDim2.fromOffset(23, 86), Size = UDim2.new(1, -46, 0, 38),
    BackgroundColor3 = Color3.fromRGB(9, 18, 27), BackgroundTransparency = 0.2,
    BorderSizePixel = 0, Text = "", PlaceholderText = "Enter license...",
    PlaceholderColor3 = MUTED, TextColor3 = WHITE, TextSize = 13, Font = Enum.Font.Gotham,
    ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Left,
}, licenseCard), 10)
make("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 10) }, licenseInput)
local licenseStroke = outline(licenseInput, 0.8, 1.5)
local verifyBtn = button(licenseCard, "Verify & Unlock", UDim2.fromOffset(23, 134), UDim2.new(1, -46, 0, 36))
rounded(verifyBtn, 12)
local hintLabel = label(licenseCard, "TURNhub · 2s cooldown after 3 failures", UDim2.fromOffset(23, 176), UDim2.new(1, -46, 0, 18), 9, MUTED)
local licensePageList = make("UIListLayout", { FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, licensePage)
licenseCard.LayoutOrder = 2
local function licenseNotifyLocked()
    notify("Please verify license first")
end
local startModulesOnce
local function tryUnlock(silent)
    if state.unlocked then return true end
    local cleaned = tostring(licenseInput.Text or ""):gsub("%s+", "")
    if cleaned == "" then
        if not silent then
            licenseStatus.Text = "Enter license"
            licenseStatus.TextColor3 = Color3.fromRGB(255, 140, 140)
        end
        return false
    end
    if cleaned == Config.LicenseKey or cleaned:lower() == Config.LicenseKey:lower() then
        state.unlocked = true
        state.licenseAttempts = 0
        licenseStatus.Text = "Verified · Unlocked"
        licenseStatus.TextColor3 = Color3.fromRGB(80, 230, 170)
        licenseStroke.Color = Color3.fromRGB(80, 230, 170)
        licenseStroke.Transparency = 0.1
        verifyBtn.Text = "Unlocked"
        licenseInput.TextEditable = false
        startModulesOnce()
        notify("License accepted · Unlocked")
        return true
    end
    state.licenseAttempts = state.licenseAttempts + 1
    licenseStatus.Text = "Wrong license, try again"
    licenseStatus.TextColor3 = Color3.fromRGB(255, 120, 120)
    licenseStroke.Color = Color3.fromRGB(255, 120, 120)
    tween(licenseCard, 0.06, { Position = UDim2.fromOffset(0, 0) })
    if state.licenseAttempts >= 3 then
        state.licenseAttempts = 0
        state.licenseCooldown = os.clock() + 2
        licenseStatus.Text = "Too many attempts · 2s cooldown"
        task.delay(2, function()
            if alive and not state.unlocked then
                licenseStatus.Text = "Enter license to continue"
                licenseStatus.TextColor3 = MUTED
            end
        end)
    end
    return false
end
connect(verifyBtn.Activated, function()
    if os.clock() < state.licenseCooldown then return end
    tryUnlock(false)
end)
connect(licenseInput.FocusLost, function() end)
connect(Input.InputBegan, function(input, processed)
    if processed or Input:GetFocusedTextBox() then return end
    if input.KeyCode == Enum.KeyCode.KeypadEnter or input.KeyCode == Enum.KeyCode.Return then
        if state.page == 1 and not state.unlocked then tryUnlock(false) end
    end
end)


local function optToggle(parent, title, y, initial, cb)
    local value = initial
    label(parent, title, UDim2.fromOffset(18, y), UDim2.new(1, -88, 0, 24), 11, WHITE)
    local b = button(parent, "", UDim2.new(1, -64, 0, y + 2), UDim2.fromOffset(44, 22))
    rounded(b, 20)
    local knob = frame(b, "Knob", UDim2.fromOffset(value and 23 or 3, 3), UDim2.fromOffset(16, 16), WHITE, 0, 20)
    local function paint()
        b.BackgroundColor3 = value and state.accent or Color3.fromRGB(61, 76, 84)
        knob.Position = UDim2.fromOffset(value and 23 or 3, 3)
    end
    paint()
    connect(b.Activated, function()
        value = not value
        paint()
        if cb then pcall(cb, value) end
    end)
    return function(v) value = v; paint() end
end
local function optSlider(parent, title, y, low, high, initial, suffix, cb)
    local range = high - low
    local step = range <= 3 and 0.01 or (range <= 20 and 0.05 or 1)
    local value = initial
    label(parent, title, UDim2.fromOffset(18, y), UDim2.new(1, -100, 0, 22), 11, MUTED, true)
    local num = accent(label(parent, "", UDim2.new(1, -88, 0, y), UDim2.fromOffset(70, 22), 11, state.accent, true), "TextColor3")
    num.TextXAlignment = Enum.TextXAlignment.Right
    local track = frame(parent, "Track", UDim2.fromOffset(18, y + 27), UDim2.new(1, -40, 0, 4), WHITE, 0.88, 6)
    local fill = accent(frame(track, "Fill", UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), state.accent, 0, 6), "BackgroundColor3")
    local knob = accent(frame(track, "Handle", UDim2.fromScale(0.5, 0.5), UDim2.fromOffset(10, 10), state.accent, 0, 12), "BackgroundColor3")
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    local hit = button(parent, "", UDim2.fromOffset(8, y + 14), UDim2.new(1, -22, 0, 30))
    hit.BackgroundTransparency = 1
    local function set(v, animate)
        v = math.clamp(math.floor(v / step + 0.5) * step, low, high)
        value = v
        local p = (v - low) / math.max(0.0001, range)
        num.Text = fmtNum(v) .. (suffix or "")
        if animate then
            tween(fill, 0.08, { Size = UDim2.fromScale(p, 1) })
            tween(knob, 0.08, { Position = UDim2.fromScale(p, 0.5) })
        else
            fill.Size = UDim2.fromScale(p, 1)
            knob.Position = UDim2.fromScale(p, 0.5)
        end
    end
    local function update(x, y2)
        local trackX = track.AbsolutePosition.X
        local p = math.clamp((x - trackX) / math.max(1, track.AbsoluteSize.X), 0, 1)
        set(low + p * range, true)
        if cb then pcall(cb, value) end
    end
    connect(hit.InputBegan, function(input)
        if state.uiLocked or uiDrag then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            uiDrag = { input = input, update = update }
            update(input.Position.X, input.Position.Y)
        end
    end)
    set(value, false)
    if cb then pcall(cb, value) end
    return function(v) set(v, false) end
end

local effectsCard = frame(themePage, "Effects", UDim2.fromOffset(0, 0), UDim2.new(1, -10, 0, 168), CARD_BG, 0, 8)
outline(effectsCard, 0.55, 1, false).Color = CARD_LINE
accent(frame(effectsCard, "AccentLine", UDim2.fromOffset(12, 17), UDim2.fromOffset(2, 21), state.accent, 0.1, 2), "BackgroundColor3")
effectsCard.LayoutOrder = 4
label(effectsCard, "UI Style", UDim2.fromOffset(23, 10), UDim2.fromOffset(200, 26), 16, WHITE, true)
accent(label(effectsCard, "EFFECTS", UDim2.fromOffset(112, 15), UDim2.fromOffset(160, 15), 8, state.accent, true), "TextColor3")
local setDepth = optToggle(effectsCard, "3D Depth", 48, true, function(v)
    state.depth = v
    viewport.Visible = v
    edge.Visible = v
    depthLabel.Text = v and "3D Render · On" or "3D Render · Off"
end)
local setRain = optToggle(effectsCard, "Rain Effect", 84, false, function(v)
    state.rain = v
    for _, d in ipairs(rain) do d.node.Visible = v end
end)
label(effectsCard, "3D background / drag parallax / spring easing\nAnimation follows device refresh rate", UDim2.fromOffset(18, 116), UDim2.new(1, -36, 0, 40), 10, MUTED).TextWrapped = true

setScale = optSlider(appearanceCard, "Menu Scale", 100, 35, 160, 100, "%", function(v) state.scale = v / 100; SAKEN_CFG_SET("ui_scale", state.scale); if updateFit then updateFit() end end)
setFont = optSlider(appearanceCard, "Font Size", 152, 85, 120, 100, "%", function(v)
    state.font = v / 100
    SAKEN_CFG_SET("ui_font", state.font)
    for _, entry in ipairs(textNodes) do if entry[1].Parent then entry[1].TextSize = math.max(12, entry[2] * state.font) end end
end)
setOpacity = optSlider(appearanceCard, "Menu Opacity", 204, 55, 100, 94, "%", function(v) state.opacity = v / 100; SAKEN_CFG_SET("ui_opacity", state.opacity); panel.BackgroundTransparency = 1 - state.opacity end)

applyAccent = function(color)
    state.accent = color
    for _, entry in ipairs(accents) do if entry[1].Parent then tween(entry[1], 0.4, { [entry[2]] = color }) end end
    for _, s in ipairs(strokes) do if s.Parent then tween(s, 0.4, { Color = color }) end end
    for _, p in ipairs(crystalParts) do tween(p, 0.45, { Color = color }) end
    for _, ring in ipairs(rings) do for _, part in ipairs(ring:GetChildren()) do part.Color = color end end
end
applyTheme = function(index, silent)
    state.theme = index
    applyAccent(themes[index].accent)
    tween(panel, 0.45, { BackgroundColor3 = themes[index].base })
    for i, entry in ipairs(themeChecks) do
        entry[1].Text = i == index and "✓" or ""
        entry[2].Visible = i == index
        tween(entry[3], 0.35, { Transparency = i == index and 0.05 or 0.85 })
    end
    SAKEN_CFG_SET("ui_theme", index)
    if not silent then notify("Switched to" .. themes[index].name .. "Theme") end
end
for i, b in ipairs(themeCards) do
    connect(b.Activated, function() applyTheme(i) end)
    connect(b.MouseEnter, function() tween(b, 0.28, { Rotation = state.depth and -0.8 or 0 }) end)
    connect(b.MouseLeave, function() tween(b, 0.3, { Rotation = 0 }) end)
end
for _, b in ipairs(swatches) do
    connect(b.Activated, function()
        applyAccent(b.BackgroundColor3)
        notify("Accent updated")
    end)
end


root.Parent = gui
root.Position = UDim2.fromScale(0.5, 0.5)
rootScale.Scale = 1
screenToCanvas = function(x, y)
    local w = root.AbsoluteSize.X
    local h = root.AbsoluteSize.Y
    if w < 1 or h < 1 then return end
    local nx = (x - root.AbsolutePosition.X) / w
    local ny = (y - root.AbsolutePosition.Y) / h
    return Vector2.new(nx * 980 * renderDensity, ny * 624 * renderDensity)
end

local targetFit, openAmount, openVelocity, targetOpen = 1, 0, 0, 0
local position = Vector2.new(0, 0)
local tilt, tiltVelocity = Vector2.new(0, 0), Vector2.new(0, 0)
local drag, tiltGesture, resizeGesture
local function screenSize()
    return gui.AbsoluteSize
end
local function clampPosition(p)
    local size = screenSize()
    local half = Vector2.new(980 * targetFit / 2, 624 * targetFit / 2)
    local minX, maxX = half.X + 8, size.X - half.X - 8
    local minY, maxY = half.Y + 68, size.Y - half.Y - 8
    if maxX < minX then minX = size.X / 2; maxX = minX end
    if maxY < minY then minY = size.Y / 2 + 24; maxY = minY end
    return Vector2.new(math.clamp(p.X, minX, maxX), math.clamp(p.Y, minY, maxY))
end
updateFit = function()
    local size = screenSize()
    if size.X < 1 or size.Y < 1 then return end
    local available = math.min((size.X - 28) / 980, (size.Y - 100) / 624, 1.15)
    targetFit = math.max(0.1, math.min(available * state.scale, (size.X - 24) / (980 * 1.07), (size.Y - 86) / (624 * 1.07)))
    islandScale.Scale = math.min(1, size.X / 370)
    position = clampPosition(position.Magnitude == 0 and Vector2.new(size.X / 2, size.Y / 2 + 24) or position)
end
connect(gui:GetPropertyChangedSignal("AbsoluteSize"), updateFit)
updateFit()

local lockTargets = nil
local function lockList()
    if lockTargets then return lockTargets end
    local list = {}
    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then
            list[#list + 1] = obj
        end
    end
    lockTargets = list
    return list
end
local function setInteractionLock(locked)
    if state.uiLocked == locked then return end
    state.uiLocked = locked
    for _, obj in ipairs(lockList()) do
        if obj:IsA("ScrollingFrame") then
            obj.ScrollingEnabled = not locked
        else
            obj.TextEditable = not locked
        end
    end
end

local function setOpen(value)
    if not alive then return end
    if state.open == value then return end
    state.open = value
    targetOpen = value and 1 or 0
    if value then
        root.Visible = true
    else
        tiltGesture = nil; drag = nil; resizeGesture = nil; uiDrag = nil
        for _, d in ipairs(particles) do d.node.Position = UDim2.fromScale(d.x, d.y) end
    end
    islandStatus.Text = value and "Collapse" or "Open"
    islandTitle.Text = "TURNsakenV4.1"
    tween(island, 0.4, { BackgroundColor3 = value and Color3.fromRGB(29, 44, 50) or Color3.fromRGB(20, 29, 36) }, Enum.EasingStyle.Quint)
end
API.Toggle = function() setOpen(not state.open) end
API.Open = function() setOpen(true) end
API.Close = function() setOpen(false) end

do
    local press, moved, islandStart = nil, false, nil
    local islandPos = UDim2.new(0.5, 0, 0, 16)
    island.Position = islandPos
    connect(island.InputBegan, function(i)
        if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
        press, moved, islandStart = i.Position, false, island.Position
    end)
    connect(Input.InputChanged, function(i)
        if not press then return end
        if i.UserInputType ~= Enum.UserInputType.MouseMovement and i.UserInputType ~= Enum.UserInputType.Touch then return end
        local d = i.Position - press
        if not moved and d.Magnitude < 6 then return end
        moved = true
        island.Position = UDim2.new(islandStart.X.Scale, islandStart.X.Offset + d.X, islandStart.Y.Scale, islandStart.Y.Offset + d.Y)
    end)
    connect(Input.InputEnded, function(i)
        if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
        if not press then return end
        press = nil
        if not moved then API.Toggle() end
    end)
end
connect(minimize.Activated, API.Close)
connect(Input.InputBegan, function(input, processed)
    if not processed and not Input:GetFocusedTextBox() and input.KeyCode == Config.ToggleKey then API.Toggle() end
end)
connect(Input.InputBegan, function(input, processed)
    if processed then return end
    if captureKeybind then
        local name = input.KeyCode.Name
        if name ~= "Unknown" then
            if name == "Escape" then name = "None" end
            local cap = captureKeybind
            captureKeybind = nil
            cap.btn.Text = name
            if SAKEN_CFG_SET then SAKEN_CFG_SET(cap.key, name) end
            if cap.cb then pcall(cap.cb, name) end
        end
        return
    end
    if not state.open or state.uiLocked or tiltGesture or drag or resizeGesture or uiDrag or openAmount < 0.98 then return end
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
    local point = screenToCanvas(input.Position.X, input.Position.Y)
    if not point or point.X < 0 or point.X > 980 * renderDensity or point.Y < 50 * renderDensity or point.Y > 624 * renderDensity then return end
    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA("GuiButton") or obj:IsA("TextBox") or (obj:IsA("ScrollingFrame") and obj.AbsoluteCanvasSize.Y > obj.AbsoluteSize.Y + 1) then
            local visible, ancestor = true, obj
            while ancestor and ancestor ~= root do
                if ancestor:IsA("GuiObject") and not ancestor.Visible then visible = false; break end
                ancestor = ancestor.Parent
            end
            local pos, size = obj.AbsolutePosition, obj.AbsoluteSize
            if visible and point.X >= pos.X and point.X <= pos.X + size.X and point.Y >= pos.Y and point.Y <= pos.Y + size.Y then return end
        end
    end
    tiltGesture = { input = input, start = Vector2.new(input.Position.X, input.Position.Y), delta = Vector2.new(0, 0), active = false, age = 0 }
end)
connect(header.InputBegan, function(input)
    if state.uiLocked or resizeGesture then return end
    local point = screenToCanvas(input.Position.X, input.Position.Y)
    if point and (point.X < 14 * renderDensity or point.X > 966 * renderDensity or point.Y < 14 * renderDensity) then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tiltGesture = nil
        drag = { input = input, start = Vector2.new(input.Position.X, input.Position.Y), origin = position }
    end
end)
local resizeZones = {
    { name = "TopLeft", x = -1, y = -1, pos = UDim2.fromOffset(0, 0), size = UDim2.fromOffset(30, 30) },
    { name = "TopRight", x = 1, y = -1, pos = UDim2.new(1, -30, 0, 0), size = UDim2.fromOffset(30, 30) },
    { name = "BottomLeft", x = -1, y = 1, pos = UDim2.new(0, 0, 1, -30), size = UDim2.fromOffset(30, 30) },
    { name = "BottomRight", x = 1, y = 1, pos = UDim2.new(1, -30, 1, -30), size = UDim2.fromOffset(30, 30) },
    { name = "Left", x = -1, y = 0, pos = UDim2.fromOffset(0, 30), size = UDim2.new(0, 14, 1, -60) },
    { name = "Right", x = 1, y = 0, pos = UDim2.new(1, -14, 0, 30), size = UDim2.new(0, 14, 1, -60) },
    { name = "Top", x = 0, y = -1, pos = UDim2.fromOffset(30, 0), size = UDim2.new(1, -60, 0, 14) },
    { name = "Bottom", x = 0, y = 1, pos = UDim2.new(0, 30, 1, -14), size = UDim2.new(1, -60, 0, 14) },
}
for _, zone in ipairs(resizeZones) do
    local hit = button(shell, "", zone.pos, zone.size)
    hit.Name = "Resize" .. zone.name
    hit.BackgroundTransparency = 1
    hit.ZIndex = 10
    connect(hit.InputBegan, function(input)
        if not state.open or state.uiLocked or resizeGesture or drag or uiDrag or openAmount < 0.98 then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        tiltGesture, drag = nil, nil
        tilt, tiltVelocity = Vector2.new(0, 0), Vector2.new(0, 0)
        resizeGesture = {
            input = input, start = Vector2.new(input.Position.X, input.Position.Y),
            last = Vector2.new(input.Position.X, input.Position.Y), started = false,
            x = zone.x, y = zone.y,
        }
    end)
end
local function updateResize(input)
    if resizeGesture and (input == resizeGesture.input or (resizeGesture.input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)) then
        local gesture = resizeGesture
        local point = Vector2.new(input.Position.X, input.Position.Y)
        local delta = point - gesture.last
        gesture.last = point
        if delta.Magnitude > 240 then gesture.start = point; return end
        if not gesture.started then
            if (point - gesture.start).Magnitude < 7 then return end
            gesture.started = true
            delta = point - gesture.start
        end
        local axis = Vector2.new(gesture.x * 980, gesture.y * 624)
        local change = delta:Dot(axis) / axis:Dot(axis)
        local size = screenSize()
        local available = math.min((size.X - 28) / 980, (size.Y - 100) / 624, 1.15)
        local limit = math.min(available * 1.6, (size.X - 24) / (980 * 1.07), (size.Y - 86) / (624 * 1.07))
        local previous = targetFit
        local minimum = math.min(limit, math.max(0.1, available * 0.35))
        targetFit = math.clamp(previous + change, minimum, limit)
        local difference = targetFit - previous
        position = clampPosition(position + Vector2.new(gesture.x * 490 * difference, gesture.y * 312 * difference))
        state.scale = targetFit / math.max(0.1, available)
        if setScale then setScale(state.scale * 100) end
        return true
    end
end
connect(Input.InputChanged, function(input)
    if updateResize(input) then return end
    if tiltGesture and (input == tiltGesture.input or (tiltGesture.input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)) then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - tiltGesture.start
        if not tiltGesture.active and state.depth and state.follow and delta.Magnitude >= 3 then
            tiltGesture.active = true
            setInteractionLock(true)
        end
        if tiltGesture.active then tiltGesture.delta = delta end
    end
    if uiDrag and (input == uiDrag.input or (uiDrag.input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)) then
        uiDrag.update(input.Position.X, input.Position.Y)
    end
    if drag and (input == drag.input or (drag.input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)) then
        local point = Vector2.new(input.Position.X, input.Position.Y)
        position = clampPosition(drag.origin + point - drag.start)
    end
end)
connect(Input.InputEnded, function(input)
    if resizeGesture and input == resizeGesture.input then updateResize(input); resizeGesture = nil end
    if tiltGesture and input == tiltGesture.input then tiltGesture = nil end
    if drag and input == drag.input then drag = nil end
    if uiDrag and input == uiDrag.input then uiDrag = nil end
end)
connect(Input.WindowFocusReleased, function()
    drag = nil; tiltGesture = nil; resizeGesture = nil; uiDrag = nil
    setInteractionLock(false)
end)
connect(resetPosition.Activated, function()
    local size = screenSize()
    position = clampPosition(Vector2.new(size.X / 2, size.Y / 2 + 24))
    notify("Window centered")
end)
connect(resetStyle.Activated, function()
    state.scale, state.font, state.opacity, state.motion = 1, 1, 0.94, 1
    state.depth, state.particles, state.rain, state.follow, state.glass = false, true, false, true, true
    if setScale then setScale(100) end
    if setFont then setFont(100) end
    if setOpacity then setOpacity(94) end
    if setDepth then setDepth(false) end
    if setRain then setRain(false) end
    for _, entry in ipairs(textNodes) do if entry[1].Parent then entry[1].TextSize = entry[2] end end
    for _, d in ipairs(particles) do d.node.Visible = true end
    for _, d in ipairs(rain) do d.node.Visible = false end
    viewport.Visible, edge.Visible = false, true
    depthLabel.Text = "3D Render · Off"
    tween(border, 0.3, { Transparency = 0.22 })
    panel.BackgroundTransparency = 0.06
    applyTheme(1, true)
    updateFit()
    notify("Default appearance restored")
end)


local transitionSerial = 0
local function switchPage(index, instant)
    if not instant and not state.unlocked and index ~= 1 then
        notify("Please verify license first")
        return
    end
    if index == state.page and not instant then return end
    local previous = state.page
    state.page = index
    SAKEN_CFG_SET("ui_page", index)
    transitionSerial = transitionSerial + 1
    local token = transitionSerial
    local direction = index >= previous and 1 or -1
    tween(selection, 0.4, { Position = UDim2.fromOffset(0, (index - 1) * NAV_STEP) }, Enum.EasingStyle.Quint)
    if pageTitle and navData[index] then pageTitle.Text = navData[index].title end
    if navScroll then
        local target = (index - 1) * NAV_STEP
        local view = navScroll.AbsoluteSize.Y
        local canvas = navScroll.AbsoluteCanvasSize.Y
        local top = navScroll.CanvasPosition.Y
        if target + 40 > top + view then
            tween(navScroll, 0.25, { CanvasPosition = Vector2.new(0, math.min(target + 40 - view, math.max(0, canvas - view))) })
        elseif target < top then
            tween(navScroll, 0.25, { CanvasPosition = Vector2.new(0, target) })
        end
    end
    for i, title in ipairs(navLabels) do tween(title, 0.25, { TextColor3 = i == index and state.accent or WHITE }) end
    local old, nextPage = pages[previous], pages[index]
    for i, p in ipairs(pages) do if i ~= index and i ~= previous then p.Visible = false end end
    if instant or previous == index then
        for i, p in ipairs(pages) do p.Visible = i == index; p.Position = UDim2.fromScale(0, 0) end
        return
    end
    nextPage.Visible = true
    nextPage.Position = UDim2.fromOffset(direction * 80, 8)
    tween(nextPage, 0.46, { Position = UDim2.fromOffset(0, 0) })
    tween(old, 0.28, { Position = UDim2.fromOffset(-direction * 100, -3) })
    task.delay(0.3, function()
        if alive and transitionSerial == token and state.page ~= previous then old.Visible = false end
    end)
    nextPage.ZIndex = 3
    old.ZIndex = 2
end
for i, b in ipairs(navButtons) do connect(b.Activated, function() switchPage(i) end) end
connect(homeBtn.Activated, function() switchPage(1) end)
API.SelectPage = function(index)
    if not state.uiLocked and type(index) == "number" and pages[index] then switchPage(index) end
end


local function spring(x, v, goal, frequency, dt)
    local offset = x - goal
    local decay = math.exp(-frequency * dt)
    local c = v + frequency * offset
    return goal + (offset + c * dt) * decay, (v - frequency * c * dt) * decay
end
local elapsed, fpsTime, fpsFrames = 0, 0, 0
local rootPosition = position
local sceneAcc, SCENE_STEP, barAcc, lastVisibility = 0, 1 / 10, 0, -1
connect(RunService.RenderStepped, function(rawDt)
    if not alive then return end
    local dt = math.min(rawDt, 1 / 20)
    elapsed = elapsed + dt
    fpsTime, fpsFrames = fpsTime + rawDt, fpsFrames + 1
    if fpsTime >= 0.65 then
        fpsLabel.Text = tostring(math.floor(fpsFrames / fpsTime + 0.5)) .. " FPS / 3D OVERLAY"
        fpsTime, fpsFrames = 0, 0
    end
    barAcc = barAcc + rawDt
    if barAcc >= 0.05 then
        barAcc = 0
        for i, b in ipairs(bars) do
            local height = 3 + (math.sin(elapsed * 4.4 + i * 0.9) * 0.5 + 0.5) * (state.open and 7 or 4)
            b.Size = UDim2.fromOffset(2, height)
            b.Position = UDim2.fromOffset(88 + i * 4, 14 - height / 2)
        end
        islandDot.BackgroundTransparency = 0.12 + (math.sin(elapsed * 2) + 1) * 0.15
    end
    openAmount, openVelocity = spring(openAmount, openVelocity, targetOpen, 26 / state.motion, dt)
    if not state.open and openAmount < 0.04 then root.Visible = false; return end
    if not root.Visible then return end
    sceneAcc = sceneAcc + dt
    local doScene = sceneAcc >= SCENE_STEP
    local sceneDt = sceneAcc
    if doScene then sceneAcc = 0 end
    local p = math.clamp(openAmount, 0, 1)
    local size = screenSize()
    local normalized = Vector2.new(0, 0)
    if tiltGesture and not tiltGesture.active then
        tiltGesture.age = tiltGesture.age + rawDt
        if tiltGesture.age >= 0.25 then
            drag = { input = tiltGesture.input, start = tiltGesture.start, origin = position, held = true }
            tiltGesture = nil
            setInteractionLock(true)
        end
    end
    if state.depth and state.follow and tiltGesture and tiltGesture.active then
        normalized = Vector2.new(math.clamp(tiltGesture.delta.X / math.max(70, 170 * targetFit), -1, 1), math.clamp(tiltGesture.delta.Y / math.max(60, 130 * targetFit), -1, 1))
    end
    tilt, tiltVelocity = spring(tilt, tiltVelocity, normalized, 18, dt)
    rootPosition = resizeGesture and position or rootPosition:Lerp(position, 1 - math.exp(-20 * dt))
    local origin = Vector2.new(size.X / 2, 30)
    local animatedPosition = origin:Lerp(rootPosition, p)
    local tilting = (tiltGesture ~= nil and tiltGesture.active) or tilt.Magnitude > 0.002
    if state.uiLocked and not tilting and not (drag and drag.held) then setInteractionLock(false) end
    root.Position = UDim2.new(0, animatedPosition.X, 0, animatedPosition.Y)
    if math.abs(rootScale.Scale - targetFit) > 0.0004 then
        rootScale.Scale = targetFit
    end
    local visibility = state.open and p or math.clamp((p - 0.08) / 0.92, 0, 1)
    if math.abs(visibility - lastVisibility) > 0.012 then
        lastVisibility = visibility
        panel.BackgroundTransparency = 1 - (state.opacity * visibility)
        edge.BackgroundTransparency = 1 - 0.52 * visibility
        for _, shadow in ipairs(shadows) do shadow.BackgroundTransparency = 1 - 0.09 * visibility end
    end
    edge.Position = UDim2.fromOffset(3 - tilt.X * 7, 5 - tilt.Y * 6)
    if state.depth and doScene then
        camera.CFrame = CFrame.lookAt(Vector3.new(tilt.X * 1.7, -tilt.Y * 1.2, 19), Vector3.new(0, 0, 0))
        sculpture:PivotTo(CFrame.new(0, math.sin(elapsed * 0.65) * 0.2, 0) * CFrame.Angles(0, math.sin(elapsed * 0.2) * 0.3, 0.04 * math.sin(elapsed)))
        for i, ring in ipairs(rings) do
            ring:PivotTo(CFrame.new(3.4, 0, -2) * CFrame.Angles(0.6 + i * 0.35, elapsed * 0.12 * (i % 2 == 0 and -1 or 1), i * 0.5))
        end
    end
    if doScene and state.particles and p > 0.02 then
        for _, d in ipairs(particles) do
            d.node.Position = UDim2.fromScale((d.x + math.sin(elapsed * 0.3 + d.phase) * 0.025) % 1, (d.y - elapsed * d.speed) % 1)
        end
    end
    if doScene and state.rain and p > 0.02 then
        for _, d in ipairs(rain) do d.node.Position = UDim2.fromScale((d.x - elapsed * 0.035) % 1, (d.y + elapsed * d.speed) % 1) end
    end
end)


local HttpService = game:GetService("HttpService")
local M = {
    Local = LocalPlayer,
    Svc = {
        Players = Players, RunService = RunService, ReplicatedStorage = ReplicatedStorage,
        Workspace = Workspace, UserInputService = Input, TweenService = TweenService,
        Debris = game:GetService("Debris"), HttpService = HttpService,
        SoundService = game:GetService("SoundService"), Lighting = Lighting,
        StarterPlayer = game:GetService("StarterPlayer"), Stats = game:GetService("Stats"),
        Teams = game:GetService("Teams"),
    },
}
M.Notify = function(title, text)
    local msg = text ~= nil and (tostring(title) .. " · " .. tostring(text)) or tostring(title)
    notify(msg)
end
M.Get = function(key) return SAKEN_CFG_GET(key) end
M.Set = function(key, value) SAKEN_CFG_SET(key, value) end
M.OnConfigLoaded = function(fn) M._configLoaded = fn end
M.Bind = function(conn)
    if typeof(conn) == "RBXScriptConnection" then connections[#connections + 1] = conn end
    return conn
end
M.IsAlive = function() return alive end
M.Wait = function(seconds) task.wait(seconds) end
M.Page = function(id)
    if id == "license" then return nil end
    local p = featurePages[id]
    if not p then return nil end
    return {
        ScrollingFrame = p,
        Section = function(self, title, en, desc) return makeSection(p, title, en, desc) end,
    }
end
M.OnHeartbeat = function(fn)
    M.Bind(RunService.Heartbeat:Connect(function(dt)
        if not alive then return end
        pcall(fn, dt, os.clock())
    end))
end
M.Every = function(seconds, fn)
    task.spawn(function()
        while alive do
            task.wait(seconds)
            if not alive then break end
            pcall(fn)
        end
    end)
end
local remoteCache = nil
M.Remote = function()
    if remoteCache and remoteCache.Parent then return remoteCache end
    local ok, found = pcall(function()
        local net = ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Network") and ReplicatedStorage.Modules.Network:FindFirstChild("Network")
        return net and net:FindFirstChild("RemoteEvent")
    end)
    if ok and found then remoteCache = found return found end
    local ok2, waited = pcall(function()
        return ReplicatedStorage.Modules.Network.Network:WaitForChild("RemoteEvent", 5)
    end)
    if ok2 and waited then remoteCache = waited return waited end
    return nil
end

local MODULE_FUNCS = {}
local function addModule(fn)
    MODULE_FUNCS[#MODULE_FUNCS + 1] = fn
end
M.OnUnload = function(fn)
    if type(fn) == "function" then UNLOAD_HOOKS[#UNLOAD_HOOKS + 1] = fn end
end


addModule(function(M)
    local page = M.Page("stam")
    if not page then return end
    local sec = page:Section("Stamina", "STAMINA", "Infinite stamina only")
    local RS = M.Svc.ReplicatedStorage
    local cachedMod, cachedAt = nil, 0
    local function getModel()
        local now = os.clock()
        if cachedMod and now - cachedAt < 2 then return cachedMod end
        local ok, mod = pcall(function()
            return require(RS.Systems.Character.Game.Sprinting)
        end)
        if ok and type(mod) == "table" then
            cachedMod, cachedAt = mod, now
            return mod
        end
        return nil
    end
    local enabled = false
    local function apply(mod)
        if not mod then return end
        if enabled then
            mod.StaminaLossDisabled = true
            local cap = tonumber(mod.MaxStamina) or 100
            mod.Stamina = cap
            if mod.__staminaChangedEvent then
                pcall(function() mod.__staminaChangedEvent:Fire(cap) end)
            end
        end
    end
    sec:Toggle("st_inf", "Infinite Stamina", false, function(v)
        enabled = v and true or false
        if enabled then
            local mod = getModel()
            apply(mod)
            if not mod then M.Notify("Stamina", "Sprinting module not found, retry in-game") end
        else
            local mod = getModel()
            if mod then pcall(function() mod.StaminaLossDisabled = false end) end
        end
    end)
    M.OnHeartbeat(function()
        if not enabled then return end
        local mod = getModel()
        if mod then apply(mod) end
    end)
end)



addModule(function(M)


local page = M.Page("ab")
local sec = page:Section("Block Mode", "Mode", "Decoy / Zone / Hitbox — pick one; ranges render even before enabling")
local secBtn = page:Section("Quick Button", "Quick", "Floating Toggle Button")
local secHB = page:Section("3D Hitbox", "3D HITBOX", "Killer hitbox detection & visualization")

local Players, WS, RS, RunService, Debris, UIS =
    M.Svc.Players, M.Svc.Workspace, M.Svc.ReplicatedStorage, M.Svc.RunService, M.Svc.Debris, M.Svc.UserInputService
local LP = M.Local
local playerGui = LP:WaitForChild("PlayerGui")

local S = {
    on = M.Get("ab_on") == true,
    mode = "Hitbox",
    facing = M.Get("ab_facing") ~= false,
    range = tonumber(M.Get("ab_range")) or 15,
    dot = tonumber(M.Get("ab_dot")) or 0.3,
    window = tonumber(M.Get("ab_window")) or 0.25,
    showCone = M.Get("ab_show_cone") ~= false,
    zoneLen = tonumber(M.Get("ab_zone_len")) or 8,
    zoneWid = tonumber(M.Get("ab_zone_wid")) or 4,
    zoneOff = tonumber(M.Get("ab_zone_off")) or 3,
    zoneR = tonumber(M.Get("ab_zone_r")) or 5,
    showZone = M.Get("ab_show_zone") ~= false,
    showCircle = M.Get("ab_show_circle") ~= false,
    hbDist = tonumber(M.Get("ab_hb_dist")) or 3,
    hbWidth = tonumber(M.Get("ab_hb_width")) or 6,
    hbLength = tonumber(M.Get("ab_hb_length")) or 9,
    hbHeight = tonumber(M.Get("ab_hb_height")) or 6,
    hbMul = tonumber(M.Get("ab_hb_mul")) or 1,
    hbShow = M.Get("ab_hb_show") ~= false,
    hbOutline = M.Get("ab_hb_outline") ~= false,
    hbTrans = tonumber(M.Get("ab_hb_trans")) or 0.8,
    hbOutlineTrans = tonumber(M.Get("ab_hb_ot")) or 0.6,
    hbColor = M.Get("ab_hb_color") or "#FFFFFF",
    floating = M.Get("ab_floating") ~= false,
    charMode = M.Get("ab_char") or "Guest 1337",
}

local function alive() return M.IsAlive() end
local function note(t) pcall(M.Notify, "Auto Block", t) end
local function killersFolder()
    local p = WS:FindFirstChild("Players")
    return p and p:FindFirstChild("Killers")
end
local function myChar() return LP and LP.Character end
local function myRoot()
    local c = myChar()
    return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("RootPart")), c
end
local function rootOf(m) return m and (m:FindFirstChild("HumanoidRootPart") or m:FindFirstChild("RootPart")) end
local function isKillerRole()
    local c = myChar()
    if not c then return false end
    local n = c
    for _ = 1, 4 do
        n = n and n.Parent
        if not n then break end
        if n == killersFolder() or n.Name == "Killers" then return true end
    end
    return false
end
local function parseColor(h, dr, dg, db)
    local r, g, b = tostring(h or ""):match("^#(%x%x)(%x%x)(%x%x)$")
    if not r then return Color3.fromRGB(dr, dg, db) end
    return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end


local remote = nil
local function getRemote()
    if NET.Remote and NET.Remote.Parent then return NET.Remote end
    if remote and remote.Parent then return remote end
    local ok, r = pcall(function()
        local mods = RS:FindFirstChild("Modules")
        local net = mods and mods:FindFirstChild("Network")
        local net2 = net and net:FindFirstChild("Network")
        return net2 and net2:FindFirstChild("RemoteEvent")
    end)
    if ok and r then remote = r return r end
    local ok2, r2 = pcall(function() return RS:FindFirstChild("RemoteEvent", true) end)
    if ok2 and r2 then remote = r2 end
    return remote
end
local function abilityContainer()
    local main = playerGui:FindFirstChild("MainUI")
    return main and main:FindFirstChild("AbilityContainer", true)
end
local function fireSignalButton(name)
    local c = abilityContainer()
    local btn = c and c:FindFirstChild(name)
    if btn and firesignal then
        local ok = pcall(function() firesignal(btn.MouseButton1Down) end)
        pcall(function() firesignal(btn.MouseButton1Click) end)
        return ok
    end
    return false
end
local function fireAbilityBinary(kind)
    if netFireAbility(kind) then return true end
    local r = getRemote()
    if r then
        local payload = "\3\5\0\0\0" .. kind
        local ok = pcall(function() r:FireServer("UseActorAbility", { buffer.fromstring(payload) }) end)
        if ok then return true end
        pcall(function() r:FireServer("UseActorAbility", buffer.fromstring(payload)) end)
        return true
    end
    return fireSignalButton(kind)
end
local function fireBlock() return fireAbilityBinary(S.charMode == "007n7" and "Clone" or "Block") end


local function inCone(k)
    local mr = myRoot()
    local kr = rootOf(k)
    if not (mr and kr) then return false end
    local d = mr.Position - kr.Position
    local mag = d.Magnitude
    if mag <= 0.05 or mag > math.clamp(S.range, 3, 40) then return false end
    if not S.facing then return true end
    local a = Vector3.new(kr.CFrame.LookVector.X, 0, kr.CFrame.LookVector.Z)
    local b = Vector3.new(d.X, 0, d.Z)
    if a.Magnitude < 0.01 or b.Magnitude < 0.01 then return false end
    return a.Unit:Dot(b.Unit) >= math.clamp(S.dot, -1, 1)
end


local abStates, abPending = {}, {}
local abCones, abFolder = {}, nil
local function abEdge(parent)
    local p = Instance.new("Part")
    p.Anchored, p.CanCollide, p.CanTouch, p.CanQuery, p.CastShadow = true, false, false, false, false
    p.Material, p.Transparency, p.Size = Enum.Material.Neon, 0.32, Vector3.new(0.16, 0.06, 1)
    p.Parent = parent
    return p
end
local function abSetEdge(p, a, b)
    local d = b - a
    if d.Magnitude < 0.05 then p.Transparency = 1 return end
    p.Transparency, p.Size = 0.32, Vector3.new(0.16, 0.06, d.Magnitude)
    p.CFrame = CFrame.lookAt((a + b) / 2, b)
end
local function abClearCone(k)
    local z = abCones[k]
    if z then pcall(function() z:Destroy() end); abCones[k] = nil end
end
local function abUpdateCone(k)
    if not S.showCone or S.mode ~= "Anti Bait" then abClearCone(k) return end
    local kr = rootOf(k)
    if not kr then abClearCone(k) return end
    if not abFolder or not abFolder.Parent then
        abFolder = Instance.new("Folder")
        abFolder.Name = "TURNsakenV4_AntiBaitCones"
        abFolder.Parent = WS
    end
    local z = abCones[k]
    if not z then
        z = Instance.new("Model")
        z.Name = "AntiBaitCone"
        z.Parent = abFolder
        z.edges = { abEdge(z), abEdge(z), abEdge(z), abEdge(z), abEdge(z), abEdge(z) }
        abCones[k] = z
    end
    local o = kr.Position - Vector3.new(0, 2.5, 0)
    local f = Vector3.new(kr.CFrame.LookVector.X, 0, kr.CFrame.LookVector.Z)
    if f.Magnitude < 0.01 then return end
    f = f.Unit
    local r = Vector3.new(-f.Z, 0, f.X)
    local half = S.facing and math.acos(math.clamp(S.dot, -1, 1)) or math.pi
    half = math.clamp(half, math.rad(25), math.rad(90))
    local tip = o + f * 0.8
    local range = math.clamp(S.range, 3, 40)
    local l = tip + (f * math.cos(half) - r * math.sin(half)).Unit * range
    local rr = tip + (f * math.cos(half) + r * math.sin(half)).Unit * range
    abSetEdge(z.edges[1], tip, l)
    abSetEdge(z.edges[2], tip, rr)
    local pts = { l }
    for i = 1, 3 do
        local a = -half + (2 * half) * (i / 4)
        pts[#pts + 1] = tip + (f * math.cos(a) + r * math.sin(a)).Unit * range
    end
    pts[#pts + 1] = rr
    for i = 1, #pts - 1 do abSetEdge(z.edges[i + 2], pts[i], pts[i + 1]) end
    local col = inCone(k) and Color3.fromRGB(60, 255, 110) or Color3.fromRGB(255, 55, 55)
    for _, p in ipairs(z.edges) do p.Color = col end
end
local function abProcess(k)
    if not S.on or S.mode ~= "Anti Bait" or not k or not k.Parent then return end
    local now = os.clock()
    local pend = abPending[k]
    if pend and now <= pend then
        if inCone(k) then fireBlock(); abPending[k] = nil end
    elseif pend then
        abPending[k] = nil
    end
    local a = tonumber(k:GetAttribute("AbilityLastUsed")) or 0
    local b = tonumber(k:GetAttribute("AbilitiesUsed")) or 0
    local st = abStates[k]
    if not st then
        abStates[k] = { a = a, b = b, bait = false, lock = 0 }
        return
    end
    if b > st.b then st.bait = true end
    if a > st.a then
        if st.bait then
            st.bait = false
        elseif now >= st.lock then
            st.lock = now + 0.1
            if inCone(k) then fireBlock() else abPending[k] = now + math.max(0.05, S.window) end
        end
    end
    st.a, st.b = a, b
end


local PLAYER_R, ZONE_OFF, DIA_H, CIR_H = 1.5, 0.15, 3, 1
local zoneFolder, zoneModels, zoneConn = nil, {}, nil
local function zoneBaseY(kr, fo) return kr.Position.Y + (fo or -3) + ZONE_OFF end
local function flatLookCF(kr, y)
    local lv = kr.CFrame.LookVector
    local f = Vector3.new(lv.X, 0, lv.Z)
    f = f.Magnitude < 0.01 and Vector3.new(0, 0, -1) or f.Unit
    local p = Vector3.new(kr.Position.X, y, kr.Position.Z)
    return CFrame.lookAt(p, p + f)
end
local function footOffset(k, kr)
    local names = { "LeftFoot", "RightFoot", "Left Leg", "Right Leg", "LeftLowerLeg", "RightLowerLeg" }
    local low = nil
    for _, n in ipairs(names) do
        local p = k:FindFirstChild(n)
        if p and p:IsA("BasePart") then
            local b = p.Position.Y - p.Size.Y / 2
            if not low or b < low then low = b end
        end
    end
    return low and (low - kr.Position.Y) or -3
end
local function isInDiamond(myPos, kCF, kPos)
    local fwd, rgt = kCF.LookVector, kCF.RightVector
    local ff = Vector3.new(fwd.X, 0, fwd.Z)
    local rr = Vector3.new(rgt.X, 0, rgt.Z)
    if ff.Magnitude < 0.01 or rr.Magnitude < 0.01 then return false end
    ff, rr = ff.Unit, rr.Unit
    local tp = Vector3.new(myPos.X - kPos.X, 0, myPos.Z - kPos.Z)
    local dF, dR = tp:Dot(ff), tp:Dot(rr)
    local cd = S.zoneOff + S.zoneLen / 2
    local hw = S.zoneWid / 2 + PLAYER_R
    local hl = S.zoneLen / 2 + PLAYER_R
    if math.abs(myPos.Y - kPos.Y) > 10 + PLAYER_R then return false end
    return math.abs(dR) / hw + math.abs(dF - cd) / hl <= 1
end
local function isInCircle(myPos, kPos)
    local dx, dz = myPos.X - kPos.X, myPos.Z - kPos.Z
    local r = S.zoneR + PLAYER_R
    if math.abs(myPos.Y - kPos.Y) > 10 + PLAYER_R then return false end
    return dx * dx + dz * dz <= r * r
end
local function isInZone(k)
    local kr = rootOf(k)
    local mr = myRoot()
    if not (kr and mr) then return false end
    return isInDiamond(mr.Position, kr.CFrame, kr.Position) or isInCircle(mr.Position, kr.Position)
end
local function buildZone(k)
    local m = Instance.new("Model")
    m.Name = "ABZone"
    m.Parent = zoneFolder
    local kr = rootOf(k)
    local fo = kr and footOffset(k, kr) or -3
    local edges = {}
    for i = 1, 4 do
        local p = Instance.new("Part")
        p.Name = "Edge" .. i
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Material, p.Transparency, p.Size = Enum.Material.Neon, 0.6, Vector3.new(0.35, 0.08, 1)
        p.CFrame = CFrame.new(0, -5000, 0)
        p.Parent = m
        edges[i] = p
    end
    local c = Instance.new("Part")
    c.Shape, c.Name = Enum.PartType.Cylinder, "CircleZone"
    c.Anchored, c.CanCollide, c.CanQuery, c.CanTouch, c.CastShadow = true, false, false, false, false
    c.Material, c.Transparency, c.Size = Enum.Material.Neon, 0.7, Vector3.new(CIR_H, 10, 10)
    c.CFrame = CFrame.new(0, -5000, 0)
    c.Parent = m
    return { model = m, edges = edges, circle = c, killer = k, footOffsetY = fo }
end
local function updateZone(z, kr, mr)
    if not z or not z.model or not z.model.Parent or not kr then return end
    if isKillerRole() then
        for _, e in ipairs(z.edges) do if e.Parent then e.Transparency = 1 end end
        if z.circle.Parent then z.circle.Transparency = 1 end
        return
    end
    local bY = zoneBaseY(kr, z.footOffsetY)
    local dCF = flatLookCF(kr, bY + DIA_H)
    local cCF = flatLookCF(kr, bY + CIR_H)
    local off, L, W = S.zoneOff, S.zoneLen, S.zoneWid
    local wA = dCF:PointToWorldSpace(Vector3.new(0, 0, -off))
    local wB = dCF:PointToWorldSpace(Vector3.new(0, 0, -(off + L)))
    local wC = dCF:PointToWorldSpace(Vector3.new(-W / 2, 0, -(off + L / 2)))
    local wD = dCF:PointToWorldSpace(Vector3.new(W / 2, 0, -(off + L / 2)))
    local specs = { { wA, wC }, { wA, wD }, { wB, wC }, { wB, wD } }
    for i, sp in ipairs(specs) do
        local p1, p2 = sp[1], sp[2]
        local diff = p2 - p1
        local len = diff.Magnitude
        local e = z.edges[i]
        if e and len > 0.01 then
            e.Size = Vector3.new(0.35, 0.08, len)
            e.CFrame = CFrame.lookAt((p1 + p2) / 2, (p1 + p2) / 2 + diff.Unit)
            e.Transparency = S.showZone and 0.6 or 1
        end
    end
    if z.circle then
        local cc = cCF.Position
        z.circle.Size = Vector3.new(CIR_H, S.zoneR * 2, S.zoneR * 2)
        z.circle.CFrame = CFrame.new(cc) * CFrame.Angles(0, 0, math.rad(90))
        z.circle.Transparency = S.showCircle and 0.7 or 1
    end
    local inD = mr and isInDiamond(mr.Position, kr.CFrame, kr.Position) or false
    local inC = mr and isInCircle(mr.Position, kr.Position) or false
    local bad, good = Color3.fromRGB(255, 60, 60), Color3.fromRGB(80, 255, 80)
    for _, e in ipairs(z.edges) do e.Color = inD and good or bad end
    if z.circle then z.circle.Color = inC and good or bad end
end
local zoneAcc = 0
local function zoneStep(dt)
    if not (S.showZone or S.showCircle or (S.on and S.mode == "Zone")) then
        if zoneFolder then
            for _, z in pairs(zoneModels) do pcall(function() z.model:Destroy() end) end
            table.clear(zoneModels)
            pcall(function() zoneFolder:Destroy() end)
            zoneFolder = nil
        end
        return
    end
    if not zoneFolder or not zoneFolder.Parent then
        zoneFolder = Instance.new("Folder")
        zoneFolder.Name = "TURNsakenV4_ABZones"
        zoneFolder.Parent = WS
    end
    zoneAcc = zoneAcc + (tonumber(dt) or 0)
    if zoneAcc < 0.05 then return end
    zoneAcc = 0
    local kf = killersFolder()
    if not kf then return end
    local mr = myRoot()
    local seen = {}
    for _, k in ipairs(kf:GetChildren()) do
        if k:IsA("Model") then
            local kr = rootOf(k)
            if kr then
                seen[k] = true
                local z = zoneModels[k]
                if not z or not z.model.Parent then
                    z = buildZone(k)
                    zoneModels[k] = z
                end
                updateZone(z, kr, mr)
            end
        end
    end
    for k, z in pairs(zoneModels) do
        if not seen[k] then
            pcall(function() z.model:Destroy() end)
            zoneModels[k] = nil
        end
    end
end


local HB_CFG = {
    ["CoolKid"] = { dura = 0.05, life = 0.05, width = 5, length = 7, height = 6 },
    ["Slasher"] = { dura = 0.35, life = 0.35 },
    ["1x1x1x1"] = { dura = 0.45, life = 0.45 },
    ["JohnDoe"] = { dura = 0.45, life = 0.45 },
    ["Nosferatu"] = { dura = 0.42, life = 0.42 },
    ["Sixer"] = { dura = 0.42, life = 0.42, distance = 6.0 },
    ["Noli"] = { dura = 0.37, life = 0.37 },
    ["Azure"] = { dura = 0.35, life = 0.35 },
}
local HB_DEFAULT = { dura = 0.26, life = 0.26 }
local hbStates, hbBusy = {}, setmetatable({}, { __mode = "k" })
local function hbCfgFor(name)
    local n = tostring(name or "")
    for key, v in pairs(HB_CFG) do
        if string.find(n, key, 1, true) then return v end
    end
    return HB_DEFAULT
end
local function makeVisual(root, size, cfr, name, life)
    local p = Instance.new("Part")
    p.Name = name
    p.Anchored, p.CanCollide, p.CanTouch, p.CanQuery, p.CastShadow = true, false, false, false, false
    p.Size = size
    p.CFrame = cfr
    p.Color = parseColor(S.hbColor, 255, 255, 255)
    p.Material = Enum.Material.ForceField
    p.Transparency = S.hbShow and S.hbTrans or 1
    p.Parent = WS
    if S.hbOutline and S.hbShow then
        local sb = Instance.new("SelectionBox")
        sb.Adornee = p
        sb.Color3 = parseColor(S.hbColor, 255, 255, 255)
        sb.LineThickness = 0.04
        sb.Transparency = S.hbOutlineTrans
        sb.Visible = true
        sb.Parent = p
    end
    Debris:AddItem(p, life or 0.5)
    return p
end
local function hbDetect(killer)
    if hbBusy[killer] or not S.on or S.mode ~= "Hitbox" then return end
    local kr = rootOf(killer)
    if not kr then return end
    hbBusy[killer] = true
    task.spawn(function()
        local cfg = hbCfgFor(killer.Name)
        local w = cfg.width or S.hbWidth
        local l = cfg.length or S.hbLength
        local h = cfg.height or S.hbHeight
        local size = Vector3.new(w * S.hbMul, h * S.hbMul, l * S.hbMul)
        local op = OverlapParams.new()
        op.FilterType = Enum.RaycastFilterType.Exclude
        op.FilterDescendantsInstances = { killer }
        local baseColor = parseColor(S.hbColor, 255, 255, 255)
        local green = Color3.fromRGB(0, 255, 0)
        local box = nil
        local function ensureBox(cfr)
            if box and box.Parent then
                box.Size = size
                box.CFrame = cfr
                return box
            end
            local p = Instance.new("Part")
            p.Name = "AutoBlockHitbox_Frame"
            p.Anchored = true
            p.CanCollide = false
            p.CanTouch = false
            p.CanQuery = false
            p.CastShadow = false
            p.Material = Enum.Material.ForceField
            p.Size = size
            p.CFrame = cfr
            p.Color = baseColor
            p.Transparency = S.hbShow and S.hbTrans or 1
            p.Parent = WS
            if S.hbOutline and S.hbShow then
                local sb = Instance.new("SelectionBox")
                sb.Adornee = p
                sb.Color3 = baseColor
                sb.LineThickness = 0.04
                sb.Transparency = S.hbOutlineTrans
                sb.Visible = true
                sb.Parent = p
            end
            box = p
            return p
        end
        local started = os.clock()
        local hit = false
        while alive() and S.on and S.mode == "Hitbox" and killer.Parent
            and os.clock() - started < math.max(0.05, cfg.dura) do
            local ckr = rootOf(killer)
            if not ckr then break end
            local dist = cfg.distance or S.hbDist
            local cfr = ckr.CFrame * CFrame.new(0, 0, -dist)
            local part = ensureBox(cfr)
            local ok, parts = pcall(function() return WS:GetPartsInPart(part, op) end)
            if ok and type(parts) == "table" then
                for _, pt in ipairs(parts) do
                    local model = pt:FindFirstAncestorOfClass("Model")
                    local hum = model and model:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 and (model == LP.Character or Players:GetPlayerFromCharacter(model) == LP) then
                        hit = true
                        break
                    end
                end
            end
            if hit then
                part.Color = green
                local sb = part:FindFirstChildOfClass("SelectionBox")
                if sb then sb.Color3 = green end
                if S.hbShow then part.Transparency = math.clamp(S.hbTrans - 0.2, 0, 1) end
                fireBlock()
                task.delay(0.02, fireBlock)
                task.delay(0.04, fireBlock)
                break
            end
            RunService.Heartbeat:Wait()
        end
        if box and box.Parent then
            if hit then
                local keep = box
                task.delay(0.4, function()
                    if keep and keep.Parent then pcall(function() keep:Destroy() end) end
                end)
            else
                Debris:AddItem(box, math.max(0.05, cfg.life))
            end
        end
        hbBusy[killer] = nil
    end)
end
local function hbStep()
    if not (S.on and S.mode == "Hitbox") then return end
    if isKillerRole() then return end
    local kf = killersFolder()
    if not kf then return end
    for _, k in ipairs(kf:GetChildren()) do
        if k:IsA("Model") then
            local a = tonumber(k:GetAttribute("AbilityLastUsed")) or 0
            local b = tonumber(k:GetAttribute("AbilitiesUsed")) or 0
            local st = hbStates[k]
            if not st then
                hbStates[k] = { a = a, b = b, locked = false }
            else
                if b > st.b then st.locked = true end
                if a > st.a then
                    if st.locked then st.locked = false else hbDetect(k) end
                end
                st.a, st.b = a, b
            end
        end
    end
end


local setEnabled
local floatGui, floatBox, floatBtn, floatText
local function floatPaint()
    if not floatBtn then return end
    local on = S.on
    floatBtn.BackgroundColor3 = on and Color3.fromRGB(144, 238, 144) or Color3.fromRGB(205, 205, 205)
    if floatText then
        floatText.Text = on and "AUTO BLOCK\nON" or "AUTO BLOCK\nOFF"
        floatText.TextColor3 = Color3.fromRGB(20, 20, 20)
    end
end
local function stopFloat()
    if floatGui then pcall(function() floatGui:Destroy() end) end
    floatGui, floatBox, floatBtn, floatText = nil, nil, nil, nil
end
local function startFloat()
    stopFloat()
    local sg = Instance.new("ScreenGui")
    sg.Name = "TURNsakenV4_AutoBlockButton"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 999999
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.Parent = playerGui
    floatGui = sg
    local box = Instance.new("Frame")
    box.Name = "Box"
    box.Size = UDim2.fromOffset(132, 62)
    box.Position = UDim2.new(0.5, -66, 0.62, 0)
    box.BackgroundTransparency = 1
    box.Parent = sg
    floatBox = box
    local btn = Instance.new("TextButton")
    btn.Name = "Toggle"
    btn.Size = UDim2.fromOffset(96, 62)
    btn.BackgroundColor3 = Color3.fromRGB(205, 205, 205)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Text = ""
    btn.Parent = box
    local c1 = Instance.new("UICorner")
    c1.CornerRadius = UDim.new(0, 10)
    c1.Parent = btn
    local st = Instance.new("UIStroke")
    st.Color = Color3.fromRGB(30, 30, 30)
    st.Thickness = 1.5
    st.Transparency = 0.4
    st.Parent = btn
    local txt = Instance.new("TextLabel")
    txt.Name = "Status"
    txt.Size = UDim2.fromScale(1, 1)
    txt.BackgroundTransparency = 1
    txt.Text = "AUTO BLOCK\nOFF"
    txt.TextColor3 = Color3.fromRGB(20, 20, 20)
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 13
    txt.TextWrapped = true
    txt.Parent = btn
    floatBtn, floatText = btn, txt
    local drag = Instance.new("TextButton")
    drag.Name = "Drag"
    drag.Size = UDim2.fromOffset(30, 30)
    drag.Position = UDim2.fromOffset(102, 16)
    drag.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
    drag.Text = "↕"
    drag.TextSize = 16
    drag.TextColor3 = Color3.fromRGB(30, 30, 30)
    drag.AutoButtonColor = false
    drag.Parent = box
    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(0, 8)
    c2.Parent = drag
    floatPaint()

    local dragging, dragStart, boxStart = false, nil, nil
    M.Bind(drag.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging, dragStart, boxStart = true, i.Position, box.Position
        end
    end))
    M.Bind(UIS.InputChanged:Connect(function(i)
        if not dragging then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local d = i.Position - dragStart
            box.Position = UDim2.new(boxStart.X.Scale, boxStart.X.Offset + d.X, boxStart.Y.Scale, boxStart.Y.Offset + d.Y)
        end
    end))
    M.Bind(UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end))
    local lastTap = 0
    M.Bind(btn.Activated:Connect(function()
        local now = os.clock()
        if now - lastTap < 0.2 then return end
        lastTap = now
        setEnabled(not S.on)
        floatPaint()
    end))
end


function setEnabled(v)
    S.on = v == true
    M.Set("ab_on", S.on)
    if not S.on then
        table.clear(abStates)
        table.clear(abPending)
        for k in pairs(abCones) do abClearCone(k) end
        table.clear(hbStates)
    end
    note(S.on and ("AUTO BLOCK ON · " .. tostring(S.mode)) or "AUTO BLOCK OFF")
end

sec:Toggle("ab_on", "Auto Block (Hitbox)", S.on, function(v) setEnabled(v); floatPaint() end)
sec:Segmented("ab_char", "Character Ability", { "Guest 1337", "007n7" }, S.charMode, function(v)
    S.charMode = v
    M.Set("ab_char", v)
end)
sec:Keybind("ab_key", "Toggle Hotkey", tostring(M.Get("ab_key") or "None"), function(k) M.Set("ab_key", k) end)

secHB:Slider("ab_hb_dist", "Hitbox Distance", 0, 12, S.hbDist, "", function(v) S.hbDist = tonumber(v) or 3; M.Set("ab_hb_dist", S.hbDist) end)
secHB:Slider("ab_hb_width", "Hitbox Width", 1, 16, S.hbWidth, "", function(v) S.hbWidth = math.clamp(tonumber(v) or 6, 1, 16); M.Set("ab_hb_width", S.hbWidth) end)
secHB:Slider("ab_hb_length", "Hitbox Length", 1, 20, S.hbLength, "", function(v) S.hbLength = math.clamp(tonumber(v) or 9, 1, 20); M.Set("ab_hb_length", S.hbLength) end)
secHB:Slider("ab_hb_height", "Hitbox Height", 1, 16, S.hbHeight, "", function(v) S.hbHeight = math.clamp(tonumber(v) or 6, 1, 16); M.Set("ab_hb_height", S.hbHeight) end)
secHB:Slider("ab_hb_mul", "Hitbox Multiplier", 0.2, 3, S.hbMul, "x", function(v) S.hbMul = math.max(0.1, tonumber(v) or 1); M.Set("ab_hb_mul", S.hbMul) end)
secHB:Toggle("ab_hb_show", "Show Hitbox", S.hbShow, function(v) S.hbShow = v == true; M.Set("ab_hb_show", S.hbShow) end)
secHB:Toggle("ab_hb_outline", "Show Outline", S.hbOutline, function(v) S.hbOutline = v == true; M.Set("ab_hb_outline", S.hbOutline) end)
secHB:Slider("ab_hb_trans", "Hitbox Transparency", 0, 1, S.hbTrans, "", function(v) S.hbTrans = math.clamp(tonumber(v) or 0.8, 0, 1); M.Set("ab_hb_trans", S.hbTrans) end)
secHB:Slider("ab_hb_ot", "Outline Transparency", 0, 1, S.hbOutlineTrans, "", function(v) S.hbOutlineTrans = math.clamp(tonumber(v) or 0.6, 0, 1); M.Set("ab_hb_ot", S.hbOutlineTrans) end)
secHB:Color("ab_hb_color", "Hitbox Color", S.hbColor, function(c)
    S.hbColor = string.format("#%02X%02X%02X", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
    M.Set("ab_hb_color", S.hbColor)
end)
secHB:Button("3D Preview", function()
    if SAKEN_ABPreview then SAKEN_ABPreview("hitbox") end
end)

secBtn:Toggle("ab_floating", "Show Floating Button", S.floating, function(v)
    S.floating = v == true
    M.Set("ab_floating", S.floating)
    if S.floating then startFloat() else stopFloat() end
end)


M.Bind(UIS.InputBegan:Connect(function(input, processed)
    if processed or not input.KeyCode then return end
    local key = tostring(M.Get("ab_key") or "None")
    if key ~= "None" and input.KeyCode.Name == key then
        setEnabled(not S.on)
        floatPaint()
    end
end))
local hbAcc = 0
M.OnHeartbeat(function(dt)
    if not alive() then return end
    if S.mode == "Anti Bait" then
        local kf = killersFolder()
        if kf then
            local seen = {}
            for _, k in ipairs(kf:GetChildren()) do
                if k:IsA("Model") then
                    seen[k] = true
                    abProcess(k)
                    abUpdateCone(k)
                end
            end
            for k in pairs(abStates) do
                if not seen[k] then
                    abStates[k], abPending[k] = nil, nil
                    abClearCone(k)
                end
            end
        end
    else
        for k in pairs(abCones) do abClearCone(k) end
    end
    zoneStep(dt)
    if S.mode == "Hitbox" then
        hbAcc = hbAcc + (tonumber(dt) or 0)
        if hbAcc >= 0.05 then
            hbAcc = 0
            hbStep()
        end
    end
end)
M.Bind(LP.CharacterAdded:Connect(function()
    table.clear(abStates)
    table.clear(abPending)
    table.clear(hbStates)
    task.delay(0.5, function()
        local kf = killersFolder()
        if not kf then return end
        for _, k in ipairs(kf:GetChildren()) do
            if k:IsA("Model") then pcall(abUpdateCone, k) end
        end
    end)
end))

task.defer(function()
    for _ = 1, 6 do
        local kf = killersFolder()
        if kf then
            for _, k in ipairs(kf:GetChildren()) do
                if k:IsA("Model") then pcall(abUpdateCone, k) end
            end
            break
        end
        task.wait(0.5)
    end
end)
M.OnUnload(function()
    stopFloat()
    for k in pairs(abCones) do abClearCone(k) end
    if abFolder then pcall(function() abFolder:Destroy() end); abFolder = nil end
    for _, z in pairs(zoneModels) do pcall(function() z.model:Destroy() end) end
    table.clear(zoneModels)
    if zoneFolder then pcall(function() zoneFolder:Destroy() end); zoneFolder = nil end
end)
task.defer(function()
    if S.floating then startFloat() end
end)
end)


addModule(function(M)
local page = M.Page("surv")
















local Svc = M.Svc
local RunService = Svc.RunService
local RS = Svc.ReplicatedStorage
local WS = Svc.Workspace
local Players = Svc.Players
local Debris = Svc.Debris
local LP = M.Local

local VIM = nil
pcall(function() VIM = game:GetService("VirtualInputManager") end)



local function alive()
	return M.IsAlive()
end

local function getChar()
	if not alive() or not LP then return nil end
	local ch = LP.Character
	if ch and ch.Parent then return ch end
	return nil
end

local function getHum(ch)
	ch = ch or getChar()
	if not ch then return nil end
	local hum = ch:FindFirstChildOfClass("Humanoid")
	return hum
end

local function getHrp(ch)
	ch = ch or getChar()
	if not ch then return nil end
	return ch:FindFirstChild("HumanoidRootPart")
end


local function charBaseName(ch)
	if not (ch and ch.Parent) then return "" end
	local raw = nil
	pcall(function() raw = ch:GetAttribute("CharacterName") end)
	if raw == nil then raw = ch.Name end
	return tostring(raw):gsub("^[!#]", "")
end

local function isChar(name, ch)
	ch = ch or getChar()
	if not (ch and ch.Parent and ch.Parent.Name == "Survivors") then return false end
	return charBaseName(ch) == name
end

local function isGuest(ch) return isChar("Guest1337", ch) end
local function isJane(ch) return isChar("JaneDoe", ch) end
local function isVee(ch) return isChar("Veeronica", ch) end

local function getPlayersFolder(sub)
	local pf = WS:FindFirstChild("Players")
	return pf and pf:FindFirstChild(sub) or nil
end

local function nearestKillerModel(fromPos, maxDist)
	if not fromPos then return nil end
	local kf = getPlayersFolder("Killers")
	if not kf then return nil end
	local best, bestD = nil, maxDist or math.huge
	for _, k in ipairs(kf:GetChildren()) do
		if k:IsA("Model") then
			local hrp = k:FindFirstChild("HumanoidRootPart")
			local hum = k:FindFirstChildOfClass("Humanoid")
			if hrp and (not hum or hum.Health > 0) then
				local d = (hrp.Position - fromPos).Magnitude
				if d < bestD then
					bestD = d
					best = k
				end
			end
		end
	end
	return best
end

local function childPath(root, ...)
	local cur = root
	local names = { ... }
	for i = 1, #names do
		if not cur then return nil end
		cur = cur:FindFirstChild(names[i])
	end
	return cur
end

local function requireModule(inst)
	if not (inst and inst:IsA("ModuleScript")) then return nil end
	local ok, mod = pcall(require, inst)
	if ok and type(mod) == "table" then return mod end
	return nil
end



local function cfgNum(key, def)
	local n = tonumber(M.Get(key))
	if n == nil then return def end
	return n
end

local function cfgBool(key, def)
	local v = M.Get(key)
	if v == nil then return def end
	return v == true
end


local state = {
	autoPunch = cfgBool("sv_auto_punch", false),
	punchDelay = cfgNum("sv_punch_delay", 0.3),
	aimPunch = cfgBool("sv_aim_punch", false),
	prediction = cfgNum("sv_punch_pred", 2.3),
	steerDur = cfgNum("sv_steer_dur", 0.5),
	autoCharge = cfgBool("sv_auto_charge", false),
	chargeAim = cfgBool("sv_charge_aim", false),
	chargeRange = cfgNum("sv_charge_range", 20),
	hdt = cfgBool("sv_hdt", false),
	hdtSpeed = cfgNum("sv_hdt_speed", 12),
	noHdtCd = cfgBool("sv_no_hdt_cd", false),
	jdInstant = cfgBool("sv_jd_instant", false),
	jdCrystalAim = cfgBool("sv_jd_crystal_aim", false),
	jdHatchet = cfgBool("sv_jd_hatchet", false),
	veeTrick = cfgBool("sv_vee_trick", false),
	veeStam = cfgBool("sv_vee_stam", false),
	veeCtrl = cfgBool("sv_vee_ctrl", false),
	veeTurn = cfgNum("sv_vee_turn", 5),
	veeRebound = cfgBool("sv_vee_rebound", false),
	veePhase = cfgBool("sv_vee_phase", false),
	dusSilent = cfgBool("sv_dus_silent", false),
	dusMode = tostring(M.Get("sv_dus_mode") or "Killer"),
	dusPredict = cfgNum("sv_dus_predict", 0.5),
	dusButton = cfgBool("sv_dus_button", false),
}

local function anyGuestOn()
	return state.autoPunch or state.aimPunch or state.autoCharge or state.chargeAim or state.hdt
end

local function anyJaneOn()
	return state.jdInstant or state.jdCrystalAim or state.jdHatchet
end

local function anyVeeOn()
	return state.veeTrick or state.veeStam or state.veeCtrl or state.veeRebound or state.veePhase
end

local function anyFeatureOn()
	return anyGuestOn() or anyJaneOn() or anyVeeOn()
end




local rotLocks = {}
local rotLockedByUs = false

local function rotLock(tag)
	rotLocks[tag or "default"] = true
	rotLockedByUs = true
	local hum = getHum()
	if hum and hum.Parent then
		pcall(function() hum.AutoRotate = false end)
	end
end

local function rotUnlock(tag)
	if tag then
		rotLocks[tag] = nil
	else
		table.clear(rotLocks)
	end
	if next(rotLocks) ~= nil then return end
	if not rotLockedByUs then return end
	rotLockedByUs = false
	local hum = getHum()
	if hum and hum.Parent then
		pcall(function() hum.AutoRotate = true end)
	end
end




local PUNCH_PAYLOAD = "\3\5\0\0\0Punch"
local CHARGE_PAYLOAD = "\3\6\0\0\0Charge"

local function fireAbility(payload)
	if not alive() then return false end
	local remote = nil
	pcall(function() remote = M.Remote() end)
	if not remote then return false end
	local ok = pcall(function()
		remote:FireServer("UseActorAbility", { [1] = buffer.fromstring(payload) })
	end)
	return ok
end



local PUNCH_IDS = {
	["87259391926321"] = true,
	["140703210927645"] = true,
	["136007065400978"] = true,
	["129843313690921"] = true,
	["86709774283672"] = true,
	["108807732150251"] = true,
	["138040001965654"] = true,
	["86096387000557"] = true,
	["81905101227053"] = true,
	["127777649118195"] = true,
	["99100240941590"] = true,
	["92831180929659"] = true,
	["112081768119093"] = true,
	["117587689359268"] = true,
	["91830732867282"] = true,
	["91730605416216"] = true,
	["100184164753080"] = true,
	["108911997126897"] = true,
	["138936949998619"] = true,
	["116427323741607"] = true,
	["72007882634344"] = true,
	["91522546229765"] = true,
	["111270184603402"] = true,
	["82137285150006"] = true,
	["119850211147676"] = true,
}


local BLOCK_IDS = {
	["98105697395689"] = true, ["100926346851492"] = true, ["140671644163156"] = true,
	["72182155407310"] = true, ["72722244508749"] = true, ["95802026624883"] = true,
	["88557287105521"] = true, ["123548100869928"] = true, ["82605295530067"] = true,
	["120748030255574"] = true, ["88287038085804"] = true, ["96959123077498"] = true,
	["115706752305794"] = true, ["82036084568393"] = true, ["127040663332045"] = true,
	["138407964761603"] = true, ["102517104852347"] = true, ["133292581373127"] = true,
	["113899931890882"] = true, ["90970641235403"] = true,
}


local guestChargeAnims = {}
local guestHarvested = false

local function extractAnimIds(val, outLookup, depth)
	if (depth or 0) > 4 or val == nil then return end
	local t = type(val)
	if t == "string" or t == "number" then
		local num = tostring(val):match("%d+")
		if num then outLookup[num] = true end
	elseif typeof(val) == "Instance" then
		if val:IsA("Animation") then
			local num = tostring(val.AnimationId):match("%d+")
			if num then outLookup[num] = true end
		end
	elseif t == "table" then
		for _, sub in pairs(val) do
			extractAnimIds(sub, outLookup, (depth or 0) + 1)
		end
	end
end

local function harvestGuestAnims(force)
	if guestHarvested and not force then return end
	pcall(function()
		local assets = RS:FindFirstChild("Assets")
		if not assets then return end
		local function harvest(cfgMod)
			if not (cfgMod and cfgMod:IsA("ModuleScript")) then return end
			local ok, mod = pcall(require, cfgMod)
			if not (ok and type(mod) == "table" and type(mod.Animations) == "table") then return end
			for k, v in pairs(mod.Animations) do
				local ks = tostring(k)
				local kl = ks:lower()
				if ks == "Block" or kl:find("block", 1, true) then
					extractAnimIds(v, BLOCK_IDS, 0)
				elseif ks:find("Punch") or ks:find("Parry") or kl:find("punch", 1, true) or kl:find("parry", 1, true) then
					extractAnimIds(v, PUNCH_IDS, 0)
				elseif ks:find("Charge") or ks:find("Dash") or kl:find("charge", 1, true) or kl:find("dash", 1, true) then
					extractAnimIds(v, guestChargeAnims, 0)
				end
			end
		end
		local surv = assets:FindFirstChild("Survivors")
		local guest = surv and surv:FindFirstChild("Guest1337")
		if guest and guest:FindFirstChild("Config") then harvest(guest.Config) end
		local skins = assets:FindFirstChild("Skins")
		local sSurv = skins and skins:FindFirstChild("Survivors")
		local gSkins = sSurv and sSurv:FindFirstChild("Guest1337")
		if gSkins then
			for _, c in ipairs(gSkins:GetChildren()) do
				if c:FindFirstChild("Config") then harvest(c.Config) end
			end
		end
		guestHarvested = true
	end)
end






local punchUi = { btn = nil, name = nil, cd = nil, icon = nil }
local punchConns = {}
local punchLastAt = 0
local punchWatcher = nil
local watcherStartT = 0

local function addPunchConn(c)
	if not c then return end
	punchConns[#punchConns + 1] = c
	pcall(M.Bind, c)
end

local function clearPunchConns()
	for i = #punchConns, 1, -1 do
		local c = punchConns[i]
		punchConns[i] = nil
		pcall(function() c:Disconnect() end)
	end
end

local function isYellowColor(col)
	if typeof(col) ~= "Color3" then return false end
	return col.R >= 0.75 and col.G >= 0.55 and col.B <= 0.45 and (col.R - col.B) >= 0.35
end


local function isParryState()
	local btn, nameLbl, cd = punchUi.btn, punchUi.name, punchUi.cd
	if not (btn and btn.Parent and nameLbl and cd) then return false end
	local cdTxt = cd.Text
	if cdTxt ~= "" and cdTxt ~= "0" and cdTxt ~= "0.0" then return false end
	local parryAttr = false
	pcall(function()
		parryAttr = (btn:GetAttribute("Parry") == true) or (nameLbl:GetAttribute("Parry") == true)
	end)
	if parryAttr then return true end
	local yellow = false
	pcall(function()
		if btn:IsA("GuiObject") and isYellowColor(btn.BackgroundColor3) then yellow = true end
		if btn:IsA("ImageButton") and isYellowColor(btn.ImageColor3) then yellow = true end
		if punchUi.icon and punchUi.icon.Parent and punchUi.icon:IsA("ImageLabel") and isYellowColor(punchUi.icon.ImageColor3) then yellow = true end
		if nameLbl:IsA("TextLabel") and isYellowColor(nameLbl.TextColor3) then yellow = true end
		local sName = nameLbl:FindFirstChildOfClass("UIStroke")
		if sName and sName.Enabled and sName.Transparency < 0.9 then
			if isYellowColor(sName.Color) or (sName.Color.R + sName.Color.G > 1.2 and sName.Color.B < 0.5) then yellow = true end
		end
		local sBtn = btn:FindFirstChildOfClass("UIStroke")
		if sBtn and sBtn.Enabled and sBtn.Transparency < 0.9 and isYellowColor(sBtn.Color) then yellow = true end
	end)
	return yellow
end

local function stopPunchWatcher()
	if punchWatcher then
		local c = punchWatcher
		punchWatcher = nil
		pcall(function() c:Disconnect() end)
	end
end


local function tryFireParryPunch(srcTag)
	if not alive() or not state.autoPunch then return end
	if not isGuest() then return end
	local now = os.clock()
	if now - punchLastAt < 0.65 then return end
	local ch = getChar()
	if not (ch and ch.Parent) then return end
	if not isParryState() then return end
	local myRoot = getHrp(ch)
	if not myRoot then return end
	local kf = getPlayersFolder("Killers")
	local ok, ckRoot, bd = false, nil, 15.5
	if kf then
		for _, k in ipairs(kf:GetChildren()) do
			local r = k:FindFirstChild("HumanoidRootPart")
			if r and Players:GetPlayerFromCharacter(k) then
				local d = (r.Position - myRoot.Position).Magnitude
				if d < bd then
					bd, ckRoot = d, r
				end
			end
		end
	end
	if not ckRoot then return end
	punchLastAt = now
	stopPunchWatcher()
	local delay = tonumber(state.punchDelay) or 0
	if delay <= 0 then
		ok = fireAbility(PUNCH_PAYLOAD)
	else
		task.delay(delay, function()
			if not alive() or not state.autoPunch then return end
			local c2 = getChar()
			local r2 = c2 and getHrp(c2)
			local h2 = c2 and getHum(c2)
			if not (r2 and h2 and h2.Health > 0) then return end
			if not isGuest(c2) then return end
			fireAbility(PUNCH_PAYLOAD)
		end)
		ok = true
	end
	return ok
end

local function onParrySignal(srcTag)
	if not alive() or not state.autoPunch then return end
	if not isGuest() then return end
	if isParryState() then
		tryFireParryPunch(srcTag)
		if os.clock() - punchLastAt < 0.1 then return end
	end
	watcherStartT = os.clock()
	if not punchWatcher then
		punchWatcher = RunService.Heartbeat:Connect(function()
			if not alive() or not state.autoPunch or os.clock() - watcherStartT > 1.35 then
				stopPunchWatcher()
				return
			end
			if isParryState() then
				tryFireParryPunch("transient")
			end
		end)
		pcall(M.Bind, punchWatcher)
	end
end

local function hookStroke(st)
	if not (st and st:IsA("UIStroke")) then return end
	addPunchConn(st:GetPropertyChangedSignal("Color"):Connect(function() onParrySignal("stroke-color") end))
	addPunchConn(st:GetPropertyChangedSignal("Enabled"):Connect(function() onParrySignal("stroke-enabled") end))
	addPunchConn(st:GetPropertyChangedSignal("Transparency"):Connect(function() onParrySignal("stroke-trans") end))
end


local function bindPunchButton(btn, nameLbl, cdLbl)
	clearPunchConns()
	punchUi.btn, punchUi.name, punchUi.cd = btn, nameLbl, cdLbl
	punchUi.icon = btn:FindFirstChild("Icon") or btn:FindFirstChildWhichIsA("ImageLabel")
	pcall(function()
		addPunchConn(btn:GetPropertyChangedSignal("BackgroundColor3"):Connect(function() onParrySignal("btn-bg") end))
		addPunchConn(btn.AttributeChanged:Connect(function() onParrySignal("btn-attr") end))
		if btn:IsA("ImageButton") then
			addPunchConn(btn:GetPropertyChangedSignal("ImageColor3"):Connect(function() onParrySignal("btn-img") end))
		end
		if punchUi.icon and punchUi.icon:IsA("ImageLabel") then
			addPunchConn(punchUi.icon:GetPropertyChangedSignal("ImageColor3"):Connect(function() onParrySignal("icon-img") end))
		end
		if nameLbl and nameLbl:IsA("TextLabel") then
			addPunchConn(nameLbl:GetPropertyChangedSignal("TextColor3"):Connect(function() onParrySignal("name-col") end))
			addPunchConn(nameLbl.AttributeChanged:Connect(function() onParrySignal("name-attr") end))
		end
		if cdLbl and cdLbl:IsA("TextLabel") then
			addPunchConn(cdLbl:GetPropertyChangedSignal("Text"):Connect(function()
				if cdLbl.Text == "" or cdLbl.Text == "0" then
					onParrySignal("cd-ready")
				end
			end))
		end
		for _, ch in ipairs(btn:GetDescendants()) do
			if ch:IsA("UIStroke") then hookStroke(ch) end
		end
		addPunchConn(btn.DescendantAdded:Connect(function(desc)
			if desc:IsA("UIStroke") then
				hookStroke(desc)
				onParrySignal("stroke-added")
			end
		end))
	end)
end


local function resolvePunchButton()
	if not alive() or not state.autoPunch then return end
	if not isGuest() then return end
	local pg = LP:FindFirstChild("PlayerGui")
	local mu = pg and pg:FindFirstChild("MainUI")
	local ac = mu and mu:FindFirstChild("AbilityContainer")
	local b = ac and ac:FindFirstChild("Punch")
	if not b then return end
	if punchUi.btn and punchUi.btn == b and punchUi.btn.Parent then return end
	local n = b:FindFirstChild("AbilityName")
	local cd = b:FindFirstChild("CooldownTime")
	if n and cd then
		bindPunchButton(b, n, cd)
	end
end

local apPgConn, apCharConn = nil, nil

local function stopAutoPunch()
	stopPunchWatcher()
	clearPunchConns()
	if apPgConn then
		local c = apPgConn
		apPgConn = nil
		pcall(function() c:Disconnect() end)
	end
	if apCharConn then
		local c = apCharConn
		apCharConn = nil
		pcall(function() c:Disconnect() end)
	end
	punchUi.btn, punchUi.name, punchUi.cd, punchUi.icon = nil, nil, nil, nil
end


local function syncAutoPunch()
	if not alive() or not state.autoPunch then
		stopAutoPunch()
		return
	end
	resolvePunchButton()
	local pg = LP and LP:FindFirstChild("PlayerGui")
	if not apPgConn and pg then
		apPgConn = pg.DescendantAdded:Connect(function(desc)
			if not alive() or not state.autoPunch then return end
			if desc.Name == "Punch" and desc.Parent and desc.Parent.Name == "AbilityContainer" then
				task.defer(resolvePunchButton)
			end
		end)
		pcall(M.Bind, apPgConn)
	end
	if not apCharConn and LP then
		apCharConn = LP.CharacterAdded:Connect(function()
			if not alive() or not state.autoPunch then return end
			task.delay(0.5, function()
				if alive() and state.autoPunch then resolvePunchButton() end
			end)
			task.delay(1.5, function()
				if alive() and state.autoPunch then resolvePunchButton() end
			end)
		end)
		pcall(M.Bind, apCharConn)
	end
end






local aimUntil = 0
local aimConn = nil
local aimPunchActive = false

local stopAimPunch

local function aimStep()
	if not alive() or not state.aimPunch or os.clock() > aimUntil then
		stopAimPunch()
		return
	end
	if not isGuest() then
		stopAimPunch()
		return
	end
	local ch = getChar()
	local hrp = getHrp(ch)
	local hum = getHum(ch)
	if not (ch and hrp and hum and hum.Health > 0) then
		stopAimPunch()
		return
	end
	rotLock("punch")
	pcall(function() hum.AutoRotate = false end)
	pcall(function() hrp.AssemblyAngularVelocity = Vector3.zero end)
	local km = nearestKillerModel(hrp.Position)
	if not km then return end
	local kHrp = km:FindFirstChild("HumanoidRootPart")
	if not kHrp then return end
	local pred = tonumber(state.prediction) or 2.3
	local vel = kHrp.AssemblyLinearVelocity
	local tgt = kHrp.Position
	if vel and vel.Magnitude > 0.5 then
		tgt = kHrp.Position + vel * (pred / 60)
	end
	local flat = Vector3.new(tgt.X - hrp.Position.X, 0, tgt.Z - hrp.Position.Z)
	if flat.Magnitude > 0.01 then
		pcall(function() hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + flat.Unit) end)
	end
end

stopAimPunch = function()
	aimUntil = 0
	aimPunchActive = false
	if aimConn then
		local c = aimConn
		aimConn = nil
		pcall(function() c:Disconnect() end)
	end
	rotUnlock("punch")
end

local function startAimPunch(steerDur)
	if not alive() or not state.aimPunch then return end
	if not isGuest() then return end
	local d = tonumber(steerDur) or 0.5
	if d < 0.05 then d = 0.05 end
	if d > 1.5 then d = 1.5 end
	aimUntil = os.clock() + d
	aimPunchActive = true
	if not aimConn then
		aimConn = RunService.RenderStepped:Connect(aimStep)
		pcall(M.Bind, aimConn)
	end
end






local hdtActive = false
local hdtConn, hdtBv, hdtHum = nil, nil, nil
local hdtCdPer = setmetatable({}, { __mode = "k" })
local stopHDT, startHDT, triggerHDT

stopHDT = function()
	hdtActive = false
	if hdtConn then
		local c = hdtConn
		hdtConn = nil
		pcall(function() c:Disconnect() end)
	end
	if hdtBv then
		local bv = hdtBv
		hdtBv = nil
		if bv.Parent then pcall(function() bv:Destroy() end) end
	end
	if hdtHum then
		hdtHum = nil
		rotUnlock("hdt")
	end
end

startHDT = function(killerModel)
	if hdtActive or not state.hdt then return end
	if not isGuest() then return end
	local ch = getChar()
	local hrp = getHrp(ch)
	local hum = getHum(ch)
	local tr = killerModel and killerModel:FindFirstChild("HumanoidRootPart")
	if not (hrp and hum and tr) or hum.Health <= 0 then return end
	stopHDT()
	hdtActive = true
	hdtHum = hum
	rotLock("hdt")
	pcall(function() hum.AutoRotate = false end)
	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(1e5, 0, 1e5)
	bv.P = 1e4
	bv.Velocity = Vector3.zero
	bv.Parent = hrp
	if Debris then
		pcall(function() Debris:AddItem(bv, 1.2) end)
	else
		task.delay(1.2, function()
			if bv.Parent then pcall(function() bv:Destroy() end) end
		end)
	end
	hdtBv = bv
	local conn
	conn = RunService.Heartbeat:Connect(function()
		if not alive() or not state.hdt or not hdtActive
			or not (ch and ch.Parent and killerModel and killerModel.Parent)
			or (hum and hum.Health <= 0) then
			stopHDT()
			return
		end
		local t2 = killerModel:FindFirstChild("HumanoidRootPart")
		if not t2 then
			stopHDT()
			return
		end
		local off = t2.Position - hrp.Position
		local hz = Vector3.new(off.X, 0, off.Z)
		if hz.Magnitude > 0.01 then
			local dir = hz.Unit
			local spd = math.clamp(tonumber(state.hdtSpeed) or 12, 5, 20)
			bv.Velocity = Vector3.new(dir.X * spd, 0, dir.Z * spd)
			pcall(function()
				hrp.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(t2.Position.X, hrp.Position.Y, t2.Position.Z))
			end)
		else
			bv.Velocity = Vector3.zero
		end
		if off.Magnitude <= 2.0 then hdtActive = false end
	end)
	hdtConn = conn
	pcall(M.Bind, conn)
	task.delay(0.8, function() hdtActive = false end)
end

triggerHDT = function()
	if not alive() or not state.hdt or hdtActive then return end
	if not isGuest() then return end
	local ch = getChar()
	local myRoot = getHrp(ch)
	if not myRoot then return end
	local kf = getPlayersFolder("Killers")
	if not kf then return end
	local nearest, nd = nil, math.huge
	for _, k in ipairs(kf:GetChildren()) do
		local kr = k:FindFirstChild("HumanoidRootPart")
		if kr and Players:GetPlayerFromCharacter(k) then
			local d = (kr.Position - myRoot.Position).Magnitude
			if d < nd then
				nd, nearest = d, k
			end
		end
	end
	if not nearest then return end
	local now = os.clock()
	if not state.noHdtCd and hdtCdPer[nearest] and now - hdtCdPer[nearest] < 2.5 then return end
	hdtCdPer[nearest] = now
	task.spawn(function() pcall(startHDT, nearest) end)
end






local CHARGE_STEP = "SakenSVChargeAim"
local chargeBound = false
local chargeAimTarget = nil
local chargeAimStartAt = 0
local chargeAimLastDir = nil
local chargeSawMult = false
local chargeGrace = 0.45
local chargeAimTag = nil
local lastChargeAt = 0
local chargeSmConn = nil
local chargeSmSeq = 0

local stopChargeAim, chargeAimStep, startChargeAim, chargeReady, fireCharge


chargeReady = function()
	local pg = LP and LP:FindFirstChild("PlayerGui")
	local mu = pg and pg:FindFirstChild("MainUI")
	local ac = mu and mu:FindFirstChild("AbilityContainer")
	local chg = ac and ac:FindFirstChild("Charge")
	if not chg then return true end
	local cd = chg:FindFirstChild("CooldownTime")
	if not (cd and cd:IsA("TextLabel")) then return true end
	local txt = cd.Text
	return txt == "" or txt == "0"
end

stopChargeAim = function(reason)
	if chargeBound then
		chargeBound = false
		pcall(function() RunService:UnbindFromRenderStep(CHARGE_STEP) end)
	end
	local had = (chargeAimTag ~= nil)
	if had then
		pcall(function()
			local hum = getHum()
			rotUnlock("charge")
			if hum then hum:Move(Vector3.zero) end
		end)
	end
	chargeAimTag = nil
	chargeAimTarget = nil
	chargeAimStartAt = 0
	chargeAimLastDir = nil
end


chargeAimStep = function()
	if not alive() or not state.chargeAim then
		stopChargeAim("disabled")
		return
	end
	
	pcall(function() RunService:UnbindFromRenderStep("GuestCharging") end)
	local elapsed = os.clock() - chargeAimStartAt
	if elapsed >= 1.25 then
		stopChargeAim("timeout")
		return
	end
	local ch = getChar()
	local hrp = getHrp(ch)
	local hum = getHum(ch)
	if not (ch and hrp and hum and hum.Health > 0) then
		stopChargeAim("char-invalid")
		return
	end
	local sm = ch:FindFirstChild("SpeedMultipliers")
	local hasMult = (sm and sm:FindFirstChild("Guest1337Charge") ~= nil) or false
	if hasMult then
		chargeSawMult = true
	elseif chargeSawMult or elapsed > chargeGrace then
		stopChargeAim("mult-ended")
		return
	end
	local kHrp = chargeAimTarget and chargeAimTarget.Parent and chargeAimTarget:FindFirstChild("HumanoidRootPart")
	if not kHrp then
		stopChargeAim("target-lost")
		return
	end
	local offset = kHrp.Position - hrp.Position
	if offset.Magnitude <= 3.5 then
		stopChargeAim("hit")
		return
	end
	local kVel = kHrp.AssemblyLinearVelocity
	local flatVel = kVel and Vector3.new(kVel.X, 0, kVel.Z) or Vector3.zero
	local leadT = math.clamp(offset.Magnitude / 42, 0.02, 0.18)
	local aimPos = kHrp.Position + flatVel * leadT
	local flat = Vector3.new(aimPos.X - hrp.Position.X, 0, aimPos.Z - hrp.Position.Z)
	local flatDirect = Vector3.new(offset.X, 0, offset.Z)
	local moveDir = nil
	if flat.Magnitude > 0.01 then
		moveDir = flat.Unit
	elseif flatDirect.Magnitude > 0.01 then
		moveDir = flatDirect.Unit
	else
		moveDir = chargeAimLastDir
	end
	if moveDir then
		chargeAimLastDir = moveDir
		rotLock("charge")
		pcall(function() hrp.AssemblyAngularVelocity = Vector3.zero end)
		pcall(function() hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + moveDir) end)
		pcall(function() hum:Move(moveDir) end)
	end
end


startChargeAim = function(targetKiller, srcTag)
	if not alive() or not state.chargeAim then return end
	if not isGuest() then return end
	local ch = getChar()
	local hrp = getHrp(ch)
	local hum = getHum(ch)
	if not (ch and hrp and hum and hum.Health > 0) then return end
	local target = nil
	if targetKiller and targetKiller.Parent and targetKiller:FindFirstChild("HumanoidRootPart") then
		target = targetKiller
	end
	if not target then
		target = nearestKillerModel(hrp.Position, (state.chargeRange or 20) * 1.5)
	end
	if not target then return end
	stopChargeAim("restart")
	chargeAimTarget = target
	chargeAimStartAt = os.clock()
	chargeGrace = (srcTag == "anim-charge") and 0.65 or 0.45
	local sm = ch:FindFirstChild("SpeedMultipliers")
	chargeSawMult = (sm and sm:FindFirstChild("Guest1337Charge") ~= nil) or false
	chargeAimLastDir = nil
	rotLock("charge")
	pcall(function() RunService:UnbindFromRenderStep("GuestCharging") end)
	
	local kHrp0 = target:FindFirstChild("HumanoidRootPart")
	if kHrp0 then
		local flat0 = Vector3.new(kHrp0.Position.X - hrp.Position.X, 0, kHrp0.Position.Z - hrp.Position.Z)
		if flat0.Magnitude > 0.01 then
			chargeAimLastDir = flat0.Unit
			local lookAtPos0 = Vector3.new(kHrp0.Position.X, hrp.Position.Y, kHrp0.Position.Z)
			pcall(function() hrp.CFrame = CFrame.lookAt(hrp.Position, lookAtPos0) end)
			pcall(function() hum:Move(chargeAimLastDir) end)
		end
	end
	chargeAimTag = tostring(srcTag or "charge")
	pcall(function()
		RunService:BindToRenderStep(CHARGE_STEP, Enum.RenderPriority.Character.Value + 25, chargeAimStep)
		chargeBound = true
	end)
end


fireCharge = function(killerModel)
	if not alive() or not state.autoCharge then return false end
	if not isGuest() then return false end
	local nowT = os.clock()
	if nowT - lastChargeAt < 0.75 then return false end
	if not chargeReady() then return false end
	local ch = getChar()
	local hrp = getHrp(ch)
	local hum = getHum(ch)
	if not (ch and hrp) then return false end
	local target = killerModel
	if not (target and target:FindFirstChild("HumanoidRootPart")) then
		target = nearestKillerModel(hrp.Position, state.chargeRange or 20)
	end
	local kHrp = target and target:FindFirstChild("HumanoidRootPart")
	if not kHrp then return false end
	local dist = (kHrp.Position - hrp.Position).Magnitude
	if dist > (state.chargeRange or 20) then return false end
	lastChargeAt = nowT
	
	local lookAtPos = Vector3.new(kHrp.Position.X, hrp.Position.Y, kHrp.Position.Z)
	pcall(function() hrp.CFrame = CFrame.lookAt(hrp.Position, lookAtPos) end)
	if hum then
		rotLock("charge")
		local dir = lookAtPos - hrp.Position
		if dir.Magnitude > 0.01 then
			pcall(function() hum:Move(dir.Unit) end)
		end
	end
	pcall(function() RunService:UnbindFromRenderStep("GuestCharging") end)
	fireAbility(CHARGE_PAYLOAD)
	if state.chargeAim then
		startChargeAim(target, "auto-charge")
	elseif hum then
		task.delay(0.85, function()
			if chargeAimTag then return end
			pcall(function() rotUnlock("charge") end)
			if hum and hum.Parent then pcall(function() hum:Move(Vector3.zero) end) end
		end)
	end
	return true
end


local function clearSmBind()
	chargeSmSeq = chargeSmSeq + 1
	if chargeSmConn then
		local c = chargeSmConn
		chargeSmConn = nil
		pcall(function() c:Disconnect() end)
	end
end

local function bindChargeSm(ch)
	clearSmBind()
	if not ch or not state.chargeAim then return end
	local mySeq = chargeSmSeq
	task.spawn(function()
		local sm = ch:FindFirstChild("SpeedMultipliers") or ch:WaitForChild("SpeedMultipliers", 5)
		if chargeSmSeq ~= mySeq then return end
		if not (sm and ch.Parent and LP.Character == ch and state.chargeAim and alive()) then return end
		clearSmBind()
		local conn = sm.ChildAdded:Connect(function(child)
			if not alive() or not state.chargeAim or chargeAimTag then return end
			if child.Name == "Guest1337Charge" then
				local hrp = getHrp(ch)
				local near = nearestKillerModel(hrp and hrp.Position, (state.chargeRange or 20) * 1.5)
				if near then
					startChargeAim(near, "manual-charge")
				end
			end
		end)
		chargeSmConn = conn
		pcall(M.Bind, conn)
	end)
end






local jdState = { charging = false, chargeStartAt = 0, throwUntil = 0 }
local jdCrystalTables = setmetatable({}, { __mode = "k" })
local jdHarvested = false
local jdChargeAnims = { ["106527725058030"] = true }
local jdThrowAnims = { ["139929602101552"] = true }
local jdHatchetAnims = { ["111918351126361"] = true }


local CANON_JD_CRYSTAL = {
	ChannelTime = 0.2,
	MinChargeTime = 0.25,
	MaxChargeTime = 2.0,
	MaximumHoldTime = 2.0,
	ChargeSpeedMult = 0.75,
}

local extActors = nil
local function getActorsModule()
	if extActors then return extActors end
	extActors = requireModule(childPath(RS, "Modules", "Gameplay", "Actors"))
	return extActors
end

local function extractIdsToSet(val, outSet, depth)
	if (depth or 0) > 3 or val == nil then return end
	local t = type(val)
	if t == "string" or t == "number" then
		local id = tostring(val):match("%d+")
		if id then outSet[id] = true end
	elseif typeof(val) == "Instance" then
		if val:IsA("Animation") then
			local id = tostring(val.AnimationId):match("%d+")
			if id then outSet[id] = true end
		elseif val:IsA("Sound") then
			local id = tostring(val.SoundId):match("%d+")
			if id then outSet[id] = true end
		end
	elseif t == "table" then
		for _, sub in pairs(val) do
			extractIdsToSet(sub, outSet, (depth or 0) + 1)
		end
	end
end

local function patchCrystalTable(crystalTbl, enable)
	if type(crystalTbl) ~= "table" then return end
	jdCrystalTables[crystalTbl] = true
	if enable and alive() then
		crystalTbl.ChannelTime = 0.15
		crystalTbl.MinChargeTime = 0.25
		crystalTbl.MaxChargeTime = 0.25
		crystalTbl.MaximumHoldTime = 999999
		crystalTbl.ChargeSpeedMult = 1
	else
		for k, v in pairs(CANON_JD_CRYSTAL) do
			crystalTbl[k] = v
		end
	end
end


local syncJaneDoeConfigs = function()
	local enable = state.jdInstant and alive()
	pcall(function()
		if not jdHarvested then
			local assets = RS:FindFirstChild("Assets")
			if assets then
				local function process(cfgMod)
					if not (cfgMod and cfgMod:IsA("ModuleScript")) then return end
					local ok, cfg = pcall(require, cfgMod)
					if not (ok and type(cfg) == "table") then return end
					if type(cfg.Crystal) == "table" then
						patchCrystalTable(cfg.Crystal, enable)
					end
					if type(cfg.Animations) == "table" then
						for k, v in pairs(cfg.Animations) do
							local kl = tostring(k):lower()
							if kl:find("crystal", 1, true) and kl:find("charge", 1, true) then
								extractIdsToSet(v, jdChargeAnims, 0)
							elseif kl:find("crystal", 1, true) and kl:find("throw", 1, true) then
								extractIdsToSet(v, jdThrowAnims, 0)
							elseif kl:find("axe", 1, true) or kl:find("hatchet", 1, true) then
								extractIdsToSet(v, jdHatchetAnims, 0)
							end
						end
					end
				end
				local surv = assets:FindFirstChild("Survivors")
				local jdBase = surv and surv:FindFirstChild("JaneDoe")
				if jdBase then process(jdBase:FindFirstChild("Config")) end
				local skins = assets:FindFirstChild("Skins")
				local sSurv = skins and skins:FindFirstChild("Survivors")
				local jdSkins = sSurv and sSurv:FindFirstChild("JaneDoe")
				if jdSkins then
					for _, sk in ipairs(jdSkins:GetChildren()) do
						process(sk:FindFirstChild("Config"))
					end
				end
				jdHarvested = true
			end
		else
			for tbl in pairs(jdCrystalTables) do
				patchCrystalTable(tbl, enable)
			end
		end

		local actors = getActorsModule()
		local curActors = actors and actors.CurrentActors
		if type(curActors) == "table" then
			for _, act in pairs(curActors) do
				if type(act) == "table" and (act.Player == LP or act.Rig == LP.Character) then
					if type(act.Config) == "table" and type(act.Config.Crystal) == "table" then
						patchCrystalTable(act.Config.Crystal, enable)
					end
					if enable and type(act.State) == "table" then
						act.State.CrystalFullChargeTime = nil
					end
				end
			end
		end
		for tbl in pairs(jdCrystalTables) do
			patchCrystalTable(tbl, enable)
		end
	end)
end

local function getMyActor()
	local actors = getActorsModule()
	local cur = actors and actors.CurrentActors
	if type(cur) ~= "table" then return nil end
	local myAct = cur[LP]
	if type(myAct) == "table" then return myAct end
	for _, act in pairs(cur) do
		if type(act) == "table" and (act.Player == LP or act.Rig == LP.Character) then
			return act
		end
	end
	return nil
end

local function getChargeDisplayGui()
	local pg = LP and LP:FindFirstChild("PlayerGui")
	local tempUi = pg and pg:FindFirstChild("TemporaryUI")
	local cd = tempUi and tempUi:FindFirstChild("ChargeDisplay")
	if cd and cd.Parent then
		if cd:IsA("GuiObject") and not cd.Visible then return nil end
		return cd
	end
	return nil
end

local function isCrystalAimActiveNow()
	local now = os.clock()
	if jdState.charging and (now - jdState.chargeStartAt) > 12 then
		jdState.charging = false
	end
	if jdState.charging or now <= jdState.throwUntil then return true end
	if getChargeDisplayGui() ~= nil then
		if not jdState.charging then
			jdState.charging = true
			jdState.chargeStartAt = now
		end
		return true
	end
	local act = getMyActor()
	local st = act and act.State
	if type(st) == "table" and st.IsCrystalEquipped == true then
		return true
	end
	return false
end


local function computeCrystalBallisticAimPos()
	if not (alive() and state.jdCrystalAim) then return nil, nil, nil end
	local ch = getChar()
	if not isJane(ch) then return nil, nil, nil end
	local myHrp = getHrp(ch)
	local hum = getHum(ch)
	if not (myHrp and hum and hum.Health > 0) then return nil, nil, nil end
	if not isCrystalAimActiveNow() then return nil, nil, nil end
	local kModel = nearestKillerModel(myHrp.Position)
	if not kModel then return nil, nil, nil end
	local kHrp = kModel:FindFirstChild("HumanoidRootPart")
	if not kHrp then return nil, nil, nil end

	local act = getMyActor()
	local cCfg = act and type(act.Config) == "table" and act.Config.Crystal
	local minSpd = (type(cCfg) == "table" and tonumber(cCfg.MinSpeed)) or 35
	local maxSpd = (type(cCfg) == "table" and tonumber(cCfg.MaxSpeed)) or 250
	local gravArc = (type(cCfg) == "table" and tonumber(cCfg.ProjectileArc)) or 40
	local maxChargeT = (type(cCfg) == "table" and tonumber(cCfg.MaxChargeTime)) or 2.0
	local chanT = (type(cCfg) == "table" and tonumber(cCfg.ChannelTime)) or 0.2

	local chargeRatio = 1.0
	if not state.jdInstant and maxChargeT > 0.05 then
		local elapsed = math.max(0, os.clock() - (jdState.chargeStartAt or os.clock()) - chanT)
		chargeRatio = math.clamp(elapsed / maxChargeT, 0.125, 1.0)
	end
	local projSpd = minSpd + (maxSpd - minSpd) * chargeRatio
	local liftY = ((hum.HipHeight or 2) + (myHrp.Size.Y * 0.5)) * 0.5
	local launchOrigin = myHrp.Position + Vector3.new(0, liftY, 0)

	local kPos = kHrp.Position
	local kVel = kHrp.AssemblyLinearVelocity
	local flatVel = kVel and Vector3.new(kVel.X, 0, kVel.Z) or Vector3.zero
	if flatVel.Magnitude > 85 then
		flatVel = flatVel.Unit * 85
	end
	local dist0 = (kPos - launchOrigin).Magnitude
	local tFlight = math.clamp(dist0 / math.max(projSpd, 35), 0.02, 2.2)
	local predPos = kPos + flatVel * tFlight
	tFlight = math.clamp((predPos - launchOrigin).Magnitude / math.max(projSpd, 35), 0.02, 2.2)
	predPos = kPos + flatVel * tFlight
	local gravDrop = 0.5 * gravArc * (tFlight * tFlight)
	local aimPoint = predPos + Vector3.new(0, gravDrop, 0)
	return aimPoint, launchOrigin, myHrp
end

local PITCH_COMP_ANGLE = -math.atan(1 / 3)

local function buildCompensatedCamCF(aimPoint, myHrp, fallbackCF)
	local cam = WS.CurrentCamera
	local camPos = (cam and cam.CFrame.Position)
		or (typeof(fallbackCF) == "CFrame" and fallbackCF.Position)
		or myHrp.Position
	local delta = aimPoint - myHrp.Position
	if delta.Magnitude < 0.05 then
		return fallbackCF or (cam and cam.CFrame) or myHrp.CFrame
	end
	local dirToAim = delta.Unit
	return CFrame.lookAt(camPos, camPos + dirToAim) * CFrame.Angles(PITCH_COMP_ANGLE, 0, 0)
end


local mouseMod, utilMod = nil, nil
local origGetMousePos, origGetCamCF, origUtilMousePos, origUtilCamCF = nil, nil, nil, nil
local hookedMouse, hookedUtil = false, false

local restoreCrystalSilentAimHooks

restoreCrystalSilentAimHooks = function()
	if hookedMouse and mouseMod then
		pcall(function()
			if origGetMousePos then mouseMod.GetMousePos = origGetMousePos end
			if origGetCamCF then mouseMod.GetCameraCFrame = origGetCamCF end
		end)
		hookedMouse = false
	end
	if hookedUtil and utilMod then
		pcall(function()
			if origUtilMousePos then utilMod.GetPlayerMousePosition = origUtilMousePos end
			if origUtilCamCF then utilMod.GetPlayerCameraCFrame = origUtilCamCF end
		end)
		hookedUtil = false
	end
end

local function syncCrystalSilentAimHooks()
	local want = state.jdCrystalAim and alive()
	if not want then
		restoreCrystalSilentAimHooks()
		return
	end
	pcall(function()
		if not mouseMod then
			mouseMod = requireModule(childPath(RS, "Systems", "Player", "Miscellaneous", "GetPlayerMousePosition"))
		end
		if type(mouseMod) == "table" and not hookedMouse then
			if type(mouseMod.GetMousePos) == "function" then
				origGetMousePos = origGetMousePos or mouseMod.GetMousePos
				mouseMod.GetMousePos = function(...)
					local aimPoint = computeCrystalBallisticAimPos()
					if aimPoint then return aimPoint end
					return origGetMousePos(...)
				end
			end
			if type(mouseMod.GetCameraCFrame) == "function" then
				origGetCamCF = origGetCamCF or mouseMod.GetCameraCFrame
				mouseMod.GetCameraCFrame = function(...)
					local origCF = origGetCamCF(...)
					local aimPoint, _, myHrp = computeCrystalBallisticAimPos()
					if aimPoint and myHrp then
						return buildCompensatedCamCF(aimPoint, myHrp, origCF)
					end
					return origCF
				end
			end
			hookedMouse = true
		end
	end)

	pcall(function()
		if not utilMod then
			utilMod = requireModule(childPath(RS, "Modules", "Utilities", "Util"))
		end
		if type(utilMod) == "table" and not hookedUtil then
			if type(utilMod.GetPlayerMousePosition) == "function" then
				origUtilMousePos = origUtilMousePos or utilMod.GetPlayerMousePosition
				utilMod.GetPlayerMousePosition = function(selfArg, plrArg, ...)
					local targetPlr = (plrArg == nil and typeof(selfArg) == "Instance") and selfArg or plrArg
					if targetPlr == nil or targetPlr == LP then
						local aimPoint = computeCrystalBallisticAimPos()
						if aimPoint then return aimPoint end
					end
					return origUtilMousePos(selfArg, plrArg, ...)
				end
			end
			if type(utilMod.GetPlayerCameraCFrame) == "function" then
				origUtilCamCF = origUtilCamCF or utilMod.GetPlayerCameraCFrame
				utilMod.GetPlayerCameraCFrame = function(selfArg, plrArg, ...)
					local origCF = origUtilCamCF(selfArg, plrArg, ...)
					local targetPlr = (plrArg == nil and typeof(selfArg) == "Instance") and selfArg or plrArg
					if targetPlr == nil or targetPlr == LP then
						local aimPoint, _, myHrp = computeCrystalBallisticAimPos()
						if aimPoint and myHrp then
							return buildCompensatedCamCF(aimPoint, myHrp, origCF)
						end
					end
					return origCF
				end
			end
			hookedUtil = true
		end
	end)
end

local function stopCrystalAim()
	jdState.charging = false
	jdState.throwUntil = 0
end

local function startCrystalAimWindow(isThrowPhase)
	if not alive() or not state.jdCrystalAim then return end
	local ch = getChar()
	if not isJane(ch) then return end
	local now = os.clock()
	if isThrowPhase then
		jdState.charging = false
		jdState.throwUntil = now + 0.85
	else
		if not jdState.charging then
			jdState.chargeStartAt = now
		end
		jdState.charging = true
	end
end


local function forceUnstuckJaneDoeCrystal()
	if not alive() then return end
	local ch = getChar()
	if not isJane(ch) then return end
	if getChargeDisplayGui() ~= nil then return end
	local act = getMyActor()
	local st = act and act.State
	if type(st) ~= "table" or st.IsCrystalEquipped ~= true then return end

	st.IsCrystalEquipped = false
	st.CrystalFullChargeTime = nil

	pcall(function()
		local anims = act.Animations
		if type(anims) == "table" and anims.CrystalThrowCharge and type(anims.CrystalThrowCharge.Stop) == "function" then
			anims.CrystalThrowCharge:Stop(0.1)
		end
	end)

	pcall(function()
		local hum = getHum(ch)
		local an = hum and hum:FindFirstChildOfClass("Animator")
		if an then
			for _, tr in ipairs(an:GetPlayingAnimationTracks()) do
				local aid = tr.Animation and tostring(tr.Animation.AnimationId):match("%d+")
				local aName = ((tr.Animation and tr.Animation.Name) or tr.Name or ""):lower()
				if (aid and jdChargeAnims[aid]) or (aName:find("crystal", 1, true) and aName:find("charge", 1, true)) then
					tr:Stop(0.1)
				end
			end
		end
	end)

	pcall(function()
		if not utilMod then
			utilMod = requireModule(childPath(RS, "Modules", "Utilities", "Util"))
		end
		if type(utilMod) == "table" and type(utilMod.ToggleLockForAbilityIcon) == "function" then
			utilMod:ToggleLockForAbilityIcon("Axe", "JaneDoeCrystalEquipped", false)
		end
	end)

	pcall(function()
		local beh = act.Behavior
		if type(beh) == "table" and type(beh.lcl_OnCrystalUnequipped) == "function" then
			beh:lcl_OnCrystalUnequipped(act)
		end
	end)
end


local jdUiConns = {}
local jdHookedCd = setmetatable({}, { __mode = "k" })
local jdUiBound = false
local jdUiPg = nil

local function clearJdUiConns()
	jdUiBound = false
	jdUiPg = nil
	table.clear(jdHookedCd)
	for i = #jdUiConns, 1, -1 do
		local c = jdUiConns[i]
		jdUiConns[i] = nil
		pcall(function() c:Disconnect() end)
	end
end

local function bindChargeDisplayWatchers()
	if not alive() or not (state.jdInstant or state.jdCrystalAim) then
		if jdUiBound then clearJdUiConns() end
		return
	end
	local pg = LP and LP:FindFirstChild("PlayerGui")
	if not pg then
		if jdUiBound then clearJdUiConns() end
		return
	end
	if jdUiBound and jdUiPg == pg then return end
	clearJdUiConns()
	jdUiBound = true
	jdUiPg = pg
	local function onChargeDisplayAdded(inst)
		if not alive() then return end
		if inst and inst.Name == "ChargeDisplay" and inst.Parent and inst.Parent.Name == "TemporaryUI" then
			if state.jdInstant then pcall(syncJaneDoeConfigs) end
			if state.jdCrystalAim then pcall(startCrystalAimWindow, false) end
			if not jdHookedCd[inst] then
				local ancConn
				ancConn = inst.AncestryChanged:Connect(function(_, parent)
					if not parent then
						jdState.charging = false
						if state.jdCrystalAim then
							jdState.throwUntil = math.max(jdState.throwUntil, os.clock() + 0.85)
						end
						task.delay(0.38, function() pcall(forceUnstuckJaneDoeCrystal) end)
						jdHookedCd[inst] = nil
						if ancConn then
							local c0 = ancConn
							ancConn = nil
							pcall(function() c0:Disconnect() end)
						end
					end
				end)
				jdHookedCd[inst] = ancConn
				jdUiConns[#jdUiConns + 1] = ancConn
			end
		end
	end
	local hookedTempUi = nil
	local function bindTempUiFolder(tempUi)
		if not (tempUi and tempUi.Parent == pg) or hookedTempUi == tempUi then return end
		hookedTempUi = tempUi
		jdUiConns[#jdUiConns + 1] = tempUi.ChildAdded:Connect(onChargeDisplayAdded)
		local curCd = getChargeDisplayGui()
		if curCd then onChargeDisplayAdded(curCd) end
	end
	local tempUi0 = pg:FindFirstChild("TemporaryUI")
	if tempUi0 then bindTempUiFolder(tempUi0) end
	jdUiConns[#jdUiConns + 1] = pg.ChildAdded:Connect(function(child)
		if child.Name == "TemporaryUI" then
			task.defer(bindTempUiFolder, child)
		end
	end)
end


local HATCHET_STEP = "SakenSVHatchetAim"
local hatchetBound = false
local hatchetUntil = 0

local stopHatchetAim, hatchetStep, startHatchetAimWindow

stopHatchetAim = function()
	if hatchetBound then
		hatchetBound = false
		pcall(function() RunService:UnbindFromRenderStep(HATCHET_STEP) end)
	end
	hatchetUntil = 0
	rotUnlock("jd_hatchet")
end

hatchetStep = function()
	if not alive() or not state.jdHatchet or os.clock() > hatchetUntil then
		stopHatchetAim()
		return
	end
	local ch = getChar()
	if not isJane(ch) then
		stopHatchetAim()
		return
	end
	local myHrp = getHrp(ch)
	local hum = getHum(ch)
	if not (myHrp and hum and hum.Health > 0) then
		stopHatchetAim()
		return
	end
	local kModel = nearestKillerModel(myHrp.Position, 28)
	local kHrp = kModel and kModel:FindFirstChild("HumanoidRootPart")
	if not kHrp then
		rotUnlock("jd_hatchet")
		return
	end
	local dist = (kHrp.Position - myHrp.Position).Magnitude
	local kVel = kHrp.AssemblyLinearVelocity
	local flatVel = kVel and Vector3.new(kVel.X, 0, kVel.Z) or Vector3.zero
	local leadT = math.clamp(dist / 45, 0.04, 0.22)
	local aimPos = kHrp.Position + flatVel * leadT
	local flat = Vector3.new(aimPos.X - myHrp.Position.X, 0, aimPos.Z - myHrp.Position.Z)
	if flat.Magnitude > 0.05 then
		rotLock("jd_hatchet")
		pcall(function() myHrp.AssemblyAngularVelocity = Vector3.zero end)
		pcall(function()
			myHrp.CFrame = CFrame.lookAt(myHrp.Position, Vector3.new(aimPos.X, myHrp.Position.Y, aimPos.Z))
		end)
	end
end

startHatchetAimWindow = function()
	if not alive() or not state.jdHatchet then return end
	local ch = getChar()
	if not isJane(ch) then return end
	local myHrp = getHrp(ch)
	local hum = getHum(ch)
	if not (myHrp and hum and hum.Health > 0) then return end
	hatchetUntil = os.clock() + 1.0
	hatchetStep()
	if not hatchetBound and hatchetUntil > os.clock() then
		pcall(function()
			RunService:UnbindFromRenderStep(HATCHET_STEP)
			RunService:BindToRenderStep(HATCHET_STEP, Enum.RenderPriority.Character.Value + 3, hatchetStep)
			hatchetBound = true
		end)
	end
end






local CANON_VEE_SK8 = {
	Sk8TurnControl = 0.65,
	Sk8PhaseBounceEnabled = false,
	Sk8TrickStamina = 10,
	Sk8TrickStaminaNerfed = 4,
}

local veeTables = setmetatable({}, { __mode = "k" })
local veeHarvested = false
local veeSk8Anims = { ["123803922491274"] = true, ["117058860640843"] = true }
local veeSaved = setmetatable({}, { __mode = "k" })
local netMod = nil


local function patchSingleVeeConfig(cfgTbl, forceRestore)
	if type(cfgTbl) ~= "table" then return end
	veeTables[cfgTbl] = true
	local orig = veeSaved[cfgTbl]
	if not orig then
		orig = {
			TurnControl = tonumber(cfgTbl.Sk8TurnControl) or CANON_VEE_SK8.Sk8TurnControl,
			PhaseBounce = (cfgTbl.Sk8PhaseBounceEnabled == true),
			TrickStam = tonumber(cfgTbl.Sk8TrickStamina) or CANON_VEE_SK8.Sk8TrickStamina,
			TrickStamNerfed = tonumber(cfgTbl.Sk8TrickStaminaNerfed) or CANON_VEE_SK8.Sk8TrickStaminaNerfed,
		}
		veeSaved[cfgTbl] = orig
	end
	local live = (not forceRestore) and alive()
	if live and state.veeCtrl then
		cfgTbl.Sk8TurnControl = math.clamp(tonumber(state.veeTurn) or 5.0, 1.0, 15.0)
	else
		cfgTbl.Sk8TurnControl = orig.TurnControl
	end
	if live and state.veeRebound then
		cfgTbl.Sk8PhaseBounceEnabled = true
	else
		cfgTbl.Sk8PhaseBounceEnabled = orig.PhaseBounce
	end
	if live and state.veeStam then
		
		cfgTbl.Sk8TrickStamina = orig.TrickStam
		cfgTbl.Sk8TrickStaminaNerfed = orig.TrickStam
	else
		cfgTbl.Sk8TrickStamina = orig.TrickStam
		cfgTbl.Sk8TrickStaminaNerfed = orig.TrickStamNerfed
	end
end


local syncVeeronicaConfigs = function(forceRestore)
	pcall(function()
		if not veeHarvested then
			local assets = RS:FindFirstChild("Assets")
			if assets then
				local function process(cfgMod, isBase)
					if not (cfgMod and cfgMod:IsA("ModuleScript")) then return end
					local ok, cfg = pcall(require, cfgMod)
					if not (ok and type(cfg) == "table") then return end
					if isBase or cfg.Sk8TurnControl ~= nil or cfg.Sk8TrickStamina ~= nil or cfg.Sk8PhaseBounceEnabled ~= nil then
						patchSingleVeeConfig(cfg, forceRestore)
					end
					if type(cfg.Animations) == "table" then
						for k, v in pairs(cfg.Animations) do
							local kl = tostring(k):lower()
							if kl:find("sk8", 1, true) or kl:find("skate", 1, true) then
								extractIdsToSet(v, veeSk8Anims, 0)
							end
						end
					end
				end
				local surv = assets:FindFirstChild("Survivors")
				local veeBase = surv and surv:FindFirstChild("Veeronica")
				if veeBase then process(veeBase:FindFirstChild("Config"), true) end
				local skins = assets:FindFirstChild("Skins")
				local sSurv = skins and skins:FindFirstChild("Survivors")
				local veeSkins = sSurv and sSurv:FindFirstChild("Veeronica")
				if veeSkins then
					for _, sk in ipairs(veeSkins:GetChildren()) do
						process(sk:FindFirstChild("Config"), false)
					end
				end
				veeHarvested = true
			end
		else
			for tbl in pairs(veeTables) do
				patchSingleVeeConfig(tbl, forceRestore)
			end
		end

		local actors = getActorsModule()
		local curActors = actors and actors.CurrentActors
		if type(curActors) == "table" then
			for _, act in pairs(curActors) do
				if type(act) == "table" and (act.Player == LP or act.Rig == LP.Character) and isVee(act.Rig or LP.Character) then
					if type(act.Config) == "table" then
						patchSingleVeeConfig(act.Config, forceRestore)
					end
				end
			end
		end
		for tbl in pairs(veeTables) do
			patchSingleVeeConfig(tbl, forceRestore)
		end
	end)
end

local function getNetworkModule()
	if netMod then return netMod end
	netMod = requireModule(childPath(RS, "Modules", "Network", "Network"))
	return netMod
end

local vee = {
	wasSkating = false,
	lastTrickAt = 0,
	phaseFiredThisSk8 = false,
	phasePending = false,
	lastPhaseAt = 0,
	lastSk8StartAt = 0,
	sessionId = 0,
}

local function resetVeeTracking()
	vee.wasSkating = false
	vee.phaseFiredThisSk8 = false
	vee.phasePending = false
	vee.lastSk8StartAt = 0
end


local function fireVeeTrickInput()
	if not (alive() and state.veeTrick) then return end
	local pressedBtn = nil
	if type(firesignal) == "function" then
		pcall(function()
			local sprintingMod = requireModule(childPath(RS, "Systems", "Character", "Game", "Sprinting"))
			local mb = sprintingMod and rawget(sprintingMod, "MobileButton")
			if typeof(mb) == "Instance" and mb:IsA("GuiButton") and mb.Visible then
				pressedBtn = mb
				if mb.MouseButton1Down then firesignal(mb.MouseButton1Down) end
			end
		end)
	end
	if VIM then
		pcall(function()
			VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
		end)
	end
	task.delay(0.04, function()
		if pressedBtn and type(firesignal) == "function" then
			pcall(function()
				if pressedBtn.MouseButton1Up then firesignal(pressedBtn.MouseButton1Up) end
			end)
		end
		if VIM then
			pcall(function()
				VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
			end)
		end
	end)
end


local function scheduleVeeAutoPhase(sessionId)
	if not (alive() and state.veePhase) then return end
	if vee.phaseFiredThisSk8 or vee.phasePending then return end
	if os.clock() - (vee.lastPhaseAt or 0) < 1.0 then return end
	vee.phasePending = true
	task.delay(0.12, function()
		vee.phasePending = false
		if not (alive() and state.veePhase) then return end
		if vee.phaseFiredThisSk8 or vee.sessionId ~= sessionId then return end
		local ch = getChar()
		if not isVee(ch) then return end
		local act = getMyActor()
		local st = act and type(act.State) == "table" and act.State or nil
		for _ = 1, 4 do
			if st and st.isSkating == true then break end
			task.wait(0.06)
			if not (alive() and state.veePhase) then return end
			if vee.phaseFiredThisSk8 or vee.sessionId ~= sessionId then return end
			act = getMyActor()
			st = act and type(act.State) == "table" and act.State or nil
		end
		if not (st and st.isSkating == true) then return end
		local meta = (act and type(act.Meta) == "table") and act.Meta or nil
		local curChan = (meta and tonumber(meta.CurrentChannel)) or 1
		local uses = (meta and tonumber(meta.Sk8AbilityUses)) or 0
		if curChan ~= 1 or uses >= 1 then return end
		local myHrp = getHrp(ch)
		local killerModel = nearestKillerModel(myHrp and myHrp.Position)
		if not killerModel then return end
		local net = getNetworkModule()
		if net == nil then return end
		vee.phaseFiredThisSk8 = true
		vee.lastPhaseAt = os.clock()
		if meta then meta.Sk8AbilityUses = uses + 1 end
		pcall(function()
			net:FireServerConnection(LP.Name .. "SkatePhase", "REMOTE_EVENT", killerModel)
		end)
	end)
end


local function veeOnSk8Started()
	if not alive() then return end
	local now = os.clock()
	if now - (vee.lastSk8StartAt or 0) < 0.85 then return end
	vee.lastSk8StartAt = now
	vee.sessionId = vee.sessionId + 1
	vee.phaseFiredThisSk8 = false
	if state.veePhase then
		scheduleVeeAutoPhase(vee.sessionId)
	end
end


local function veeHeartbeat(dt)
	if not alive() then return end
	if not anyVeeOn() then
		resetVeeTracking()
		return
	end
	local ch = getChar()
	if not isVee(ch) then
		resetVeeTracking()
		return
	end
	local act = getMyActor()
	if not act then return end
	if (state.veeCtrl or state.veeRebound or state.veeStam) and type(act.Config) == "table" and not veeSaved[act.Config] then
		pcall(patchSingleVeeConfig, act.Config, false)
	end
	local st = type(act.State) == "table" and act.State or nil
	local skatingNow = (st and st.isSkating == true) == true
	if skatingNow and not vee.wasSkating then
		vee.wasSkating = true
		veeOnSk8Started()
	elseif not skatingNow and vee.wasSkating then
		vee.wasSkating = false
		vee.phaseFiredThisSk8 = false
		vee.phasePending = false
		vee.lastSk8StartAt = 0
	end

	if state.veeTrick and skatingNow then
		local insts = type(act.Instances) == "table" and act.Instances or nil
		local hl = (insts and insts.Sk8Highlight) or ch:FindFirstChild("Sk8Highlight")
		if hl and hl:IsA("Highlight") and hl.Adornee == (act.Rig or ch) then
			local now = os.clock()
			if now - (vee.lastTrickAt or 0) >= 0.30 then
				vee.lastTrickAt = now
				fireVeeTrickInput()
			end
		end
	end
end





local function handleAnimation(ch, track)
	if not (ch and ch.Parent and alive()) then return end
	local anim = track and track.Animation
	local animId = anim and tostring(anim.AnimationId):match("%d+")
	local animName = ((anim and anim.Name) or (track and track.Name) or ""):lower()

	if isGuest(ch) then
		local isBlock = (animId and BLOCK_IDS[animId]) or (animName:find("block", 1, true) ~= nil)
		if isBlock then
			if state.autoPunch then pcall(onParrySignal, "block-anim") end
			if state.hdt then pcall(triggerHDT) end
		end
		local isPunch = (animId and PUNCH_IDS[animId])
			or (animName:find("punch", 1, true) ~= nil)
			or (animName:find("parry", 1, true) ~= nil)
		if isPunch and state.aimPunch then
			pcall(startAimPunch, state.steerDur)
			pcall(function()
				track.Ended:Once(function()
					if aimPunchActive then stopAimPunch() end
				end)
				track.Stopped:Once(function()
					if aimPunchActive then stopAimPunch() end
				end)
			end)
		end
		local isCharge = (animId and guestChargeAnims[animId])
			or (animName:find("charge", 1, true) ~= nil)
			or (animName:find("dash", 1, true) ~= nil)
		if isCharge and state.chargeAim then
			pcall(startChargeAim, nil, "anim-charge")
		end
		return
	end

	if isJane(ch) then
		local isCharge = (animId and jdChargeAnims[animId])
			or (animName:find("crystal", 1, true) ~= nil and animName:find("charge", 1, true) ~= nil)
		local isThrow = (animId and jdThrowAnims[animId])
			or (animName:find("crystal", 1, true) ~= nil and animName:find("throw", 1, true) ~= nil and not isCharge)
		local isAxe = (animId and jdHatchetAnims[animId])
			or (animName:find("axe", 1, true) ~= nil)
			or (animName:find("hatchet", 1, true) ~= nil)
		if isCharge then
			if state.jdInstant then pcall(syncJaneDoeConfigs) end
			if state.jdCrystalAim then pcall(startCrystalAimWindow, false) end
			pcall(function()
				track.Stopped:Once(function()
					jdState.charging = false
					if state.jdCrystalAim then
						jdState.throwUntil = math.max(jdState.throwUntil, os.clock() + 0.85)
					end
					task.delay(0.38, function() pcall(forceUnstuckJaneDoeCrystal) end)
				end)
			end)
		elseif isThrow then
			if state.jdCrystalAim then pcall(startCrystalAimWindow, true) end
		elseif isAxe then
			if state.jdHatchet then pcall(startHatchetAimWindow) end
		end
		return
	end

	if isVee(ch) then
		local isSk8 = (animId and veeSk8Anims[animId])
			or (animName:find("sk8", 1, true) ~= nil)
			or (animName:find("skate", 1, true) ~= nil)
		if isSk8 then
			if state.veeCtrl or state.veeRebound or state.veeStam then
				pcall(syncVeeronicaConfigs, false)
			end
			pcall(veeOnSk8Started)
		end
	end
end





local hookedChar = nil
local charConns = {}
local charSeq = 0
local animatorReady = false
local bindRetryAt = 0

local function clearCharConns()
	charSeq = charSeq + 1
	animatorReady = false
	for i = #charConns, 1, -1 do
		local c = charConns[i]
		charConns[i] = nil
		pcall(function() c:Disconnect() end)
	end
	hookedChar = nil
end

local function addCharConn(c)
	if not c then return end
	charConns[#charConns + 1] = c
	pcall(M.Bind, c)
end

local function bindChar(ch)
	clearCharConns()
	if not (ch and ch.Parent and alive()) then return end
	hookedChar = ch
	local seq = charSeq
	task.spawn(function()
		local hum = ch:FindFirstChildOfClass("Humanoid") or ch:WaitForChild("Humanoid", 5)
		local animator = hum and (hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator", 5))
		if charSeq ~= seq or not alive() then return end
		if LP.Character ~= ch or not ch.Parent then return end
		pcall(harvestGuestAnims, true)
		pcall(syncJaneDoeConfigs)
		pcall(syncVeeronicaConfigs, false)
		if animator then
			animatorReady = true
			addCharConn(animator.AnimationPlayed:Connect(function(track)
				if charSeq ~= seq or not alive() then return end
				pcall(handleAnimation, ch, track)
			end))
		else
			bindRetryAt = os.clock() + 1.5
		end
		addCharConn(ch:GetAttributeChangedSignal("SkinName"):Connect(function()
			if charSeq ~= seq or not alive() then return end
			pcall(harvestGuestAnims, true)
			pcall(syncJaneDoeConfigs)
			pcall(syncVeeronicaConfigs, false)
		end))
		addCharConn(ch:GetAttributeChangedSignal("CharacterName"):Connect(function()
			if charSeq ~= seq or not alive() then return end
			pcall(syncJaneDoeConfigs)
			pcall(syncVeeronicaConfigs, false)
		end))
		addCharConn(ch.AncestryChanged:Connect(function()
			if charSeq ~= seq or not alive() then return end
			pcall(syncJaneDoeConfigs)
			pcall(syncVeeronicaConfigs, false)
		end))
	end)
end

local function ensureCharBinding(ch)
	if not alive() then return end
	if not anyFeatureOn() then
		if hookedChar then clearCharConns() end
		return
	end
	if not ch then
		if hookedChar then clearCharConns() end
		return
	end
	if hookedChar ~= ch then
		bindChar(ch)
		return
	end
	if not animatorReady and os.clock() > bindRetryAt then
		bindChar(ch)
	end
end





local function syncGuest()
	if not alive() then return end
	if not state.autoPunch then pcall(stopAutoPunch) end
	if not state.aimPunch then pcall(stopAimPunch) end
	if not state.hdt then pcall(stopHDT) end
	if not state.chargeAim then pcall(stopChargeAim, "disabled") end
	if state.autoPunch then pcall(syncAutoPunch) end
	local ch = getChar()
	if state.chargeAim and ch and isGuest(ch) then
		pcall(bindChargeSm, ch)
	else
		pcall(clearSmBind)
	end
	pcall(ensureCharBinding, ch)
end

local function syncJane()
	if not alive() then return end
	pcall(syncJaneDoeConfigs)
	pcall(syncCrystalSilentAimHooks)
	pcall(bindChargeDisplayWatchers)
	if not state.jdHatchet then pcall(stopHatchetAim) end
	if not state.jdCrystalAim then pcall(stopCrystalAim) end
	pcall(ensureCharBinding, getChar())
end

local function syncVee()
	if not alive() then return end
	pcall(syncVeeronicaConfigs, false)
	pcall(ensureCharBinding, getChar())
end





local shutdownDone = false
local chargeHbAcc = 0

M.OnHeartbeat(function(dt)
	if not alive() then
		if shutdownDone then return end
		shutdownDone = true
		pcall(stopAimPunch)
		pcall(stopHDT)
		pcall(stopChargeAim, "unload")
		pcall(stopHatchetAim)
		pcall(stopAutoPunch)
		pcall(clearSmBind)
		pcall(restoreCrystalSilentAimHooks)
		pcall(clearJdUiConns)
		pcall(clearCharConns)
		resetVeeTracking()
		return
	end

	local ch = getChar()
	pcall(ensureCharBinding, ch)

	
	if state.autoPunch then
		pcall(syncAutoPunch)
	end

	
	
	if state.autoCharge then
		chargeHbAcc = chargeHbAcc + (tonumber(dt) or 0)
		if chargeHbAcc >= 0.25 and chargeAimTag == nil then
			chargeHbAcc = 0
			pcall(fireCharge, nil)
		end
	else
		chargeHbAcc = 0
	end

	
	if state.jdInstant or state.jdCrystalAim then
		pcall(bindChargeDisplayWatchers)
	end

	
	pcall(veeHeartbeat, dt)
end)


local dusHookConn, dusButtonGui, dusOrigInvoke, dusHooked = nil, nil, nil, false
local function dusTarget(maxDist)
    local r = getHrp(); if not r then return nil end
    local folder = WS:FindFirstChild("Players") and WS.Players:FindFirstChild(state.dusMode == "Survivor" and "Survivors" or "Killers")
    local best, bd = nil, maxDist or 250
    if folder then for _, m in ipairs(folder:GetChildren()) do
        local rr, hh = m:FindFirstChild("HumanoidRootPart"), m:FindFirstChildOfClass("Humanoid")
        if rr and hh and hh.Health > 0 and m ~= getChar() then local d = (rr.Position-r.Position).Magnitude; if d < bd then best, bd = m, d end end
    end end
    return best
end
local function startDusSilentHook()
    if dusHooked or not state.dusSilent or not hookfunction or not getcallbackvalue then return end
    local _, rf = M.Remote and M.Remote() or nil, nil
    local ok, network = pcall(function() return RS.Modules.Network.Network end)
    local remoteFunction = ok and network and network:FindFirstChild("RemoteFunction")
    if not remoteFunction then return end
    local cbOk, cb = pcall(function() return getcallbackvalue(remoteFunction, "OnClientInvoke") end)
    if not cbOk or type(cb) ~= "function" then return end
    local old
    local hookedOk = pcall(function()
        old = hookfunction(cb, function(...)
            local args = table.pack(...)
            if args[1] == "GetMousePosition" and state.dusSilent and isChar("Dusekkar") then
                local t = dusTarget(250); local tr = t and t:FindFirstChild("HumanoidRootPart")
                if tr then
                    local pos = tr.Position; local h = t:FindFirstChildOfClass("Humanoid")
                    if h and h.MoveDirection.Magnitude > 0.05 then pos += h.MoveDirection.Unit * math.clamp(state.dusPredict, 0, 5) end
                    return pos
                end
            end
            return old(table.unpack(args, 1, args.n))
        end)
    end)
    if hookedOk then dusOrigInvoke, dusHooked = old, true end
end
local function stopDusSilentHook()
    
    dusHooked = false
    dusOrigInvoke = nil
end

local function stopDusAim()
    if dusHookConn then pcall(function() dusHookConn:Disconnect() end); dusHookConn = nil end
    stopDusSilentHook()
end
local function startDusAim()
    stopDusAim()
    if not state.dusSilent then return end
    pcall(startDusSilentHook)
    dusHookConn = RunService.RenderStepped:Connect(function()
        if not alive() or not state.dusSilent then return end
        local c, h = selfRoot(); local t = dusTarget(250); local tr = t and t:FindFirstChild("HumanoidRootPart")
        if c and h and tr and isChar("Dusekkar", c) then
            local pos = tr.Position
            local th = t:FindFirstChildOfClass("Humanoid")
            if th and th.MoveDirection.Magnitude > 0.05 then pos += th.MoveDirection.Unit * math.clamp(state.dusPredict, 0, 5) end
            c.CFrame = CFrame.lookAt(c.Position, Vector3.new(pos.X, c.Position.Y, pos.Z))
        end
    end)
    M.Bind(dusHookConn)
end
local function stopDusButton()
    if dusButtonGui then pcall(function() dusButtonGui:Destroy() end); dusButtonGui = nil end
end
local function startDusButton()
    stopDusButton()
    local sg = Instance.new("ScreenGui"); sg.Name = "TURNsakenV4_DusekkarMode"; sg.ResetOnSpawn = false; sg.DisplayOrder = 999990; sg.Parent = LP:WaitForChild("PlayerGui"); dusButtonGui = sg
    local b = Instance.new("TextButton"); b.Size = UDim2.fromOffset(130, 32); b.Position = UDim2.new(0.5, -65, 0.8, 0); b.TextSize = 12; b.Font = Enum.Font.GothamBold; b.TextColor3 = Color3.new(1,1,1); b.BackgroundColor3 = Color3.fromRGB(60,60,70); b.Parent = sg; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local function paint() b.Text = "Dusekkar: " .. state.dusMode end
    paint(); b.Activated:Connect(function() state.dusMode = state.dusMode == "Killer" and "Survivor" or "Killer"; M.Set("sv_dus_mode", state.dusMode); paint() end)
end





local booting = true

local secGuest = page:Section("Guest 1337", "Guest", "Punch / Charge / Pull combat engine")
secGuest:Label("Only active as Guest1337; otherwise idle.")

secGuest:Toggle("sv_auto_punch", "Auto Punch", state.autoPunch, function(v)
	state.autoPunch = (v == true)
	pcall(syncGuest)
	if booting then return end
	M.Notify("Survivor", state.autoPunch and "Auto Punch: On" or "Auto Punch: Off")
end)

secGuest:Slider("sv_punch_delay", "Auto Punch Delay", 0, 1, state.punchDelay, "s", function(v)
	state.punchDelay = math.clamp(tonumber(v) or 0.3, 0, 1)
end)

secGuest:Toggle("sv_aim_punch", "Punch Aimbot", state.aimPunch, function(v)
	state.aimPunch = (v == true)
	pcall(syncGuest)
	if booting then return end
	M.Notify("Survivor", state.aimPunch and "Aimbot Punch: On" or "Aimbot Punch: Off")
end)

secGuest:Slider("sv_punch_pred", "Prediction", 0, 6, state.prediction, "f", function(v)
	state.prediction = math.clamp(tonumber(v) or 2.3, 0, 6)
end)

secGuest:Slider("sv_steer_dur", "Steer Duration", 0, 1.5, state.steerDur, "s", function(v)
	state.steerDur = math.clamp(tonumber(v) or 0.5, 0, 1.5)
end)

secGuest:Toggle("sv_auto_charge", "Auto Charge", state.autoCharge, function(v)
	state.autoCharge = (v == true)
	pcall(syncGuest)
	if booting then return end
	M.Notify("Survivor", state.autoCharge and "Auto Charge: On" or "Auto Charge: Off")
end)

secGuest:Toggle("sv_charge_aim", "Charge Aim", state.chargeAim, function(v)
	state.chargeAim = (v == true)
	pcall(syncGuest)
	if booting then return end
	M.Notify("Survivor", state.chargeAim and "Charge Aim: On" or "Charge Aim: Off")
end)

secGuest:Slider("sv_charge_range", "Charge Max Distance", 10, 35, state.chargeRange, "m", function(v)
	state.chargeRange = math.clamp(tonumber(v) or 20, 10, 35)
end)

local secJane = page:Section("Jane Doe", "Jane Doe", "Crystal / Hatchet kit")
secJane:Label("Only active as JaneDoe.")

secJane:Toggle("sv_jd_instant", "Instant Crystal Charge", state.jdInstant, function(v)
	state.jdInstant = (v == true)
	pcall(syncJane)
	if booting then return end
	M.Notify("Survivor", state.jdInstant and "Instant Crystal Charge: On" or "Instant Crystal Charge: Off")
end)

secJane:Toggle("sv_jd_crystal_aim", "Crystal Silent Aim", state.jdCrystalAim, function(v)
	state.jdCrystalAim = (v == true)
	pcall(syncJane)
	if booting then return end
	M.Notify("Survivor", state.jdCrystalAim and "Crystal Silent Aim: On" or "Crystal Silent Aim: Off")
end)

secJane:Toggle("sv_jd_hatchet", "Hatchet Aim", state.jdHatchet, function(v)
	state.jdHatchet = (v == true)
	pcall(syncJane)
	if booting then return end
	M.Notify("Survivor", state.jdHatchet and "Hatchet Aim: On" or "Hatchet Aim: Off")
end)

local secVee = page:Section("Veeronica", "Veeronica", "Skate / Phase kit")
secVee:Label("Only active as Veeronica.")

secVee:Toggle("sv_vee_trick", "Auto Trick", state.veeTrick, function(v)
	state.veeTrick = (v == true)
	pcall(syncVee)
	if booting then return end
	M.Notify("Survivor", state.veeTrick and "Auto Trick: On" or "Auto Trick: Off")
end)

secVee:Toggle("sv_vee_stam", "Trick Stamina Boost (10)", state.veeStam, function(v)
	state.veeStam = (v == true)
	pcall(syncVee)
	if booting then return end
	M.Notify("Survivor", state.veeStam and "Trick Stamina Boost: On" or "Trick Stamina Boost: Off")
end)

secVee:Toggle("sv_vee_ctrl", "Skate Turn Control", state.veeCtrl, function(v)
	state.veeCtrl = (v == true)
	pcall(syncVee)
	if booting then return end
	M.Notify("Survivor", state.veeCtrl and "Sk8 Turn Control: On" or "Sk8 Turn Control: Off")
end)

secVee:Slider("sv_vee_turn", "Skate Turn Sensitivity", 0, 15, state.veeTurn, "", function(v)
	state.veeTurn = math.clamp(tonumber(v) or 5, 0, 15)
	pcall(syncVee)
end)

secVee:Toggle("sv_vee_rebound", "Skate Wall Rebound", state.veeRebound, function(v)
	state.veeRebound = (v == true)
	pcall(syncVee)
	if booting then return end
	M.Notify("Survivor", state.veeRebound and "Sk8 Wall Rebound: On" or "Sk8 Wall Rebound: Off")
end)

secVee:Toggle("sv_vee_phase", "Auto Phase Boost", state.veePhase, function(v)
	state.veePhase = (v == true)
	pcall(syncVee)
	if booting then return end
	M.Notify("Survivor", state.veePhase and "Auto Phase Boost: On" or "Auto Phase Boost: Off")
end)

local secDus = page:Section("Dusekkar", "Dusekkar", "Target Mode & Prediction")
secDus:Toggle("sv_dus_silent", "Silent Aim", state.dusSilent, function(v) state.dusSilent = v == true; M.Set("sv_dus_silent", state.dusSilent); if state.dusSilent then startDusAim() else stopDusAim() end end)
secDus:Segmented("sv_dus_mode", "Target Mode", { "Killer", "Survivor" }, state.dusMode, function(v) state.dusMode = v; M.Set("sv_dus_mode", v) end)
secDus:Slider("sv_dus_predict", "Prediction", 0, 5, state.dusPredict, "", function(v) state.dusPredict = tonumber(v) or 0.5; M.Set("sv_dus_predict", state.dusPredict) end)
secDus:Toggle("sv_dus_button", "Target Mode Button", state.dusButton, function(v) state.dusButton = v == true; M.Set("sv_dus_button", state.dusButton); if state.dusButton then startDusButton() else stopDusButton() end end)

M.OnUnload(function() stopDusAim(); stopDusButton() end)
task.defer(function() booting = false; if state.dusSilent then startDusAim() end; if state.dusButton then startDusButton() end end)
end)


addModule(function(M)
local page = M.Page("killer")
local Players = M.Svc.Players
local WS, RUN = M.Svc.Workspace, M.Svc.RunService
local LP = M.Local

local rotLocks, rotLocked = {}, false
local function rotLock(hum, tag)
    tag = tag or "default"; rotLocks[tag] = true; rotLocked = true
    hum = hum or (LP.Character and LP.Character:FindFirstChildOfClass("Humanoid"))
    if hum and hum.Parent then hum.AutoRotate = false end
end
local function rotUnlock(hum, tag)
    if tag then rotLocks[tag] = nil else table.clear(rotLocks) end
    if next(rotLocks) ~= nil then return end
    hum = hum or (LP.Character and LP.Character:FindFirstChildOfClass("Humanoid"))
    if not rotLocked and tag ~= nil then return end
    rotLocked = false
    if hum and hum.Parent then hum.AutoRotate = true end
end
local function isKiller(ch)
    ch = ch or LP.Character
    return ch ~= nil and ch.Parent ~= nil and ch.Parent.Name == "Killers" and ch:IsDescendantOf(WS)
end
local function survFolder()
    local pl = WS:FindFirstChild("Players")
    return pl and pl:FindFirstChild("Survivors") or nil
end
local function rootOf(model)
    return model and model:FindFirstChild("HumanoidRootPart") or nil
end


local ABS_SOUND_IDS = { ["134932463887703"] = true, ["101489994047160"] = true }
local ABS_ANIM_IDS = { ["100725497418533"] = "Stab", ["89448354637442"] = "LungeStart" }
local ABS_MODEL_NAME = "TwoTime"
local ABS = { on = false, ring = false, range = 27, duration = 0.8, locked = false, hits = 0,
    soundConns = {}, animConns = {}, rings = {} }
local absTurn, absFrameConn
local function absTarget(model)
    local sv = survFolder()
    return sv ~= nil and sv:IsDescendantOf(WS) and model ~= nil
        and model:IsA("Model") and model.Parent == sv
        and (model.Name == ABS_MODEL_NAME or model:GetAttribute("CharacterName") == ABS_MODEL_NAME)
end
local function absRing(model)
    if not ABS.on or not ABS.ring or not isKiller() then return end
    if ABS.rings[model] or not model or not model.Parent then return end
    if not Players:GetPlayerFromCharacter(model) then return end
    local hrp = rootOf(model)
    if not hrp then return end
    local ring = Instance.new("Part")
    ring.Name = "KlAbsRing"; ring.Shape = Enum.PartType.Cylinder
    ring.Size = Vector3.new(0.1, ABS.range * 2, ABS.range * 2)
    ring.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90))
    ring.Color = Color3.fromRGB(220, 50, 50); ring.Material = Enum.Material.ForceField
    ring.Transparency = 0.5; ring.Anchored = false; ring.CanCollide = false
    ring.CanTouch = false; ring.CanQuery = false; ring.CastShadow = false
    ring.Massless = true; ring.Locked = true; ring.Parent = hrp
    local w = Instance.new("WeldConstraint")
    w.Part0 = hrp; w.Part1 = ring; w.Parent = ring
    ABS.rings[model] = ring
end
local function absRingOff(model)
    local r = ABS.rings[model]
    if r then pcall(function() r:Destroy() end) end
    ABS.rings[model] = nil
end
local function absRingsClear()
    for m in pairs(ABS.rings) do absRingOff(m) end
end
local function absRingsResize()
    for _, r in pairs(ABS.rings) do
        if r and r.Parent then r.Size = Vector3.new(0.1, ABS.range * 2, ABS.range * 2) end
    end
end
local function absRefreshRings()
    if not ABS.ring then absRingsClear() return end
    for m in pairs(ABS.animConns) do absRing(m) end
end
local function absEndTurn()
    local t = absTurn
    absTurn = nil; ABS.locked = false
    if t then pcall(rotUnlock, t.hum, "kl_abs") end
end
local function absTrigger(target)
    if not ABS.on or ABS.locked or not M.IsAlive() then return end
    if not isKiller() then return end
    local ch = LP.Character
    local myRoot = ch and rootOf(ch)
    local hum = ch and ch:FindFirstChildOfClass("Humanoid")
    if not (myRoot and hum and hum.Health > 0) then return end
    local model = target
    if not absTarget(model) or model == ch then return end
    local ttRoot = rootOf(model)
    if not (ttRoot and ttRoot.Parent) then return end
    if (myRoot.Position - ttRoot.Position).Magnitude > ABS.range then return end
    ABS.locked = true; ABS.hits += 1
    absTurn = { model = model, hum = hum, untilT = os.clock() + ABS.duration, hp0 = hum.Health }
    rotLock(hum, "kl_abs")
    M.Notify("Anti Backstab", "At least they tried")
end
local function absFrame()
    local t = absTurn
    if not t then return end
    if not ABS.on or not M.IsAlive() then absEndTurn() return end
    local model = t.model
    local ttRoot = (model and model.Parent) and rootOf(model) or nil
    local ch = LP.Character
    local myRoot = ch and rootOf(ch)
    local hum = ch and ch:FindFirstChildOfClass("Humanoid")
    if not (ttRoot and ttRoot.Parent and myRoot and hum) or hum ~= t.hum
        or os.clock() > t.untilT or (t.hp0 and hum.Health < t.hp0 - 0.5)
        or not absTarget(model) or not isKiller() then absEndTurn() return end
    local flat = Vector3.new(ttRoot.Position.X - myRoot.Position.X, 0, ttRoot.Position.Z - myRoot.Position.Z)
    if flat.Magnitude < 0.05 then absEndTurn() return end
    pcall(function()
        rotLock(hum, "kl_abs")
        myRoot.CFrame = CFrame.lookAt(myRoot.Position, Vector3.new(ttRoot.Position.X, myRoot.Position.Y, ttRoot.Position.Z))
    end)
end
local absUnbindSound, absBindSound
absUnbindSound = function(snd)
    local entry = ABS.soundConns[snd]
    ABS.soundConns[snd] = nil
    if entry then
        for _, c in ipairs(entry) do pcall(function() c:Disconnect() end) end
    end
end
absBindSound = function(snd, model)
    if not ABS.on or ABS.soundConns[snd] then return end
    if not (snd and snd:IsA("Sound") and snd:IsDescendantOf(model)) then return end
    local function check()
        if not ABS.on or not absTarget(model) or not snd:IsDescendantOf(model) then return end
        local ok, id = pcall(function() return tostring(snd.SoundId):match("%d+") end)
        if ok and id and ABS_SOUND_IDS[id] then absTrigger(model) end
    end
    ABS.soundConns[snd] = {
        snd.Played:Connect(check),
        snd:GetPropertyChangedSignal("IsPlaying"):Connect(function() if snd.IsPlaying then check() end end),
        snd:GetPropertyChangedSignal("SoundId"):Connect(function() if snd.IsPlaying then check() end end),
        snd.AncestryChanged:Connect(function() if not snd:IsDescendantOf(model) then absUnbindSound(snd) end end),
    }
    if snd.IsPlaying then check() end
end
local function absUnhookModel(model)
    local owner = ABS.animConns[model]
    ABS.animConns[model] = nil
    if owner then
        for _, c in ipairs(owner) do pcall(function() c:Disconnect() end) end
    end
    for snd in pairs(ABS.soundConns) do
        if not snd.Parent or not snd:IsDescendantOf(model) then absUnbindSound(snd) end
    end
    absRingOff(model)
end
local function absHookModel(model)
    if not ABS.on or not absTarget(model) or ABS.animConns[model] then return end
    local hum = model:FindFirstChildOfClass("Humanoid")
    local animator = hum and hum:FindFirstChildOfClass("Animator")
    if not animator then return end
    local owner = {}
    ABS.animConns[model] = owner
    owner[#owner + 1] = animator.AnimationPlayed:Connect(function(track)
        if not ABS.on or not absTarget(model) then return end
        local ok, aid = pcall(function() return track.Animation.AnimationId end)
        local id = ok and aid and tostring(aid):match("%d+")
        if id and ABS_ANIM_IDS[id] then absTrigger(model) end
    end)
    owner[#owner + 1] = model.DescendantAdded:Connect(function(d)
        if d:IsA("Sound") then task.defer(absBindSound, d, model) end
    end)
    owner[#owner + 1] = model.AncestryChanged:Connect(function()
        if not absTarget(model) then absUnhookModel(model) end
    end)
    for _, d in ipairs(model:GetDescendants()) do
        if d:IsA("Sound") then pcall(absBindSound, d, model) end
    end
    absRing(model)
end
local function absTick()
    if not ABS.on or not M.IsAlive() then return end
    local sv = survFolder()
    if sv then
        for _, model in ipairs(sv:GetChildren()) do pcall(absHookModel, model) end
    end
    for model in pairs(ABS.animConns) do
        if not absTarget(model) then absUnhookModel(model) end
    end
    if not ABS.ring then absRingsClear() end
    for model, r in pairs(ABS.rings) do
        if not absTarget(model) or not r.Parent then absRingOff(model) end
    end
end
local function absStart()
    if not ABS.on or not M.IsAlive() then return end
    if not isKiller() then M.Notify("Anti Backstab", "Not killer, waiting for killer round") return end
    if not absFrameConn then
        absFrameConn = RUN.RenderStepped:Connect(function()
            if not M.IsAlive() then return end
            pcall(absFrame)
        end)
        M.Bind(absFrameConn)
    end
    pcall(absTick)
end
local function absStop()
    ABS.on = false
    absEndTurn()
    if absFrameConn then
        pcall(function() absFrameConn:Disconnect() end)
        absFrameConn = nil
    end
    for model in pairs(ABS.animConns) do absUnhookModel(model) end
    for snd in pairs(ABS.soundConns) do absUnbindSound(snd) end
    table.clear(ABS.animConns); table.clear(ABS.soundConns); absRingsClear()
end
local function absSetOn(v)
    ABS.on = v and true or false
    if ABS.on then
        absStart()
        M.Notify("Anti Backstab", "On · watching TwoTime backstab/dash")
    else
        absStop()
        M.Notify("Anti Backstab", "Disabled")
    end
end


local STUN_ANIMS = {
    ["87259391926321"] = { char = "Guest1337", skill = "Punch" }, ["116618003477002"] = { char = "Shedletsky", skill = "Slash" },
    ["100725497418533"] = { char = "TwoTime", skill = "Stab" }, ["89448354637442"] = { char = "TwoTime", skill = "LungeStart" },
    ["133491532453922"] = { char = "Chance", skill = "AimGun" }, ["90499469533503"] = { char = "Chance", skill = "GunFire" },
}
local STUN_SOUNDS = {
    ["133398613783505"] = { char = "Guest1337", skill = "Punch" }, ["13471740561"] = { char = "Guest1337", skill = "CriticalPunch" },
    ["609342351"] = { char = "Guest1337", skill = "PunchWindup" }, ["12222208"] = { char = "Shedletsky", skill = "Slash" },
    ["134932463887703"] = { char = "TwoTime", skill = "Stab" }, ["101489994047160"] = { char = "TwoTime", skill = "CrouchStab" },
    ["139012439429121"] = { char = "Chance", skill = "GunWindUp" }, ["121120408563206"] = { char = "Chance", skill = "GunFire" },
}
local DODGE = { on = false, melee = 18, chance = 75, facing = false, notif = true, cd = 1.0,
    last = 0, hits = 0, conns = {} }
local function dodgeTarget(model)
    local sv = survFolder()
    return sv ~= nil and sv:IsDescendantOf(WS) and model ~= nil
        and model:IsA("Model") and model.Parent == sv
end

local function dodgeAbility()
    local ch = LP.Character
    if not ch then return nil end
    local base = tostring(ch:GetAttribute("CharacterName") or ch.Name):gsub("^[!#]", "")
    if base ~= "Slasher" and base ~= "JohnDoe" and base ~= "JoshDoe" then return nil end
    if buffer == nil then return nil end
    if base == "Slasher" then return "RagingPace", buffer.fromstring("\3\n\0\0\0RagingPace") end
    return "404Error", buffer.fromstring("\3\8\0\0\000404Error")
end
local function dodgeCdReady(abilityName)
    local pg = LP:FindFirstChild("PlayerGui")
    local mu = pg and pg:FindFirstChild("MainUI")
    local ac = mu and mu:FindFirstChild("AbilityContainer")
    local btn = ac and ac:FindFirstChild(abilityName)
    local lbl = btn and btn:FindFirstChild("CooldownTime")
    if lbl and lbl:IsA("TextLabel") then
        local txt = lbl.Text
        if txt ~= "" and txt ~= "0" and txt ~= "0.0" then
            local val = tonumber(txt:match("[%d%.]+"))
            if not val or val > 0 then return false end
        end
    end
    return true
end
local dodgeWarned = false
local function dodgeTry(info, model)
    if not DODGE.on or not info or not M.IsAlive() then return end
    local ch = LP.Character
    if not (ch and isKiller(ch)) then return end
    local hum = ch:FindFirstChildOfClass("Humanoid")
    if not (hum and hum.Health > 0) then return end
    local okA, abilityName, payload = pcall(dodgeAbility)
    if not okA or not abilityName or not payload then
        if not dodgeWarned then
            dodgeWarned = true
            M.Notify("Auto Dodge", "Current character has no counter skill (Slasher / John Doe)")
        end
        return
    end
    if os.clock() - DODGE.last < DODGE.cd then return end
    if not dodgeCdReady(abilityName) then return end
    local myRoot, sRoot = rootOf(ch), rootOf(model)
    if not (myRoot and sRoot) then return end
    local dist = (myRoot.Position - sRoot.Position).Magnitude
    local isChance = info.char == "Chance" or (info.skill and tostring(info.skill):find("Gun") ~= nil)
    if dist > (isChance and DODGE.chance or DODGE.melee) then return end
    if DODGE.facing then
        local toKiller = myRoot.Position - sRoot.Position
        if toKiller.Magnitude < 0.01 then return end
        if sRoot.CFrame.LookVector:Dot(toKiller.Unit) < 0.15 then return end
    end
    DODGE.last = os.clock()
    local fired = false
    pcall(function()
        local remote = M.Remote()
        if remote then
            remote:FireServer("UseActorAbility", { [1] = payload })
            fired = true
        end
    end)
    if fired then
        DODGE.hits += 1
        if DODGE.notif then
            M.Notify("Auto Dodge", string.format("%s vs %s (%s) %.0fm", abilityName, tostring(info.char), tostring(info.skill), dist))
        end
    end
end
local function dodgeUnhook(model)
    local list = DODGE.conns[model]
    DODGE.conns[model] = nil
    if list then
        for _, c in ipairs(list) do pcall(function() c:Disconnect() end) end
    end
end
local function dodgeHook(model)
    if not DODGE.on or not dodgeTarget(model) or DODGE.conns[model] then return end
    local list, seen = {}, {}
    DODGE.conns[model] = list
    local function soundCheck(snd)
        if not DODGE.on or not dodgeTarget(model) or not snd:IsDescendantOf(model) then return end
        local ok, id = pcall(function() return tostring(snd.SoundId):match("%d+") end)
        if ok and id and STUN_SOUNDS[id] then dodgeTry(STUN_SOUNDS[id], model) end
    end
    local function bindSound(snd)
        if not (snd and snd:IsA("Sound")) or seen[snd] then return end
        seen[snd] = true
        list[#list + 1] = snd.Played:Connect(function() soundCheck(snd) end)
        list[#list + 1] = snd:GetPropertyChangedSignal("IsPlaying"):Connect(function() if snd.IsPlaying then soundCheck(snd) end end)
        if snd.IsPlaying then soundCheck(snd) end
    end
    for _, d in ipairs(model:GetDescendants()) do
        if d:IsA("Sound") then pcall(bindSound, d) end
    end
    list[#list + 1] = model.DescendantAdded:Connect(function(d)
        if d:IsA("Sound") then task.defer(bindSound, d) end
    end)
    local hum = model:FindFirstChildOfClass("Humanoid")
    local animator = hum and hum:FindFirstChildOfClass("Animator")
    if animator then
        list[#list + 1] = animator.AnimationPlayed:Connect(function(track)
            if not DODGE.on or not dodgeTarget(model) then return end
            local ok, aid = pcall(function() return track.Animation.AnimationId end)
            local id = ok and aid and tostring(aid):match("%d+")
            if id and STUN_ANIMS[id] then dodgeTry(STUN_ANIMS[id], model) end
        end)
    end
    list[#list + 1] = model.AncestryChanged:Connect(function()
        if not dodgeTarget(model) then dodgeUnhook(model) end
    end)
end
local function dodgeTick()
    if not DODGE.on or not M.IsAlive() then return end
    local sv = survFolder()
    if sv then
        for _, model in ipairs(sv:GetChildren()) do pcall(dodgeHook, model) end
    end
    for model in pairs(DODGE.conns) do
        if not dodgeTarget(model) then dodgeUnhook(model) end
    end
end
local function dodgeSetOn(v)
    DODGE.on = v and true or false
    if DODGE.on then
        if not isKiller() then M.Notify("Auto Dodge", "Not killer, waiting for killer round")
        else M.Notify("Auto Dodge", "On · melee always dodges / ranged by chance radius") end
        pcall(dodgeTick)
    else
        for model in pairs(DODGE.conns) do dodgeUnhook(model) end
        M.Notify("Auto Dodge", "Disabled")
    end
end


local AIM = { on = false, untilT = 0, locked = nil, conn = nil, charHooks = {} }
local KILLER_AIM = { on = M.Get("kl_killer_aim") == true, target = nil, conn = nil, input = nil, locked = false }
local SIXER_AUTO_BITE = M.Get("kl_sixer_bite") == true

local azureMG = { running = false, originalNew = nil }
local function azureQteModule()
    local ok, mod = pcall(function()
        return require(M.Svc.ReplicatedStorage.Assets.Killers.Azure.Config.cl_WorkaroundModules.cl_ConstructQTE)
    end)
    if ok and type(mod) == "table" then return mod end
    return nil
end
local function startAzureMG()
    if azureMG.running then return end
    local mod = azureQteModule()
    if not mod then M.Notify("Azure", "QTE module not found") return end
    azureMG.running = true
    if not azureMG.originalNew then azureMG.originalNew = mod.new end
    mod.new = function(...)
        local obj = azureMG.originalNew(...)
        if obj and type(obj.AddProgress) == "function" then
            task.spawn(function()
                local started = os.clock()
                while azureMG.running and os.clock() - started < 8 do task.wait(0.2) end
                if azureMG.running then pcall(function() obj:AddProgress(100) end) end
            end)
        end
        return obj
    end
end
local function stopAzureMG()
    azureMG.running = false
    local mod = azureQteModule()
    if mod and azureMG.originalNew then pcall(function() mod.new = azureMG.originalNew end) end
end
local nosMGThread = nil
local function startNosMG()
    if nosMGThread then return end
    nosMGThread = task.spawn(function()
        while M.IsAlive() and nosMGThread do
            task.wait(0.08 + math.random() * 0.07)
            pcall(function()
                local pg = LP:FindFirstChild("PlayerGui")
                local tu = pg and pg:FindFirstChild("TemporaryUI")
                if not tu then return end
                local qte = tu:FindFirstChild("QTE")
                if not qte then
                    for _, c in ipairs(tu:GetChildren()) do
                        if c:FindFirstChild("ActiveButton") or c:FindFirstChild("Line") then qte = c break end
                    end
                end
                if not qte then return end
                local btn = qte:FindFirstChild("ActiveButton", true)
                if not btn then return end
                if getconnections then
                    for _, c in ipairs(getconnections(btn.MouseButton1Down)) do
                        pcall(function() c.Function() end)
                    end
                    local act = btn.Activated or btn.MouseButton1Click
                    if act then
                        for _, c in ipairs(getconnections(act)) do
                            pcall(function() if c.Function then c.Function() end end)
                        end
                    end
                else
                    pcall(function() btn:Activate() end)
                end
            end)
        end
        nosMGThread = nil
    end)
end
local function stopNosMG()
    local t = nosMGThread
    nosMGThread = nil
    if t then pcall(task.cancel, t) end
end
local sixerHookInstalled = false
local function ensureSixerHook()
    if sixerHookInstalled or not SIXER_AUTO_BITE then return end
    if not hookmetamethod or not getnamecallmethod then return end
    local rem = M.Remote(); if not rem then return end
    local ok = pcall(function()
        local old
        old = hookmetamethod(game, "__namecall", function(self, ...)
            if SIXER_AUTO_BITE and rawequal(self, rem) and getnamecallmethod() == "FireServer" then
                local args = { ... }
                if args[1] == LP.Name .. "666BiteCancel" then return nil end
            end
            return old(self, ...)
        end)
    end)
    sixerHookInstalled = ok
end
local function aimClearCharHooks()
    for _, c in ipairs(AIM.charHooks) do pcall(function() c:Disconnect() end) end
    table.clear(AIM.charHooks)
end
local function aimStop()
    AIM.untilT = 0; AIM.locked = nil
    aimClearCharHooks()
    if AIM.conn then
        pcall(function() AIM.conn:Disconnect() end)
        AIM.conn = nil
    end
    if rotLocks["kl_m1"] then pcall(rotUnlock, nil, "kl_m1") end
end

local function aimLOS(myRoot, tRoot)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    local ex = { LP.Character }
    local sv = survFolder()
    if sv then table.insert(ex, sv) end
    params.FilterDescendantsInstances = ex
    params.IgnoreWater = true
    local ok, hit = pcall(function() return WS:Raycast(myRoot.Position, tRoot.Position - myRoot.Position, params) end)
    if not ok then return true end
    return hit == nil
end
local function aimPick(myRoot)
    local sv = survFolder()
    if not sv then return nil end
    local best, bestD = nil, 15
    for _, model in ipairs(sv:GetChildren()) do
        if model:IsA("Model") and model ~= LP.Character and not model:GetAttribute("Undetectable") then
            local hrp = rootOf(model)
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local d = (hrp.Position - myRoot.Position).Magnitude
                if d <= bestD and aimLOS(myRoot, hrp) then best, bestD = hrp, d end
            end
        end
    end
    return best
end
local function aimStep()
    if not AIM.on or not M.IsAlive() then pcall(aimStop) return end
    if os.clock() > AIM.untilT then
        AIM.locked = nil
        if rotLocks["kl_m1"] then pcall(rotUnlock, nil, "kl_m1") end
        return
    end
    local ch = LP.Character
    if not isKiller(ch) then return end
    local myRoot = rootOf(ch)
    local hum = ch:FindFirstChildOfClass("Humanoid")
    if not (myRoot and hum and hum.Health > 0) then return end
    local target = nil
    local locked = AIM.locked
    if locked and locked.Parent then
        local tm = locked.Parent
        local th = tm:FindFirstChildOfClass("Humanoid")
        if tm.Parent and tm.Parent.Name == "Survivors" and not tm:GetAttribute("Undetectable")
            and th and th.Health > 0 and (locked.Position - myRoot.Position).Magnitude <= 16.5 then
            target = locked
        end
    end
    if not target then
        target = aimPick(myRoot)
        AIM.locked = target
    end
    if not target then
        if rotLocks["kl_m1"] then pcall(rotUnlock, hum, "kl_m1") end
        return
    end
    if not aimLOS(myRoot, target) then return end
    local flat = Vector3.new(target.Position.X - myRoot.Position.X, 0, target.Position.Z - myRoot.Position.Z)
    if flat.Magnitude > 0.05 then
        rotLock(hum, "kl_m1")
        pcall(function() myRoot.AssemblyAngularVelocity = Vector3.zero end)
        myRoot.CFrame = CFrame.lookAt(myRoot.Position, Vector3.new(target.Position.X, myRoot.Position.Y, target.Position.Z))
    end
end

local function aimTrigger()
    if not AIM.on or not M.IsAlive() or not isKiller() then return end
    AIM.untilT = os.clock() + 0.42
    if not AIM.conn then
        AIM.conn = RUN.RenderStepped:Connect(function()
            if not M.IsAlive() then return end
            pcall(aimStep)
        end)
        M.Bind(AIM.conn)
    end
end
local function aimAttach()
    aimClearCharHooks()
    local ch = LP.Character
    if not (AIM.on and ch) then return end
    local hum = ch:FindFirstChildOfClass("Humanoid")
    local animator = hum and hum:FindFirstChildOfClass("Animator")
    if animator then
        table.insert(AIM.charHooks, animator.AnimationPlayed:Connect(function()
            if AIM.on then pcall(aimTrigger) end
        end))
    end
    table.insert(AIM.charHooks, ch.DescendantAdded:Connect(function(d)
        if d:IsA("Sound") then
            table.insert(AIM.charHooks, d.Played:Connect(function() if AIM.on then pcall(aimTrigger) end end))
        end
    end))
    for _, d in ipairs(ch:GetDescendants()) do
        if d:IsA("Sound") then
            table.insert(AIM.charHooks, d.Played:Connect(function() if AIM.on then pcall(aimTrigger) end end))
        end
    end
end
local function aimSetOn(v)
    AIM.on = v and true or false
    if AIM.on then
        if not isKiller() then M.Notify("M1 Aim", "Not killer; enables automatically when you attack") end
        pcall(aimAttach)
        M.Notify("M1 Aim", "On")
    else
        pcall(aimStop)
        M.Notify("M1 Aim", "Disabled")
    end
end



local function killerAimPick()
    local cam = WS.CurrentCamera; local f = WS:FindFirstChild("Players") and WS.Players:FindFirstChild("Survivors")
    if not cam or not f then return nil end
    local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2); local best, bd = nil, 350
    for _, m in ipairs(f:GetChildren()) do local r,h=m:FindFirstChild("HumanoidRootPart"),m:FindFirstChildOfClass("Humanoid"); if r and h and h.Health>0 then local p,on=cam:WorldToViewportPoint(r.Position); if on then local d=(Vector2.new(p.X,p.Y)-center).Magnitude; if d<bd then best,bd=m,d end end end end
    return best
end
local function stopKillerAim()
    if KILLER_AIM.conn then pcall(function() KILLER_AIM.conn:Disconnect() end); KILLER_AIM.conn=nil end
    if KILLER_AIM.input then pcall(function() KILLER_AIM.input:Disconnect() end); KILLER_AIM.input=nil end
    KILLER_AIM.target=nil; KILLER_AIM.locked=false
end
local function startKillerAim()
    stopKillerAim(); if not KILLER_AIM.on then return end
    KILLER_AIM.input = M.Svc.UserInputService.InputBegan:Connect(function(i,gp) if not gp and i.KeyCode == Enum.KeyCode.V then KILLER_AIM.locked = not KILLER_AIM.locked; if KILLER_AIM.locked then KILLER_AIM.target = killerAimPick() end end end); M.Bind(KILLER_AIM.input)
    KILLER_AIM.conn = M.Svc.RunService.RenderStepped:Connect(function()
        if not M.IsAlive() or not KILLER_AIM.on or not KILLER_AIM.locked then return end
        local c = LP.Character; local h = c and c:FindFirstChildOfClass("Humanoid"); local r = c and c:FindFirstChild("HumanoidRootPart"); local t = KILLER_AIM.target; local tr = t and t:FindFirstChild("HumanoidRootPart")
        if not (r and h and tr and t.Parent) then KILLER_AIM.target = killerAimPick(); return end
        h.AutoRotate = false; r.CFrame = CFrame.lookAt(r.Position, Vector3.new(tr.Position.X, r.Position.Y, tr.Position.Z))
    end); M.Bind(KILLER_AIM.conn)
end
local function setKillerAim(v) KILLER_AIM.on = v == true; M.Set("kl_killer_aim", KILLER_AIM.on); if KILLER_AIM.on then startKillerAim() else stopKillerAim() end end
local secGeneral = page:Section("General", "GENERAL")
local secAbs = page:Section("Anti Backstab", "ANTI BACKSTAB", "Predict and snap-turn on TwoTime backstab/dash animations")
local secDodge = page:Section("Auto Dodge", "AUTO DODGE", "Slasher Raging Pace · John Doe 404 Error")
secGeneral:Toggle("kl_killer_aim", "Killer Aimbot", KILLER_AIM.on, function(v) setKillerAim(v) end)
secGeneral:Toggle("kl_sixer_bite", "Sixer Auto Bite", SIXER_AUTO_BITE, function(v) SIXER_AUTO_BITE = v == true; M.Set("kl_sixer_bite", SIXER_AUTO_BITE); if SIXER_AUTO_BITE then ensureSixerHook() end end)
secGeneral:Label("Press V to lock/unlock the survivor near the screen center; Sixer Auto Bite is a state toggle.")
secGeneral:Toggle("kl_az_mg", "Azure Auto Minigame", M.Get("kl_az_mg") == true, function(v)
    M.Set("kl_az_mg", v == true)
    if v then startAzureMG() else stopAzureMG() end
end)
secGeneral:Label("Azure QTE completes ~8s after install (not instant).")
secGeneral:Toggle("kl_nos_mg", "Nosferatu Auto Minigame", M.Get("kl_nos_mg") == true, function(v)
    M.Set("kl_nos_mg", v == true)
    if v then startNosMG() else stopNosMG() end
end)
secGeneral:Toggle("kl_m1aim", "M1 Aim", false, function(v) pcall(aimSetOn, v) end)
secAbs:Toggle("kl_abs", "Anti Backstab", false, function(v) pcall(absSetOn, v) end)
secAbs:Toggle("kl_abs_ring", "Show Range Ring", false, function(v) ABS.ring = v and true or false; pcall(absRefreshRings) end)
secAbs:Slider("kl_abs_range", "Detect Range", 10, 120, 27, function(n) ABS.range = math.clamp(tonumber(n) or 27, 10, 120); pcall(absRingsResize) end)
secAbs:Slider("kl_abs_dur", "Turn Duration", 0.15, 2, 0.8, function(n) ABS.duration = math.clamp(tonumber(n) or 0.8, 0.15, 2) end)
secDodge:Toggle("kl_dodge", "Auto Dodge", false, function(v) pcall(dodgeSetOn, v) end)
secDodge:Slider("kl_dodge_melee", "Melee Radius", 8, 30, 18, function(n) DODGE.melee = math.clamp(tonumber(n) or 18, 8, 30) end)
secDodge:Slider("kl_dodge_chance", "Gun Chance Radius", 30, 100, 75, function(n) DODGE.chance = math.clamp(tonumber(n) or 75, 30, 100) end)
secDodge:Toggle("kl_dodge_facing", "Facing Check", false, function(v) DODGE.facing = v and true or false end)
secDodge:Toggle("kl_dodge_notif", "Screen Notice", true, function(v) DODGE.notif = v and true or false end)
secDodge:Slider("kl_dodge_cd", "Debounce Cooldown", 0.2, 3, 1, function(n) DODGE.cd = math.clamp(tonumber(n) or 1, 0.2, 3) end)


M.Every(1, function()
    if not M.IsAlive() then return end
    if ABS.on then pcall(absTick) end
end)
M.Every(1, function()
    if not M.IsAlive() then return end
    if DODGE.on then pcall(dodgeTick) end
end)
M.Bind(LP.CharacterAdded:Connect(function()
    task.wait(0.4)
    if not M.IsAlive() then return end
    if AIM.on then pcall(aimAttach) end
    if ABS.on then pcall(absTick) end
    if DODGE.on then pcall(dodgeTick) end
end))
M.OnUnload(function()
    stopAzureMG()
    stopNosMG()
    stopKillerAim()
    pcall(aimStop)
    pcall(absStop)
    for model in pairs(DODGE.conns) do pcall(dodgeUnhook, model) end
    DODGE.on = false; ABS.on = false; AIM.on = false
    pcall(function()
        table.clear(rotLocks); rotLocked = false
        local ch = LP.Character
        local hum = ch and ch:FindFirstChildOfClass("Humanoid")
        if hum and hum.Parent then hum.AutoRotate = true end
    end)
end)
end)


addModule(function(M)
local page = M.Page("killer")
local RS, WS = M.Svc.ReplicatedStorage, M.Svc.Workspace
local RunService, UIS, LP = M.Svc.RunService, M.Svc.UserInputService, M.Local
local function alive() return M.IsAlive() end


local st = {
  rushCtrl = false, turnStr = 5.5, rushAim = false, speedOn = false, dashSpeed = 60,
  antiCrash = false, autoNova = false, novaRadius = 14,
  nosQTE = false, qteDelay = 85, batsAim = false,
  spireCtrl = false, spireTurn = 28, ascentCtrl = false, diveTurn = 14,
  ascentAim = false, aimTarget = "Nearest to Impact",
  azQTE = false, azStepDelay = 160, azGrabAim = false, azNoGrabStam = false,
  novaAcc = 0, lastNovaFireAt = 0, noliOrigDash = 60,
  detonated = {}, prevNovaDist = {}, rotLocks = {}, savedAuto = {},
}


local function getChar() return LP and LP.Character end
local function getHrp(ch) return ch and ch:FindFirstChild("HumanoidRootPart") end
local function getHum(ch) return ch and ch:FindFirstChildOfClass("Humanoid") end
local function attr(inst, n)
  if not inst then return nil end
  local ok, v = pcall(function() return inst:GetAttribute(n) end)
  return ok and v or nil
end
local function isKiller(ch, n) return (ch and ch.Parent) ~= nil and (ch.Name == n or attr(ch, "CharacterName") == n) end
local function tryRequire(path)
  local ok, mod = pcall(function() return require(path) end)
  return (ok and type(mod) == "table") and mod or nil
end
local function remote()
  local ok, r = pcall(function() return M.Remote() end)
  return ok and r or nil
end


local function rotLock(hum, key)
  if not hum then return end
  st.rotLocks[key] = true
  if st.savedAuto[key] == nil then
    local ok, v = pcall(function() return hum.AutoRotate end)
    st.savedAuto[key] = ok and v or true
  end
  pcall(function() hum.AutoRotate = false end)
end
local function rotUnlock(hum, key)
  local was = st.savedAuto[key]
  st.savedAuto[key], st.rotLocks[key] = nil, nil
  if hum and was ~= nil then pcall(function() hum.AutoRotate = was end) end
end

local losParams = RaycastParams.new()
losParams.FilterType, losParams.IgnoreWater = Enum.RaycastFilterType.Exclude, true
local function hasLos(fromPos, myChar, targetChar, toPos)
  losParams.FilterDescendantsInstances = { myChar, targetChar }
  local ok, hit = pcall(function() return WS:Raycast(fromPos, toPos - fromPos, losParams) end)
  return (not ok) or hit == nil
end
local function survivorFolder()
  local pf = WS:FindFirstChild("Players")
  return pf and pf:FindFirstChild("Survivors")
end
local function nearestSurvivorHrp(refPos, maxDist, losFrom)
  local sf = survivorFolder()
  if not sf then return nil end
  local best, bestD = nil, maxDist or math.huge
  for _, surv in ipairs(sf:GetChildren()) do
    if surv:IsA("Model") and not attr(surv, "Undetectable") then
      local hrp, hum = surv:FindFirstChild("HumanoidRootPart"), surv:FindFirstChildOfClass("Humanoid")
      if hrp and hum and hum.Health > 0 then
        local d = (hrp.Position - refPos).Magnitude
        if d < bestD and (not losFrom or hasLos(losFrom, getChar(), surv, hrp.Position)) then best, bestD = hrp, d end
      end
    end
  end
  return best
end
local function flatUnit(v)
  local f = Vector3.new(v.X, 0, v.Z)
  return f.Magnitude > 1e-4 and f.Unit or nil
end
local function rotateToward(cur, tgt, maxRad)
  if math.acos(math.clamp(cur:Dot(tgt), -1, 1)) <= maxRad then return tgt end
  local axis = cur:Cross(tgt)
  return axis.Magnitude < 1e-5 and cur or (CFrame.fromAxisAngle(axis.Unit, maxRad) * cur).Unit
end

local function steerHrp(hrp, hum, aimPos, key, maxRadPerSec, dt)
  local cur, tgt = flatUnit(hrp.CFrame.LookVector), flatUnit(Vector3.new(aimPos.X - hrp.Position.X, 0, aimPos.Z - hrp.Position.Z))
  if not (cur and tgt) then return end
  local dir = rotateToward(cur, tgt, math.max(0.02, maxRadPerSec * math.clamp(dt or (1 / 60), 0, 0.1)))
  rotLock(hum, key)
  pcall(function()
    hrp.AssemblyAngularVelocity = Vector3.zero
    hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir)
  end)
end


local actorsMod, netMod, sprintingMod, projMod
local azBehaviorMod, origGrabStamFn, constructQteMod, origConstructNew
local function getMyActor()
  if not actorsMod then actorsMod = tryRequire(RS.Modules.Gameplay.Actors) end
  if not actorsMod then return nil end
  local ok, act = pcall(function()
    local cur = actorsMod.CurrentActors
    if type(cur) ~= "table" then return nil end
    if type(cur[LP]) == "table" then return cur[LP] end
    for _, v in pairs(cur) do
      if type(v) == "table" and (v.Player == LP or v.Rig == getChar()) then return v end
    end
    return nil
  end)
  return ok and act or nil
end


local noliSaved, noliCfgTables = setmetatable({}, { __mode = "k" }), setmetatable({}, { __mode = "k" })
local function patchNoliConfig(cfg)
  if type(cfg) ~= "table" or (cfg.VoidRushTurnSpeed == nil and cfg.VoidRushDashSpeed == nil) then return end
  local orig = noliSaved[cfg]
  if not orig then
    orig = {
      turn = tonumber(cfg.VoidRushTurnSpeed) or 1, mult = tonumber(cfg.VoidRushInitialTurnMult) or 6.6,
      dur = tonumber(cfg.VoidRushInitialTurnDuration) or 1.5, spd = tonumber(cfg.VoidRushDashSpeed) or 60,
    }
    noliSaved[cfg] = orig
  end
  if alive() and (st.rushCtrl or st.rushAim) then
    
    
    local curved = math.clamp((st.turnStr - 1.0) / 15.0, 0.0, 1.0) ^ 1.35
    local baseTurn = (orig.turn > 1e-4) and orig.turn or 0.15
    local newTurn = baseTurn * (1.0 + curved * 6.5)
    if st.rushAim then newTurn = math.max(newTurn, 1.5 + curved * 6.0) end
    local origPeak = baseTurn * ((orig.mult or 6.6) + 1.0)
    local targetPeak = math.max(newTurn, origPeak * (1.0 + curved * 0.25))
    cfg.VoidRushTurnSpeed = newTurn
    cfg.VoidRushInitialTurnMult = math.max(0.0, (targetPeak / math.max(newTurn, 1e-4)) - 1.0)
    cfg.VoidRushInitialTurnDuration = orig.dur
  else
    cfg.VoidRushTurnSpeed, cfg.VoidRushInitialTurnMult, cfg.VoidRushInitialTurnDuration = orig.turn, orig.mult, orig.dur
  end
  st.noliOrigDash = orig.spd
  cfg.VoidRushDashSpeed = (alive() and st.speedOn) and st.dashSpeed or orig.spd
end
local function syncNoliConfigs()
  pcall(function()
    local assets = RS:FindFirstChild("Assets")
    local killers = assets and assets:FindFirstChild("Killers")
    local noliDir = killers and killers:FindFirstChild("Noli")
    local cfgMod = noliDir and noliDir:FindFirstChild("Config")
    if cfgMod and cfgMod:IsA("ModuleScript") then
      local cfg = tryRequire(cfgMod)
      if cfg then noliCfgTables[cfg] = true patchNoliConfig(cfg) end
    end
    local ch = getChar()
    local skin = attr(ch, "SkinName")
    if type(skin) == "string" and skin ~= "" then
      local skins = assets and assets:FindFirstChild("Skins")
      local sk = skins and skins:FindFirstChild("Killers")
      local ns = sk and sk:FindFirstChild("Noli")
      local folder = ns and ns:FindFirstChild(skin)
      local scm = folder and folder:FindFirstChild("Config")
      if scm and scm:IsA("ModuleScript") then
        local cfg = tryRequire(scm)
        if cfg then patchNoliConfig(cfg) end
      end
    end
    local act = getMyActor()
    if act and type(act.Config) == "table" then patchNoliConfig(act.Config) end
    for cfg in pairs(noliCfgTables) do patchNoliConfig(cfg) end
    
    if isKiller(ch, "Noli") then
      local sm = ch:FindFirstChild("SpeedMultipliers")
      local dm = sm and sm:FindFirstChild("VoidRushDash")
      if dm and dm:IsA("NumberValue") then
        dm.Value = ((alive() and st.speedOn) and st.dashSpeed or (st.noliOrigDash or 60)) / 8
      end
    end
  end)
end


local renderBound = {}
local function bindRender(key, name, prio, fn)
  if renderBound[key] then return end
  renderBound[key] = true
  pcall(function()
    RunService:UnbindFromRenderStep(name)
    RunService:BindToRenderStep(name, prio, fn)
  end)
end
local function unbindRender(key, name)
  if not renderBound[key] then return end
  renderBound[key] = nil
  pcall(function() RunService:UnbindFromRenderStep(name) end)
end


local NOLI_STEP = "kl_NoliRushAim"
local function stepNoliAim(dt)
  if not (alive() and st.rushAim) then unbindRender("noli", NOLI_STEP) return end
  local ch = getChar()
  if not isKiller(ch, "Noli") then unbindRender("noli", NOLI_STEP) return end
  local hrp, hum = getHrp(ch), getHum(ch)
  if not (hrp and hum and hum.Health > 0) then unbindRender("noli", NOLI_STEP) return end
  local dashing = (attr(ch, "VoidRushState") == "Dashing")
  local sm = ch:FindFirstChild("SpeedMultipliers")
  if sm and sm:FindFirstChild("VoidRushDash") then dashing = true end
  if not dashing then
    unbindRender("noli", NOLI_STEP)
    rotUnlock(hum, "kl_noli_aim")
    return
  end
  local tHrp = nearestSurvivorHrp(hrp.Position, 96, hrp.Position)
  if not tHrp then return end
  local spd = tonumber(hrp.AssemblyLinearVelocity.Magnitude) or 60
  local leadT = math.clamp((tHrp.Position - hrp.Position).Magnitude / math.max(spd, 40), 0.02, 0.30)
  local vel = tHrp.AssemblyLinearVelocity
  
  steerHrp(hrp, hum, tHrp.Position + Vector3.new(vel.X, 0, vel.Z) * leadT, "kl_noli_aim",
    3.0 + math.clamp((st.turnStr - 1.0) / 15.0, 0.0, 1.0) * 13.0, dt)
end




local crashParams = RaycastParams.new()
crashParams.FilterType, crashParams.IgnoreWater = Enum.RaycastFilterType.Exclude, true
local function antiCrashStep()
  local ch = getChar()
  local hrp = isKiller(ch, "Noli") and getHrp(ch)
  if not hrp then return end
  local look = flatUnit(hrp.CFrame.LookVector)
  if not look then return end
  crashParams.FilterDescendantsInstances = { ch }
  local ok, hit = pcall(function() return WS:Raycast(hrp.Position + look * 1.2, look * 8.5, crashParams) end)
  if not (ok and hit) or math.abs(hit.Normal.Y) > 0.7 then return end
  local n = hit.Normal
  local tangent = look - n * look:Dot(n)
  tangent = (tangent.Magnitude > 1e-3) and tangent.Unit or Vector3.new(-n.Z, 0, n.X).Unit
  pcall(function()
    hrp.AssemblyLinearVelocity = tangent * math.max(hrp.AssemblyLinearVelocity.Magnitude, 55)
    hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + tangent)
  end)
end


local function autoNovaStep(dt)
  if not (alive() and st.autoNova) then return end
  st.novaAcc += (dt or 0.016)
  if st.novaAcc < 0.033 then return end 
  st.novaAcc = 0
  if not isKiller(getChar(), "Noli") then return end
  if not projMod then projMod = tryRequire(RS.Systems.Player.Game.ProjectileReplication) end
  local live = projMod and projMod.Projectiles
  if type(live) ~= "table" or next(live) == nil then
    if next(st.prevNovaDist) ~= nil then table.clear(st.prevNovaDist) end
    return
  end
  local now = os.clock()
  if now - st.lastNovaFireAt < 0.45 then return end
  local sf = survivorFolder()
  if not sf then return end
  for id, p in pairs(live) do
    local mdl = type(p) == "table" and p.Model
    if not st.detonated[id] and typeof(mdl) == "Instance" and mdl.Parent then
      local nm = mdl.Name
      if nm == "Voidstar" or nm:find("Voidstar") or nm:find("Nova") then
        local okP, pos = pcall(function() return mdl:IsA("BasePart") and mdl.Position or mdl:GetPivot().Position end)
        if okP and pos then
          local bestD = math.huge
          for _, surv in ipairs(sf:GetChildren()) do
            if surv:IsA("Model") and not attr(surv, "Undetectable") then
              local sHrp, sHum = surv:FindFirstChild("HumanoidRootPart"), surv:FindFirstChildOfClass("Humanoid")
              if sHrp and sHum and sHum.Health > 0 then bestD = math.min(bestD, (sHrp.Position - pos).Magnitude) end
            end
          end
          if bestD <= st.novaRadius then
            local prevD = st.prevNovaDist[id]
            if bestD <= st.novaRadius * 0.65 or (prevD ~= nil and bestD >= prevD - 0.08) then
              st.prevNovaDist[id] = nil
              st.detonated[id], st.lastNovaFireAt = now, now
              local r = remote()
              if r then
                pcall(function()
                  r:FireServer("UseActorAbility", { [1] = buffer.fromstring("\3\4\0\0\0Nova") })
                end)
              end
              return
            end
          end
          st.prevNovaDist[id] = bestD
        end
      end
    end
  end
  for id in pairs(st.prevNovaDist) do
    if live[id] == nil then st.prevNovaDist[id] = nil end
  end
  for id, t0 in pairs(st.detonated) do
    if live[id] == nil or (now - t0) > 10 then st.detonated[id] = nil end
  end
end


local nosSaved = setmetatable({}, { __mode = "k" })
local function patchNosConfig(cfg, restore)
  if type(cfg) ~= "table" then return end
  if type(cfg.Spire) ~= "table" and type(cfg.Ascent) ~= "table" and type(cfg.AscentBite) ~= "table" then return end
  local orig = nosSaved[cfg]
  if not orig then
    orig = {
      spire = (type(cfg.Spire) == "table" and tonumber(cfg.Spire.TurnControl)) or 10,
      canTurn = (type(cfg.Ascent) == "table" and cfg.Ascent.CanTurn == true) or false,
      dive = (type(cfg.AscentBite) == "table" and tonumber(cfg.AscentBite.TurnSpeed)) or 4,
    }
    nosSaved[cfg] = orig
  end
  local on = (not restore) and alive()
  
  if type(cfg.Spire) == "table" then
    cfg.Spire.TurnControl = (on and st.spireCtrl) and math.clamp(st.spireTurn, 10, 50) or orig.spire
  end
  if type(cfg.Ascent) == "table" then cfg.Ascent.CanTurn = (on and st.ascentCtrl) and true or orig.canTurn end
  if type(cfg.AscentBite) == "table" then
    cfg.AscentBite.TurnSpeed = (on and st.ascentCtrl) and math.clamp(st.diveTurn, 4, 25) or orig.dive
  end
end
local function syncNosferatuConfigs(restore)
  pcall(function()
    local assets = RS:FindFirstChild("Assets")
    local killers = assets and assets:FindFirstChild("Killers")
    local nosDir = killers and killers:FindFirstChild("Nosferatu")
    local cfgMod = nosDir and nosDir:FindFirstChild("Config")
    if cfgMod and cfgMod:IsA("ModuleScript") then
      local cfg = tryRequire(cfgMod)
      if cfg then patchNosConfig(cfg, restore) end
    end
    local skins = assets and assets:FindFirstChild("Skins")
    local sk = skins and skins:FindFirstChild("Killers")
    local ns = sk and sk:FindFirstChild("Nosferatu")
    if ns then
      for _, folder in ipairs(ns:GetChildren()) do
        local cm = folder:FindFirstChild("Config")
        if cm and cm:IsA("ModuleScript") then
          local cfg = tryRequire(cm)
          if cfg then patchNosConfig(cfg, restore) end
        end
      end
    end
    local act = getMyActor()
    if act and type(act.Config) == "table" and isKiller(act.Rig or getChar(), "Nosferatu") then
      patchNosConfig(act.Config, restore)
    end
    for cfg in pairs(nosSaved) do patchNosConfig(cfg, restore) end
  end)
end


local BATS_STEP = "kl_NosBatsAim"
local function stepBatsAim(dt)
  if not (alive() and st.batsAim) then unbindRender("bats", BATS_STEP) return end
  local ch = getChar()
  if not isKiller(ch, "Nosferatu") then unbindRender("bats", BATS_STEP) return end
  local hrp, hum = getHrp(ch), getHum(ch)
  if not (hrp and hum and hum.Health > 0) then unbindRender("bats", BATS_STEP) return end
  local act = getMyActor()
  local state = act and type(act.State) == "table" and act.State or nil
  if not (state and (state.BatsThrowing == true or state.Spire == true or state.Slash == true)) then
    unbindRender("bats", BATS_STEP)
    rotUnlock(hum, "kl_nos_bats")
    return
  end
  
  
  local refPos = hrp.Position
  pcall(function()
    local map = WS:FindFirstChild("Map")
    local ing = map and map:FindFirstChild("Ingame")
    if not ing then return end
    for _, inst in ipairs(ing:GetChildren()) do
      if (inst:IsA("BasePart") or inst:IsA("Model")) and (inst.Name == "Bats" or inst.Name:find("Bats", 1, true)) then
        refPos = inst:IsA("BasePart") and inst.Position or inst:GetPivot().Position
        return
      end
      if inst:IsA("BasePart") then
        local snd = inst:FindFirstChildOfClass("Sound")
        if snd and snd.IsPlaying and tostring(snd.SoundId):find("104283479568709", 1, true) then
          refPos = inst.Position
          return
        end
      end
    end
  end)
  local tHrp = nearestSurvivorHrp(refPos, 160, hrp.Position)
  if not tHrp then return end
  steerHrp(hrp, hum, tHrp.Position, "kl_nos_bats", 4.0 + math.clamp((st.turnStr - 1.0) / 15.0, 0.0, 1.0) * 10.0, dt)
end


local qteConns, qteSeen = {}, setmetatable({}, { __mode = "k" })
local activeQteFrame, vim = nil, nil
pcall(function() vim = game:GetService("VirtualInputManager") end)
local KEYCODES = { W = Enum.KeyCode.W, A = Enum.KeyCode.A, S = Enum.KeyCode.S, D = Enum.KeyCode.D }
local function clearQteConns()
  activeQteFrame = nil
  for i = #qteConns, 1, -1 do
    local c = qteConns[i]
    qteConns[i] = nil
    pcall(function() c:Disconnect() end)
  end
end
local function stepBloodhookQTE()
  if not (alive() and st.nosQTE) then return end
  local frame = activeQteFrame
  if not (frame and frame.Parent) then
    activeQteFrame = nil
    return
  end
  local tempUi, pcRef = frame.Parent, frame:FindFirstChild("PC")
  for _, btn in ipairs(frame:GetChildren()) do
    if btn ~= pcRef and btn:IsA("GuiObject") and btn.Visible and not qteSeen[btn] then
      local posOk = btn.Position.X.Scale < 0.65
      local transOk = not (btn:IsA("ImageLabel") or btn:IsA("ImageButton")) or btn.ImageTransparency < 0.25
      if posOk and transOk then
        qteSeen[btn] = true
        task.delay(math.clamp(st.qteDelay, 20, 300) / 1000, function()
          if not (alive() and st.nosQTE) then return end
          if not (frame and frame.Parent == tempUi and btn and btn.Parent == frame and btn.Visible) then return end
          if btn:IsA("GuiButton") and type(firesignal) == "function" then
            pcall(function()
              if btn.MouseButton1Click then firesignal(btn.MouseButton1Click) end
              if btn.Activated then firesignal(btn.Activated) end
            end)
          end
          local tl = btn:FindFirstChild("TextLabel") or btn:FindFirstChildWhichIsA("TextLabel", true)
          local kch = tl and tostring(tl.Text or ""):upper():match("[WASD]") or nil
          local kc = kch and KEYCODES[kch] or nil
          if kc and vim then
            local wasHeld = false
            pcall(function() wasHeld = UIS:IsKeyDown(kc) end)
            pcall(function() vim:SendKeyEvent(true, kc, false, game) end)
            task.delay(0.025, function()
              if not wasHeld and vim then pcall(function() vim:SendKeyEvent(false, kc, false, game) end) end
            end)
          end
        end)
      end
    end
  end
end
local function bindQteWatchers()
  clearQteConns()
  if not (alive() and st.nosQTE) then return end
  local pg = LP:FindFirstChild("PlayerGui")
  if not pg then return end
  local function onCandidate(inst)
    if not (alive() and st.nosQTE) then return end
    if inst and inst.Name == "QTE" and inst.Parent then
      activeQteFrame = inst
      pcall(stepBloodhookQTE)
    end
  end
  local hookedTemp = nil
  local function bindTempUi(tempUi)
    if not (tempUi and tempUi.Parent == pg) or hookedTemp == tempUi then return end
    hookedTemp = tempUi
    local c1 = tempUi.ChildAdded:Connect(onCandidate)
    local c2 = tempUi.ChildRemoved:Connect(function(ch)
      if ch == activeQteFrame or ch.Name == "QTE" then activeQteFrame = tempUi:FindFirstChild("QTE") end
    end)
    qteConns[#qteConns + 1], qteConns[#qteConns + 2] = c1, c2
    M.Bind(c1)
    M.Bind(c2)
    local cur = tempUi:FindFirstChild("QTE")
    if cur then onCandidate(cur) end
  end
  local t0 = pg:FindFirstChild("TemporaryUI")
  if t0 then bindTempUi(t0) end
  local cpg = pg.ChildAdded:Connect(function(ch)
    if ch.Name == "TemporaryUI" then task.defer(bindTempUi, ch) end
  end)
  qteConns[#qteConns + 1] = cpg
  M.Bind(cpg)
end


local function syncAzureHooks()
  pcall(function()
    local assets = RS:FindFirstChild("Assets")
    local killers = assets and assets:FindFirstChild("Killers")
    local azDir = killers and killers:FindFirstChild("Azure")
    if not azDir then return end
    local cfgMod = azDir:FindFirstChild("Config")
    local wk = cfgMod and cfgMod:FindFirstChild("cl_WorkaroundModules")
    local qteScript = wk and wk:FindFirstChild("cl_ConstructQTE")
    if st.azQTE and qteScript and qteScript:IsA("ModuleScript") then
      if not constructQteMod then
        constructQteMod = tryRequire(qteScript)
        if constructQteMod and type(constructQteMod.new) == "function" then
          origConstructNew = constructQteMod.new
          constructQteMod.new = function(...)
            local qteObj = origConstructNew(...)
            if st.azQTE and alive() and type(qteObj) == "table" then
              task.spawn(function()
                task.wait(0.10)
                for _ = 1, 3 do
                  task.wait(math.clamp(st.azStepDelay, 40, 400) / 1000)
                  if not (st.azQTE and alive() and type(qteObj) == "table" and qteObj.Maid and qteObj.UI) then return end
                  pcall(function() qteObj.UI:PlayHitSound() end)
                  pcall(function() qteObj:AddProgress(34) end)
                end
              end)
            end
            return qteObj
          end
        end
      end
    elseif (not st.azQTE) and constructQteMod and origConstructNew then
      pcall(function() constructQteMod.new = origConstructNew end)
    end
    local behScript = azDir:FindFirstChild("Behavior")
    if st.azNoGrabStam and behScript and behScript:IsA("ModuleScript") then
      if not azBehaviorMod then
        azBehaviorMod = tryRequire(behScript)
        if azBehaviorMod and type(azBehaviorMod.lcl_SetGrabStaminaRegenReduction) == "function" then
          origGrabStamFn = azBehaviorMod.lcl_SetGrabStaminaRegenReduction
          azBehaviorMod.lcl_SetGrabStaminaRegenReduction = function(selfArg, actorArg, reduceFlag, ...)
            if st.azNoGrabStam and alive() and reduceFlag == true then return origGrabStamFn(selfArg, actorArg, false, ...) end
            return origGrabStamFn(selfArg, actorArg, reduceFlag, ...)
          end
        end
      end
    elseif (not st.azNoGrabStam) and azBehaviorMod and origGrabStamFn then
      pcall(function() azBehaviorMod.lcl_SetGrabStaminaRegenReduction = origGrabStamFn end)
    end
  end)
end


local AZ_STEP = "kl_AzureGrabAim"
local function stepAzGrabAim(dt)
  if not (alive() and st.azGrabAim) then unbindRender("az", AZ_STEP) return end
  local ch = getChar()
  if not isKiller(ch, "Azure") then unbindRender("az", AZ_STEP) return end
  local hrp, hum = getHrp(ch), getHum(ch)
  if not (hrp and hum and hum.Health > 0) then unbindRender("az", AZ_STEP) return end
  local act = getMyActor()
  local state = act and type(act.State) == "table" and act.State or nil
  if not (state and state.GrabAimingSequence == true) then
    unbindRender("az", AZ_STEP)
    rotUnlock(hum, "kl_az_grab")
    return
  end
  local cfg = act.Config or {}
  local tHrp = nearestSurvivorHrp(hrp.Position, tonumber(cfg.HookRange) or 60, hrp.Position)
  if not tHrp then return end
  local dist = (tHrp.Position - hrp.Position).Magnitude
  local vel = tHrp.AssemblyLinearVelocity
  local aimPos = tHrp.Position + Vector3.new(vel.X, 0, vel.Z)
    * math.clamp(dist / math.max(tonumber(cfg.HookSpeed) or 270, 60), 0.01, 0.35)
  pcall(function() state.CameraLookPosition = aimPos end)
  local lookCF = CFrame.lookAt(hrp.Position, Vector3.new(aimPos.X, hrp.Position.Y, aimPos.Z))
  local align = hrp:FindFirstChildOfClass("AlignOrientation")
  if align then pcall(function() align.CFrame = lookCF end) end
  rotLock(hum, "kl_az_grab")
  pcall(function() hrp.CFrame = lookCF end)
  local now = os.clock()
  if now - (st.lastGrabNetAt or 0) >= 0.03 then
    st.lastGrabNetAt = now
    if not netMod then netMod = tryRequire(RS.Modules.Network.Network) end
    if type(netMod) == "table" and type(netMod.FireServerConnection) == "function" then
      pcall(function()
        netMod:FireServerConnection(LP.Name .. "AzureUpdateCameraLookVector", "UREMOTE_EVENT", aimPos)
      end)
    end
  end
  steerHrp(hrp, hum, aimPos, "kl_az_grab", 18.0, dt)
end


local NOS_STEP = "kl_NosDiveAim"
local function stepNosDiveAim(dt)
  if not (alive() and st.ascentAim) then unbindRender("nos", NOS_STEP) return end
  local ch = getChar()
  if not isKiller(ch, "Nosferatu") then unbindRender("nos", NOS_STEP) return end
  local hrp, hum = getHrp(ch), getHum(ch)
  if not (hrp and hum and hum.Health > 0) then unbindRender("nos", NOS_STEP) return end
  local act = getMyActor()
  local state = act and type(act.State) == "table" and act.State or nil
  if not ((state and state.Slashing == true) or (os.clock() <= (st.diveWindowUntil or 0))) then
    unbindRender("nos", NOS_STEP)
    rotUnlock(hum, "kl_nos_dive")
    return
  end
  local refPos = hrp.Position
  if st.aimTarget == "Nearest to Impact" and act and type(act.Instances) == "table" then
    local ind = act.Instances.DiveIndicator
    local indTarget = (type(ind) == "table" or typeof(ind) == "Instance") and ind.Target or nil
    if typeof(indTarget) == "Instance" then
      local okP, tPos = pcall(function()
        return indTarget:IsA("BasePart") and indTarget.Position or indTarget:GetPivot().Position
      end)
      if okP and tPos then refPos = tPos end
    end
  end
  local sHrp = nearestSurvivorHrp(refPos, 160, hrp.Position)
  if not sHrp then return end
  local cfg = (act and act.Config) or {}
  local diveSpd = tonumber(cfg.AscentBite and cfg.AscentBite.Speed) or 100
  local dist = (sHrp.Position - hrp.Position).Magnitude
  local sVel = sHrp.AssemblyLinearVelocity
  local aimPos = sHrp.Position + Vector3.new(sVel.X, 0, sVel.Z) * math.clamp(dist / math.max(diveSpd, 40), 0.02, 0.45)
  steerHrp(hrp, hum, aimPos, "kl_nos_dive", 6.0 + math.clamp(st.diveTurn, 5, 40) * 0.5, dt)
  local bv = hrp:FindFirstChildOfClass("BodyVelocity")
  if bv and bv.Velocity.Magnitude > 5 then
    local dir3D = aimPos - hrp.Position
    if dir3D.Magnitude > 0.1 then pcall(function() bv.Velocity = dir3D.Unit * diveSpd end) end
  end
end


local hbAcc, cfgAcc = 0, 0
local function syncAll()
  if st.rushCtrl or st.rushAim or st.speedOn then pcall(syncNoliConfigs) end
  if st.spireCtrl or st.ascentCtrl then pcall(syncNosferatuConfigs, false) end
end
local function ensureBindings()
  local ch = getChar()
  if isKiller(ch, "Noli") then
    local hrp, hum = getHrp(ch), getHum(ch)
    if hrp and hum and hum.Health > 0 then
      local dashing = (attr(ch, "VoidRushState") == "Dashing")
      local sm = ch:FindFirstChild("SpeedMultipliers")
      if sm and sm:FindFirstChild("VoidRushDash") then dashing = true end
      if dashing and st.rushAim then
        bindRender("noli", NOLI_STEP, Enum.RenderPriority.Character.Value + 10, stepNoliAim)
      else
        unbindRender("noli", NOLI_STEP)
        rotUnlock(hum, "kl_noli_aim")
      end
      if st.antiCrash and dashing then pcall(antiCrashStep) end
    end
  else
    unbindRender("noli", NOLI_STEP)
  end
  if isKiller(ch, "Nosferatu") then
    local act = getMyActor()
    local state = act and type(act.State) == "table" and act.State or nil
    if st.ascentAim and ((state and state.Slashing == true) or (os.clock() <= (st.diveWindowUntil or 0))) then
      bindRender("nos", NOS_STEP, Enum.RenderPriority.Character.Value + 12, stepNosDiveAim)
    else
      unbindRender("nos", NOS_STEP)
    end
    if st.batsAim then
      bindRender("bats", BATS_STEP, Enum.RenderPriority.Character.Value + 11, stepBatsAim)
    else
      unbindRender("bats", BATS_STEP)
    end
    if st.nosQTE and activeQteFrame then pcall(stepBloodhookQTE) end
  else
    unbindRender("nos", NOS_STEP)
    unbindRender("bats", BATS_STEP)
  end
  if isKiller(ch, "Azure") then
    local act = getMyActor()
    local state = act and type(act.State) == "table" and act.State or nil
    if st.azGrabAim and state and state.GrabAimingSequence == true then
      bindRender("az", AZ_STEP, Enum.RenderPriority.Last.Value + 1, stepAzGrabAim)
    else
      unbindRender("az", AZ_STEP)
    end
    if st.azNoGrabStam then
      if not sprintingMod then sprintingMod = tryRequire(RS.Systems.Character.Game.Sprinting) end
      if sprintingMod and type(sprintingMod.StaminaGain) == "number" then
        local full = (act and type(act.Cache) == "table" and tonumber(act.Cache.AzureGrabStaminaGain))
          or (act and type(act.Config) == "table" and tonumber(act.Config.StaminaGain)) or 21
        if sprintingMod.StaminaGain < full * 0.8 then pcall(function() sprintingMod.StaminaGain = full end) end
      end
    end
  else
    unbindRender("az", AZ_STEP)
  end
end
M.OnHeartbeat(function(dt)
  if not alive() then return end
  hbAcc += dt
  if hbAcc < 0.05 then return end
  hbAcc = 0
  pcall(ensureBindings)
  pcall(autoNovaStep, 0.05)
  if st.nosQTE and activeQteFrame then pcall(stepBloodhookQTE) end
  cfgAcc += 0.05
  if cfgAcc >= 1.0 then
    cfgAcc = 0
    pcall(syncAll)
    pcall(syncAzureHooks)
  end
end)


local noliSec = page:Section("Noli", "Noli", "Void rush patch / auto nova")
noliSec:Toggle("kl_noli_rush_ctrl", "Void Rush Control", false, function(v)
  st.rushCtrl = v and true or false
  pcall(syncNoliConfigs)
  M.Notify("Noli", v and "Void Rush Control: On" or "Void Rush Control: Off")
end)

noliSec:Slider("kl_noli_turn", "Turn Strength (x0.1)", 10, 160, 55, nil, function(n)
  st.turnStr = math.clamp((tonumber(n) or 55) / 10, 1.0, 16.0)
  if st.rushCtrl or st.rushAim then pcall(syncNoliConfigs) end
end)
noliSec:Toggle("kl_noli_rush_aim", "Void Rush Aimbot", false, function(v)
  st.rushAim = v and true or false
  pcall(syncNoliConfigs)
  if not st.rushAim then unbindRender("noli", NOLI_STEP) end
  M.Notify("Noli", v and "Void Rush Aimbot: On" or "Void Rush Aimbot: Off")
end)
noliSec:Toggle("kl_noli_speed_on", "Custom Speed", false, function(v)
  st.speedOn = v and true or false
  pcall(syncNoliConfigs)
  M.Notify("Noli", v and "Custom Speed: On" or "Custom Speed: Off")
end)
noliSec:Slider("kl_noli_speed", "Speed", 30, 120, 60, nil, function(n)
  st.dashSpeed = math.clamp(tonumber(n) or 60, 30, 120)
  if st.speedOn then pcall(syncNoliConfigs) end
end)
noliSec:Toggle("kl_noli_anti_crash", "Anti Crash", false, function(v)
  st.antiCrash = v and true or false
  M.Notify("Noli", v and "Anti-Crash: On" or "Anti-Crash: Off")
end)
noliSec:Toggle("kl_noli_auto_nova", "Auto Detonate Nova", false, function(v)
  st.autoNova = v and true or false
  st.novaAcc = 0
  table.clear(st.detonated)
  table.clear(st.prevNovaDist)
  M.Notify("Noli", v and "Auto Nova: On" or "Auto Nova: Off")
end)
noliSec:Slider("kl_noli_nova_rad", "Nova Radius", 5, 40, 14, nil, function(n)
  st.novaRadius = math.clamp(tonumber(n) or 14, 5, 40)
end)

local nosSec = page:Section("Nosferatu", "Nosferatu", "Blood hook QTE / Cataclysm / Ascent")
nosSec:Toggle("kl_nos_auto_qte", "Auto Blood Hook QTE", false, function(v)
  st.nosQTE = v and true or false
  if st.nosQTE then pcall(bindQteWatchers) else pcall(clearQteConns) end
  M.Notify("Nosferatu", v and "Auto QTE: On" or "Auto QTE: Off")
end)
nosSec:Slider("kl_nos_qte_delay", "QTE Delay (ms)", 20, 300, 85, nil, function(n)
  st.qteDelay = math.clamp(tonumber(n) or 85, 20, 300)
end)
nosSec:Toggle("kl_nos_bats_aim", "Bats Redirect Aim", false, function(v)
  st.batsAim = v and true or false
  if not st.batsAim then unbindRender("bats", BATS_STEP) end
  M.Notify("Nosferatu", v and "Bats Redirect Aim: On" or "Bats Redirect Aim: Off")
end)
nosSec:Toggle("kl_nos_spire_ctrl", "Cataclysm Turn Control", false, function(v)
  st.spireCtrl = v and true or false
  pcall(syncNosferatuConfigs, false)
  M.Notify("Nosferatu", v and "Cataclysm Turn Control: On" or "Cataclysm Turn Control: Off")
end)
nosSec:Slider("kl_nos_spire_turn", "Cataclysm Turn Speed", 5, 60, 28, nil, function(n)
  st.spireTurn = math.clamp(tonumber(n) or 28, 5, 60)
  if st.spireCtrl then pcall(syncNosferatuConfigs, false) end
end)
nosSec:Toggle("kl_nos_ascent_ctrl", "Ascent Dive Control", false, function(v)
  st.ascentCtrl = v and true or false
  pcall(syncNosferatuConfigs, false)
  M.Notify("Nosferatu", v and "Ascension Control: On" or "Ascension Control: Off")
end)
nosSec:Slider("kl_nos_dive_turn", "Dive Bite Turn Speed", 5, 40, 14, nil, function(n)
  st.diveTurn = math.clamp(tonumber(n) or 14, 5, 40)
  if st.ascentCtrl then pcall(syncNosferatuConfigs, false) end
end)
nosSec:Toggle("kl_nos_ascent_aim", "Dive Aimbot", false, function(v)
  st.ascentAim = v and true or false
  if not st.ascentAim then unbindRender("nos", NOS_STEP) end
  M.Notify("Nosferatu", v and "Dive Aim: On" or "Dive Aim: Off")
end)
nosSec:Segmented("kl_nos_dive_target", "Dive Target",
  { "Nearest to Impact", "Nearest to Nosferatu" }, "Nearest to Impact",
  function(v) st.aimTarget = v or "Nearest to Impact" end)

local azSec = page:Section("Azure", "Azure", "Place QTE / Choke")
azSec:Toggle("kl_az_auto_qte", "Auto Place/Remove QTE", false, function(v)
  st.azQTE = v and true or false
  pcall(syncAzureHooks)
  M.Notify("Azure", v and "Auto QTE: On" or "Auto QTE: Off")
end)
azSec:Slider("kl_az_qte_delay", "QTE Step Delay (ms)", 40, 400, 160, nil, function(n)
  st.azStepDelay = math.clamp(tonumber(n) or 160, 40, 400)
end)
azSec:Toggle("kl_az_grab_aim", "Choke Aimbot", false, function(v)
  st.azGrabAim = v and true or false
  if not st.azGrabAim then unbindRender("az", AZ_STEP) end
  M.Notify("Azure", v and "Grab Aim: On" or "Grab Aim: Off")
end)
azSec:Toggle("kl_az_no_stam", "No Grab Stamina Cost", false, function(v)
  st.azNoGrabStam = v and true or false
  pcall(syncAzureHooks)
  M.Notify("Azure", v and "No Grab Stamina Cost: On" or "No Grab Stamina Cost: Off")
end)


local function cleanup()
  unbindRender("noli", NOLI_STEP)
  unbindRender("nos", NOS_STEP)
  unbindRender("bats", BATS_STEP)
  unbindRender("az", AZ_STEP)
  pcall(clearQteConns)
  pcall(function()
    if constructQteMod and origConstructNew then constructQteMod.new = origConstructNew end
  end)
  pcall(function()
    if azBehaviorMod and origGrabStamFn then
      azBehaviorMod.lcl_SetGrabStaminaRegenReduction = origGrabStamFn
    end
  end)
  pcall(function()
    if next(noliSaved) ~= nil or next(nosSaved) ~= nil then
      st.rushCtrl, st.rushAim, st.speedOn = false, false, false
      st.spireCtrl, st.ascentCtrl = false, false
      syncNoliConfigs()
      syncNosferatuConfigs(true)
    end
  end)
end
if type(M.OnUnload) == "function" then pcall(function() M.OnUnload(cleanup) end) end


task.defer(function() pcall(syncAll) end)
end)


addModule(function(M)

local page = M.Page("esp")
local secEsp = page:Section("ESP", "ESP", "Track things through walls (plussaken engine)")
local secObj = page:Section("Objects", "OBJECTS", "Generators / Items / Traps / Candy")
local secPick = page:Section("Pickup", "PICKUP", "Auto pickup items and gear")

local Players = M.Svc.Players
local Workspace = M.Svc.Workspace
local RunService = M.Svc.RunService
local ReplicatedStorage = M.Svc.ReplicatedStorage
local LocalPlayer = M.Local
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")

local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Light Green"] = Color3.fromRGB(191, 255, 191),["Purple"] = Color3.fromRGB(158, 0, 179),["Red"] = Color3.fromRGB(255,0,0),["Candy"] = Color3.fromRGB(255, 64, 77),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,135,15)}

local function GetValue(key)
    if key == nil then return false end
    return M.Get(key) == true
end
local function hexColor(h, dr, dg, db)
    local r, g, b = tostring(h or ""):match("^#(%x%x)(%x%x)(%x%x)$")
    if not r then return Color3.fromRGB(dr or 255, dg or 255, db or 255) end
    return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end
local function ColorOf(key, dr, dg, db)
    return hexColor(M.Get(key), dr, dg, db)
end
local function playersFolder()
    return Workspace:FindFirstChild("Players")
end
local function inGameFolder()
    local m = Workspace:FindFirstChild("Map")
    return m and m:FindFirstChild("Ingame")
end
local function gameMapFolder()
    local ig = inGameFolder()
    return ig and ig:FindFirstChild("Map")
end
local function localCharacter()
    return LocalPlayer.Character
end
local function localRoot()
    local ch = localCharacter()
    return ch and (ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("RootPart"))
end
local function playerData()
    return LocalPlayer:FindFirstChild("PlayerData")
end
local function mainUi()
    return PlayerGui:FindFirstChild("MainUI")
end
local hasQuery = false
do
    local ok = pcall(function() return workspace:QueryDescendants("BasePart") end)
    hasQuery = ok
end
local function query(inst, q)
    if not inst then return {} end
    if hasQuery then
        local ok, res = pcall(function() return inst:QueryDescendants(q) end)
        if ok and type(res) == "table" then return res end
    end
    local out = {}
    local wantHl = q:find("Highlight") ~= nil
    local wantBb = q:find("BillboardGui") ~= nil
    local notDyn = q:find(":not") ~= nil
    for _, d in ipairs(inst:GetDescendants()) do
        if (wantHl and d:IsA("Highlight")) or (wantBb and d:IsA("BillboardGui")) then
            local dyn = d:GetAttribute("Dynamic") == true
            if (notDyn and not dyn) or ((not notDyn) and dyn) then
                out[#out + 1] = d
            end
        end
    end
    return out
end

local ESP = {}

function ESP:CheckHighlightDistance(Highlight,TargetRoot,Settings)
    local Camera = TargetRoot and workspace.CurrentCamera
    if not Camera or (Highlight:GetAttribute("Frozen") and not Settings.Instant) then return end
    local Distance = (Camera.CFrame.Position - TargetRoot.Position).Magnitude
    local MinDistance = Settings.MinDistance
    local ShouldHide = Distance < MinDistance or Distance > 1200
    if ShouldHide and Highlight.OutlineTransparency ~= 1 then
        local Tween = TweenService:Create(Highlight,TweenInfo.new(Settings.Instant and 0 or 0.1),{
            FillTransparency = 1,
            OutlineTransparency = 1
        })
        Tween.Parent = Highlight
        Tween:Play()
        Debris:AddItem(Tween,0.2)
        return
    end
    local TransparencyAmount = math.clamp(1 - math.clamp((Distance - MinDistance) / math.max(Settings.MaxDistance - MinDistance, 0.001),0,1),0.45,1)
    if not ShouldHide and Distance >= MinDistance and Distance < 1200 and TransparencyAmount ~= Highlight.FillTransparency + 0.05 then
        if math.abs(Highlight.FillTransparency - TransparencyAmount) > 0 then
            local pd = playerData()
            if pd and pd:FindFirstChild("LowDetailMode") and pd:FindFirstChild("LowDetailMode").Value then
                Highlight.FillTransparency = math.clamp(TransparencyAmount + 0.05,0,1)
                Highlight.OutlineTransparency = TransparencyAmount <= 0.95 and TransparencyAmount - 0.05 or TransparencyAmount
            else
                local Tween = TweenService:Create(Highlight,TweenInfo.new(Settings.Instant and 0 or 0.1),{
                    FillTransparency = math.clamp(TransparencyAmount + 0.05,0,1),
                    OutlineTransparency = TransparencyAmount <= 0.95 and TransparencyAmount - 0.05 or TransparencyAmount
                })
                Tween.Parent = Highlight
                Tween:Play()
                Debris:AddItem(Tween,0.2)
            end
        end
    end
end

function ESP:CheckTextDistance(Text,Image,TargetRoot,Settings)
    local Camera = TargetRoot and workspace.CurrentCamera
    if not Camera or (Text:GetAttribute("Frozen") and not Settings.Instant) then return end
    local Distance = (Camera.CFrame.Position - TargetRoot.Position).Magnitude
    local MinDistance = Settings.MinDistance
    if Distance > MinDistance and Distance < 1200 and Text.TextTransparency ~= 0 then
        local Tween = Text.Parent:FindFirstChild("TweenShowText") or TweenService:Create(Text,TweenInfo.new(Settings.Instant and 0 or 0.1),{TextTransparency = 0,TextStrokeTransparency = 0})
        local Tween2 = Text.Parent:FindFirstChild("TweenShowImage") or TweenService:Create(Image,TweenInfo.new(Settings.Instant and 0 or 0.1),{ImageTransparency = 0})
        Tween.Parent = Text.Parent
        Tween.Name = "TweenShowText"
        Tween2.Parent = Text.Parent
        Tween2.Name = "TweenShowImage"
        Tween:Play()
        Tween2:Play()
    elseif Distance <= MinDistance or Distance >= 1200 and Text.TextTransparency ~= 1 then
        local Tween = Text.Parent:FindFirstChild("TweenHideText") or TweenService:Create(Text,TweenInfo.new(Settings.Instant and 0 or 0.1),{TextTransparency = 1,TextStrokeTransparency = 1})
        local Tween2 = Text.Parent:FindFirstChild("TweenHideImage") or TweenService:Create(Image,TweenInfo.new(Settings.Instant and 0 or 0.1),{ImageTransparency = 1})
        Tween.Parent = Text.Parent
        Tween.Name = "TweenHideText"
        Tween2.Parent = Text.Parent
        Tween2.Name = "TweenHideImage"
        Tween:Play()
        Tween2:Play()
    end
end

function ESP:CreateDynamicHighlight(Enabled,ItemInstance,TargetRoot,Settings)
    if not ItemInstance then return end
    Settings = type(Settings) == "table" and Settings or {["MaxDistance"] = 100,["MinDistance"] = 10,["Color"] = Color3.new(1,1,1)}
    local Highlight = query(ItemInstance,"Highlight[$Dynamic]")
    local ExistingHighlights = query(ItemInstance,"Highlight:not([$Dynamic])")
    if Enabled and GetValue("ESP") then
        if not Highlight[1] then
            Highlight = Instance.new("Highlight")
            Highlight.Name = HttpService:GenerateGUID(false):sub(1,7)
            Highlight.Archivable = false
            local H, S, V = Settings.Color:ToHSV()
            Highlight.FillColor = Color3.fromHSV(H, S, V * 0.8)
            Highlight.OutlineColor = Color3.fromHSV(H, S, V * 1.1)
            Highlight:SetAttribute("Dynamic",true)
            Highlight.Parent = ItemInstance
            Highlight.Adornee = ItemInstance
            Highlight.FillTransparency = 1
            Highlight.OutlineTransparency = 1
            self:CheckHighlightDistance(Highlight, TargetRoot, Settings)
            local Connection
            Connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
                if Highlight and Highlight.Parent then
                    for i,v in Highlight:GetChildren() do v:Cancel() end
                    Highlight.FillTransparency = 0.95
                    Highlight.OutlineTransparency = 0.95
                else
                    Connection:Disconnect()
                end
            end)
            Highlight.Destroying:Once(function()
                if Connection then
                    Connection:Disconnect()
                end
            end)
            if not Highlight.Parent then
                Highlight:Destroy()
                return
            end
            Highlight.Parent:GetPropertyChangedSignal("Parent"):Once(function()
                Highlight:Destroy()
            end)
        else
            Highlight = Highlight[1]
            local H, S, V = Settings.Color:ToHSV()
            Highlight.FillColor = Color3.fromHSV(H, S, V * 0.8)
            Highlight.OutlineColor = Color3.fromHSV(H, S, V * 1.1)
            self:CheckHighlightDistance(Highlight, TargetRoot, Settings)
        end
        for i,v in ExistingHighlights do
            v.Enabled = false
        end
    elseif Highlight[1] then
        for i,v in ExistingHighlights do
            v.Enabled = true
        end
        Highlight[1]:Destroy()
    end
end

function ESP:CreateText(Enabled,ItemInstance,TargetRoot,Settings)
    if not ItemInstance then return end
    Settings = type(Settings) == "table" and Settings or {["MinDistance"] = 10,["Color"] = Color3.new(1,1,1)}
    local BillboardGui = query(ItemInstance,"BillboardGui[$Dynamic]")
    if Enabled and GetValue("ShowText") and GetValue("ESP") then
        if not BillboardGui[1] then
            BillboardGui = Instance.new("BillboardGui")
            local TextLabel = Instance.new("TextLabel")
            local ImageLabel = Instance.new("ImageLabel")
            local AspectRatio = Instance.new("UIAspectRatioConstraint")
            BillboardGui.Name = HttpService:GenerateGUID(false):sub(1,7)
            BillboardGui.Archivable = false
            BillboardGui.Size = ItemInstance:IsA("Tool") and UDim2.new(1.5, 30, 0.75, 30) or UDim2.new(1.5,60,0.75,25)
            BillboardGui.StudsOffset = Settings.Size or ItemInstance:IsA("Tool") and Vector3.new(0,3,0) or Vector3.new(0,4,0)
            BillboardGui.AlwaysOnTop = true
            BillboardGui.ResetOnSpawn = true
            BillboardGui.Adornee = TargetRoot
            BillboardGui:SetAttribute("Dynamic",true)
            TextLabel.Text = Settings.Text or "Unknown"
            local H, S, V = Settings.Color:ToHSV()
            TextLabel.TextColor3 = Color3.fromHSV(H, S, V * 1.1)
            TextLabel.AnchorPoint = Vector2.new(0.5,0.5)
            TextLabel.Position = UDim2.fromScale(0.5,0.5)
            TextLabel.Size = UDim2.fromScale(1,1)
            TextLabel.TextScaled = true
            TextLabel.BackgroundTransparency = 1
            TextLabel.TextStrokeTransparency = 0
            TextLabel.TextSize = 8
            TextLabel.Parent = BillboardGui
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.ImageColor3 = Settings.Color
            ImageLabel.Position = UDim2.fromScale(0.5,0)
            ImageLabel.Size = UDim2.fromScale(1,1)
            ImageLabel.AnchorPoint = Vector2.new(0.5,0.65)
            ImageLabel.Image = type(Settings.Image) == type(0) and "rbxassetid://" .. Settings.Image or Settings.Image or ""
            ImageLabel.Parent = BillboardGui
            AspectRatio.Parent = ImageLabel
            BillboardGui:GetPropertyChangedSignal("Size"):Connect(function()
                BillboardGui.Size = ItemInstance:IsA("Tool") and UDim2.new(1.5, 30, 0.75, 30) or UDim2.new(1.5,60,0.75,25)
            end)
            BillboardGui:GetPropertyChangedSignal("StudsOffset"):Connect(function()
                BillboardGui.StudsOffset = Settings.Size or ItemInstance:IsA("Tool") and Vector3.new(0,3,0) or Vector3.new(0,4,0)
            end)
            BillboardGui.Parent = TargetRoot
            self:CheckTextDistance(TextLabel,ImageLabel,TargetRoot,Settings)
            local Connection
            Connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
                if BillboardGui and BillboardGui.Parent then
                    for i,v in TextLabel:GetChildren() do v:Cancel() end
                    TextLabel.TextTransparency = 0.95
                    TextLabel.TextStrokeTransparency = 0.95
                else
                    Connection:Disconnect()
                end
            end)
            BillboardGui.Destroying:Once(function()
                if Connection then
                    Connection:Disconnect()
                end
            end)
            if not BillboardGui.Parent then
                BillboardGui:Destroy()
                return
            end
            BillboardGui.Parent:GetPropertyChangedSignal("Parent"):Once(function()
                BillboardGui:Destroy()
            end)
        else
            BillboardGui = BillboardGui[1]
            local H, S, V = Settings.Color:ToHSV()
            local TextLabel = BillboardGui:FindFirstChild("TextLabel")
            local Image = BillboardGui:FindFirstChild("ImageLabel")
            if TextLabel then TextLabel.TextColor3 = Color3.fromHSV(H, S, V * 1.1) end
            if Image then
                Image.ImageColor3 = Settings.Color
                Image.Image = type(Settings.Image) == type(0) and "rbxassetid://" .. Settings.Image or Settings.Image or ""
            end
            self:CheckTextDistance(TextLabel,Image,TargetRoot,Settings)
        end
    elseif BillboardGui[1] then
        BillboardGui[1]:Destroy()
    end
end

function ESP:PickupObject(Object,Prompt)
    local fireprompt = fireproximityprompt or function(ProximityPrompt)
        if ProximityPrompt then
            ProximityPrompt:InputHoldBegin()
            ProximityPrompt:InputHoldEnd()
        end
    end
    local root = localRoot()
    if not root then return end
    local Param = OverlapParams.new()
    Param.BruteForceAllSlow = true
    Param.FilterType = Enum.RaycastFilterType.Include
    Param.FilterDescendantsInstances = {Object}
    local Result = workspace:GetPartBoundsInRadius(root.Position, 4.5, Param)
    if root and #Result > 0 and Prompt then
        pcall(fireprompt, Prompt)
    end
end

local ModelData = {
    ["VineModel"] = {"Vine",ColorPresets["Purple"]},
    ["GroundBulbModel"] = {"Bulb",ColorPresets["Purple"]},
    ["SubspaceTripmine"] = {"Mine",ColorPresets["Orange"]},
    ["PizzaDeliveryRig"] = {" NPC ",ColorPresets["Orange"]},
    ["TaphTripwire"] = {"Wire",ColorPresets["Light Green"]},
    ["BuildermanDispenser"] = {"Dispenser",ColorPresets["Light Green"]},
    ["BuildermanSentry"] = {"Sentry",ColorPresets["Red"]},
    ["Document"] = {"Contract",ColorPresets["Red"]},
    ["Gear"] = {"   Gear   ",ColorPresets["White"]},
    ["C00lCandy"] = {"   Candy   ",ColorPresets["Candy"],GetValue("CandyESP")},
    ["Pumpkin"] = {"  Pumpkin  ",ColorPresets["Orange"]},
}
local GeneratorImages = {["ConnectServerMinigame"] = 99080479259815,["GearServerMinigame"] = 81454811776080,["FlowServerMinigame"] = 110241164394153,["LockServerMinigame"] = 108612249774904}

local function matchModelData(name)
    local n = string.lower(tostring(name or ""))
    for key, data in pairs(ModelData) do
        if string.find(n, string.lower(key), 1, true) then return data end
    end
    return nil
end

local function isKillerSide()
    local ch = localCharacter()
    local parent = ch and ch.Parent
    if not parent then return false end
    return string.lower(parent.Name):find("kill") ~= nil
end

local function loopPlayers()
    local pf = playersFolder()
    if not pf then return end
    local myChar = localCharacter()
    local ui = mainUi()
    local uiReady = (ui == nil) or (ui.Enabled == true)
    for _, teamName in ipairs({"Killers","Survivors"}) do
        local folder = pf:FindFirstChild(teamName)
        if folder then
            for _, v in ipairs(folder:GetChildren()) do
                task.spawn(function()
                    local Player = v ~= myChar and Players:GetPlayerFromCharacter(v)
                    local hum = v:FindFirstChildOfClass("Humanoid")
                    if Player and hum and hum.Health > 0 and uiReady then
                        local targetRoot = v:FindFirstChild("HumanoidRootPart")
                        local FeatureValue = GetValue(teamName.."ESP")
                        local ColorValue = ColorOf(teamName.."Color", 255, 255, 255)
                        ESP:CreateDynamicHighlight(FeatureValue, v, targetRoot, {MaxDistance = 100,MinDistance = 10,Color = ColorValue})
                        ESP:CreateText(FeatureValue, v, targetRoot, {MinDistance = 25,Text = Player.Name,Color = ColorValue})
                    else
                        ESP:CreateDynamicHighlight(false, v)
                        ESP:CreateText(false, v)
                    end
                end)
            end
        end
    end
end

local function loopWorld()
    local otherOn = GetValue("OtherESP")
    local candyOn = GetValue("CandyESP")
    local pumpkinOn = GetValue("PumpkinESP")
    if not (otherOn or candyOn or pumpkinOn) then return end
    local InGame = inGameFolder()
    if not InGame then return end
    for _, v in ipairs(InGame:GetDescendants()) do
        local nm = string.lower(v.Name)
        if nm:find("c00lcandy") or nm:find("pumpkin") or nm:find("vinemodel") or nm:find("groundbulbmodel")
            or nm:find("subspacetripmine") or nm:find("pizzadeliveryrig") or nm:find("taphtripwire")
            or nm:find("buildermandispenser") or nm:find("buildermansentry") or nm:find("document")
            or (nm == "gear") then
            task.spawn(function()
                local target = v
                local data = matchModelData(target.Name)
                if not data then
                    data = matchModelData(target.Parent and target.Parent.Name or "")
                end
                local colorValue = data and data[2] or ColorPresets["White"]
                local text = data and data[1] or target.Name
                local feature = otherOn
                if target.Name:find("C00lCandy") then
                    feature = GetValue("CandyESP")
                    colorValue = ColorPresets["Candy"]
                elseif target.Name:find("Pumpkin") then
                    feature = GetValue("PumpkinESP") and isKillerSide()
                end
                local targetRoot = target:IsA("Model") and (target.PrimaryPart or target:FindFirstChild("RootPart")) or target:FindFirstChildWhichIsA("BasePart")
                ESP:CreateDynamicHighlight(feature, target, targetRoot, {MaxDistance = 100,MinDistance = 12,Color = colorValue})
                ESP:CreateText(feature, target, targetRoot, {MinDistance = 25,Text = text,Color = colorValue})
            end)
        end
    end
    for _, v in ipairs(workspace:GetChildren()) do
        if v:IsA("MeshPart") and v:FindFirstChild("Moving Outward Burst") then
            local myChar = localCharacter()
            local feature = otherOn and (not v:GetAttribute("Team") or (myChar and myChar.Parent and v:GetAttribute("Team") ~= myChar.Parent.Name))
            ESP:CreateDynamicHighlight(feature, v, v, {MaxDistance = 100,MinDistance = 12,Color = ColorPresets["Red"]})
            ESP:CreateText(feature, v, v, {MinDistance = 25,Text = "Contract", Color = ColorPresets["Red"]})
        end
    end
end

local function loopItems()
    local itemsOn = GetValue("ItemsESP")
    local autoPickup = GetValue("AutoPickup")
    if not (itemsOn or autoPickup) then return end
    local InGame = inGameFolder()
    if not InGame then return end
    local itemsColor = ColorOf("ItemsColor", 0, 255, 255)
    local myChar = localCharacter()
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    for _, v in ipairs(InGame:GetDescendants()) do
        if v:IsA("Tool") then
            local parentModel = v.Parent
            local holderHum = parentModel and parentModel:IsA("Model") and parentModel:FindFirstChildOfClass("Humanoid")
            if not holderHum then
                local targetRoot = v:FindFirstChildWhichIsA("BasePart")
                if targetRoot then
                    local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                    local label = prompt and prompt.ActionText or v.Name
                    ESP:CreateDynamicHighlight(itemsOn, v, targetRoot, {MaxDistance = 100,MinDistance = 12,Color = itemsColor})
                    ESP:CreateText(itemsOn, v, targetRoot, {MinDistance = 25,Text = label, Color = itemsColor})
                    local held = myChar and myChar:FindFirstChildOfClass("Tool")
                    if autoPickup and prompt and (not held or held.Name ~= v.Name)
                        and not (backpack and backpack:FindFirstChild(v.Name))
                        and not v:GetAttribute("JustDropped") then
                        ESP:PickupObject(v, prompt)
                    end
                end
            end
        end
    end
    local GameMap = gameMapFolder()
    if GameMap then
        for _, v in ipairs(GameMap:GetDescendants()) do
            if v:IsA("Model") and string.lower(v.Name) == "gear" and v:FindFirstChild("Root") then
                if autoPickup then
                    ESP:PickupObject(v, v:FindFirstChildWhichIsA("ProximityPrompt", true))
                end
            end
        end
    end
end

local function loopGenerators()
    local genOn = GetValue("GeneratorsESP")
    if not genOn then return end
    local GameMap = gameMapFolder()
    if not GameMap then return end
    local genColor = ColorOf("GeneratorsColor", 255, 255, 0)
    local hideDone = GetValue("GeneratorsCheck")
    local puzzleIcon = GetValue("GeneratorPuzzleIcon")
    for _, v in ipairs(GameMap:GetDescendants()) do
        if v:IsA("Model") and string.lower(v.Name):find("generator", 1, true) and not string.lower(v.Name):find("fake", 1, true) then
            local main = v:FindFirstChild("Main")
            if main then
                local barUi = v:FindFirstChild("BarUI", true)
                local bar = barUi and barUi:FindFirstChild("Bar")
                local prog = v:FindFirstChild("Progress")
                local ProgressValue = bar and bar.Size.X.Scale or (prog and prog.Value / 100)
                task.spawn(function()
                    if hideDone and ProgressValue and ProgressValue >= 1 then
                        ESP:CreateDynamicHighlight(false, v)
                        ESP:CreateText(false, v)
                    elseif ProgressValue then
                        local img = nil
                        if puzzleIcon then
                            local tag = v:GetAttribute("Puzzle")
                            img = tag and GeneratorImages[tag] or nil
                        end
                        ESP:CreateDynamicHighlight(genOn, v, main, {MaxDistance = 100,MinDistance = 12,Color = genColor})
                        ESP:CreateText(genOn, v, main, {MinDistance = 25,Text = v.Name, Color = genColor, Image = img})
                    end
                end)
            end
        end
    end
end

local accPlayers, accWorld, accItems, accGen = 0, 0, 0, 0
M.OnHeartbeat(function(dt)
    if not M.IsAlive() then return end
    if not GetValue("ESP") then return end
    local d = tonumber(dt) or 0
    accPlayers = accPlayers + d
    accWorld = accWorld + d
    accItems = accItems + d
    accGen = accGen + d
    if accPlayers >= 0.1 then
        accPlayers = 0
        pcall(loopPlayers)
    end
    if accWorld >= 0.5 then
        accWorld = 0
        pcall(loopWorld)
    end
    if accItems >= 0.5 then
        accItems = 0
        pcall(loopItems)
    end
    if accGen >= 0.5 then
        accGen = 0
        pcall(loopGenerators)
    end
end)

local function clearAll()
    for _, root in ipairs({playersFolder(), inGameFolder()}) do
        if root then
            for _, v in ipairs(root:GetDescendants()) do
                pcall(function()
                    local hl = query(v, "Highlight[$Dynamic]")
                    for _, h in ipairs(hl) do h:Destroy() end
                    local bb = query(v, "BillboardGui[$Dynamic]")
                    for _, b in ipairs(bb) do b:Destroy() end
                end)
            end
        end
    end
end

secEsp:Toggle("ESP", "ESP Master", GetValue("ESP"), function(v) if not v then pcall(clearAll) end end)
secEsp:Toggle("ShowText", "Show Text", M.Get("ShowText") ~= false, function(v) end)
secEsp:Toggle("KillersESP", "Killer(s) ESP", GetValue("KillersESP"), function(v) end)
secEsp:Color("KillersColor", "Killer Color", M.Get("KillersColor") or "#FF0000", function(c) end)
secEsp:Toggle("SurvivorsESP", "Survivor(s) ESP", GetValue("SurvivorsESP"), function(v) end)
secEsp:Color("SurvivorsColor", "Survivor Color", M.Get("SurvivorsColor") or "#0000FF", function(c) end)

secObj:Toggle("GeneratorsESP", "Generator ESP", GetValue("GeneratorsESP"), function(v) end)
secObj:Color("GeneratorsColor", "Generator Color", M.Get("GeneratorsColor") or "#FFFF00", function(c) end)
secObj:Toggle("GeneratorsCheck", "Hide Completed Generators", GetValue("GeneratorsCheck"), function(v) end)
secObj:Toggle("GeneratorPuzzleIcon", "Puzzle Icons On Generators", GetValue("GeneratorPuzzleIcon"), function(v) end)
secObj:Toggle("ItemsESP", "Item ESP", GetValue("ItemsESP"), function(v) end)
secObj:Color("ItemsColor", "Item Color", M.Get("ItemsColor") or "#00FFFF", function(c) end)
secObj:Toggle("OtherESP", "Other ESP (Traps / NPC / Gear)", GetValue("OtherESP"), function(v) end)
secObj:Toggle("CandyESP", "Candy ESP", GetValue("CandyESP"), function(v) end)
secObj:Toggle("PumpkinESP", "Pumpkin ESP (Killer)", GetValue("PumpkinESP"), function(v) end)

secPick:Toggle("AutoPickup", "Auto Pickup Items", GetValue("AutoPickup"), function(v) end)
secPick:Toggle("CandyPickup", "Auto Pickup Candy", GetValue("CandyPickup"), function(v) end)

M.OnUnload(function()
    pcall(clearAll)
end)
end)


addModule(function(M)


































local page    = M.Page("gen")
local secEsp  = page:Section("Generator ESP", "Generator ESP", "Highlight + overhead progress bar (fakes filtered)")
local secSol  = page:Section("Minigame Solvers", "Minigame Solver", "Flow / Lock / Connect / Gear")
local secPace = page:Section("Pacing", "Pacing", "Solve duration and per-step jitter")

local Workspace         = M.Svc.Workspace
local RunService        = M.Svc.RunService
local ReplicatedStorage = M.Svc.ReplicatedStorage
local LocalPlayer       = M.Local

local function waitT(sec)
    
    if sec == nil then
        task.wait()
    else
        M.Wait(sec)
    end
end





local GEN_CAP = 6 

local genCore = {
    esp = false,
    conns = {},
    hl = {},   
    bb = {},   
    bars   = setmetatable({}, { __mode = "k" }),
    prog   = setmetatable({}, { __mode = "k" }),
    core   = setmetatable({}, { __mode = "k" }),
    pos    = setmetatable({}, { __mode = "k" }),
    cached = nil,
    dirty  = true,
    gui    = nil,
}


local function genIsFake(name)
    return name == "FakeGenerator" or string.match(name, "^FakeGenerator%d+$") ~= nil
end

local function genIsGen(name)
    return name == "Generator" or string.match(name, "^Generator%d+$") ~= nil or genIsFake(name)
end


local function genResolveCore(child)
    local cached = genCore.core[child]
    if cached and cached.Parent and (cached == child or cached:IsDescendantOf(child)) then
        return cached
    end
    local ins = child:FindFirstChild("Instances")
    if ins then
        local m = ins:FindFirstChild("Generator")
        if m and m:IsA("Model") then
            genCore.core[child] = m
            return m
        end
    end
    genCore.core[child] = child
    return child
end


local function genPosOf(child)
    local cachedPos = genCore.pos[child]
    if cachedPos then return cachedPos end
    local okP, pv = pcall(function() return genResolveCore(child):GetPivot().Position end)
    if okP and typeof(pv) == "Vector3" then
        genCore.pos[child] = pv
        return pv
    end
    return nil
end




local function genCorePart(core)
    if not core then return nil end
    local main = core:FindFirstChild("Main")
    if main then
        if main:IsA("BasePart") then return main end
        local mp = main.PrimaryPart or main:FindFirstChildWhichIsA("BasePart", true)
        if mp then return mp end
    end
    if core:IsA("BasePart") then return core end
    if core.PrimaryPart then return core.PrimaryPart end
    local best, bestVol = nil, nil
    for _, d in ipairs(core:GetDescendants()) do
        if d:IsA("BasePart") then
            local v = d.Size.X * d.Size.Y * d.Size.Z
            if v <= 4000 and (not bestVol or v > bestVol) then
                best, bestVol = d, v
            end
        end
    end
    return best or core:FindFirstChildWhichIsA("BasePart", true)
end
local function genProgressOf(gen)
    if genIsFake(gen.Name) then return 0 end
    local pr = genCore.prog[gen]
    if pr == nil or (pr ~= false and not (pr.Parent and pr:IsDescendantOf(gen))) then
        pr = gen:FindFirstChild("Progress") or false
        genCore.prog[gen] = pr
    end
    if pr then
        local okv, vv = pcall(function() return pr.Value end)
        if okv and type(vv) == "number" then
            return math.clamp(vv, 0, 100)
        end
    end
    local okA, attr = pcall(function() return gen:GetAttribute("Progress") end)
    if okA and type(attr) == "number" then
        return math.clamp(attr, 0, 100)
    end
    local bar = genCore.bars[gen]
    if bar == false then return 0 end
    if bar ~= nil and not (bar.Parent and bar:IsDescendantOf(gen)) then
        bar = nil
        genCore.bars[gen] = nil
    end
    if not bar then
        local best, bestScale = nil, -1
        for _, d in ipairs(gen:GetDescendants()) do
            if d:IsA("Frame") and d.Name == "Bar" then
                local okv2, sv = pcall(function() return d.Size.X.Scale end)
                if okv2 and type(sv) == "number" and sv > bestScale then
                    best, bestScale = d, sv
                end
            end
        end
        if best then
            genCore.bars[gen] = best
            bar = best
        else
            genCore.bars[gen] = false
            return 0
        end
    end
    if bar then
        local okv3, sv3 = pcall(function() return bar.Size.X.Scale end)
        if okv3 and type(sv3) == "number" then
            return math.clamp(sv3 * 100, 0, 100)
        end
    end
    return 0
end


local function genFindMaps()
    local found = {}
    local function harvest(container)
        if not container then return end
        local direct = {}
        for _, c in ipairs(container:GetChildren()) do
            if genIsGen(c.Name) then table.insert(direct, c) end
        end
        if #direct > 0 then
            table.insert(found, { container = container, gens = direct })
            return
        end
        local gfolder = container:FindFirstChild("Generators")
        if gfolder then
            local gg = {}
            for _, c in ipairs(gfolder:GetChildren()) do
                if genIsGen(c.Name) then table.insert(gg, c) end
            end
            if #gg > 0 then table.insert(found, { container = gfolder, gens = gg }) end
        end
    end
    local map = Workspace:FindFirstChild("Map")
    if map then
        harvest(map)
        local ing = map:FindFirstChild("Ingame") or map:FindFirstChild("ingame")
        harvest(ing)
        if ing then harvest(ing:FindFirstChild("Map")) end
    end
    for _, nm in ipairs({ "ingame", "Ingame", "Game" }) do
        local alt = Workspace:FindFirstChild(nm)
        if alt then
            harvest(alt)
            if nm ~= "Game" then harvest(alt:FindFirstChild("Map")) end
        end
    end
    return found
end


local function genEnsureGui()
    local gui = genCore.gui
    if gui and gui.Parent then return gui end
    local pg = nil
    pcall(function()
        pg = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer.PlayerGui
    end)
    if not pg then return nil end
    gui = Instance.new("Folder")
    gui.Name = "SAKEN_GenESP"
    gui.Parent = pg
    genCore.gui = gui
    return gui
end


local function genMakeBillboard(core, parentGui)
    local bb = Instance.new("BillboardGui")
    bb.Name = "SAKEN_GenProgress"
    bb.Size = UDim2.fromOffset(168, 46)
    bb.StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = 400
    bb.Adornee = core
    bb.Parent = parentGui

    local root = Instance.new("Frame")
    root.Name = "Root"
    root.Size = UDim2.fromScale(1, 1)
    root.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
    root.BackgroundTransparency = 0.25
    root.BorderSizePixel = 0
    root.Parent = bb
    local c1 = Instance.new("UICorner")
    c1.CornerRadius = UDim.new(0, 6)
    c1.Parent = root
    local st = Instance.new("UIStroke")
    st.Color = Color3.fromRGB(255, 220, 60)
    st.Thickness = 1
    st.Transparency = 0.35
    st.Parent = root

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromOffset(6, 2)
    title.Size = UDim2.new(1, -12, 0, 12)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 11
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextColor3 = Color3.fromRGB(255, 232, 130)
    title.TextStrokeTransparency = 0.4
    title.Text = "GENERATOR"
    title.Parent = root

    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Position = UDim2.fromOffset(6, 18)
    track.Size = UDim2.new(1, -12, 0, 10)
    track.BackgroundColor3 = Color3.fromRGB(48, 48, 56)
    track.BorderSizePixel = 0
    track.Parent = root
    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(0, 5)
    c2.Parent = track

    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.fromScale(0, 1)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 60)
    fill.BorderSizePixel = 0
    fill.Parent = track
    local c3 = Instance.new("UICorner")
    c3.CornerRadius = UDim.new(0, 5)
    c3.Parent = fill

    local pct = Instance.new("TextLabel")
    pct.Name = "Pct"
    pct.BackgroundTransparency = 1
    pct.Position = UDim2.fromOffset(6, 30)
    pct.Size = UDim2.new(1, -12, 0, 14)
    pct.Font = Enum.Font.GothamBold
    pct.TextSize = 12
    pct.TextXAlignment = Enum.TextXAlignment.Center
    pct.TextColor3 = Color3.fromRGB(255, 255, 255)
    pct.TextStrokeTransparency = 0.3
    pct.Text = "0%"
    pct.Parent = root

    return { bb = bb, fill = fill, pct = pct, title = title }
end



local function genApply()
    if not genCore.esp then return end
    if not M.IsAlive() then return end
    local gui = genEnsureGui()
    if not gui then return end

    local progOf = {}
    local aliveList = {}
    for _, entry in ipairs(genFindMaps()) do
        for _, gen in ipairs(entry.gens) do
            if gen and gen.Parent and gen:IsDescendantOf(Workspace) then
                if not genIsFake(gen.Name) then 
                    local pr = genProgressOf(gen)
                    if pr < 100 then          
                        progOf[gen] = pr
                        aliveList[#aliveList + 1] = gen
                    end
                end
            end
        end
    end

    local refPos = nil
    pcall(function()
        local ch = LocalPlayer.Character
        local root = ch and ch:FindFirstChild("HumanoidRootPart")
        refPos = (root and root.Position) or (Workspace.CurrentCamera and Workspace.CurrentCamera.CFrame.Position)
    end)
    if refPos and #aliveList > GEN_CAP then
        table.sort(aliveList, function(a2, b2)
            local pa, pb = genPosOf(a2), genPosOf(b2)
            local da = (pa and (pa - refPos).Magnitude) or math.huge
            local db = (pb and (pb - refPos).Magnitude) or math.huge
            return da < db
        end)
    end

    local keep = {}
    local limit = math.min(#aliveList, GEN_CAP)
    for i = 1, limit do
        local gen = aliveList[i]
        keep[gen] = true
        local core = genResolveCore(gen)

        
        local h = genCore.hl[gen]
        if h and not h.Parent then
            h = nil
            genCore.hl[gen] = nil
        end
        local corePart = genCorePart(core)
        if not h and not core:FindFirstChild("NergGenHL") then
            local okH, newH = pcall(function()
                local hl = Instance.new("Highlight")
                hl.Name = "NergGenHL"
                hl.Adornee = corePart or core
                hl.FillColor = Color3.fromRGB(255, 255, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 0)
                hl.FillTransparency = 0.78
                hl.OutlineTransparency = 0.15
                hl.Parent = core
                return hl
            end)
            if okH then
                h = newH
                genCore.hl[gen] = h
            end
        end
        if h then
            pcall(function()
                h.Adornee = corePart or core
                h.FillColor = Color3.fromRGB(255, 255, 0)
                h.OutlineColor = Color3.fromRGB(255, 255, 0)
                h.FillTransparency = 0.78
                h.OutlineTransparency = 0.15
            end)
        end

        
        local entry = genCore.bb[gen]
        if not entry or not entry.bb or not entry.bb.Parent then
            local okB, made = pcall(genMakeBillboard, core, gui)
            entry = okB and made or nil
            if entry then genCore.bb[gen] = entry end
        end
        if entry then
            local pv = progOf[gen] or 0
            pcall(function()
                entry.bb.Adornee = core
                entry.bb.Enabled = true
                entry.fill.Size = UDim2.fromScale(math.clamp(pv / 100, 0, 1), 1)
                entry.pct.Text = string.format("GENERATOR  %d%%", math.floor(pv + 0.5))
            end)
        end
    end

    
    for gen, h in pairs(genCore.hl) do
        if not keep[gen] then
            genCore.hl[gen] = nil
            pcall(function() h:Destroy() end)
        end
    end
    for gen, entry in pairs(genCore.bb) do
        if not keep[gen] then
            genCore.bb[gen] = nil
            pcall(function() entry.bb:Destroy() end)
        end
    end
    for gen in pairs(genCore.bars) do
        if not keep[gen] then genCore.bars[gen] = nil end
    end
    for gen in pairs(genCore.prog) do
        if not keep[gen] and (not gen.Parent or not gen:IsDescendantOf(Workspace)) then
            genCore.prog[gen] = nil
        end
    end
end

local function genStop()
    genCore.esp = false
    for _, c in ipairs(genCore.conns) do pcall(function() c:Disconnect() end) end
    genCore.conns = {}
    for _, h in pairs(genCore.hl) do pcall(function() h:Destroy() end) end
    for _, e in pairs(genCore.bb) do pcall(function() e.bb:Destroy() end) end
    genCore.hl, genCore.bb = {}, {}
    table.clear(genCore.bars)
    table.clear(genCore.prog)
    table.clear(genCore.core)
    table.clear(genCore.pos)
    genCore.cached = nil
    genCore.dirty = true
    if genCore.gui then
        pcall(function() genCore.gui:Destroy() end)
        genCore.gui = nil
    end
end

local function genStart()
    genCore.esp = true
    genCore.dirty = true
    pcall(genApply)
end


pcall(function()
    M.Bind(Workspace.ChildAdded:Connect(function(c)
        if not genCore.esp then return end
        if c.Name == "Map" or c.Name == "Ingame" or c.Name == "ingame" or c.Name == "Game"
            or c.Name == "Generators" or genIsGen(c.Name) then
            genCore.dirty = true
            task.delay(0.6, function()
                if genCore.esp and M.IsAlive() then pcall(genApply) end
            end)
        end
    end))
    M.Bind(Workspace.ChildRemoved:Connect(function(c)
        if not genCore.esp then return end
        if c.Name == "Map" or c.Name == "Ingame" or c.Name == "ingame" or c.Name == "Game"
            or c.Name == "Generators" or genIsGen(c.Name) then
            genCore.dirty = true
        end
    end))
    M.Bind(LocalPlayer.CharacterAdded:Connect(function()
        pcall(function()
            genCore.dirty = true
            table.clear(genCore.pos)
            table.clear(genCore.core)
        end)
    end))
end)



M.Every(0.5, function()
    if not genCore.esp then return end
    if not M.IsAlive() then return end
    genCore.dirty = true
    pcall(genApply)
end)








local a743 = {
    flow      = { on = false },
    lock      = { on = false },
    conn      = { on = false },
    gear      = { on = false },
    gearSolve = { on = false },
    flowMin   = 2.0,
    flowMax   = 4.5,
    pace      = 0.15,
    jit       = 0.2,
}

local a743Active = {}            
local a743Hooked = {}            
local a743OrigStarts = {}        
local a743Found = { flow = false, lock = false, conn = false, gear = false }


local function a743Paced()
    local base = tonumber(a743.pace) or 0.15
    local j = tonumber(a743.jit) or 0
    local d = base * (1 - j + math.random() * 2 * j)
    if d < 0.03 then d = 0.03 end
    return d
end




local function a743ModuleOf(name)
    local sys = ReplicatedStorage:FindFirstChild("Systems")
    local ply = sys and sys:FindFirstChild("Player")
    local gam = ply and ply:FindFirstChild("Game")
    local mgFolder = gam and gam:FindFirstChild("Minigames")
    if not mgFolder then
        pcall(function()
            mgFolder = ReplicatedStorage:WaitForChild("Systems", 5):WaitForChild("Player", 5):WaitForChild("Game", 5):WaitForChild("Minigames", 5)
        end)
    end
    local m = mgFolder and (mgFolder:FindFirstChild(name) or mgFolder:WaitForChild(name, 5))
    if not m then return nil end
    local okR, mm = pcall(require, m)
    if okR and type(mm) == "table" then return mm end
    return nil
end


local function a743ClassValues(mm)
    if type(mm) ~= "table" then return nil end
    for k in pairs(mm) do
        if tostring(k):find("ClassValues") then
            local cls = mm[k]
            if type(cls) == "table" and type(cls.Start) == "function" then return cls end
        end
    end
    return nil
end


local function a743HookStart(cls, onSession)
    if a743Hooked[cls] then return end
    a743Hooked[cls] = true
    local cur = cls.Start
    a743OrigStarts[cls] = cur
    cls.Start = function(...)
        local a = { ... }
        local rets = { cur(table.unpack(a)) }
        for _, v in ipairs(a) do
            if type(v) == "table" and (type(v.Network) == "table" or v.__input ~= nil or v.__renderer ~= nil) then
                local ses = v
                task.spawn(function()
                    a743Active[ses] = true
                    pcall(onSession, ses)
                    a743Active[ses] = nil
                end)
                break
            end
        end
        return table.unpack(rets)
    end
end

local function a743RestoreHooks()
    for cls, orig in pairs(a743OrigStarts) do
        pcall(function() cls.Start = orig end)
    end
    a743OrigStarts = {}
    a743Hooked = {}
    table.clear(a743Active)
end




local function a743OnFlow(ses)
    if not a743.flow.on then return end
    local b, inp, rd
    for _ = 1, 28 do
        inp = ses.__input
        rd = ses.__renderer
        b = inp and inp.Board
        if b and rd and not inp.Ended
            and type(b.Size) == "number" and b.Size > 0
            and type(b.Pairs) == "table" and next(b.Pairs) ~= nil
            and type(b.Paths) == "table" and type(b.Position) == "table" then
            break
        end
        waitT(0.25)
    end
    if not (b and rd and inp and not inp.Ended and type(b.Pairs) == "table" and next(b.Pairs) ~= nil) then return end
    local solveStartT = os.clock()
    waitT(0.45)
    if inp.Ended or not a743.flow.on then return end
    local s = b.Size
    local function rc(c) return math.ceil(c / s), (c - 1) % s + 1 end
    local function pairDist(i)
        local pr = b.Pairs[i]
        if type(pr) ~= "table" then return 999 end
        return math.abs(math.ceil(pr[1] / s) - math.ceil(pr[2] / s)) + math.abs((pr[1] - 1) % s - (pr[2] - 1) % s)
    end
    local maxI = 0
    for i in pairs(b.Pairs) do
        if i > maxI then maxI = i end
    end
    for i = 1, maxI do
        if type(b.Paths[i]) ~= "table" then b.Paths[i] = {} end
    end
    local endpointOwner = {}
    for i, pr in pairs(b.Pairs) do
        if type(pr) == "table" and pr[1] and pr[2] then
            endpointOwner[pr[1]] = i
            endpointOwner[pr[2]] = i
        end
    end
    local tran, co = {}, {}
    for i, pr in pairs(b.Pairs) do
        if type(pr) == "table" and pr[1] and pr[2] then
            local pp = b.Paths[i]
            if type(pp) == "table" and #pp >= 2 and pp[1] == pr[1] and pp[#pp] == pr[2] then
                co[#co + 1] = i
            else
                tran[#tran + 1] = i
            end
        end
    end
    table.sort(tran)
    if #tran == 0 then return end
    local bestI, bestD
    for _, i in ipairs(tran) do
        local d = pairDist(i)
        if not bestD or d < bestD then
            bestD, bestI = d, i
        end
    end
    local function mutatePath(i2, pts)
        local tgt = b.Paths[i2]
        if type(tgt) ~= "table" then
            tgt = {}
            b.Paths[i2] = tgt
        end
        for j = #tgt, 1, -1 do
            tgt[j] = nil
        end
        for j, v in ipairs(pts) do
            tgt[j] = v
        end
    end
    for _, i in ipairs(tran) do
        local oldP = b.Paths[i]
        if type(oldP) == "table" then
            for _, cc in ipairs(oldP) do
                b.Position[cc] = nil
                if type(b.Owner) == "table" then b.Owner[cc] = nil end
            end
        end
        mutatePath(i, {})
    end
    for cc, ow in pairs(b.Owner or {}) do
        local isDone = false
        for _, ci in ipairs(co) do
            if ci == ow then
                isDone = true
                break
            end
        end
        if not isDone then
            b.Owner[cc] = nil
            b.Position[cc] = nil
        end
    end
    local used = {}
    for _, i in ipairs(co) do
        local pp = b.Paths[i]
        if type(pp) == "table" then
            for _, cc in ipairs(pp) do
                used[cc] = true
            end
        end
    end
    local prs = {}
    for _, i in ipairs(tran) do
        if i ~= bestI then prs[#prs + 1] = i end
    end
    table.sort(prs, function(iA, iB)
        local dA, dB = pairDist(iA), pairDist(iB)
        if dA ~= dB then return dA < dB end
        return iA < iB
    end)
    local solveOrder = table.clone(prs)
    solveOrder[#solveOrder + 1] = bestI
    local nbrCache = {}
    for c = 1, s * s do
        local r, co2 = rc(c)
        local t = {}
        if r > 1 then t[#t + 1] = c - s end
        if r < s then t[#t + 1] = c + s end
        if co2 > 1 then t[#t + 1] = c - 1 end
        if co2 < s then t[#t + 1] = c + 1 end
        nbrCache[c] = t
    end
    local function canStep(nx, i2)
        return (not used[nx]) and (endpointOwner[nx] == nil or endpointOwner[nx] == i2)
    end
    local function reachable(a2, z2, i2)
        if a2 == z2 then return true end
        local seen = { [a2] = true }
        local q = { a2 }
        local head = 1
        while head <= #q do
            local cur = q[head]
            head += 1
            for _, nx in ipairs(nbrCache[cur]) do
                if not seen[nx] and canStep(nx, i2) then
                    if nx == z2 then return true end
                    seen[nx] = true
                    q[#q + 1] = nx
                end
            end
        end
        return false
    end
    local function allRemainingReachable(fromK)
        for k2 = fromK, #solveOrder do
            local idx2 = solveOrder[k2]
            local p2 = b.Pairs[idx2]
            if not reachable(p2[1], p2[2], idx2) then
                return false
            end
        end
        return true
    end
    local function commit(i2, snap)
        mutatePath(i2, snap)
        for j, cc in ipairs(snap) do
            used[cc] = true
            b.Position[cc] = j
            if type(b.Owner) == "table" then b.Owner[cc] = i2 end
        end
    end
    local function uncommit(i2, snap)
        mutatePath(i2, {})
        for _, cc in ipairs(snap) do
            used[cc] = nil
            b.Position[cc] = nil
            if type(b.Owner) == "table" then b.Owner[cc] = nil end
        end
    end
    local success = false
    local nodes = 0
    local allowSelfTouch = false
    local function isChordless(nx, cur, z2, onp)
        if allowSelfTouch or nx == z2 then return true end
        for _, nb in ipairs(nbrCache[nx]) do
            if nb ~= cur and onp[nb] then
                return false
            end
        end
        return true
    end
    local function bt(k)
        if success then return end
        if k > #solveOrder then
            success = true
            return
        end
        local i2 = solveOrder[k]
        local pr = b.Pairs[i2]
        local a2, z2 = pr[1], pr[2]
        local bpath
        do
            local prev = { [a2] = 0 }
            local q = { a2 }
            local head = 1
            while head <= #q and not prev[z2] do
                local cur = q[head]
                head += 1
                for _, nx in ipairs(nbrCache[cur]) do
                    if not prev[nx] and canStep(nx, i2) then
                        prev[nx] = cur
                        q[#q + 1] = nx
                    end
                end
            end
            if prev[z2] then
                local rev = {}
                local cur = z2
                while cur ~= 0 do
                    rev[#rev + 1] = cur
                    cur = prev[cur]
                end
                bpath = {}
                for j = #rev, 1, -1 do bpath[j] = rev[#rev - j + 1] end
            end
        end
        if bpath then
            commit(i2, bpath)
            if allRemainingReachable(k + 1) then
                bt(k + 1)
            end
            if not success then
                uncommit(i2, bpath)
            end
        end
        if success then return end
        local rz, cz = rc(z2)
        local onp = { [a2] = true }
        local cells = { a2 }
        local function cmpNbr(p, q)
            local rp, cp = rc(p)
            local rq, cq = rc(q)
            return (math.abs(rp - rz) + math.abs(cp - cz)) < (math.abs(rq - rz) + math.abs(cq - cz))
        end
        local function dfs(c)
            nodes += 1
            if nodes > 45000 or success or inp.Ended or not a743.flow.on or not M.IsAlive() then return end
            if nodes % 600 == 0 then
                task.wait()
                if inp.Ended or not a743.flow.on or not M.IsAlive() then return end
            end
            if c == z2 then
                local snap = table.clone(cells)
                commit(i2, snap)
                if allRemainingReachable(k + 1) then
                    bt(k + 1)
                end
                if not success then
                    uncommit(i2, snap)
                end
                return
            end
            local nbrs = table.clone(nbrCache[c])
            table.sort(nbrs, cmpNbr)
            for _, nx in ipairs(nbrs) do
                if not onp[nx] and canStep(nx, i2) and isChordless(nx, c, z2, onp) then
                    onp[nx] = true
                    cells[#cells + 1] = nx
                    dfs(nx)
                    cells[#cells] = nil
                    onp[nx] = nil
                    if nodes > 45000 or success or inp.Ended or not a743.flow.on or not M.IsAlive() then return end
                end
            end
        end
        dfs(a2)
        return success
    end
    bt(1)
    if not success and not inp.Ended and a743.flow.on then
        nodes = 0
        allowSelfTouch = true
        bt(1)
    end
    if not success then
        return
    end
    local solvedSnap = {}
    for _, idx in ipairs(solveOrder) do
        solvedSnap[idx] = table.clone(b.Paths[idx] or {})
        uncommit(idx, solvedSnap[idx])
    end
    if type(b.__rebuild) == "function" then pcall(function() return b:__rebuild() end) end
    if type(rd) == "table" and type(rd.Render) == "function" then
        pcall(function() return rd:Render() end)
    end
    
    local lo = math.clamp(math.min(tonumber(a743.flowMin) or 2.0, tonumber(a743.flowMax) or 5.0), 1.0, 10.0)
    local hi = math.clamp(math.max(tonumber(a743.flowMin) or 2.0, tonumber(a743.flowMax) or 5.0), 1.0, 10.0)
    local totalWait = lo + math.random() * (hi - lo)
    local remWait = math.max(0.15, totalWait - (os.clock() - solveStartT))
    local stepWait = math.max(0.05, remWait / math.max(1, #solveOrder))
    for k, idx in ipairs(solveOrder) do
        waitT(stepWait)
        if not M.IsAlive() or inp.Ended or not a743.flow.on then return end
        local snap = solvedSnap[idx]
        if k == #solveOrder then
            inp.Dragging = nil
            for _, i2 in ipairs(solveOrder) do
                local oldP = b.Paths[i2]
                if type(oldP) == "table" then
                    for _, cc in ipairs(oldP) do
                        b.Position[cc] = nil
                        if type(b.Owner) == "table" then b.Owner[cc] = nil end
                    end
                end
                mutatePath(i2, {})
            end
            for cc, ow in pairs(b.Owner or {}) do
                local keep = false
                for _, ci in ipairs(co) do
                    if ci == ow then
                        keep = true
                        break
                    end
                end
                if not keep then
                    b.Owner[cc] = nil
                    b.Position[cc] = nil
                end
            end
            for _, i2 in ipairs(solveOrder) do
                commit(i2, solvedSnap[i2])
            end
        else
            commit(idx, snap)
        end
        if type(b.__rebuild) == "function" then pcall(function() return b:__rebuild() end) end
        if type(rd) == "table" and type(rd.Render) == "function" then
            pcall(function() return rd:Render() end)
        end
        if type(rd) == "table" and type(rd.Pulse) == "function" and type(snap) == "table" and snap[#snap] then
            pcall(function() rd:Pulse(snap[#snap]) end)
        end
    end
    if not inp.Ended and a743.flow.on and type(b.IsSolved) == "function" and b:IsSolved() then
        waitT(0.08)
        if not inp.Ended and a743.flow.on and M.IsAlive() then
            if type(inp.__finish) == "function" then pcall(function() inp:__finish() end) end
            local cb = inp.Callbacks
            if type(cb) == "table" and type(cb.OnSolved) == "function" then
                pcall(cb.OnSolved)
            end
        end
    end
end





local function a743OnLock(ses)
    if not a743.lock.on then return end
    local inp, rd
    for _ = 1, 40 do
        inp = ses.__input
        rd = ses.__renderer
        if inp and rd and not inp.Ended then break end
        waitT(0.05)
    end
    if not (inp and rd and not inp.Ended) then return end
    local b = rd.Board
    local circle = rd.Circle
    if type(b) ~= "table" or typeof(circle) ~= "Instance" then return end
    local line = circle:FindFirstChild("Line")
    if not line then return end
    local cb = inp.Callbacks
    if type(cb) ~= "table" or type(cb.OnPress) ~= "function" then return end
    local startTime = tonumber(b.Config and b.Config.StartTime) or 0
    local waitT0 = os.clock()
    while a743.lock.on and not inp.Ended and M.IsAlive() and (os.clock() - waitT0) < 3.0 do
        if Workspace:GetServerTimeNow() >= startTime + 0.02 then break end
        RunService.Heartbeat:Wait()
    end
    if inp.Ended or not a743.lock.on or not M.IsAlive() then return end
    local hasAngleAt = (type(b.AngleAt) == "function")
    local hasIsOnTarget = (type(b.IsOnTarget) == "function")
    local guard = 0
    while a743.lock.on and not inp.Ended and M.IsAlive() and guard < 30 do
        guard += 1
        local st = b.State
        local remaining = tonumber(st and st.Remaining) or 0
        if remaining <= 0 or rd.__broken then break end
        local target = tonumber(st.Target)
        if not target then
            RunService.Heartbeat:Wait()
            continue
        end
        local cfg = b.Config
        local half = (tonumber(cfg and cfg.TargetSize) or 45) * 0.5
        local hitThreshold = math.max(4, half * 0.88)
        local t0 = os.clock()
        local prevOff, prevRot = nil, nil
        local fired = false
        while os.clock() - t0 < 12 and a743.lock.on and not inp.Ended and M.IsAlive() do
            if tonumber(st.Target) ~= target or (tonumber(st.Remaining) or 0) <= 0 or rd.__broken then
                fired = true
                break
            end
            local nowSrv = Workspace:GetServerTimeNow()
            local okAng, srvAng = false, nil
            if hasAngleAt then
                okAng, srvAng = pcall(b.AngleAt, b, nowSrv)
            end
            local rot = (okAng and type(srvAng) == "number") and srvAng or line.Rotation
            local off = (rot - target + 180) % 360 - 180
            local dist = math.abs(off)
            local crossed = false
            if prevOff and prevRot then
                local dd = (rot - prevRot + 180) % 360 - 180
                if dd > 0 then
                    crossed = (prevOff < 0 and off >= 0)
                elseif dd < 0 then
                    crossed = (prevOff > 0 and off <= 0)
                end
            end
            if dist <= hitThreshold or crossed then
                local onTgt = true
                if hasIsOnTarget then
                    local okT, resT = pcall(b.IsOnTarget, b, rot)
                    if okT then onTgt = (resT == true) end
                end
                if onTgt then
                    pcall(function() return cb.OnPress() end)
                    fired = true
                    break
                end
            end
            prevOff, prevRot = off, rot
            RunService.Heartbeat:Wait()
        end
        if not fired then
            break
        end
        local postT0 = os.clock()
        repeat
            RunService.Heartbeat:Wait()
        until inp.Ended or not a743.lock.on or (tonumber(st.Remaining) or 0) < remaining
            or tonumber(st.Target) ~= target or (os.clock() - postT0) >= 0.05
    end
end





local function a743OnConnect(ses)
    if not a743.conn.on then return end
    local inp, rd
    for _ = 1, 16 do
        inp = ses.__input
        rd = ses.__renderer
        if inp and rd and not inp.Ended and type(inp.Board) == "table"
            and type(inp.Board.Mates) == "table" and next(inp.Board.Mates) ~= nil
            and type(rd.Blobs) == "table" then
            break
        end
        waitT(0.5)
    end
    if not (inp and rd and not inp.Ended) then return end
    waitT(0.5)
    if inp.Ended or not a743.conn.on then return end
    local board = inp.Board
    local function ctr(i)
        local f = rd.Blobs[i]
        if typeof(f) ~= "Instance" then return nil end
        return Vector2.new(f.AbsolutePosition.X + f.AbsoluteSize.X / 2, f.AbsolutePosition.Y + f.AbsoluteSize.Y / 2)
    end
    local guard = 0
    while a743.conn.on and not inp.Ended and M.IsAlive() and guard < 12 do
        guard += 1
        local links = board.Links
        local pending = nil
        for i, mate in pairs(board.Mates) do
            i = tonumber(i)
            mate = tonumber(mate)
            if i and mate and links[tonumber(i)] == nil then
                pending = { i, mate }
                break
            end
        end
        if not pending then break end
        local c1, c2 = ctr(pending[1]), ctr(pending[2])
        if c1 and c2 then
            inp:__begin(pending[1], c1)
            inp:__release(c2)
        end
        waitT(a743Paced())
    end
    waitT(0.4)
end





local function a743OnGear(ses)
    local inp, rd = ses.__input, ses.__renderer
    local t0 = os.clock()
    while (inp == nil or rd == nil) and os.clock() - t0 < 8 and M.IsAlive() do
        waitT(0.2)
        inp = ses.__input
        rd = ses.__renderer
    end
    while inp and inp.Ended == false and M.IsAlive() do
        if a743.gearSolve.on and rd and rd.__flying ~= nil and rd.__flight == nil and not rd.__isSpinning then
            waitT(0.05)
            local cb = inp.Callbacks
            local onTurn = type(cb) == "table" and cb.OnTurn
            while a743.gearSolve.on and not inp.Ended and rd.__flying ~= nil and rd.__flight == nil
                and not rd.__isSpinning and M.IsAlive() do
                local dt = RunService.Heartbeat:Wait()
                if not (a743.gearSolve.on and not inp.Ended and not rd.__isSpinning) then break end
                local stepDeg = math.clamp((dt or 0.016) * 1080, 18, 65)
                if type(onTurn) == "function" then
                    pcall(onTurn, stepDeg)
                end
            end
        else
            waitT(0.15)
        end
    end
end






local espFolder, bbPool, boxPool, slotUsed, tracked = nil, {}, {}, {}, {}
local gearPool, gearIng, gearAddConn, gearRemConn = {}, nil, nil, nil
local A743_MAXD, A743_CAP = 200, 8
local a743Acc = 0

local function a743EspClean()
    for _, e in pairs(tracked) do
        if e.bb then
            e.bb.Enabled = false
            e.bb.Adornee = nil
        end
        if e.box then
            e.box.Visible = false
            e.box.Adornee = nil
        end
        if e.slot then slotUsed[e.slot] = nil end
        e.bb, e.box, e.slot = nil, nil, nil
    end
    table.clear(tracked)
    table.clear(slotUsed)
end

local function a743AllocSlot()
    for s = 1, A743_CAP do
        if not slotUsed[s] then
            slotUsed[s] = true
            return s
        end
    end
    return nil
end

local function a743EspBuild()
    if espFolder and espFolder.Parent then return end
    espFolder = Instance.new("Folder")
    espFolder.Name = "SAKEN_GearESP"
    espFolder.Parent = Workspace
    for i = 1, A743_CAP do
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "SAKEN_GearBox"
        box.Color3 = Color3.fromRGB(255, 205, 0)
        box.Transparency = 0.35
        box.AlwaysOnTop = true
        box.ZIndex = 8
        box.Size = Vector3.new(2.2, 2.2, 2.2)
        box.Visible = false
        box.Parent = espFolder
        boxPool[i] = box

        local bb = Instance.new("BillboardGui")
        bb.Name = "SAKEN_GearTag"
        bb.Size = UDim2.fromOffset(140, 22)
        bb.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.Enabled = false
        local tl = Instance.new("TextLabel")
        tl.Name = "TextLabel"
        tl.Size = UDim2.fromScale(1, 1)
        tl.BackgroundTransparency = 1
        tl.Font = Enum.Font.GothamBold
        tl.TextScaled = true
        tl.TextColor3 = Color3.fromRGB(255, 220, 80)
        tl.TextStrokeTransparency = 0.2
        tl.Text = "Gear"
        tl.Parent = bb
        bb.Parent = espFolder
        bbPool[i] = bb
    end
end


local function a743GearTick(dt)
    if not M.IsAlive() then return end
    for ses in pairs(a743Active) do
        local i2 = ses.__input
        if not i2 or i2.Ended ~= false then a743Active[ses] = nil end
    end
    if not a743.gear.on then
        a743Acc = 0
        return
    end
    
    local interval = (next(a743Active) ~= nil) and 3 or 1
    a743Acc += dt
    if a743Acc < interval then return end
    a743Acc = 0
    a743EspBuild()
    local chr = LocalPlayer.Character
    local hrp = chr and chr:FindFirstChild("HumanoidRootPart")
    if not hrp then
        a743EspClean()
        return
    end
    local seen = {}
    local mapInst = Workspace:FindFirstChild("Map")
    local ing = mapInst and mapInst:FindFirstChild("Ingame")
    if not ing then
        if gearIng then
            gearIng = nil
            table.clear(gearPool)
            if gearAddConn then pcall(function() gearAddConn:Disconnect() end) gearAddConn = nil end
            if gearRemConn then pcall(function() gearRemConn:Disconnect() end) gearRemConn = nil end
        end
        a743EspClean()
        return
    end
    if ing ~= gearIng then
        gearIng = ing
        table.clear(gearPool)
        a743EspClean()
        if gearAddConn then pcall(function() gearAddConn:Disconnect() end) gearAddConn = nil end
        if gearRemConn then pcall(function() gearRemConn:Disconnect() end) gearRemConn = nil end
        for _, d0 in ipairs(ing:GetDescendants()) do
            if d0:IsA("Model") and d0.Name == "Gear" then gearPool[d0] = true end
        end
        gearAddConn = ing.DescendantAdded:Connect(function(d0)
            if d0:IsA("Model") and d0.Name == "Gear" then gearPool[d0] = true end
        end)
        gearRemConn = ing.DescendantRemoving:Connect(function(d0)
            gearPool[d0] = nil
        end)
    end
    for d, isCand in pairs(gearPool) do
        if not (d.Parent and d:IsDescendantOf(ing)) then
            gearPool[d] = nil
        elseif isCand == true and d:IsA("Model") and d.Name == "Gear" then
            local realG = (d:GetAttribute("__NP_REAL_GEAR") == true)
            local ghl = d:FindFirstChild("GearHighlight")
            if ghl then
                realG = true
            elseif not realG then
                local prompt = d:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt then
                    local act = tostring(prompt.ActionText):lower()
                    local obj = tostring(prompt.ObjectText):lower()
                    if act:find("pick") or act:find("take") or act:find("grab") or act:find("collect")
                        or act:find("gear") or obj:find("gear") then
                        realG = true
                    end
                end
            end
            if realG then
                if d:GetAttribute("__NP_REAL_GEAR") ~= true then
                    pcall(function() d:SetAttribute("__NP_REAL_GEAR", true) end)
                end
                local bp = (ghl and ghl.Parent and ghl.Parent:IsA("BasePart") and ghl.Parent)
                    or d.PrimaryPart
                    or d:FindFirstChildWhichIsA("BasePart", true)
                if bp and bp.Size.Magnitude <= 25 then
                    local ok, pv = pcall(function() return bp.Position end)
                    if ok and pv then
                        local kc = (hrp.Position - pv).Magnitude
                        if kc <= (tracked[d] and A743_MAXD or 185) then
                            local entry = tracked[d]
                            if not entry then
                                local s = a743AllocSlot()
                                if s then
                                    entry = { slot = s, bb = bbPool[s], box = boxPool[s], dist = kc }
                                    tracked[d] = entry
                                end
                            else
                                entry.dist = kc
                            end
                            if entry then
                                seen[d] = true
                                entry.box.Adornee = bp
                                entry.box.Size = bp.Size + Vector3.new(0.3, 0.3, 0.3)
                                entry.box.Visible = true
                                entry.bb.Adornee = bp
                                entry.bb.Enabled = true
                                entry.bb.TextLabel.Text = string.format("Gear [%dm]", math.floor(kc + 0.5))
                            end
                        end
                    end
                end
            else
                gearPool[d] = false
            end
        end
    end
    for d, entry in pairs(tracked) do
        if seen[d] and d.Parent and d:IsDescendantOf(ing) then
            entry.miss = 0
        else
            entry.miss = (entry.miss or 0) + 1
            if not (d.Parent and d:IsDescendantOf(Workspace)) or entry.miss >= 2 then
                if entry.bb then
                    entry.bb.Enabled = false
                    entry.bb.Adornee = nil
                end
                if entry.box then
                    entry.box.Visible = false
                    entry.box.Adornee = nil
                end
                if entry.slot then slotUsed[entry.slot] = nil end
                tracked[d] = nil
            end
        end
    end
end


M.OnHeartbeat(function(dt)
    if not a743.gear.on then return end
    pcall(a743GearTick, dt)
end)

local function a743GearStart()
    if a743.gear.on then return end
    a743.gear.on = true
    a743Acc = 0
    pcall(a743EspBuild)
end

local function a743GearStop()
    a743.gear.on = false
    a743Acc = 0
    if gearAddConn then pcall(function() gearAddConn:Disconnect() end) gearAddConn = nil end
    if gearRemConn then pcall(function() gearRemConn:Disconnect() end) gearRemConn = nil end
    gearIng = nil
    table.clear(gearPool)
    pcall(a743EspClean)
    if espFolder then
        pcall(function() espFolder:Destroy() end)
        espFolder = nil
        table.clear(bbPool)
        table.clear(boxPool)
    end
end


local function a743TryHook(key, modName, onSession)
    if a743Found[key] then return end
    local cls = a743ClassValues(a743ModuleOf(modName))
    if cls then
        a743HookStart(cls, onSession)
        a743Found[key] = true
    end
end

local function a743Init()
    if not M.IsAlive() then return end
    pcall(a743TryHook, "flow", "FlowClientMinigame", a743OnFlow)
    pcall(a743TryHook, "lock", "LockClientMinigame", a743OnLock)
    pcall(a743TryHook, "conn", "ConnectClientMinigame", a743OnConnect)
    pcall(a743TryHook, "gear", "GearClientMinigame", a743OnGear)
end






secEsp:Toggle("gen_esp", "Generator ESP", false, function(v)
    pcall(function()
        if v then genStart() else genStop() end
    end)
    M.Notify("Generator", v and "ESP: On (highlight + progress bar, fakes filtered)" or "ESP: Off")
end)
secEsp:Label("Reads Progress (Value object / Progress attribute / Bar frame); shows the 6 nearest unfinished real generators.")


secSol:Toggle("gen_flow", "Flow Solver", false, function(v)
    a743.flow.on = v and true or false
end)
secSol:Toggle("gen_lock", "Lock Solver", false, function(v)
    a743.lock.on = v and true or false
end)
secSol:Toggle("gen_connect", "Connect Solver", false, function(v)
    a743.conn.on = v and true or false
end)
secSol:Toggle("gen_gear_solve", "Gear Solver", false, function(v)
    a743.gearSolve.on = v and true or false
    pcall(function() M.Set("gen_gear_solve", v and true or false) end)
end)
secSol:Toggle("gen_gear_esp", "Gear ESP", false, function(v)
    pcall(function()
        if v then a743GearStart() else a743GearStop() end
    end)
end)
secSol:Label("Solvers only call the real game session input API (__begin/__release/OnPress/OnTurn); no memory writes.")


secPace:Slider("gen_flow_min", "Flow Min Time (s)", 1, 10, 2, "s", function(v)
    local n = math.clamp(tonumber(v) or 2.0, 1.0, 10.0)
    a743.flowMin = n
end)
secPace:Slider("gen_flow_max", "Flow Max Time (s)", 1, 10, 4.5, "s", function(v)
    local n = math.clamp(tonumber(v) or 4.5, 1.0, 10.0)
    a743.flowMax = n
end)
secPace:Slider("gen_pace", "Solve Step (s)", 0.05, 1, 0.15, "s", function(v)
    local n = math.clamp(tonumber(v) or 0.15, 0.05, 1.0)
    a743.pace = n
end)
secPace:Slider("gen_pace_jit", "Step Jitter", 0, 1, 0.2, "", function(v)
    local n = math.clamp(tonumber(v) or 0.2, 0.0, 1.0)
    a743.jit = n
end)
secPace:Label("Flow replays using a random total time in [Min, Max]; Pace/Jitter sets the per-step delay for Connect.")





pcall(a743Init)

M.Every(3, function()
    if not M.IsAlive() then return end
    if a743Found.flow and a743Found.lock and a743Found.conn and a743Found.gear then return end
    pcall(a743Init)
end)

local function genFullCleanup()
    pcall(genStop)
    pcall(a743GearStop)
    pcall(a743RestoreHooks)
end



if type(M.OnUnload) == "function" then
    pcall(M.OnUnload, genFullCleanup)
end
end)


addModule(function(M)

local cs = "cam"
local CAM = M.Page("cam")
local MIS = M.Page("misc")
local camSec = CAM:Section("FOV", "FOV", "Extended FOV & zoom")
local camNC = CAM:Section("Free Camera", "NOCLIP", "WASD fly camera")
local effSec = MIS:Section("Visual Effects", "Effects", "Resist / Anti-Interference")
local gfxSec = MIS:Section("Graphics", "Graphics", "Performance & Overlay")
local privSec = MIS:Section("Privacy / Chat", "Privacy / Chat", "")

local Players, WS, Lighting, RS, RunService, UIS =
    M.Svc.Players, M.Svc.Workspace, M.Svc.Lighting, M.Svc.ReplicatedStorage, M.Svc.RunService, M.Svc.UserInputService
local LP = M.Local
local PlayerGui = LP:WaitForChild("PlayerGui")
local TextChatService = game:GetService("TextChatService")
local Stats = game:GetService("Stats")

local S = {
    fov = tonumber(M.Get("cam_fov")) or 70,
    zoom = tonumber(M.Get("cam_zoom")) or 10,
    noclip = M.Get("cam_noclip") == true,
    antiBlind = M.Get("mis_anti_blind") == true,
    antiGlitch = M.Get("mis_anti_glitch") == true,
    antiSub = M.Get("mis_anti_sub") == true,
    antiLaugh = M.Get("mis_anti_laugh") == true,
    antiFakeNoli = M.Get("mis_anti_fake_noli") == true,
    lowGfx = M.Get("mis_low_gfx") == true,
    fps = M.Get("mis_fps") == true,
    noFog = M.Get("mis_nofog") == true,
    forceChat = M.Get("mis_force_chat") == true,
    showPrivacy = M.Get("mis_privacy") == true,
    fakeName = M.Get("mis_fake_name") == true,
    noChat = M.Get("mis_no_chat") == true,
    spoofDevice = M.Get("mis_spoof_device") or "Original",
}
local function alive() return M.IsAlive() end
local function note(t) pcall(M.Notify, "Misc", t) end
local conns = {}
local function bind(c)
    if c then conns[#conns + 1] = c; M.Bind(c) end
    return c
end


local StarterPlayer = game:GetService("StarterPlayer")
local function fovSetting()
    local pd = LP:FindFirstChild("PlayerData") or LP:WaitForChild("PlayerData", 5)
    if not pd then return nil end
    local v = pd:FindFirstChild("FieldOfView", true) or pd:FindFirstChild("FOV", true)
    if v and v:IsA("NumberValue") then return v end
    return nil
end
local camFallbackConn
local function applyFov()
    local setting = fovSetting()
    if setting then
        pcall(function() setting.Value = math.clamp(S.fov, 40, 120) end)
        return
    end
    local cam = WS.CurrentCamera
    if cam then pcall(function() cam.FieldOfView = math.clamp(S.fov, 40, 120) end) end
    if not camFallbackConn then
        camFallbackConn = RunService.RenderStepped:Connect(function()
            if not alive() or S.fov == 70 then return end
            local c = WS.CurrentCamera
            if c and math.abs(c.FieldOfView - S.fov) > 0.5 then
                pcall(function() c.FieldOfView = math.clamp(S.fov, 40, 120) end)
            end
        end)
        M.Bind(camFallbackConn)
    end
end
local function applyZoom()
    local base = 10
    pcall(function() base = StarterPlayer.CameraMaxZoomDistance end)
    pcall(function() LP.CameraMaxZoomDistance = base + S.zoom * 0.25 end)
end
local function ensureCameraWatch()
    bind(WS:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        task.defer(function()
            if not alive() then return end
            if S.fov ~= 70 then applyFov() end
            if S.zoom ~= 10 then applyZoom() end
        end)
    end))
end

local ncActive, ncConn = false, nil
local function stopNC()
    ncActive = false
    if ncConn then pcall(function() ncConn:Disconnect() end); ncConn = nil end
end
local function startNC()
    stopNC()
    ncActive = true
    local cf = nil
    ncConn = RunService.RenderStepped:Connect(function(dt)
        if not ncActive or not alive() then return end
        local cam = WS.CurrentCamera
        if not cam then return end
        local move = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.E) then move += Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.Q) then move -= Vector3.new(0, 1, 0) end
        cf = cf or cam.CFrame
        if move.Magnitude > 0.01 then
            cf = cf + move.Unit * (60 * dt)
        end
        cam.CFrame = cf
        cam.CameraType = Enum.CameraType.Scriptable
    end)
end


local function watchTagged(container, tags, onHit)
    if not container then return end
    local function scan()
        if not alive() then return end
        for _, d in ipairs(container:GetDescendants()) do
            for tag, _ in pairs(tags) do
                if string.find(string.lower(d.Name), tag, 1, true) then pcall(onHit, d) end
            end
        end
    end
    scan()
    bind(container.DescendantAdded:Connect(function(d)
        for tag in pairs(tags) do
            if string.find(string.lower(d.Name), tag, 1, true) then pcall(onHit, d) end
        end
    end))
end
local function setDisabled(inst)
    if inst and (inst:IsA("BlurEffect") or inst:IsA("ColorCorrectionEffect") or inst:IsA("ImageLabel") or inst:IsA("Frame")) then
        pcall(function() inst.Enabled = false end)
    end
end
local startedFlags = {}
local function once(key, fn)
    if startedFlags[key] then return end
    startedFlags[key] = true
    pcall(fn)
end
local function startAntiBlind()
    once("blind", function()
    watchTagged(Lighting, { blind = true, flash = true, whiteout = true }, setDisabled)
    bind(Lighting.DescendantAdded:Connect(function(d)
        if d:IsA("BlurEffect") or d:IsA("ColorCorrectionEffect") then
            if S.antiBlind then pcall(setDisabled, d) end
        end
    end))
    end)
end
local function startAntiGlitch()
    once("glitch", function()
    watchTagged(PlayerGui, { glitch = true, distort = true }, function(d)
        if d:IsA("ImageLabel") or d:IsA("Frame") then
            pcall(function() d.Visible = false end)
        end
    end)
    end)
end
local function startAntiSub()
    once("sub", function()
    watchTagged(PlayerGui, { subspaced = true, subspace = true }, function(d)
        if d:IsA("Frame") or d:IsA("ImageLabel") then pcall(function() d.Visible = false end) end
    end)
    end)
end
local function startAntiLaugh()
    once("laugh", function()
    local function kill(snd)
        if snd:IsA("Sound") and string.find(string.lower(snd.Name), "laugh", 1, true) then
            pcall(function() snd.Volume = 0.15 end)
        end
    end
    if LP.Character then
        for _, d in ipairs(LP.Character:GetDescendants()) do kill(d) end
        bind(LP.Character.DescendantAdded:Connect(kill))
    end
    bind(LP.CharacterAdded:Connect(function(c)
        for _, d in ipairs(c:GetDescendants()) do kill(d) end
        bind(c.DescendantAdded:Connect(kill))
    end))
    end)
end
local function startAntiFakeNoli()
    local function sweep()
        if not alive() or not S.antiFakeNoli then return end
        local pf = WS:FindFirstChild("Players")
        local kf = pf and pf:FindFirstChild("Killers")
        if not kf then return end
        for _, k in ipairs(kf:GetChildren()) do
            if k:IsA("Model") and string.find(string.lower(k.Name), "noli", 1, true)
                and not Players:GetPlayerFromCharacter(k) then
                pcall(function() k.Parent = Lighting end)
            end
        end
    end
    once("fakeNoli", function()
        sweep()
        M.Every(1.5, sweep)
    end)
end


local LG = { enabled = false, saved = {}, destroyed = {}, lightSaved = {}, terrainSaved = {}, conn = nil }
local function lgSaveProp(o, prop)
    if not LG.saved[o] then LG.saved[o] = {} end
    if LG.saved[o][prop] == nil then
        local ok, v = pcall(function() return o[prop] end)
        if ok then LG.saved[o][prop] = v end
    end
end
local function lgSaveDestroy(o)
    if LG.destroyed[o] then return end
    local parent = o.Parent
    if not parent then return end
    local ok, c = pcall(function() return o:Clone() end)
    if ok and c then LG.destroyed[o] = { Clone = c, Parent = parent } end
end
local function lgOpt(v)
    if not LG.enabled then return end
    if v:IsA("BasePart") then
        for _, prop in ipairs({ "CastShadow", "Material", "Reflectance", "BackSurface", "BottomSurface", "FrontSurface", "LeftSurface", "RightSurface", "TopSurface" }) do
            lgSaveProp(v, prop)
        end
        v.CastShadow = false
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
        v.BackSurface = Enum.SurfaceType.SmoothNoOutlines
        v.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
        v.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
        v.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
        v.RightSurface = Enum.SurfaceType.SmoothNoOutlines
        v.TopSurface = Enum.SurfaceType.SmoothNoOutlines
    elseif v:IsA("Decal") then
        lgSaveProp(v, "Transparency")
        lgSaveProp(v, "Texture")
        v.Transparency = 1
        v.Texture = ""
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        lgSaveProp(v, "Lifetime")
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("ForceField") or v:IsA("Sparkles") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Beam") then
        lgSaveDestroy(v)
        v:Destroy()
    end
end
local function startLowGfx()
    if LG.enabled then return end
    LG.enabled = true
    local terrain = WS:FindFirstChildWhichIsA("Terrain")
    if terrain then
        LG.terrainSaved = { WaterWaveSize = terrain.WaterWaveSize, WaterWaveSpeed = terrain.WaterWaveSpeed, WaterReflectance = terrain.WaterReflectance, WaterTransparency = terrain.WaterTransparency }
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 1
    end
    LG.lightSaved = { GlobalShadows = Lighting.GlobalShadows, FogEnd = Lighting.FogEnd, FogStart = Lighting.FogStart }
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.FogStart = 9e9
    pcall(function() settings().Rendering.QualityLevel = 1 end)
    for _, v in pairs(WS:GetDescendants()) do pcall(lgOpt, v) end
    LG.conn = WS.DescendantAdded:Connect(function(v)
        if not LG.enabled then return end
        task.defer(function() pcall(lgOpt, v) end)
    end)
    bind(LG.conn)
end
local function stopLowGfx()
    if not LG.enabled then return end
    LG.enabled = false
    if LG.conn then pcall(function() LG.conn:Disconnect() end); LG.conn = nil end
    for o, props in pairs(LG.saved) do
        if o and o.Parent then
            for prop, v in pairs(props) do pcall(function() o[prop] = v end) end
        end
    end
    for _, d in pairs(LG.destroyed) do
        if d.Clone and d.Parent and d.Parent.Parent then pcall(function() d.Clone.Parent = d.Parent end) end
    end
    local terrain = WS:FindFirstChildWhichIsA("Terrain")
    if terrain then
        for k, v in pairs(LG.terrainSaved) do pcall(function() terrain[k] = v end) end
    end
    for k, v in pairs(LG.lightSaved) do pcall(function() Lighting[k] = v end) end
    table.clear(LG.saved)
    table.clear(LG.destroyed)
    table.clear(LG.terrainSaved)
    table.clear(LG.lightSaved)
end
local fogState = nil
local function applyNoFog()
    if not fogState then
        fogState = { end_ = Lighting.FogEnd, start = Lighting.FogStart, amb = Lighting.FogColor }
    end
    Lighting.FogEnd = 1e6
    Lighting.FogStart = 1e6
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Atmosphere") then pcall(function() v.Density = 0; v.Haze = 0 end) end
    end
end
local function restoreFog()
    if not fogState then return end
    pcall(function()
        Lighting.FogEnd = fogState.end_
        Lighting.FogStart = fogState.start
        Lighting.FogColor = fogState.amb
    end)
    fogState = nil
end


local fpsGui, fpsLabel, fpsConn
local function stopFps()
    if fpsConn then pcall(function() fpsConn:Disconnect() end); fpsConn = nil end
    if fpsGui then pcall(function() fpsGui:Destroy() end); fpsGui = nil end
    fpsLabel = nil
end
local function startFps()
    stopFps()
    if not S.fps then return end
    local sg = Instance.new("ScreenGui")
    sg.Name = "TURNsakenV4_FPS"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.DisplayOrder = 999998
    sg.Parent = PlayerGui
    fpsGui = sg
    local f = Instance.new("Frame")
    f.Size = UDim2.fromOffset(150, 22)
    f.AnchorPoint = Vector2.new(1, 0)
    f.Position = UDim2.new(1, -8, 0, 6)
    f.BackgroundTransparency = 0.35
    f.BackgroundColor3 = Color3.new(0, 0, 0)
    f.Parent = sg
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    local lb = Instance.new("TextLabel")
    lb.Size = UDim2.fromScale(1, 1)
    lb.BackgroundTransparency = 1
    lb.Font = Enum.Font.GothamBold
    lb.TextSize = 12
    lb.TextColor3 = Color3.fromRGB(80, 255, 130)
    lb.Text = "FPS: -- | PING: -- ms"
    lb.Parent = f
    fpsLabel = lb
    local frames, acc = 0, 0
    fpsConn = RunService.RenderStepped:Connect(function(dt)
        frames += 1
        acc += dt
        if acc >= 0.5 then
            local fps = math.floor(frames / acc + 0.5)
            local ping = 0
            pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            lb.Text = ("FPS: %d | PING: %d ms"):format(fps, ping)
            frames, acc = 0, 0
        end
    end)
    M.Bind(fpsConn)
end


local chatConn, privConn
local function setChatVisible(v)
    local ok = pcall(function()
        local gui = PlayerGui:FindFirstChild("Chat")
        if gui then gui.Enabled = v end
    end)
    if not ok then
        pcall(function()
            local controller = PlayerGui:FindFirstChild("Chat")
            if controller then controller.Enabled = v end
        end)
    end
end
local function startNoChat()
    setChatVisible(false)
    if chatConn then return end
    chatConn = PlayerGui.ChildAdded:Connect(function(c)
        if c.Name == "Chat" and S.noChat then c.Enabled = false end
    end)
    bind(chatConn)
end
local forceChatConn
local function startForceChat()
    pcall(function()
        local cfg = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
        if cfg then cfg.Enabled = true end
    end)
    setChatVisible(true)
    if forceChatConn then return end
    forceChatConn = RunService.Heartbeat:Connect(function()
        if not alive() or not S.forceChat then return end
        pcall(function()
            local cfg = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
            if cfg and not cfg.Enabled then cfg.Enabled = true end
        end)
    end)
    bind(forceChatConn)
end
local fakeNameOriginal = { name = nil, display = nil }
local function startFakeName()
    local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if not h then return end
    fakeNameOriginal.name = fakeNameOriginal.name or LP.Name
    fakeNameOriginal.display = fakeNameOriginal.display or h.DisplayName
    pcall(function() h.DisplayName = "PROTECTED" end)
end
local function stopFakeName()
    local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if h and fakeNameOriginal.display then pcall(function() h.DisplayName = fakeNameOriginal.display end) end
end
local function applyPrivacyToPlayer(p)
    if not p or p == LP then return end
    local data = p:FindFirstChild("PlayerData")
    if not data then return end
    local priv = data:FindFirstChild("Privacy", true)
    if not priv then return end
    for _, v in ipairs(priv:GetChildren()) do
        if v:IsA("BoolValue") then
            pcall(function() v.Value = false end)
        end
    end
end
local function startShowPrivacy()
    if privConn then return end
    privConn = RunService.Heartbeat:Connect(function()
        if not alive() or not S.showPrivacy then return end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP then applyPrivacyToPlayer(p) end
        end
    end)
    bind(privConn)
    bind(Players.PlayerAdded:Connect(function(p)
        task.delay(1, function() if alive() and S.showPrivacy then applyPrivacyToPlayer(p) end end)
    end))
end
local function stopShowPrivacy()
    if privConn then pcall(function() privConn:Disconnect() end); privConn = nil end
end


camSec:Slider("cam_fov", "Extended FOV", 40, 120, S.fov, "", function(v)
    S.fov = math.clamp(tonumber(v) or 70, 40, 120)
    M.Set("cam_fov", S.fov)
    applyFov()
end)
camSec:Button("Reapply FOV", function() applyFov() end)
camSec:Slider("cam_zoom", "Extended Zoom", 0, 100, S.zoom, "", function(v)
    S.zoom = math.clamp(tonumber(v) or 10, 0, 100)
    M.Set("cam_zoom", S.zoom)
    applyZoom()
end)
camSec:Button("Reapply Zoom", function() applyZoom() end)

camNC:Toggle("cam_noclip", "Free Camera", S.noclip, function(v)
    S.noclip = v == true
    M.Set("cam_noclip", S.noclip)
    if S.noclip then startNC() else stopNC() end
end)
camNC:Label("WASD to move, Q/E to ascend; camera restores on unload.")

effSec:Toggle("mis_anti_blind", "Anti Blind", S.antiBlind, function(v) S.antiBlind = v == true; M.Set("mis_anti_blind", v == true) end)
effSec:Toggle("mis_anti_glitch", "Anti Screen Tear", S.antiGlitch, function(v) S.antiGlitch = v == true; M.Set("mis_anti_glitch", v == true) end)
effSec:Toggle("mis_anti_sub", "Anti Subspace", S.antiSub, function(v) S.antiSub = v == true; M.Set("mis_anti_sub", v == true) end)
effSec:Toggle("mis_anti_laugh", "Anti Noli Laugh", S.antiLaugh, function(v) S.antiLaugh = v == true; M.Set("mis_anti_laugh", v == true) end)
effSec:Toggle("mis_anti_fake_noli", "Anti Fake Noli", S.antiFakeNoli, function(v) S.antiFakeNoli = v == true; M.Set("mis_anti_fake_noli", v == true) end)

gfxSec:Toggle("mis_low_gfx", "Low Graphics", S.lowGfx, function(v)
    S.lowGfx = v == true
    M.Set("mis_low_gfx", S.lowGfx)
    if S.lowGfx then startLowGfx() else stopLowGfx() end
end)
gfxSec:Toggle("mis_fps", "FPS + Ping", S.fps, function(v)
    S.fps = v == true
    M.Set("mis_fps", S.fps)
    if S.fps then startFps() else stopFps() end
end)
gfxSec:Toggle("mis_nofog", "Remove Fog", S.noFog, function(v)
    S.noFog = v == true
    M.Set("mis_nofog", S.noFog)
    if S.noFog then applyNoFog() else restoreFog() end
end)

privSec:Toggle("mis_force_chat", "Force Chat", S.forceChat, function(v) S.forceChat = v == true; M.Set("mis_force_chat", v == true); if v then startForceChat() end end)
privSec:Toggle("mis_privacy", "Show Privacy Info", S.showPrivacy, function(v) S.showPrivacy = v == true; M.Set("mis_privacy", v == true); if v then startShowPrivacy() else stopShowPrivacy() end end)
privSec:Toggle("mis_fake_name", "Fake Name", S.fakeName, function(v) S.fakeName = v == true; M.Set("mis_fake_name", v == true); if v then startFakeName() else stopFakeName() end end)
privSec:Toggle("mis_no_chat", "Hide Chat", S.noChat, function(v) S.noChat = v == true; M.Set("mis_no_chat", v == true); if v then startNoChat() else setChatVisible(true) end end)

local function networkRemote()
    local mods = RS:FindFirstChild("Modules")
    local net = mods and mods:FindFirstChild("Network")
    local net2 = net and net:FindFirstChild("Network")
    local ev = net2 and net2:FindFirstChildOfClass("RemoteEvent")
    if ev then return ev end
    return net and net:FindFirstChildOfClass("RemoteEvent")
end
local function applySpoofDevice(value, starting)
    local InputDevices = { Keyboard = "PC", MouseButton1 = "PC", MouseButton2 = "PC", MouseMovement = "PC", Touch = "Mobile", Gamepad1 = "Console" }
    if value == "Original" then
        value = InputDevices[UIS:GetLastInputType().Name] or "PC"
    elseif value == "Nothing" and starting then
        return
    elseif value == "Nothing" then
        value = nil
    end
    if netFireConnection("SetDevice", value) then return end
    local r = networkRemote()
    if not r then return end
    pcall(function() r:FireServer("SetDevice", { value }) end)
    pcall(function() r:FireServer("SetDevice", value) end)
end
privSec:Segmented("mis_spoof_device", "Spoof Device", { "Original", "PC", "Mobile", "Console", "Nothing" }, S.spoofDevice, function(v)
    S.spoofDevice = v
    M.Set("mis_spoof_device", v)
    applySpoofDevice(v, false)
end)


task.defer(function()
    ensureCameraWatch()
    if S.fov ~= 70 then applyFov() end
    if S.zoom ~= 10 then applyZoom() end
    if S.noclip then startNC() end
    if S.antiBlind then startAntiBlind() end
    if S.antiGlitch then startAntiGlitch() end
    if S.antiSub then startAntiSub() end
    if S.antiLaugh then startAntiLaugh() end
    if S.antiFakeNoli then startAntiFakeNoli() end
    if S.lowGfx then startLowGfx() end
    if S.fps then startFps() end
    if S.noFog then applyNoFog() end
    if S.forceChat then startForceChat() end
    if S.showPrivacy then startShowPrivacy() end
    if S.fakeName then startFakeName() end
    if S.noChat then startNoChat() end
    if S.spoofDevice ~= "Original" then applySpoofDevice(S.spoofDevice, true) end
end)

M.OnUnload(function()
    stopNC()
    stopLowGfx()
    stopFps()
    stopShowPrivacy()
    restoreFog()
    stopFakeName()
    setChatVisible(true)
    local cam = WS.CurrentCamera
    if cam then pcall(function() cam.CameraType = Enum.CameraType.Custom end) end
    pcall(function() LP.CameraMaxZoomDistance = StarterPlayer.CameraMaxZoomDistance end)
end)
end)

addModule(function(M)
local page = M.Page("hbd")
local sec = page:Section("Hitbox Drag", "HITBOX DRAG", "Dashes to the nearest killer on block/attack animations")
local secCfg = page:Section("Config", "CONFIG", "Speed / Turn / Distance")
local Players, WS, RS, RunService, UIS = M.Svc.Players, M.Svc.Workspace, M.Svc.ReplicatedStorage, M.Svc.RunService, M.Svc.UserInputService
local LP = M.Local
local S = {
    on = M.Get("hbd_on") == true,
    speed = tonumber(M.Get("hbd_speed")) or 5.6,
    speedWalk = tonumber(M.Get("hbd_speed_walk")) or 5.6,
    speedSprint = tonumber(M.Get("hbd_speed_sprint")) or 8.0,
    autoAdapt = M.Get("hbd_auto_adapt") == true,
    turnSpeed = tonumber(M.Get("hbd_turn")) or 5,
    delay = tonumber(M.Get("hbd_delay")) or 0,
    duration = tonumber(M.Get("hbd_duration")) or 1.5,
    stopDistance = tonumber(M.Get("hbd_stop")) or 2.5,
}
local SprintModule = nil
pcall(function()
    local s = RS:FindFirstChild("Systems"); local c = s and s:FindFirstChild("Character")
    local g = c and c:FindFirstChild("Game"); local sp = g and g:FindFirstChild("Sprinting")
    if sp then SprintModule = require(sp) end
end)
local blockIds = { "72722244508749","96959123077498","95802026624883","140671644163156","100926346851492","72182155407310","82605295530067","138407964761603","133292581373127","116427323741607","90970641235403","87716278630738","82036084568393","102517104852347","127040663332045","114506382930939","127245564598429","99829427721752","138938529389204","111647315359080","92567970681901","124269076578545","94958041603347","109667959938617","130958529065375","118298475669935","126830014841198","126355327951215","121086746534252","18885909645" }
local blockSet = {}
for _, id in ipairs(blockIds) do blockSet[id] = true end
local dragging = false
local function survivorsFolder()
    local p = WS:FindFirstChild("Players")
    return p and p:FindFirstChild("Survivors")
end
local function killersFolder()
    local p = WS:FindFirstChild("Players")
    return p and p:FindFirstChild("Killers")
end
local function isLocalSurvivor()
    local c = LP.Character
    return c and c.Parent == survivorsFolder()
end
local function nearestKiller()
    local mr = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not mr then return nil end
    local kf = killersFolder()
    if not kf then return nil end
    local c, d = nil, math.huge
    for _, k in ipairs(kf:GetChildren()) do
        if k:IsA("Model") then
            local hrp = k:FindFirstChild("HumanoidRootPart")
            if hrp then local dd = (hrp.Position - mr.Position).Magnitude; if dd < d then c, d = k, dd end end
        end
    end
    return c
end
local function beginDragIntoKiller(km)
    if dragging or not km or not km.Parent then return end
    local ch = LP.Character; if not ch then return end
    local hrp = ch:FindFirstChild("HumanoidRootPart"); local hum = ch:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    local thrp = km:FindFirstChild("HumanoidRootPart"); if not thrp then return end
    dragging = true
    local sprinting = false
    if SprintModule then pcall(function() sprinting = SprintModule.IsSprinting == true end) end
    local spd = S.autoAdapt and (sprinting and S.speedSprint or S.speedWalk) or S.speed
    local ow, oj, oa = hum.WalkSpeed, hum.JumpPower, hum.AutoRotate
    local startY = hrp.Position.Y
    hum.WalkSpeed = 0; hum.JumpPower = 0; hum.AutoRotate = false
    local bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5); bv.Velocity = Vector3.new(0, 0, 0)
    local st = tick()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not dragging then
            if conn then conn:Disconnect() end
            pcall(function() if bv and bv.Parent then bv:Destroy() end end)
            if hum and hum.Parent then hum.WalkSpeed = ow; hum.JumpPower = oj; hum.AutoRotate = oa end
            return
        end
        if not (ch and ch.Parent) or not (km and km.Parent) then dragging = false; return end
        thrp = km:FindFirstChild("HumanoidRootPart")
        if not thrp then dragging = false; return end
        local el = tick() - st
        if el >= S.duration then dragging = false; return end
        local mp = hrp.Position; local tp = thrp.Position
        local toTarget = Vector3.new(tp.X - mp.X, 0, tp.Z - mp.Z); local hd = toTarget.Magnitude
        if hd > S.stopDistance then
            local dir = toTarget.Unit
            local cur = spd * (0.5 + 0.5 * math.clamp(el / 0.15, 0, 1))
            if hd < 8 then cur = cur * math.clamp((hd - S.stopDistance) / (8 - S.stopDistance), 0.3, 1) end
            bv.Velocity = Vector3.new(dir.X * cur, 0, dir.Z * cur)
        else
            bv.Velocity = Vector3.new(0, 0, 0); dragging = false; return
        end
        if hd > 0.01 then
            local lookAt = CFrame.lookAt(mp, Vector3.new(tp.X, mp.Y, tp.Z))
            local ta = math.clamp(S.turnSpeed * 0.02, 0.04, 0.2)
            hrp.CFrame = hrp.CFrame:Lerp(lookAt, ta)
        end
        local yd = math.abs(hrp.Position.Y - startY)
        if yd > 1.5 then
            local r = hrp.CFrame - hrp.CFrame.Position
            hrp.CFrame = CFrame.new(hrp.Position.X, startY, hrp.Position.Z) * r
        end
    end)
    task.delay(S.duration + 0.2, function() dragging = false end)
end
local cachedAnimator
local function refreshAnimator()
    local ch = LP.Character; if not ch then cachedAnimator = nil; return end
    local h = ch:FindFirstChildOfClass("Humanoid")
    cachedAnimator = h and h:FindFirstChildOfClass("Animator")
end
refreshAnimator()
M.Bind(LP.CharacterAdded:Connect(function() task.wait(0.5) refreshAnimator() end))
M.OnHeartbeat(function()
    if not S.on or dragging or not isLocalSurvivor() then return end
    if not cachedAnimator then refreshAnimator() end
    local a = cachedAnimator
    if not a then return end
    for _, t in ipairs(a:GetPlayingAnimationTracks()) do
        local aid = nil
        pcall(function() aid = t.Animation and tostring(t.Animation.AnimationId):match("%d+") end)
        if aid and blockSet[aid] then
            local tp = 0; pcall(function() tp = t.TimePosition or 0 end)
            if tp <= 0.15 then
                local n = nearestKiller()
                if n then task.wait(S.delay); task.spawn(function() beginDragIntoKiller(n) end) end
            end
        end
    end
end)
sec:Toggle("hbd_on", "Enable Drag", S.on, function(v) S.on = v == true; M.Set("hbd_on", S.on) end)
secCfg:Toggle("hbd_auto_adapt", "Adaptive Speed", S.autoAdapt, function(v) S.autoAdapt = v == true; M.Set("hbd_auto_adapt", S.autoAdapt) end)
secCfg:Slider("hbd_speed", "Drag Speed", 1, 20, S.speed, "", function(v) S.speed = tonumber(v) or 5.6; M.Set("hbd_speed", S.speed) end)
secCfg:Slider("hbd_speed_walk", "Walk Speed", 1, 20, S.speedWalk, "", function(v) S.speedWalk = tonumber(v) or 5.6; M.Set("hbd_speed_walk", S.speedWalk) end)
secCfg:Slider("hbd_speed_sprint", "Sprint Speed", 1, 30, S.speedSprint, "", function(v) S.speedSprint = tonumber(v) or 8; M.Set("hbd_speed_sprint", S.speedSprint) end)
secCfg:Slider("hbd_turn", "Turn Speed", 1, 30, S.turnSpeed, "", function(v) S.turnSpeed = tonumber(v) or 5; M.Set("hbd_turn", S.turnSpeed) end)
secCfg:Slider("hbd_delay", "Trigger Delay", 0, 2, S.delay, "s", function(v) S.delay = tonumber(v) or 0; M.Set("hbd_delay", S.delay) end)
secCfg:Slider("hbd_duration", "Drag Duration", 0.2, 5, S.duration, "s", function(v) S.duration = tonumber(v) or 1.5; M.Set("hbd_duration", S.duration) end)
secCfg:Slider("hbd_stop", "Stop Distance", 0, 10, S.stopDistance, "", function(v) S.stopDistance = tonumber(v) or 2.5; M.Set("hbd_stop", S.stopDistance) end)
end)

SAKEN_ABPreview = nil
do
    local previewGui, previewWorld, previewCam, previewFolder
    local yaw, pitch, dist = 0.9, 0.42, 30
    local kind = "line"
    local dragInput, dragStart, startYaw, startPitch
    local conns = {}
    local coreGui = game:GetService("CoreGui")
    local uis = Input

    local function disconnectAll()
        for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
        conns = {}
    end

    local function closePreview()
        disconnectAll()
        if previewGui then pcall(function() previewGui:Destroy() end) end
        previewGui, previewWorld, previewCam, previewFolder = nil, nil, nil, nil
    end
    SAKEN_ABPreviewClose = closePreview

    local function makeEdge(parent)
        local p = Instance.new("Part")
        p.Anchored = true
        p.CanCollide = false
        p.CanQuery = false
        p.CanTouch = false
        p.CastShadow = false
        p.Material = Enum.Material.Neon
        p.Color = Color3.fromRGB(73, 217, 196)
        p.Size = Vector3.new(0.11, 0.11, 1)
        p.CFrame = CFrame.new(0, -500, 0)
        p.Parent = parent
        return p
    end

    local function setEdge(part, p1, p2)
        local diff = p2 - p1
        local len = diff.Magnitude
        if len < 0.02 then
            part.Transparency = 1
            return
        end
        part.Transparency = 0.15
        part.Size = Vector3.new(0.11, 0.11, len)
        part.CFrame = CFrame.lookAt((p1 + p2) * 0.5, (p1 + p2) * 0.5 + diff.Unit)
    end

    local function boxEdges(edges, origin, look, length, radius, halfH)
        local right = look:Cross(Vector3.new(0, 1, 0))
        if right.Magnitude < 0.05 then right = look:Cross(Vector3.new(1, 0, 0)) end
        right = right.Unit
        local up = right:Cross(look).Unit
        local r, u = radius, halfH or radius
        local o1 = origin + look * length
        local c = {
            origin + right * r + up * u, origin - right * r + up * u,
            origin - right * r - up * u, origin + right * r - up * u,
            o1 + right * r + up * u, o1 - right * r + up * u,
            o1 - right * r - up * u, o1 + right * r - up * u,
        }
        local idx = { { 1, 2 }, { 2, 3 }, { 3, 4 }, { 4, 1 }, { 5, 6 }, { 6, 7 }, { 7, 8 }, { 8, 5 }, { 1, 5 }, { 2, 6 }, { 3, 7 }, { 4, 8 } }
        for i, pr in ipairs(idx) do
            if edges[i] then setEdge(edges[i], c[pr[1]], c[pr[2]]) end
        end
    end

    local function readNumber(key, def)
        local v = SAKEN_CFG_GET and SAKEN_CFG_GET(key)
        v = tonumber(v)
        if v == nil then return def end
        return v
    end

    local function buildShapes()
        if not previewFolder or not previewFolder.Parent then return end
        for _, c in ipairs(previewFolder:GetChildren()) do c:Destroy() end
        local killer = Instance.new("Part")
        killer.Name = "Killer"
        killer.Anchored = true
        killer.CanCollide = false
        killer.CanQuery = false
        killer.Material = Enum.Material.SmoothPlastic
        killer.Color = Color3.fromRGB(235, 90, 90)
        killer.Size = Vector3.new(2, 5, 1)
        killer.CFrame = CFrame.new(0, 0, 0)
        killer.Parent = previewFolder
        local look = Vector3.new(0, 0, -1)
        local edges = {}
        for i = 1, 12 do edges[i] = makeEdge(previewFolder) end
        if kind == "line" then
            local len = math.clamp(readNumber("ab_line_len", 15), 2, 40)
            local rad = math.clamp(readNumber("ab_line_rad", 1.5), 0.5, 10)
            boxEdges(edges, Vector3.new(0, 0, -1.85), look, len, rad, rad)
            local me = Instance.new("Part")
            me.Name = "Me"
            me.Anchored = true
            me.CanCollide = false
            me.CanQuery = false
            me.Material = Enum.Material.SmoothPlastic
            me.Color = Color3.fromRGB(150, 235, 215)
            me.Size = Vector3.new(2, 5, 1)
            me.CFrame = CFrame.new(0, 0, -(1.85 + len * 0.45))
            me.Parent = previewFolder
        else
            local w = math.clamp(readNumber("ab_hb_width", 6), 1, 16)
            local h = math.clamp(readNumber("ab_hb_height", 6), 1, 16)
            local l = math.clamp(readNumber("ab_hb_length", 9), 1, 20)
            local mul = math.clamp(readNumber("ab_hb_mul", 1), 0.2, 3)
            local d = math.clamp(readNumber("ab_hb_dist", 3), 0, 12)
            boxEdges(edges, Vector3.new(0, 0, -d), look, l * mul, w * mul * 0.5, h * mul * 0.5)
            local me = Instance.new("Part")
            me.Name = "Me"
            me.Anchored = true
            me.CanCollide = false
            me.CanQuery = false
            me.Material = Enum.Material.SmoothPlastic
            me.Color = Color3.fromRGB(150, 235, 215)
            me.Size = Vector3.new(2, 5, 1)
            me.CFrame = CFrame.new(0, 0, -(d + l * mul * 0.5))
            me.Parent = previewFolder
        end
    end

    local function applyCamera()
        if not previewCam then return end
        local target = Vector3.new(0, 0, -6)
        local pos = target + Vector3.new(math.sin(yaw) * math.cos(pitch), math.sin(pitch), math.cos(yaw) * math.cos(pitch)) * dist
        previewCam.CFrame = CFrame.lookAt(pos, target)
    end

    function SAKEN_ABPreview(mode)
        closePreview()
        kind = (mode == "hitbox") and "hitbox" or "line"
        local sg = Instance.new("ScreenGui")
        sg.Name = "TURNsakenV4_ABPreview"
        sg.ResetOnSpawn = false
        sg.IgnoreGuiInset = true
        sg.DisplayOrder = 200
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        pcall(function() sg.Parent = coreGui end)
        if not sg.Parent then sg.Parent = playerGui end
        previewGui = sg

        local shade = Instance.new("TextButton")
        shade.Size = UDim2.fromScale(1, 1)
        shade.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        shade.BackgroundTransparency = 0.45
        shade.Text = ""
        shade.AutoButtonColor = false
        shade.ZIndex = 1
        shade.Parent = sg
        conns[#conns + 1] = shade.MouseButton1Click:Connect(function() end)

        local panel = Instance.new("Frame")
        panel.AnchorPoint = Vector2.new(0.5, 0.5)
        panel.Position = UDim2.fromScale(0.5, 0.5)
        panel.Size = UDim2.fromOffset(460, 400)
        panel.BackgroundColor3 = Color3.fromRGB(10, 16, 20)
        panel.BorderSizePixel = 0
        panel.ZIndex = 10
        panel.Parent = sg
        local pc = Instance.new("UICorner")
        pc.CornerRadius = UDim.new(0, 12)
        pc.Parent = panel
        local st = Instance.new("UIStroke")
        st.Color = Color3.fromRGB(27, 42, 50)
        st.Thickness = 1.2
        st.Parent = panel

        local title = Instance.new("TextLabel")
        title.BackgroundTransparency = 1
        title.Position = UDim2.fromOffset(14, 10)
        title.Size = UDim2.new(1, -90, 0, 24)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        title.TextColor3 = Color3.fromRGB(73, 217, 196)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Text = (kind == "hitbox") and "3D Preview · Auto Block Hitbox" or "3D Preview · Auto Block Line"
        title.Parent = panel

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.fromOffset(30, 28)
        closeBtn.Position = UDim2.new(1, -40, 0, 10)
        closeBtn.BackgroundColor3 = Color3.fromRGB(30, 44, 52)
        closeBtn.Text = "X"
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 14
        closeBtn.TextColor3 = Color3.fromRGB(235, 245, 245)
        closeBtn.ZIndex = 15
        closeBtn.Parent = panel
        local cb = Instance.new("UICorner")
        cb.CornerRadius = UDim.new(0, 6)
        cb.Parent = closeBtn
        conns[#conns + 1] = closeBtn.MouseButton1Click:Connect(closePreview)

        local vp = Instance.new("ViewportFrame")
        vp.Position = UDim2.fromOffset(12, 42)
        vp.Size = UDim2.new(1, -24, 0, 300)
        vp.BackgroundColor3 = Color3.fromRGB(6, 11, 14)
        vp.BorderSizePixel = 0
        vp.ZIndex = 11
        vp.Parent = panel
        local vc = Instance.new("UICorner")
        vc.CornerRadius = UDim.new(0, 10)
        vc.Parent = vp

        previewWorld = Instance.new("WorldModel")
        previewWorld.Parent = vp
        previewCam = Instance.new("Camera")
        previewCam.FieldOfView = 55
        previewCam.Parent = vp
        vp.CurrentCamera = previewCam
        previewFolder = Instance.new("Model")
        previewFolder.Name = "Shapes"
        previewFolder.Parent = previewWorld

        local hint = Instance.new("TextLabel")
        hint.BackgroundTransparency = 1
        hint.Position = UDim2.fromOffset(14, 350)
        hint.Size = UDim2.new(1, -28, 0, 20)
        hint.Font = Enum.Font.Gotham
        hint.TextSize = 12
        hint.TextColor3 = Color3.fromRGB(140, 162, 172)
        hint.TextXAlignment = Enum.TextXAlignment.Left
        hint.Text = "Drag to orbit · Scroll to zoom · Values follow current settings"
        hint.Parent = panel

        applyCamera()
        buildShapes()

        conns[#conns + 1] = vp.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
                dragStart = Vector2.new(input.Position.X, input.Position.Y)
                startYaw, startPitch = yaw, pitch
            end
        end)
        conns[#conns + 1] = uis.InputChanged:Connect(function(input)
            if not dragInput then return end
            if input == dragInput or (dragInput.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement) then
                local d = Vector2.new(input.Position.X, input.Position.Y) - dragStart
                yaw = startYaw - d.X * 0.01
                pitch = math.clamp(startPitch + d.Y * 0.008, -0.6, 1.2)
                applyCamera()
            end
        end)
        conns[#conns + 1] = uis.InputEnded:Connect(function(input)
            if dragInput and input == dragInput then dragInput = nil end
        end)
        conns[#conns + 1] = uis.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseWheel then
                dist = math.clamp(dist - input.Position.Z * 2.5, 8, 90)
                applyCamera()
            end
        end)

        task.spawn(function()
            while previewGui == sg and sg.Parent do
                task.wait(0.15)
                if previewFolder and previewFolder.Parent then
                    buildShapes()
                end
            end
        end)
    end
end

addModule(function(M)

local page = M.Page("aim")
local secTop = page:Section("Aimbot", "AIMBOT", "Character-based aim lock")
local secInfo = page:Section("Info", "INFO", "How to use")

local Players = M.Svc.Players
local Workspace = M.Svc.Workspace
local RunService = M.Svc.RunService
local ReplicatedStorage = M.Svc.ReplicatedStorage
local LocalPlayer = M.Local

local CHARS = { "Guest1337", "Shedlekey", "TwoTime", "Chance", "Pizza", "JaneDoe" }

local AIM = {
    ActiveLock = { IsActive = false, Target = nil, StartTime = 0, Mode = "", Track = nil },
    AnimationData = { Guest1337 = {}, Shedlekey = {}, TwoTime = { ["100725497418533"] = true }, Chance = {}, Pizza = { ["114155003741146"] = true }, JaneDoe = {} },
    Values = {
        Guest1337 = { Distance = 50, LockDuration = 1.3, Prediction = 0 },
        Shedlekey = { Distance = 29, LockDuration = 1.2, Prediction = 0 },
        TwoTime = { Distance = 29, LockDuration = 0.9, Prediction = 0 },
        Chance = { LockDuration = 1.5, Prediction = 3, FreezeChar = false, Delay = 0.3 },
        Pizza = { Distance = 50, LockDuration = 1.2, Prediction = 0, TargetMode = "Nearest One" },
        JaneDoe = { Distance = 50, LockDuration = 1.1, Prediction = 0 },
    },
    Selected = {},
    ActiveAnimLookup = {},
    LastFinishedTrack = nil,
    OriginalWalkSpeed = nil,
    GlobalMode = "Character Lock",
    conn = nil,
    built = false,
}

local function num(key, def)
    local v = tonumber(M.Get(key))
    if v == nil then return def end
    return v
end
local function getStr(key, def)
    local v = M.Get(key)
    if type(v) ~= "string" or v == "" then return def end
    return v
end

local function readValues()
    for _, name in ipairs(CHARS) do
        local v = AIM.Values[name]
        v.LockDuration = math.clamp(num("aim_dur_" .. string.lower(name), v.LockDuration), 0.1, 3)
        v.Prediction = math.clamp(num("aim_pred_" .. string.lower(name), v.Prediction), 0, 6)
        if v.Distance then
            v.Distance = math.clamp(num("aim_dist_" .. string.lower(name), v.Distance), 5, 200)
        end
    end
    AIM.Values.Chance.FreezeChar = M.Get("aim_chance_freeze") == true
    AIM.Values.Chance.Delay = math.clamp(num("aim_chance_delay", 0.3), 0, 2)
    AIM.Values.Pizza.TargetMode = getStr("aim_pizza_mode", "Nearest One")
    AIM.GlobalMode = getStr("aim_mode", "Character Lock")
end

local function buildAnimData()
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if not Assets then return end
    local folders = {}
    local survivors = Assets:FindFirstChild("Survivors")
    if survivors then folders[#folders + 1] = survivors end
    local skins = Assets:FindFirstChild("Skins")
    local skinSurv = skins and skins:FindFirstChild("Survivors")
    if skinSurv then folders[#folders + 1] = skinSurv end
    for _, folder in ipairs(folders) do
        for _, d in ipairs(folder:GetDescendants()) do
            if d:IsA("ModuleScript") and d.Name == "Config" then
                local ok, res = pcall(require, d)
                if ok and type(res) == "table" and type(res.Animations) == "table" then
                    local a = res.Animations
                    local function addTo(char, animId)
                        if not animId then return end
                        local id = tostring(animId):match("%d+")
                        if id and AIM.AnimationData[char] then AIM.AnimationData[char][id] = true end
                    end
                    addTo("Guest1337", a.Punch)
                    addTo("Guest1337", a.ParryPunch)
                    addTo("Shedlekey", a.Slash)
                    addTo("JaneDoe", a.Axe)
                    addTo("Chance", a.AimGun)
                end
            end
        end
    end
end

local function rebuildLookup()
    local lookup = {}
    if #AIM.Selected == 0 then
        AIM.ActiveAnimLookup = {}
        return
    end
    for char, data in pairs(AIM.AnimationData) do
        if table.find(AIM.Selected, char) then
            for id in pairs(data) do lookup[id] = char end
        end
    end
    AIM.ActiveAnimLookup = lookup
end

local function nearestKiller(maxDist)
    local p = Workspace:FindFirstChild("Players")
    local folder = p and p:FindFirstChild("Killers")
    local ch = LocalPlayer.Character
    local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
    if not folder or not myRoot then return nil end
    local best, bd = nil, maxDist
    for _, k in ipairs(folder:GetChildren()) do
        local kr = k:FindFirstChild("HumanoidRootPart")
        local kh = k:FindFirstChildOfClass("Humanoid")
        if kr and kh and kh.Health > 0 then
            local d = (kr.Position - myRoot.Position).Magnitude
            if d <= bd then
                bd = d
                best = k
            end
        end
    end
    return best
end

local function nearestSurvivor(maxDist, mode)
    local p = Workspace:FindFirstChild("Players")
    local folder = p and p:FindFirstChild("Survivors")
    local ch = LocalPlayer.Character
    local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
    if not folder or not myRoot then return nil end
    local best, bd = nil, (mode == "Lowest HP") and math.huge or maxDist
    for _, s in ipairs(folder:GetChildren()) do
        if s ~= ch then
            local sr = s:FindFirstChild("HumanoidRootPart")
            local sh = s:FindFirstChildOfClass("Humanoid")
            if sr and sh and sh.Health > 0 then
                local d = (sr.Position - myRoot.Position).Magnitude
                if d <= maxDist then
                    if mode == "Lowest HP" then
                        if sh.Health < bd then bd = sh.Health; best = s end
                    else
                        if d <= bd then bd = d; best = s end
                    end
                end
            end
        end
    end
    return best
end

local function freezeChar(char, freeze)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if freeze then
        AIM.OriginalWalkSpeed = AIM.OriginalWalkSpeed or hum.WalkSpeed
        hum.WalkSpeed = 0
    elseif AIM.OriginalWalkSpeed then
        hum.WalkSpeed = AIM.OriginalWalkSpeed
        AIM.OriginalWalkSpeed = nil
    else
        hum.WalkSpeed = 16
    end
end

local function checkAnimations()
    local ch = LocalPlayer.Character
    local hum = ch and ch:FindFirstChildOfClass("Humanoid")
    if not hum or next(AIM.ActiveAnimLookup) == nil then return nil, nil end
    for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
        if track ~= AIM.LastFinishedTrack and track.IsPlaying then
            local id = tostring(track.Animation.AnimationId or ""):match("%d+")
            local cn = id and AIM.ActiveAnimLookup[id]
            if cn then return cn, track end
        end
    end
    return nil, nil
end

local function start()
    readValues()
    rebuildLookup()
    if AIM.built then return end
    AIM.built = true
    buildAnimData()
    local frame = 0
    local cachedChar, cachedTrack
    local chancePending = false
    AIM.conn = RunService.RenderStepped:Connect(function()
        if #AIM.Selected == 0 then return end
        if AIM.LastFinishedTrack and not AIM.LastFinishedTrack.IsPlaying then AIM.LastFinishedTrack = nil end
        if next(AIM.ActiveAnimLookup) == nil and not AIM.ActiveLock.IsActive and not chancePending then return end
        local ch = LocalPlayer.Character
        local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
        local hum = ch and ch:FindFirstChildOfClass("Humanoid")
        if not myRoot then return end
        if not AIM.ActiveLock.IsActive then
            if hum and hum.AutoRotate == false and not chancePending then hum.AutoRotate = true end
            frame = frame + 1
            if frame >= 3 then
                frame = 0
                cachedChar, cachedTrack = checkAnimations()
            end
            if cachedChar and cachedTrack and not chancePending then
                local v = AIM.Values[cachedChar]
                local target = nil
                if cachedChar == "Pizza" then
                    target = nearestSurvivor(v.Distance, v.TargetMode or "Nearest One")
                elseif cachedChar == "Chance" then
                    target = nearestKiller(9999)
                else
                    local wide = (cachedChar == "Guest1337" or cachedChar == "JaneDoe")
                    target = nearestKiller(wide and 9999 or v.Distance)
                end
                if target then
                    local modeName, trackRef = cachedChar, cachedTrack
                    cachedChar, cachedTrack = nil, nil
                    local function activate(tgt, mode, track)
                        if not AIM.built or AIM.ActiveLock.IsActive then return end
                        if not tgt or not tgt.Parent then return end
                        AIM.ActiveLock.IsActive = true
                        AIM.ActiveLock.Target = tgt
                        AIM.ActiveLock.StartTime = tick()
                        AIM.ActiveLock.Mode = mode
                        AIM.ActiveLock.Track = track
                        local c = LocalPlayer.Character
                        local h = c and c:FindFirstChildOfClass("Humanoid")
                        if h then h.AutoRotate = false end
                        if mode == "Chance" and AIM.Values.Chance.FreezeChar then
                            pcall(freezeChar, c, true)
                        end
                    end
                    if modeName == "Chance" then
                        local delay = tonumber(M.Get("aim_chance_delay")) or 0
                        if delay > 0 then
                            chancePending = true
                            task.delay(delay, function()
                                chancePending = false
                                activate(target, modeName, trackRef)
                            end)
                        else
                            activate(target, modeName, trackRef)
                        end
                    else
                        activate(target, modeName, trackRef)
                    end
                end
            end
            return
        end
        local mode = AIM.ActiveLock.Mode
        local v = AIM.Values[mode]
        local elapsed = tick() - AIM.ActiveLock.StartTime
        local tgt = AIM.ActiveLock.Target
        local tgtRoot = tgt and tgt:FindFirstChild("HumanoidRootPart")
        local tgtHum = tgt and tgt:FindFirstChildOfClass("Humanoid")
        if elapsed > v.LockDuration or not tgtRoot or (tgtHum and tgtHum.Health <= 0) then
            AIM.LastFinishedTrack = AIM.ActiveLock.Track
            AIM.ActiveLock.IsActive = false
            AIM.ActiveLock.Target = nil
            AIM.ActiveLock.Track = nil
            if mode == "Chance" and v.FreezeChar then freezeChar(ch, false) end
            if hum then hum.AutoRotate = true end
            return
        end
        local pos = tgtRoot.Position
        local aimPos = pos
        local pred = v.Prediction or 0
        if pred > 0 and tgtHum and tgtHum.MoveDirection.Magnitude > 0 then
            aimPos = pos + tgtHum.MoveDirection.Unit * pred
        end
        local cf = CFrame.lookAt(myRoot.Position, Vector3.new(aimPos.X, myRoot.Position.Y, aimPos.Z))
        local function applyLock()
            if mode == "Chance" then
                myRoot.CFrame = cf
            elseif (pos - myRoot.Position).Magnitude < 6 then
                myRoot.CFrame = cf
            else
                myRoot.CFrame = myRoot.CFrame:Lerp(cf, 0.65)
            end
        end
        if AIM.GlobalMode == "Char + Cam Lock" then
            applyLock()
            local cam = Workspace.CurrentCamera
            if cam then cam.CFrame = cam.CFrame:Lerp(CFrame.lookAt(cam.CFrame.Position, aimPos), 0.75) end
        else
            applyLock()
        end
    end)
end

local function stop()
    AIM.ActiveLock.IsActive = false
    if AIM.conn then
        pcall(function() AIM.conn:Disconnect() end)
        AIM.conn = nil
    end
    local ch = LocalPlayer.Character
    local hum = ch and ch:FindFirstChildOfClass("Humanoid")
    if hum then pcall(function() hum.AutoRotate = true; hum.WalkSpeed = 16 end) end
    AIM.built = false
end

local function applySelection()
    readValues()
    rebuildLookup()
    if M.Get("aim_enabled") == true and #AIM.Selected > 0 then
        start()
    else
        stop()
    end
end

local function loadSelection()
    AIM.Selected = {}
    local stored = M.Get("aim_chars")
    if type(stored) == "table" then
        for _, v in ipairs(stored) do
            if type(v) == "string" then AIM.Selected[#AIM.Selected + 1] = v end
        end
    end
end

loadSelection()

secTop:Toggle("aim_enabled", "Enable Aimbot", M.Get("aim_enabled") == true, function(v)
    if v and #AIM.Selected == 0 then
        pcall(function() M.Notify("Aimbot", "Pick at least one character first") end)
    end
    applySelection()
end)
secTop:Segmented("aim_mode", "Aimlock Mode", { "Character Lock", "Char + Cam Lock" }, getStr("aim_mode", "Character Lock"), function(v)
    AIM.GlobalMode = v
    readValues()
end)
secTop:MultiSegmented("aim_chars", "Pick Aimbots", CHARS, AIM.Selected, function(v)
    AIM.Selected = {}
    for _, name in ipairs(v) do AIM.Selected[#AIM.Selected + 1] = name end
    applySelection()
end)
secInfo:Label("1. Pick at least 1 character above / 2. Enable Aimbot / 3. M1 with the matching character")

local function charSection(name, extra)
    local sec = page:Section(name .. " Settings", name:upper(), "")
    sec:Slider("aim_dur_" .. string.lower(name), "Lock Duration", 0.1, 3, AIM.Values[name].LockDuration, "s", function() readValues() end)
    sec:Slider("aim_pred_" .. string.lower(name), "Prediction Strength", 0, 6, AIM.Values[name].Prediction, "", function() readValues() end)
    if extra then extra(sec) end
    return sec
end

charSection("Guest1337")
charSection("Shedlekey")
charSection("TwoTime")
charSection("Chance", function(sec)
    sec:Toggle("aim_chance_freeze", "Stop Moving on Aim", M.Get("aim_chance_freeze") == true, function(v)
        AIM.Values.Chance.FreezeChar = v
    end)
    sec:Slider("aim_chance_delay", "Aim Delay", 0, 2, num("aim_chance_delay", 0.3), "s", function() readValues() end)
end)
charSection("Pizza", function(sec)
    sec:Segmented("aim_pizza_mode", "Target Mode", { "Nearest One", "Lowest HP" }, getStr("aim_pizza_mode", "Nearest One"), function(v)
        AIM.Values.Pizza.TargetMode = v
    end)
end)
charSection("JaneDoe")

M.OnUnload(function()
    stop()
end)
end)

addModule(function(M)

local page = M.Page("ab")
local sec = page:Section("Auto Block Line", "LINE", "Wireframe line in front of the killer")

local Players = M.Svc.Players
local Workspace = M.Svc.Workspace
local RunService = M.Svc.RunService
local LocalPlayer = M.Local

local LINE_BODY_OFFSET = 1.85
local LINE_EDGE_THICK = 0.11

local LINE = {
    parts = {},
    facingSince = {},
    attackUntil = {},
    predictActive = {},
    lastBlockAt = 0,
    pending = {},
    attrStates = {},
    predictState = {},
    showConn = nil,
}

local function num(key, def, lo, hi)
    local v = tonumber(M.Get(key))
    if v == nil then v = def end
    v = tonumber(v) or def
    if lo and v < lo then v = lo end
    if hi and v > hi then v = hi end
    return v
end

local function on()
    return M.Get("ab_line") == true
end
local function showLine()
    return M.Get("ab_line_show") == true or on()
end
local function modeName()
    local v = M.Get("ab_line_mode")
    if type(v) ~= "string" or v == "" then return "Guest 1337" end
    return v
end

local function isKillerRole()
    local ch = LocalPlayer.Character
    local p = ch and ch.Parent
    if not p then return false end
    return string.find(string.lower(p.Name), "kill", 1, true) ~= nil
end

local function destPart(entry)
    if not entry then return end
    if entry.model then pcall(function() entry.model:Destroy() end) end
end

local function clearVisuals()
    for _, entry in pairs(LINE.parts) do destPart(entry) end
    LINE.parts = {}
    LINE.facingSince = {}
    LINE.attackUntil = {}
    LINE.predictActive = {}
    LINE.pending = {}
    LINE.predictState = {}
end

local function makeEdge(parent, name)
    local p = Instance.new("Part")
    p.Name = name
    p.Anchored = true
    p.CanCollide = false
    p.CanQuery = false
    p.CanTouch = false
    p.CastShadow = false
    p.Material = Enum.Material.Neon
    p.Transparency = 0.22
    p.Color = Color3.fromRGB(235, 235, 255)
    p.Size = Vector3.new(LINE_EDGE_THICK, LINE_EDGE_THICK, 1)
    p.CFrame = CFrame.new(0, -8000, 0)
    p.Parent = parent
    return p
end

local function setEdge(part, p1, p2, thick)
    if not part then return end
    local diff = p2 - p1
    local len = diff.Magnitude
    if len < 0.04 then
        part.Transparency = 1
        return
    end
    thick = thick or LINE_EDGE_THICK
    part.Size = Vector3.new(thick, thick, len)
    part.CFrame = CFrame.lookAt((p1 + p2) * 0.5, (p1 + p2) * 0.5 + diff.Unit)
    if part.Transparency > 0.9 then part.Transparency = 0.22 end
end

local function ensureVisual(killer)
    local entry = LINE.parts[killer]
    if entry and entry.model and entry.model.Parent and entry.edges and #entry.edges >= 12 then
        return entry
    end
    if entry then destPart(entry) end
    local model = Instance.new("Model")
    model.Name = "ABLine_" .. tostring(killer.Name)
    model.Parent = Workspace
    local edges = {}
    for i = 1, 12 do edges[i] = makeEdge(model, "Edge" .. i) end
    entry = { model = model, edges = edges }
    LINE.parts[killer] = entry
    return entry
end

local function setColor(entry, col)
    if not entry or not entry.edges then return end
    for _, e in ipairs(entry.edges) do
        if e and e.Parent and e.Transparency < 1 then e.Color = col end
    end
end

local function updateWireframe(entry, origin, look, length, radius, visible)
    if not entry or not entry.edges then return end
    if not visible or length < 0.2 then
        for _, e in ipairs(entry.edges) do if e then e.Transparency = 1 end end
        return
    end
    local right = look:Cross(Vector3.new(0, 1, 0))
    if right.Magnitude < 0.05 then right = look:Cross(Vector3.new(1, 0, 0)) end
    right = right.Unit
    local up = right:Cross(look).Unit
    local r, u = radius, radius
    local o1 = origin + look * length
    local c = {
        origin + right * r + up * u, origin - right * r + up * u,
        origin - right * r - up * u, origin + right * r - up * u,
        o1 + right * r + up * u, o1 - right * r + up * u,
        o1 - right * r - up * u, o1 + right * r - up * u,
    }
    local idx = { { 1, 2 }, { 2, 3 }, { 3, 4 }, { 4, 1 }, { 5, 6 }, { 6, 7 }, { 7, 8 }, { 8, 5 }, { 1, 5 }, { 2, 6 }, { 3, 7 }, { 4, 8 } }
    for i, pr in ipairs(idx) do
        setEdge(entry.edges[i], c[pr[1]], c[pr[2]], LINE_EDGE_THICK)
        if entry.edges[i] then entry.edges[i].Transparency = 0.22 end
    end
end

local function pointOnLine(origin, look, length, radius, point)
    local to = point - origin
    local along = to:Dot(look)
    if along < 0 or along > length then return false end
    return (to - look * along).Magnitude <= radius
end

local function facingDot(kr, myPos)
    local look = kr.CFrame.LookVector
    local dir = myPos - kr.Position
    if dir.Magnitude < 0.1 then return -1 end
    return look:Dot(dir.Unit)
end

local function sampleSpeed(killer, pos, now)
    local ps = LINE.predictState[killer]
    local speed = 0
    if ps and ps.lastTime then
        local dt = now - ps.lastTime
        if dt > 0 and dt < 0.5 then speed = (pos - ps.lastPos).Magnitude / dt end
    end
    LINE.predictState[killer] = { lastPos = pos, lastTime = now }
    return speed
end

local function predictExtend(killer, pos, now)
    if M.Get("ab_line_predict") ~= true then return 0 end
    local speed = sampleSpeed(killer, pos, now)
    if not LINE.predictActive[killer] then return 0 end
    local window = num("ab_line_window", 0.25, 0, 5)
    return math.max(0, speed * window)
end

local function fireBlock()
    local mode = modeName()
    local ability = (mode == "007n7") and "Clone" or "Block"
    if netFireAbility then
        if netFireAbility(ability) then return end
    end
    local main = playerGui:FindFirstChild("MainUI")
    local c = main and main:FindFirstChild("AbilityContainer", true)
    local btn = c and c:FindFirstChild(ability)
    if btn and firesignal then
        pcall(function() firesignal(btn.MouseButton1Down) end)
        pcall(function() firesignal(btn.MouseButton1Click) end)
    end
end

local function tryBlockOnLine(killer, killerRoot, myRoot, now)
    if not on() or isKillerRole() then return false end
    if not killer or not killerRoot or not myRoot then return false end
    local untilT = LINE.attackUntil[killer]
    if not untilT or now >= untilT then return false end
    if now - LINE.lastBlockAt < 0.12 then return false end

    local look = killerRoot.CFrame.LookVector
    local origin = killerRoot.Position + look * LINE_BODY_OFFSET
    local length = num("ab_line_len", 15, 2, 40)
    local radius = num("ab_line_rad", 1.5, 0.5, 10)
    local checkLength = length + predictExtend(killer, killerRoot.Position, now)
    if not pointOnLine(origin, look, checkLength, radius, myRoot.Position) then return false end

    local hold = num("ab_line_hold", 0, 0, 2)
    if hold > 0.001 then
        local since = LINE.facingSince[killer]
        if not since or (now - since) < hold then return false end
    end
    local faceNeed = num("ab_line_dot", 0, -1, 1)
    if faceNeed > 0 and facingDot(killerRoot, myRoot.Position) < faceNeed then return false end
    if LINE.pending[killer] then return false end
    LINE.pending[killer] = true

    local function doFire()
        LINE.pending[killer] = nil
        if not on() or isKillerRole() then return end
        local until2 = LINE.attackUntil[killer]
        if not until2 or tick() >= until2 then return end
        if tick() - LINE.lastBlockAt < 0.12 then return end
        local ch = LocalPlayer.Character
        local mr = ch and ch:FindFirstChild("HumanoidRootPart")
        local kr = killer:FindFirstChild("HumanoidRootPart") or killer:FindFirstChild("RootPart")
        if not mr or not kr then return end
        local rkLook = kr.CFrame.LookVector
        local rkOrigin = kr.Position + rkLook * LINE_BODY_OFFSET
        local len2 = num("ab_line_len", 15, 2, 40)
        local rad2 = num("ab_line_rad", 1.5, 0.5, 10)
        if not pointOnLine(rkOrigin, rkLook, len2 + predictExtend(killer, kr.Position, tick()), rad2, mr.Position) then return end
        LINE.lastBlockAt = tick()
        fireBlock()
    end
    doFire()
    return true
end

local function onKillerAttack(killer, killerRoot)
    if not on() or isKillerRole() or not killerRoot then return false end
    local now = tick()
    local win = 0.26
    LINE.attackUntil[killer] = now + win + 0.08
    if M.Get("ab_line_predict") == true then LINE.predictActive[killer] = true end
    local ch = LocalPlayer.Character
    local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")
    if myRoot then return tryBlockOnLine(killer, killerRoot, myRoot, now) end
    return false
end

local acc = 0
M.OnHeartbeat(function(dt)
    if not M.IsAlive() then return end
    local now = tick()
    local sf = Workspace:FindFirstChild("Players")
    local killers = sf and sf:FindFirstChild("Killers")
    local ch = LocalPlayer.Character
    local myRoot = ch and ch:FindFirstChild("HumanoidRootPart")

    local wantVisual = showLine() and not isKillerRole()
    if not wantVisual then
        if next(LINE.parts) ~= nil then clearVisuals() end
        if not on() then return end
    end

    acc = acc + (tonumber(dt) or 0)
    if acc < 0.1 then return end
    acc = 0
    if not killers then return end

    for _, killer in ipairs(killers:GetChildren()) do
        if killer:IsA("Model") then
            local kr = killer:FindFirstChild("HumanoidRootPart") or killer:FindFirstChild("RootPart")
            if kr then
                local myPos = myRoot and myRoot.Position
                local look = kr.CFrame.LookVector
                local origin = kr.Position + look * LINE_BODY_OFFSET
                local length = num("ab_line_len", 15, 2, 40)
                local radius = num("ab_line_rad", 1.5, 0.5, 10)
                local ext = 0
                if on() then ext = predictExtend(killer, kr.Position, now) end
                local entry = ensureVisual(killer)
                if myPos and pointOnLine(origin, look, length + ext, radius, myPos) then
                    LINE.facingSince[killer] = LINE.facingSince[killer] or now
                    setColor(entry, Color3.fromRGB(255, 70, 70))
                else
                    LINE.facingSince[killer] = nil
                    if ext > 0 then
                        setColor(entry, Color3.fromRGB(80, 170, 255))
                    else
                        local untilT = LINE.attackUntil[killer]
                        local attacking = untilT and now < untilT
                        setColor(entry, attacking and Color3.fromRGB(255, 220, 80) or Color3.fromRGB(235, 235, 255))
                    end
                end
                updateWireframe(entry, origin, look, length + ext, radius, showLine() and not isKillerRole())

                if on() then
                    local curA = killer:GetAttribute("AbilityLastUsed") or 0
                    local curU = killer:GetAttribute("AbilitiesUsed") or 0
                    local st = LINE.attrStates[killer]
                    if not st then
                        LINE.attrStates[killer] = { a = curA, u = curU, locked = false }
                    else
                        if curU > st.u then st.locked = true end
                        if curA > st.a then
                            if st.locked then
                                st.locked = false
                            else
                                pcall(onKillerAttack, killer, kr)
                            end
                        end
                        st.a = curA
                        st.u = curU
                    end
                end
            end
        end
    end

    for killer, entry in pairs(LINE.parts) do
        if not killer.Parent then
            destPart(entry)
            LINE.parts[killer] = nil
            LINE.facingSince[killer] = nil
            LINE.attrStates[killer] = nil
        end
    end
end)

sec:Toggle("ab_line", "Auto Block Line", on(), function(v) end)
sec:Segmented("ab_line_mode", "Mode", { "Guest 1337", "007n7" }, modeName(), function(v) end)
sec:Toggle("ab_line_show", "Show Line", showLine(), function(v)
    if not v then clearVisuals() end
end)
sec:Slider("ab_line_len", "Line Length", 2, 40, num("ab_line_len", 15), "", function() end)
sec:Slider("ab_line_rad", "Line Radius", 0.5, 10, num("ab_line_rad", 1.5), "", function() end)
sec:Slider("ab_line_hold", "Anti Bait Hold (s)", 0, 2, num("ab_line_hold", 0), "s", function() end)
sec:Slider("ab_line_dot", "Facing Strictness", -1, 1, num("ab_line_dot", 0), "", function() end)
sec:Toggle("ab_line_predict", "Predict Speed", M.Get("ab_line_predict") == true, function() end)
sec:Slider("ab_line_window", "Predict Window (s)", 0, 5, num("ab_line_window", 0.25), "s", function() end)
sec:Label("White = idle | Blue = predict | Yellow = attack | Red = you are on the line")
sec:Button("3D Preview", function()
    if SAKEN_ABPreview then SAKEN_ABPreview("line") end
end)

M.OnUnload(function()
    clearVisuals()
end)
end)

addModule(function(M)

local page = M.Page("misc")
local sec = page:Section("Spectator Watch", "SPECTATOR", "Top-left spectator count + long-watch warning")

local Players = M.Svc.Players
local RunService = M.Svc.RunService
local TweenService = M.Svc.TweenService
local LocalPlayer = M.Local
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SW = {
    running = false,
    connections = {},
    spectators = {},
    since = {},
    warned = {},
    gui = nil,
    label = nil,
    holder = nil,
    order = 0,
    ATTRIBUTE = "SpectateTargetUserId",
}

local function count()
    local n = 0
    for plr in pairs(SW.spectators) do
        if plr and plr.Parent then n = n + 1 end
    end
    return n
end

local function refreshLabel()
    if not SW.label then return end
    SW.label.Text = "Spectators: " .. tostring(count())
end

local function notify(text, color, duration)
    duration = duration or 3
    local holder = SW.holder
    if not holder then return end
    SW.order = SW.order + 1
    local frame = Instance.new("Frame")
    frame.LayoutOrder = SW.order
    frame.Size = UDim2.new(1, 0, 0, 32)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Parent = holder
    local c1 = Instance.new("UICorner")
    c1.CornerRadius = UDim.new(0, 8)
    c1.Parent = frame
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 4, 1, 0)
    bar.BackgroundColor3 = color
    bar.BackgroundTransparency = 1
    bar.BorderSizePixel = 0
    bar.Parent = frame
    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(0, 8)
    c2.Parent = bar
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Size = UDim2.new(1, -18, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Text = text
    label.Parent = frame
    local info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(frame, info, { BackgroundTransparency = 0.15 }):Play()
    TweenService:Create(bar, info, { BackgroundTransparency = 0 }):Play()
    TweenService:Create(label, info, { TextTransparency = 0 }):Play()
    task.delay(duration, function()
        local out = TweenInfo.new(0.3)
        TweenService:Create(frame, out, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(bar, out, { BackgroundTransparency = 1 }):Play()
        local fade = TweenService:Create(label, out, { TextTransparency = 1 })
        fade:Play()
        fade.Completed:Wait()
        pcall(function() frame:Destroy() end)
    end)
end

local function updatePlayer(plr)
    if plr == LocalPlayer then return end
    local isWatching = plr:GetAttribute(SW.ATTRIBUTE) == LocalPlayer.UserId
    if isWatching and not SW.spectators[plr] then
        SW.spectators[plr] = true
        SW.since[plr] = tick()
        SW.warned[plr] = nil
        refreshLabel()
    elseif not isWatching and SW.spectators[plr] then
        SW.spectators[plr] = nil
        SW.since[plr] = nil
        SW.warned[plr] = nil
        refreshLabel()
    end
end

local function trackPlayer(plr)
    if plr == LocalPlayer then return end
    SW.connections[#SW.connections + 1] = plr:GetAttributeChangedSignal(SW.ATTRIBUTE):Connect(function()
        updatePlayer(plr)
    end)
    updatePlayer(plr)
end

local function buildUI()
    if SW.gui then pcall(function() SW.gui:Destroy() end) end
    local g = Instance.new("ScreenGui")
    g.Name = "TURNsakenV4_Spectator"
    g.ResetOnSpawn = false
    g.DisplayOrder = 900001
    local okCore = pcall(function() g.Parent = game:GetService("CoreGui") end)
    if not okCore or not g.Parent then g.Parent = PlayerGui end
    SW.gui = g

    local lbl = Instance.new("TextLabel")
    lbl.Name = "SpectatorsLabel"
    lbl.AnchorPoint = Vector2.new(0, 0)
    lbl.Position = UDim2.new(0, 15, 0, 15)
    lbl.Size = UDim2.new(0, 0, 0, 24)
    lbl.AutomaticSize = Enum.AutomaticSize.X
    lbl.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    lbl.BackgroundTransparency = 0.3
    lbl.BorderSizePixel = 0
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 13
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Text = "Spectators: 0"
    lbl.Parent = g
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = lbl
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.Parent = lbl
    SW.label = lbl

    local holder = Instance.new("Frame")
    holder.BackgroundTransparency = 1
    holder.AnchorPoint = Vector2.new(1, 0)
    holder.Position = UDim2.new(1, -15, 0, 15)
    holder.Size = UDim2.new(0, 280, 1, -30)
    holder.Parent = g
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = holder
    SW.holder = holder
end

local function start()
    if SW.running then return end
    SW.running = true
    SW.connections = {}
    SW.spectators = {}
    SW.since = {}
    SW.warned = {}
    SW.order = 0
    buildUI()
    for _, plr in ipairs(Players:GetPlayers()) do trackPlayer(plr) end
    SW.connections[#SW.connections + 1] = Players.PlayerAdded:Connect(trackPlayer)
    SW.connections[#SW.connections + 1] = Players.PlayerRemoving:Connect(function(plr)
        if SW.spectators[plr] then
            SW.spectators[plr] = nil
            SW.since[plr] = nil
            SW.warned[plr] = nil
            refreshLabel()
        end
    end)
    SW.connections[#SW.connections + 1] = RunService.Heartbeat:Connect(function()
        if not SW.running then return end
        local now = tick()
        for plr, t0 in pairs(SW.since) do
            if SW.spectators[plr] and not SW.warned[plr] and (now - t0) >= 20 then
                SW.warned[plr] = true
                local who = (plr and (plr.DisplayName or plr.Name)) or "Someone"
                notify(who .. ": long spectate, be careful", Color3.fromRGB(255, 180, 60), 4)
            end
        end
    end)
    refreshLabel()
end

local function stop()
    SW.running = false
    for _, c in ipairs(SW.connections) do pcall(function() c:Disconnect() end) end
    SW.connections = {}
    SW.spectators = {}
    SW.since = {}
    SW.warned = {}
    if SW.gui then pcall(function() SW.gui:Destroy() end) end
    SW.gui, SW.label, SW.holder = nil, nil, nil
end

sec:Toggle("mis_spectator", "Spectator Watch", M.Get("mis_spectator") == true, function(v)
    if v then start() else stop() end
end)
sec:Label("Shows spectator count at the top-left and warns you when someone watches for a long time")

task.defer(function()
    if M.Get("mis_spectator") == true then pcall(start) end
end)

M.OnUnload(function()
    stop()
end)
end)


local function runModules()
    for i, fn in ipairs(MODULE_FUNCS) do
        local ok, err = pcall(fn, M)
        if not ok then
            warn("[TURNsakenV4] module #" .. tostring(i) .. " error: " .. tostring(err))
        end
    end
end
local modulesStarted = false
startModulesOnce = function()
    if modulesStarted then return end
    modulesStarted = true
    runModules()
end

local savedTheme = tonumber(SAKEN_CFG_GET("ui_theme")) or 1
if savedTheme < 1 or savedTheme > #themes then savedTheme = 1 end
state.scale = math.clamp(tonumber(SAKEN_CFG_GET("ui_scale")) or state.scale, 0.75, 1.6)
state.font = math.clamp(tonumber(SAKEN_CFG_GET("ui_font")) or state.font, 0.85, 1.35)
state.opacity = math.clamp(tonumber(SAKEN_CFG_GET("ui_opacity")) or state.opacity, 0.55, 1)
applyTheme(savedTheme, true)
if setScale then setScale(state.scale * 100) end
if setFont then setFont(state.font * 100) end
if setOpacity then setOpacity(state.opacity * 100) end
local savedPage = tonumber(SAKEN_CFG_GET("ui_page")) or 1
if not state.unlocked and savedPage ~= 1 then savedPage = 1 end
if savedPage < 1 or savedPage > #pages then savedPage = 1 end
switchPage(savedPage, true)
setOpen(true)
notify("TURNsakenV4.1 ready · Right Shift / island to collapse")
return API