-- 加载WindUI（确保链接可访问）
WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- 修复：避免与后续的UIGradient变量重名，将函数名改为gradientText
function gradientText(text, startColor, endColor)
    local result = ""
    local length = #text
    
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        -- Color3的R/G/B是0~1，乘255转为RGB的0~255范围（这部分逻辑是对的）
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end
    
    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "欢迎使用神秘脚本",
    Icon = "rbxassetid://112682688917044",
    IconThemed = true,
    Content = "神秘脚本" .. gradientText("WindUI", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. " Lib",  
    Buttons = {
        {
            Title = "退出",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "使用",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "神秘脚本19.3",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "作者:○○",
    Folder = "9175",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true
})

-- 直接修改主窗口的边框（核心修改）
local windowGui = Window.Gui
local borderFrame = Instance.new("Frame")
borderFrame.Name = "MainWindowBorder"
-- 修复：确保边框完全包裹窗口（Size和Position的偏移量对应）
borderFrame.Size = UDim2.new(1, 6, 1, 6)
borderFrame.Position = UDim2.new(0, -3, 0, -3)
borderFrame.BackgroundTransparency = 0
borderFrame.BackgroundColor3 = Color3.new(1,1,1)
-- 修复：ZIndex改为1（避免被窗口完全遮挡，WindUI窗口的ZIndex通常是2+，这里设1可显示在窗口下层）
borderFrame.ZIndex = 1
borderFrame.Parent = windowGui

-- 给边框加彩色渐变（修复：变量名改为borderGradient，避免与函数重名）
local borderGradient = Instance.new("UIGradient")
borderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
    ColorSequenceKeypoint.new(0.2, Color3.fromHex("FFAA00")),
    ColorSequenceKeypoint.new(0.4, Color3.fromHex("FFFF00")),
    ColorSequenceKeypoint.new(0.6, Color3.fromHex("00FF00")),
    ColorSequenceKeypoint.new(0.8, Color3.fromHex("0000FF")),
    ColorSequenceKeypoint.new(1, Color3.fromHex("AA00FF"))
})
borderGradient.Parent = borderFrame

-- 创建顶部按钮（确保WindUI支持该API）
Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() 
    -- 修复：确保ToggleFullscreen是WindUI的合法方法
    if Window.ToggleFullscreen then
        Window:ToggleFullscreen() 
    else
        print("WindUI不支持ToggleFullscreen方法")
    end
end, 989)

-- 编辑打开按钮样式（确保参数符合WindUI要求）
Window:EditOpenButton({
    Title = "神秘脚本",
    Icon = "crown",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.2, Color3.fromHex("FFAA00")),
        ColorSequenceKeypoint.new(0.4, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.6, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.8, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("AA00FF"))
    }),
    Draggable = true,
})

