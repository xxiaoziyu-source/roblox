-- 加载UI库并处理初始弹窗
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success then
    warn("WindUI库加载失败，请检查链接或网络！")
    return
end

local Confirmed = false

-- 初始确认弹窗
WindUI:Popup({
    Title = "欢迎使用神秘脚本",
    Icon = "crown",
    IconThemed = true,
    Content = "神秘脚本 WindUI Lib",  
    Buttons = {
        {
            Title = "退出",
            Callback = function() Confirmed = false end,
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

-- 等待用户确认
repeat task.wait(0.1) until Confirmed == true or Confirmed == false
if not Confirmed then
    warn("用户已退出，脚本终止运行")
    return
end

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "神秘脚本",
    Icon = "crown",
    IconThemed = true,
    Author = "作者:○○",
    Folder = "9175",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Light",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true
})

-- 顶部按钮
Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() 
    print("全屏切换功能暂不可用")
end, 989)

-- 编辑开启按钮
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

-- 修复流动彩虹边框效果
task.spawn(function()
    while task.wait(0.05) do
        for i = 0, 1, 0.01 do
            if Window and Window.OpenButton then
                local openButton = Window.OpenButton
                local stroke = openButton:FindFirstChild("Stroke")
                if stroke then
                    local gradient = stroke:FindFirstChild("UIGradient")
                    if not gradient then
                        gradient = Instance.new("UIGradient")
                        gradient.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
                            ColorSequenceKeypoint.new(0.2, Color3.fromHex("FFAA00")),
                            ColorSequenceKeypoint.new(0.4, Color3.fromHex("FFFF00")),
                            ColorSequenceKeypoint.new(0.6, Color3.fromHex("00FF00")),
                            ColorSequenceKeypoint.new(0.8, Color3.fromHex("0000FF")),
                            ColorSequenceKeypoint.new(1, Color3.fromHex("AA00FF"))
                        })
                        gradient.Rotation = 0
                        gradient.Parent = stroke
                    end
                    gradient.Offset = Vector2.new(i, 0)
                end
            end
            task.wait(0.05)
        end
    end
end)

-- 定义所有标签页（修复重复定义问题）
local Tabs = {
    Notice = Window:Tab({ Title = "通知", Icon = "bell" }),
    General = Window:Tab({ Title = "通用", Icon = "sword" }),
    AutoLocalization = Window:Tab({ Title = "自动汉化", Icon = "language" }),
    OtherScript = Window:Tab({ Title = "其他脚本", Icon = "sword" }),
    DeadRail = Window:Tab({ Title = "死铁轨", Icon = "sword" }),
    ForestNight = Window:Tab({ Title = "森林中99个夜晚", Icon = "sword" }),
    StealBrain = Window:Tab({ Title = "偷走脑红", Icon = "brain" }),
    Blox = Window:Tab({ Title = "Blox Fruits", Icon = "sword" }),
    NaturalDisaster = Window:Tab({ Title = "自然灾害", Icon = "bell" }),
    Abandoned = Window:Tab({ Title = "被遗弃", Icon = "bell" }),
    GB = Window:Tab({ Title = "G&B", Icon = "bell" }),
    Doors = Window:Tab({ Title = "Doors", Icon = "bell" }),
    Logging = Window:Tab({ Title = "伐木大亨2", Icon = "bell" }),
    CutTrees = Window:Tab({ Title = "砍伐树木", Icon = "bell" }),
    StrangeGuns = Window:Tab({ Title = "奇怪枪械", Icon = "bell" }),
    PlantZombie = Window:Tab({ Title = "植物大战脑红", Icon = "bell" }),
    BuildPlane = Window:Tab({ Title = "建造一架飞机", Icon = "plane" }),
    GoFishing = Window:Tab({ Title = "钓鱼吧", Icon = "fish" }),
    BladeBall = Window:Tab({ Title = "刀刃球", Icon = "ball" }),
    PlantGarden = Window:Tab({ Title = "种植花园", Icon = "flower" }),
    LongTrip = Window:Tab({ Title = "长途旅行", Icon = "car" }),
    OvernightInSupermarket = Window:Tab({ Title = "在超级超市里过夜", Icon = "shopping-cart" }),
    OhioState = Window:Tab({ Title = "俄亥俄州", Icon = "map" }),
    ShelterSurvival = Window:Tab({ Title = "避难所生存", Icon = "shield" }),
    RaftSurvival = Window:Tab({ Title = "木筏生存", Icon = "raft" }),
    DigBackyard = Window:Tab({ Title = "挖掘后院", Icon = "bell" }),
    MathMurder = Window:Tab({ Title = "数学谋杀案", Icon = "bell" }),
    Donate = Window:Tab({ Title = "请捐赠", Icon = "bell" }),
    WarTycoon = Window:Tab({ Title = "战争大亨", Icon = "bell" }),
    Hypershot = Window:Tab({ Title = "超人射击", Icon = "bell" }),
    PrivateServer = Window:Tab({ Title = "免费私服", Icon = "bell" })
}

Window:SelectTab(1)

-- 时间标签（修复重复定义）
local TimeTag = Window:Tag({
    Title = "00:00", 
    Color = Color3.fromRGB(255, 255, 255) 
})

task.spawn(function()
    while task.wait(1) do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        local timeString = hours .. ":" .. minutes
        if TimeTag and TimeTag.SetTitle then
            TimeTag:SetTitle(timeString)
        end
    end
end)

WindUI:SetNotificationLower(true)

-- 添加标签
Window:Tag({
    Title = "v1.9.5",
    Color = Color3.fromHex("#9c30ff")
})

Window:Tag({
    Title = "缝合",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
    Title = "汉化",
    Color = Color3.fromHex("#0066ff")
})

-- 通知标签页
Tabs.Notice:Section({ 
    Title = "脚本说明",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.Notice:Paragraph({
    Title = "感谢",
    Desc = "黄某,雪花,本熊,老鼠,乌龟,小圆,孤行,",
})

Tabs.Notice:Paragraph({
    Title = "更新内容",
    Desc = "植物vs大脑更新了一个脚本",
})

Tabs.Notice:Button({
    Title = "作者QQ群",
    Callback = function()
        setclipboard("749944850")
        WindUI:Notify({
            Title = "快手号",
            Content = "已复制到剪贴板",
            Duration = 3
        })
    end
})

Tabs.Notice:Section({ 
    Title = "调节功能",
    TextXAlignment = "Left",
    TextSize = 25,
})

-- 修复透明度滑块（删除重复，优化逻辑）
Tabs.Notice:Slider({
    Title = "主面板透明度",
    Value = {
        Min = 0,
        Max = 100,
        Default = 0,
    },
    Increment = 5,
    Callback = function(value)
        local transparency = value / 100
        
        if Window and Window.Gui then
            local function setTransparencyRecursive(object, trans)
                if not object or not object:IsA("GuiObject") then return end
                
                pcall(function()
                    object.BackgroundTransparency = trans
                    if object:IsA("TextLabel") or object:IsA("TextBox") then
                        object.TextTransparency = trans
                    end
                    if object:IsA("ImageLabel") or object:IsA("ImageButton") then
                        object.ImageTransparency = trans
                    end
                end)
                
                for _, child in ipairs(object:GetChildren()) do
                    setTransparencyRecursive(child, trans)
                end
            end
            
            setTransparencyRecursive(Window.Gui, transparency)
        end
        
        WindUI:Notify({
            Title = "透明度设置",
            Content = "主面板透明度已设置为: " .. value .. "%",
            Duration = 2
        })
    end
})

-- 通用功能标签页（修复所有回调函数的错误处理）
Tabs.General:Slider({
    Title = "移速",
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
                if Plr and Plr.Character then
                    local Humanoid = Plr.Character:FindFirstChildOfClass("Humanoid")
                    if Humanoid then
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
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
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
        pcall(function()
            game.Workspace.Gravity = value
        end)
    end
})

Tabs.General:Button({
    Title = "飞行v3",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Jay907692/Jay/8b94c47bd5969608438fa1ee57f34b1350789caa/飞行脚本", true))()
        end)
    end
})

local originalAmbient = game.Lighting.Ambient 
Tabs.General:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(state)
        pcall(function()
            if state then
                game.Lighting.Ambient = Color3.new(1, 1, 1)  
            else
                game.Lighting.Ambient = originalAmbient or Color3.new(0, 0, 0)
            end
        end)
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

-- 修复所有按钮的回调函数
Tabs.General:Button({
    Title = "点击传送工具",
    Desc = "全自动",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/PLS-DONATE-szze-autofarm-11262"))()
        end)
    end
})