-- 创建标签页
local Tabs = {
    Notice = Window:Tab({ Title = "通知", Icon = "bell" }),
    General = Window:Tab({ Title = "通用(增强版本)", Icon = "sword" }),
    OtherScript = Window:Tab({ Title = "其他脚本", Icon = "sword" }),
    DeadRail = Window:Tab({ Title = "死铁轨", Icon = "sword" }),
    ForestNight = Window:Tab({ Title = "森林中99个夜晚", Icon = "sword" }),
    StealBrain = Window:Tab({ Title = "偷走脑红", Icon = "brain" }),
    InkGame = Window:Tab({ Title = "墨水游戏", Icon = "bell" }),
    Blox = Window:Tab({ Title = "Blox Fruits", Icon = "bell" }),
    NaturalDisaster = Window:Tab({ Title = "自然灾害", Icon = "bell" }),
    Abandoned = Window:Tab({ Title = "被遗弃", Icon = "bell" }),
    GB = Window:Tab({ Title = "G&B", Icon = "bell" }),
    StrongestBattlefield = Window:Tab({ Title = "最坚强的战场", Icon = "bell" }),
    DeathOfDeath = Window:Tab({ Title = "死亡之死", Icon = "bell" }),
    ShipBuilding = Window:Tab({ Title = "造船寻宝", Icon = "bell" }),
    Doors = Window:Tab({ Title = "doors", Icon = "bell" }),
    LoggingTycoon = Window:Tab({ Title = "伐木大亨2", Icon = "bell" }),
    StrangeGuns = Window:Tab({ Title = "奇怪枪械", Icon = "bell" }),
    PlantVsBrain = Window:Tab({ Title = "植物大战脑红", Icon = "bell" }),
    DigBackyard = Window:Tab({ Title = "挖掘后院", Icon = "bell" }),
    MathMurder = Window:Tab({ Title = "数学谋杀案", Icon = "bell" }),
    Donate = Window:Tab({ Title = "请捐赠", Icon = "bell" }),
    WarTycoon = Window:Tab({ Title = "战争大亨", Icon = "bell" }),
    Hypershot = Window:Tab({ Title = "超人弹射", Icon = "bell" }),
    PrivateServer = Window:Tab({ Title = "免费私服", Icon = "bell" })
}

Window:SelectTab(1)

-- 1. 通知标签页
Tabs.Notice:Paragraph({
    Title = "神秘脚本",
    Desc = "多功能脚本合集"
})

Tabs.Notice:Button({
    Title = "张乐🤑🤑🤑🤑🤑🤑🤑🤑",
    Callback = function() end
})

Tabs.Notice:Button({
    Title = "张乐 本熊 乌龟 老鼠 小圆 孤行",
    Callback = function() end
})

Tabs.Notice:Button({
    Title = "偷走脑红更新了一个汉化脚本",
    Callback = function() end
})

Tabs.Notice:Button({
    Title = "作者QQ群",
    Callback = function()
        setclipboard("749944850")
        WindUI:Notify({
            Title = "QQ群",
            Content = "已复制到剪贴板",
            Duration = 3
        })
    end
})

local TimeTag = Window:Tag({
    Title = "00:00", 
    Color = Color3.fromRGB(255, 255, 255) 
})

local hue = 0
task.spawn(function()
    while true do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        local timeString = hours .. ":" .. minutes
        TimeTag:SetTitle(timeString)
        task.wait(0.06)
    end
end)

Window:Tag({
    Title = "1.9.3",
    Color = Color3.fromHex("#9c30ff")
})

Window:Tag({
    Title = "缝合",
    Color = Color3.fromHex("#30ff6a")
})

WindUI:SetNotificationLower(true)

-- 2. 通用(增强版本)标签页
Tabs.General:Slider({
    Title = "移速(升级版)",
    Value = {
        Min = 16,
        Max = 120,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        task.spawn(function()
            local Plr = game.Players.LocalPlayer
            while task.wait(0.1) do
                if Plr.Character then
                    local Humanoid = Plr.Character:FindFirstChildOfClass("Humanoid")
                    if Humanoid and Humanoid.WalkSpeed ~= value then
                        Humanoid.WalkSpeed = value
                    end
                end
            end
        end)
    end
})

Tabs.General:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end
})

Tabs.General:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Increment = 0.1, 
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

Tabs.General:Button({
    Title = "飞行v3",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Jay907692/Jay/8b94c47bd5969608438fa1ee57f34b1350789caa/飞行脚本", true))()
    end
})

local originalAmbient = game.Lighting.Ambient 
Tabs.General:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)  
        else
            game.Lighting.Ambient = originalAmbient or Color3.new(0, 0, 0)
        end
    end
})

local Noclip = false
local NoclipConnection
Tabs.General:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            Noclip = true
            if NoclipConnection then
                NoclipConnection:Disconnect()
            end
            NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if Noclip and game.Players.LocalPlayer.Character then
                    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            Noclip = false
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
        end
    end
})