Tabs.General:Button({
    Title = "肘击",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt', true))()
        end)
    end
})

Tabs.General:Button({
    Title = "egor假延迟",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/GBmWn4eZ", true))()
        end)
    end
})

Tabs.General:Button({
    Title = "玩家实时数据",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%AE%9E%E6%97%B6%E6%95%B0%E6%8D%AE.txt", true))()
        end)
    end
})

Tabs.General:Button({
    Title = "透视",
    Callback = function()
        pcall(function()
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
        end)
    end
})

Tabs.General:Button({
    Title = "前后空翻",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E6%97%8B%E8%BD%AC.txt", true))()
        end)
    end
})

Tabs.General:Button({
    Title = "隐身",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj", true))()
        end)
    end
})

Tabs.General:Button({
    Title = "无限跳",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
        end)
    end
})

Tabs.General:Toggle({
    Title = "爬墙（关不了）",
    Value = false,
    Callback = function(state)
        if state then
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r", true))()
            end)
        end
    end
})

Tabs.General:Button({
    Title = "F 3x改进",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/H4x-/refs/heads/main/F%203%20x"))()
        end)
    end
})

Tabs.General:Button({
    Title = "黑色大翅膀(需要输入anim)",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end
})

Tabs.General:Button({
    Title = "自动跳墙",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-wall-hop-51794"))()
        end)
    end
})

Tabs.General:Button({
    Title = "生成78",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()
        end)
    end
})

Tabs.General:Button({
    Title = "后门加载器",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Backdoor-exe-9413"))()
        end)
    end
})

Tabs.General:Section({ 
    Title = "本地黑客功能",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.General:Button({
    Title = "c00lkidd",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkidd-50239"))()
        end)
    end
})

Tabs.General:Button({
    Title = "1x1x1x1",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x1x1x1-gui-43195"))()
        end)
    end
})

Tabs.General:Section({ 
    Title = "音频功能",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.General:Button({
    Title = "骚福瑞叫爸爸",
    Callback = function()
        pcall(function()
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
        end)
    end
})

-- 自动汉化标签页
Tabs.AutoLocalization:Paragraph({
    Title = "目前可以汉化的脚本",
    Desc = "偷走脑红任何脚本\nH4x[钓鱼吧]",
})

Tabs.AutoLocalization:Button({
    Title = "自动汉化",  
    Desc = "目前已修卡顿问题",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/H4x-/refs/heads/main/%E8%87%AA%E5%8A%A8%E6%B1%89%E5%8C%96%E3%80%82%20Pro%20max"))()
        end)
    end
})

-- 其他脚本标签页
Tabs.OtherScript:Button({
    Title = "本熊汉化脚本",
    Desc = "因为采用了高级加密所以加载会非常的卡",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/jbu7666gvv/benhan/main/benhan"))()
        end)
    end
})

-- 死铁轨标签页
Tabs.DeadRail:Section({ 
    Title = "更新了两个死铁鬼脚本↓↓",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.DeadRail:Button({
    Title = "红叶子",
    Desc = "根本没有汉化😏😏😏😏",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "RlNGta(汉化)",
    Desc = "汉化的还是全的",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%AD%BB%E9%93%81%E8%BD%A8.lua"))()
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "mtaskh(汉化)",
    Desc = "谁汉化的我不知道",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://github.com/mtaskhh/script/raw/refs/heads/main/moonmt.lua"))()
        end)
    end
})

Tabs.DeadRail:Button({
    Title = "攻速(没汉化)",
    Desc = "攻速调节.第三人称",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/Dusty/refs/heads/main/NOTV4TRUST"))()
        end)
    end
})

-- 森林中99个夜晚标签页
Tabs.ForestNight:Section({ 
    Title = "最好用的99页脚本↓↓",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.ForestNight:Button({
    Title = "虚空(汉化)",
    Desc = "更新速度快而且免费不需解卡",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/roblox/refs/heads/main/-45"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "H4X(汉化)",
    Desc = "要卡密已经被削成中等脚本",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/H4x-/refs/heads/main/H4x%E6%B1%89%E5%8C%96%E8%84%9A%E6%9C%AC"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "Ringta(汉化)",
    Desc = "也不用解卡",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/99Nights"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "TXD中心(汉化)",
    Desc = "要卡密完成96%汉化",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/54863r/XHnb/refs/heads/main/烤面包全汉"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "坑队友脚本(汉化)",
    Desc = "恶搞那些没有开无敌的玩家",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/H4x-/refs/heads/main/Ri",true))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "Nazuro(汉化)",
    Desc = "不用解卡密",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/99%E9%A1%B5nm%E8%84%9A%E6%9C%AC%E6%B1%89%E5%8C%96%E3%80%82"))()
        end)
    end
})

Tabs.ForestNight:Section({ 
    Title = "没汉化的脚本↓↓↓",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.ForestNight:Button({
    Title = "Ronix(没汉化)",
    Desc = "远古脚本",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "soluna(没汉化)",
    Desc = "需要加DC群获取卡密",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://soluna-script.vercel.app/99-Nights-in-the-Forest.lua",true))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "VEX OP(没汉化)",
    Desc = "需要解卡密",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yoursvexyyy/VEX-OP/refs/heads/main/99 nights in the forest"))()
        end)
    end
})

Tabs.ForestNight:Button({
    Title = "Kenniel(没汉化)",
    Desc = "需要解卡密",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/99-Nights-in-the-Forest/refs/heads/main/99 Nights in the Forest"))()
        end)
    end
})

-- 偷走脑红标签页
Tabs.StealBrain:Button({
    Title = "VORTEX(没汉化)",
    Desc = "现在还能用",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://backend.unban.cc/api/lua/loader"))()
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "超强变出脑红(汉化)",
    Desc = "需要解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E9%80%9A%E5%B7%9E%E9%97%B9%E7%BA%A2%E6%B1%89%E5%8C%96"))()
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "Zenikaze中心(汉化)",
    Desc = "有隐身偷目前已失效",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/Protected_1650894819534207.lua.txt"))()
        end)
    end
})

Tabs.StealBrain:Button({
    Title = "ZZZZ中心(汉化)",
    Desc = "没有隐身但功能挺多",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E5%81%B7%E8%B5%B0%E8%84%91%E7%BA%A2%E6%B1%89%E5%8C%96"))()
        end)
    end
})

-- Blox Fruits标签页
Tabs.Blox:Button({
    Title = "Event Blox Fruits",
    Desc = "要卡",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Event-Blox-Fruits-Op-Best-Free-Script-GUI-55877"))()
        end)
    end
})

Tabs.Blox:Button({
    Title = "自动开宝箱",
    Desc = "开启就关不上了",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/XMAS-Blox-Fruits-Cash-Generator-OPEN-SOURCE-and-KEYLESS-25553"))()
        end)
    end
})

-- 自然灾害标签页
Tabs.NaturalDisaster:Button({
    Title = "控制单个物体-XTTT",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/单一物体飞行载自己最终优化版"))()
        end)
    end
})

Tabs.NaturalDisaster:Button({
    Title = "全局物体漂浮-XTTT",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/全局物体漂浮最终优化版"))()
        end)
    end
})

Tabs.NaturalDisaster:Button({
    Title = "黑洞",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/V1.lua.txt"))()
        end)
    end
})

-- 被遗弃标签页
Tabs.Abandoned:Button({
    Title = "虚空(汉化)",
    Desc = "完全免费的🥰🥰🥰🥰",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/Vape.lua"))()
        end)
    end
})