Tabs.General:Button({
    Title = "点击传送工具",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse() 
        local tool = Instance.new("Tool") 
        tool.RequiresHandle = false 
        tool.Name = "点击传送" 
        tool.Activated:Connect(function() 
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local pos = mouse.Hit.Position + Vector3.new(0, 2.5, 0) 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
            end
        end) 
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

Tabs.General:Button({
    Title = "肘击",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt', true))()
    end
})

Tabs.General:Button({
    Title = "egor假延迟",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GBmWn4eZ", true))()
    end
})

Tabs.General:Button({
    Title = "玩家实时数据",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%AE%9E%E6%97%B6%E6%95%B0%E6%8D%AE.txt", true))()
    end
})

Tabs.General:Button({
    Title = "透视",
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        highlight.FillColor = Color3.new(1, 0, 0) 
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 

        local function createESP(character)
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            if not humanoidRootPart:FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = character
                highlightClone.Parent = humanoidRootPart
            end

            if not humanoidRootPart:FindFirstChild("PlayerNameDisplay") then
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "PlayerNameDisplay"
                billboardGui.Adornee = humanoidRootPart
                billboardGui.Size = UDim2.new(0, 150, 0, 20)
                billboardGui.StudsOffset = Vector3.new(0, 2.8, 0)
                billboardGui.AlwaysOnTop = true

                local textLabel = Instance.new("TextLabel")
                textLabel.Parent = billboardGui
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = character.Parent.Name 
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.TextSize = 9
                textLabel.TextScaled = false

                billboardGui.Parent = humanoidRootPart
            end
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                createESP(player.Character)
            end
        end

        game.Players.PlayerAdded:Connect(function(player)
            if player ~= game.Players.LocalPlayer then
                player.CharacterAdded:Connect(function(character)
                    createESP(character)
                end)
            end
        end)

        game.Players.PlayerRemoving:Connect(function(player)
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = player.Character.HumanoidRootPart
                if humanoidRootPart:FindFirstChild("Highlight") then humanoidRootPart.Highlight:Destroy() end
                if humanoidRootPart:FindFirstChild("PlayerNameDisplay") then humanoidRootPart.PlayerNameDisplay:Destroy() end
            end
        end)

        RunService.Heartbeat:Connect(function()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    createESP(player.Character)
                end
            end
        end)
        
        print("透视已开启")
    end
})

Tabs.General:Button({
    Title = "前后空翻",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E6%97%8B%E8%BD%AC.txt", true))()
    end
})

Tabs.General:Button({
    Title = "黑色大翅膀(需要输入anim)",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

Tabs.General:Toggle({
    Title = "爬墙（关不了）",
    Value = false,
    Callback = function(state)
        if state then
            loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r", true))()
        end
    end
})

Tabs.General:Button({
    Title = "骚福瑞叫爸爸",
    Callback = function()
        do
            local soundId = "rbxassetid://88457346646245"
            local sound = Instance.new("Sound")
            sound.Name = "GeneralTabSound"
            sound.SoundId = soundId
            sound.Looped = true
            sound.Volume = 0.5
            sound.Parent = game.Workspace

            local function keepPlaying()
                while task.wait(1) do
                    if not sound or not sound:IsDescendantOf(game) then
                        break
                    end
                    if not sound.IsPlaying then
                        sound:Play()
                    end
                end
            end

            sound:Play()
            task.spawn(keepPlaying)
        end
    end
})

Tabs.General:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj", true))()
    end
})

Tabs.General:Button({
    Title = "无限跳",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

-- 3. 其他脚本标签页
Tabs.OtherScript:Button({
    Title = "本熊汉化脚本",
    Desc = "因为采用了高级加密所以加载会非常的卡",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/jbu7666gvv/benhan/main/benhan"))()
            print("笨熊汉化加载成功")
        end)
    end
})

-- 4. 死铁轨标签页
Tabs.DeadRail:Paragraph({
    Title = "死铁轨脚本",
    Desc = "更新了两个死铁鬼脚本↓↓"
})

Tabs.DeadRail:Button({
    Title = "红叶子",
    Desc = "根本没有汉化😏😏",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
            print("红叶子加载成功")
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "RlNGta(汉化)",
    Desc = "汉化的还是全的",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%AD%BB%E9%93%81%E8%BD%A8.lua"))()
            print("R加载成功")
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "mtaskh(汉化)",
    Desc = "谁汉化的我不知道",  
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://github.com/mtaskhh/script/raw/refs/heads/main/moonmt.lua"))()
            print("9178加载成功")
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "NatHub(没汉化)",
    Desc = "要卡密",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
            print("R加载成功")
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "SolixHub(没汉化)",
    Desc = "要卡密",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/solixloader/refs/heads/main/solix v2 new loader.lua"))()
            print("R加载成功")
        end)
    end
})

-- 5. 森林中99个夜晚标签页
Tabs.ForestNight:Paragraph({
    Title = "森林中99个夜晚",
    Desc = "最好用的99页脚本↓↓"
})

Tabs.ForestNight:Button({
    Title = "虚空(汉化)",
    Desc = "没汉化全但是足够了",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/roblox/a304ee2b7344d37bbef7119436825929212fdaa1/%E8%99%9A%E7%A9%BA%E6%B1%89%E5%8C%96", true))()
            print("虚空汉化加载成功")
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "H4X(汉化)",
    Desc = "有一小点没汉化",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/roblox/cea5629b2f14172983185c8ff2104b5e2e7202aa/H4X%E6%B1%89%E5%8C%96"))()
            print("H4x汉化加载成功")
        end)
    end
})

Tabs.ForestNight:Button({
    Title极="TXD中心(汉化)",
    Desc = "要卡密完成96%汉化",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/54863r/XHnb/refs/heads/main/烤面包全汉"))()
            print("TXD中心汉化加载成功")
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "坑队友脚本(没汉化)",
    Desc = "恶搞那些没有脚本的普通玩家",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https极://raw.githubusercontent.com/Rx1m/CpsHub/refs/heads/main/Hub",true))()
            print("坑队友脚本加载成功")
        end)
    end
})