Tabs.Abandoned:Button({
    Title = "AlienX(中文)",
    Desc = "加载不出来的可以换注入器了",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/64c115c468ba4af6ddc2f73daed2595c.lua"))()
        end)
    end
})

Tabs.Abandoned:Button({
    Title = "SNT中心(汉化)",
    Desc = "依旧",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
        end)
    end
})

-- G&B标签页
Tabs.GB:Button({
    Title = "G&B(皮脚本)",
    Desc = "功能还是较多的",
    Locked = false,
    Callback = function()
        pcall(function()
            getgenv().XiaoPi="皮脚本-内脏与黑火药" 
            loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\105\97\111\112\105\55\55\47\120\105\97\111\112\105\55\55\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\82\111\98\108\111\120\45\80\105\45\71\66\45\83\99\114\105\112\116\46\108\117\97"))()
        end)
    end
})

Tabs.GB:Button({
    Title = "明日清风",
    Desc = "没用过",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\109\115\109\100\109\115\109\115\107\47\87\107\115\107\115\111\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\69\87\79\74\79\34\41\41\40\41")()
        end)
    end
})

Tabs.GB:Button({
    Title = "鲨鱼清风",
    Desc = "依旧没用过",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\65\51\78\113\122\52\78\112\47\114\97\119"))()
        end)
    end
})

-- Doors标签页
Tabs.Doors:Button({
    Title = "VelocityX(汉化)",
    Desc = "汉化",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/VelocityX.lua"))()
        end)
    end
})

-- 伐木大亨2标签页
Tabs.Logging:Button({
    Title = "LuaWare(汉化)",
    Desc = "汉化的",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
        end)
    end
})

-- 砍伐树木标签页
Tabs.CutTrees:Section({ 
    Title = "自制功能",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.CutTrees:Button({
    Title = "砍树1",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Cut-Trees-Cut-all-nearest-trees-57309"))()
        end)
    end
})

Tabs.CutTrees:Button({
    Title = "砍树2",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Cut-Trees-WORLD-3-Instant-cut-all-trees-56528"))()
        end)
    end
})

Tabs.CutTrees:Button({
    Title = "武器变大",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Cut-Trees-Resize-tool-57310"))()
        end)
    end
})

Tabs.CutTrees:Section({ 
    Title = "缝合脚本",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.CutTrees:Button({
    Title = "ViKai HUB(没汉化)",
    Desc = "不用解卡密",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Cut-Trees-Free-Keyless-ViKai-HUB-58535"))()
        end)
    end
})

-- 奇怪枪械标签页
Tabs.StrangeGuns:Button({
    Title = "修改武器(汉化)",
    Desc = "非常好用修改后还有伤害",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/refs/heads/main/%E5%A5%87%E6%80%AA%E6%9E%AA%E6%A2%B0%E6%B1%89%E5%8C%96"))()
        end)
    end
})

-- 植物大战脑红标签页
Tabs.PlantZombie:Section({ 
    Title = "汉化的",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.PlantZombie:Button({
    Title = "HackManHub(汉化)",
    Desc = "汉话",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xxiaoziyu-source/-/e2395c7c065c3763ec97e1302ad577db56e7cba9/%E6%A4%8D%E7%89%A9%E5%A4%A7%E6%88%98%E8%84%91%E7%BA%A2%E7%9A%84%E6%B1%89%E8%AF%9D"))()
        end)
    end
})

Tabs.PlantZombie:Section({ 
    Title = "没汉化的",
    TextXAlignment = "Left",
    TextSize = 25,
})

Tabs.PlantZombie:Button({
    Title = "不知名(没汉化)",
    Desc = "不用解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/PlantsVsBrainrots"))()
        end)
    end
})

-- 建造一架飞机标签页
Tabs.BuildPlane:Button({
    Title = "绿色中心(没汉化)",  
    Desc = "不用解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Greens-Hub-Build-a-Plane-56944"))()
        end)
    end
})

-- 钓鱼吧标签页
Tabs.GoFishing:Button({
    Title = "H4x(没汉化)",  
    Desc = "不需要解卡",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-Fish-It!-H4xScripts-Fish-It-60144"))()
        end)
    end
})