Tabs.ForestNight:Paragraph({
    Title = "没汉化的脚本",
    Desc = "以下脚本没有汉化↓↓↓"
})

Tabs.ForestNight:Button({
    Title = "Ronix(没汉化)",
    Desc = "远古脚本",  
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/极7d8a2a1a9a562a403b52532e58a14065.lua"))()
            print("9178加载成功")
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "Nazuro(没汉化)",
    Desc = "不用解卡密",  
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://nazuro.xyz/99nights"))()
            print("9178加载成功")
        end)
    end
})

-- 6. 偷走脑红标签页
Tabs.StealBrain:Button({
    Title = "VORTEX(没汉化)",
    Desc = "现在还能用",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://backend.unban.cc/api/lua/loader"))()
            print("9178加载成功")
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "超强变出脑红(汉化)",
    Desc = "顶多和朋友装13",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E9%80%9A%E5%B7%9E%E9%97%B9%E7%BA%A2%E6%B1%89%E5%8C%96"))()
            print("9178加载成功")
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "Zenikaze中心(汉化)",
    Desc极="有隐身偷",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/Protected_1650894819534207.lua.txt"))()
            print("9178加载成功")
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "ZZZZ中心(汉化)",
    Desc = "没有隐身但功能挺多",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E5%81%B7%E8%B5%B0%E8%84%91%E7%BA%A2%E6%B1%89%E极5%8C%96"))()
            print("9178加载成功")
       极 end)
    end
})

-- 墨水游戏标签页
-- 墨水游戏标签页
Tabs.InkGame:Button({
    Title = "Tex(汉化)",
    Desc = "忍者用不了",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/TexRBLlX"))()
            print("Tex加载成功")
        end)
    end
})

Tabs.InkGame:Button({
    Title = "XA(中文)",
    Desc = "忍者用会卡顿",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/墨水游戏.lua"))()
            print("XA加载成功")
        end)
    end
})

-- Blox Fruits标签页
Tabs.Blox:Button({
    Title = "Ronix(没汉化)",
    Desc = "要卡密",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Event-Blox-Fruits-Op-Best-Free-Script-GUI-55877"))()
            print("Ronix加载成功")
        end)
    end
})

Tabs.Blox:Button({
    Title = "自动开宝箱",
    Desc = "开启就关不上了",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/XMAS-Blox-Fruits-Cash-Generator-OPEN-SOURCE-and-KEYLESS-25553"))()
            print("自动开宝箱加载成功")
        end)
    end
})

-- 自然灾害标签页
Tabs.NaturalDisaster:Button({
    Title = "控制单个物体-XTTT",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/单一物体飞行载自己最终优化版"))()
    end
})

Tabs.NaturalDisaster:Button({
    Title = "全局物体漂浮-XTTT",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/全局物体漂浮最终优化版"))()
    end
})

-- 被遗弃标签页
Tabs.Abandoned:Button({
    Title = "虚空(汉化)",
    Desc = "完全免费的🥰🥰",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/Vape.lua"))()
            print("虚空加载成功")
        end)
    end
})

Tabs.Abandoned:Button({
    Title = "AlienX(中文)",
    Desc = "加载不出来的可以换注入器了",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/64c115c468ba4af6ddc2f73daed2595c.lua"))()
            print("AlienX加载成功")
        end)
    end
})

Tabs.Abandoned:Button({
    Title = "SNT中心(汉化)",
    Desc = "依旧",  
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
            print("SNT中心加载成功")
        end)
    end
})

-- G&B标签页
Tabs.GB:Button({
    Title = "G&B(皮脚本)",
    Desc = "功能还是较多的",
    Callback = function()
        pcall(function()
             getgenv().XiaoPi="皮脚本-内脏与黑火药" 
             loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\105\97\111\112\105\55\55\47\120\105\97\111\112\105\55\55\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\111\98\108\111\120\45\80\105\45\71\66\45\83\99\114\105\112\116\46\108\117\97"))()
            print("G&B皮脚本加载成功")
        end)
    end
})

Tabs.GB:Button({
    Title = "明日清风",
    Desc = "没用过",
    Callback = function()
        pcall(function()
             loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\109\115\109\100\109\115\109\115\107\47\87\107\115\107\115\111\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\69\87\79\74\79\34\41\41\40\41")()
            print("明日清风加载成功")
        end)
    end
})

Tabs.GB:Button({
    Title = "鲨鱼清风",
    Desc = "依旧没用过",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\65\51\78\113\122\52\78\112\47\114\97\119"))()
            print("鲨鱼清风加载成功")
        end)
    end
})

-- 最坚强的战场标签页
Tabs.StrongestBattlefield:Button({
    Title = "最强战场1",
    Desc = "可以闪避普通攻击",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
            print("最强战场1加载成功")
        end)
    end
})

Tabs.StrongestBattlefield:Button({
    Title = "最强战场2",
    Desc = "用了你就知道了",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Mahitotsbupdate'))()
            print("最强战场2加载成功")
        end)
    end
})

Tabs.StrongestBattlefield:Button({
    Title = "火车头",
    Desc = "只能在最强战场服务器里用",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()
            print("火车头加载成功")
        end)
    end
})

-- 死亡之死标签页
Tabs.DeathOfDeath:Button({
    Title = "HUB (汉化)",
    Desc = "追逐者提供",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E5%B8%AE%E7%B2%89%E4%B8%9D%E5%81%9A%E7%9A%84%E6%B1%89%E5%8C%96"))()
            print("死亡之死HUB加载成功")
        end)
    end
})