-- 刀刃球标签页
Tabs.BladeBall:Button({
    Title = "Blade Ball(没汉化)",
    Desc = "不需要解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/cjpimpin's-Place-Blade-ball-48124"))()
        end)
    end
})

-- 种植花园标签页
Tabs.PlantGarden:Button({
    Title = "H4x(没汉化)",  
    Desc = "需要解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
        end)
    end
})

-- 长途旅行标签页
Tabs.LongTrip:Button({
    Title = "长途旅行脚本",
    Desc = "自动导航功能",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Long-Trip-Auto-Travel-62345"))()
        end)
    end
})

-- 在超级超市里过夜标签页
Tabs.OvernightInSupermarket:Button({
    Title = "设置传送点并返回(没汉化)",  
    Desc = "不需要解卡",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-Overnight-in-a-Mega-Store-Roblox-Survive-Overnight-In-a-Mega-Store-Script-41522"))()
        end)
    end
})

-- 俄亥俄州标签页
Tabs.OhioState:Button({
    Title = "RB",  
    Desc = "没用",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
        end)
    end
})

-- 避难所生存标签页
Tabs.ShelterSurvival:Button({
    Title = "ZEFERUS.FUN(没汉化)",  
    Desc = "不是电脑的话，那个框有点大",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Asylum-Life-Keyless-More-Bypass-58278"))()
        end)
    end
})

-- 木筏生存标签页
Tabs.RaftSurvival:Button({
    Title = "收集木箱1",  
    Desc = "点一下就开启了",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-on-a-Raft-Survive-on-raft-my-script-59728"))()
        end)
    end
})

Tabs.RaftSurvival:Button({
    Title = "Peachy Hub(没汉化)",  
    Desc = "需要解卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-on-a-Raft-Peachy-Hub-59276"))()
        end)
    end
})

Tabs.RaftSurvival:Button({
    Title = "收集木箱2",  
    Desc = "点一下就开启了",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Survive-on-a-Raft-Auto-collect-boxes-59284"))()
        end)
    end
})

-- 挖掘后院标签页
Tabs.DigBackyard:Button({
    Title = "老外(没汉化)",
    Desc = "功能不咋多",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Dig-the-Backyard-Alpha-OP-Script-34131"))()
        end)
    end
})

-- 数学谋杀案标签页
Tabs.MathMurder:Button({
    Title = "自动回答",  
    Desc = "点一下就开启了",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Math-Murder-Auto-Answer-43521"))()
        end)
    end
})

Tabs.MathMurder:Button({
    Title = "自动拾取苹果",  
    Desc = "并砸向别人",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Math-Murder-Auto-Answer-43531"))()
        end)
    end
})

-- 请捐赠标签页
Tabs.Donate:Button({
    Title = "自动圈罗宝",
    Desc = "全自动辅助类脚本",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/PLS-DONATE-szze-autofarm-11262"))()
        end)
    end
})

-- 战争大亨标签页
Tabs.WarTycoon:Button({
    Title = "战争大亨1(没汉化)",
    Desc = "要卡密",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Limited-War-Tycoon-Kill-Aura-and-Gun-Mods-and-More-58205"))()
        end)
    end
})

Tabs.WarTycoon:Button({
    Title = "战争大亨2(汉化)",
    Desc = "实用性中等",
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.txt"))()
        end)
    end
})

-- 超人射击标签页
Tabs.Hypershot:Button({
    Title = "Zephyr(没汉化)",
    Desc = "国外免费最强脚本",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hypershot-OP-by-EDUX-51972"))()
        end)
    end
})

-- 免费私服标签页
Tabs.PrivateServer:Button({
    Title = "免费私服脚本(没汉化)",
    Desc = "需要进入你要弄的私服服务器",  
    Locked = false,
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FREE-PRIVATE-SERVER-GUI-ANY-GAME-55939"))()
        end)
    end
})

-- 脚本加载完成提示
print("神秘脚本加载完成！")
WindUI:Notify({
    Title = "神秘脚本",
    Content = "脚本加载完成！",
    Duration = 3
})