-- 造船寻宝标签页
Tabs.ShipBuilding:Button({
    Title = "最强脚本(Kenny汉化)",
    Desc = "刷金条最好用",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/zcxb.lua"))()
            print("造船寻宝脚本加载成功")
        end)
    end
})

-- Doors标签页
Tabs.Doors:Button({
    Title = "Smshax(汉化)",
    Desc = "汉化的较全",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/DOORS.lua"))()
            print("Smshax加载成功")
        end)
    end
})

Tabs.Doors:Button({
    Title = "VelocityX(汉化)",
    Desc = "汉化",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/VelocityX.lua"))()
            print("VelocityX加载成功")
        end)
    end
})

-- 伐木大亨2标签页
Tabs.LoggingTycoon:Button({
    Title = "LuaWare(汉化)",
    Desc = "汉化的",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
            print("LuaWare加载成功")
        end)
    end
})

-- 奇怪枪械标签页
Tabs.StrangeGuns:Button({
    Title = "修改武器(汉化)",
    Desc = "非常好用修改后还有伤害",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E5%A5%87%E6%80%AA%E6%9E%AA%E6%A2%B0%E6%B1%89%E5%8C%96"))()
            print("奇怪枪械脚本加载成功")
        end)
    end
})

-- 植物大战脑红标签页
Tabs.PlantVsBrain:Button({
    Title = "HackManHub(oo汉化)",
    Desc = "汉话",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/e2395c7c065c3763ec97e1302ad577db56e7cba9/%E6%A4%8D%E7%89%A9%E5%A4%A7%E6%88%98%E8%84%91%E7%BA%A2%E7%9A%84%E6%B1%89%E8%AF%9D"))()
            print("HackManHub加载成功")
        end)
    end
})

-- 挖掘后院标签页
Tabs.DigBackyard:Button({
    Title = "老外(没汉化)",
    Desc = "功能不咋多",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Dig-the-Backyard-Alpha-OP-Script-34131"))()
            print("挖掘后院脚本加载成功")
        end)
    end
})

-- 数学谋杀案标签页
Tabs.MathMurder:Button({
    Title = "自动回答",  
    Desc = "点一下就开启了",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Math-Murder-Auto-Answer-43521"))()
            print("数学谋杀案自动回答加载成功")
        end)
    end
})

-- 请捐赠标签页
Tabs.Donate:Button({
    Title = "自动圈罗宝",
    Desc = "全自动",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/PLS-DONATE-szze-autofarm-11262"))()
            print("自动圈罗宝加载成功")
        end)
    end
})

-- 战争大亨标签页
Tabs.WarTycoon:Button({
    Title = "战争大亨1(没汉化)",
    Desc = "要卡密",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Limited-War-Tycoon-Kill-Aura-and-Gun-Mods-and-More-58205"))()
            print("战争大亨1加载成功")
        end)
    end
})

Tabs.WarTycoon:Button({
    Title = "战争大亨2(汉化)",
    Desc = "实用性中等",
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.txt"))()
            print("战争大亨2加载成功")
        end)
    end
})

-- 超人弹射标签页
Tabs.Hypershot:Button({
    Title = "Zephyr(没汉化)",
    Desc = "国外免费最强脚本",  
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hypershot-OP-by-EDUX-51972"))()
            print("Zephyr加载成功")
        end)
    end
})

-- 免费私服标签页
Tabs.PrivateServer:Button({
    Title = "免费私服脚本(没汉化)",
    Desc = "需要进入你要弄的私服服务器",  
    Callback = function()
        pcall(function()
             loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FREE-PRIVATE-SERVER-GUI-ANY-GAME-55939"))()
            print("免费私服脚本加载成功")
        end)
    end
})

-- 设置默认选中的标签页
Window:SelectTab("通知")

-- 加载完成提示
print("神秘脚本1.9.3加载完成 - 基于本熊汉化格式重构")
