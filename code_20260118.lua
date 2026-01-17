-- 脚本来源: discord.gg/25ms
-- Cat-King-HUB v2.5 重构版
local CoreGui = game:GetService('CoreGui')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local Lighting = game:GetService('Lighting')
local HttpService = game:GetService('HttpService')

-- 清理旧 WindUI 实例
if CoreGui:FindFirstChild('WindUI') then
    CoreGui.WindUI:Destroy()
end
if LocalPlayer.PlayerGui:FindFirstChild('WindUI') then
    LocalPlayer.PlayerGui.WindUI:Destroy()
end

-- 加载依赖
require('./src/Init')
local CatKingHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/CatKing2331/Script/refs/heads/main/main.lua'))()

-- 创建主窗口
local MainWindow = CatKingHub:CreateWindow({
    NewElements = true,
    OpenButton = {
        StrokeThickness = 3,
        Title = 'Open Cat-King hub UI',
        Enabled = true,
        Color = ColorSequence.new(Color3.fromHex('#30FF6A'), Color3.fromHex('#e7ff2f')),
        Draggable = true,
        OnlyMobile = false,
        CornerRadius = UDim.new(1, 0),
    },
    User = {Enabled = true},
    Folder = 'Cat-King-HUB',
    Topbar = {
        Height = 44,
        ButtonsType = 'Mac',
    },
    Title = 'Cat-King-HUB',
    Transparent = true,
    IconSize = 44,
    HideSearchBar = false,
    TransparencyValue = 0.6,
    Acrylic = true,
})

-- 窗口标签
MainWindow:Tag({Title = 'v2.5', Color = Color3.fromHex('#1c1c1c')})
local StatusTag = MainWindow:Tag({Title = 'Loading...', Color = Color3.fromHex('#1c1c1c')})

-- 优化彩虹文字动画（修复无限循环错误）
task.spawn(function()
    local hueStep = 0.0833 -- 12个字母对应12等分色相环
    while wait(0.1) do
        local baseHue = os.clock() * 0.2 % 1 -- 缓慢循环色相
        local text = ''
        local letters = {'G','o','o','d',' ','E','v','e','n','i','n','g'}
        
        for i, letter in ipairs(letters) do
            local hue = (baseHue + (i-1)*hueStep) % 1
            local color = Color3.fromHSV(hue, 1, 1)
            text = text .. string.format('<font color="#%s">%s</font>', color:ToHex(), letter)
        end
        
        text = text .. '  ' .. os.date('%H:%M:%S')
        StatusTag:SetTitle(text)
    end
end)

-- 添加主题
CatKingHub:AddTheme({
    Outline = Color3.fromHex('#E5E5E5'),
    DialogIcon = Color3.fromHex('#000000'),
    DialogBackground = Color3.fromHex('#FFFFFF'),
    PopupIcon = Color3.fromHex('#000000'),
    PopupContent = Color3.fromHex('#000000'),
    ElementIcon = Color3.fromHex('#000000'),
    ElementTitle = Color3.fromHex('#000000'),
    DialogBackgroundTransparency = 0.05,
    TopbarAuthor = Color3.fromHex('#666666'),
    TabIcon = Color3.fromHex('#000000'),
    Button = Color3.fromHex('#FFFFFF'),
    DialogTitle = Color3.fromHex('#000000'),
    Icon = Color3.fromHex('#000000'),
    PopupTitle = Color3.fromHex('#000000'),
    ElementBackground = Color3.fromHex('#FFFFFF'),
    PopupBackgroundTransparency = 0.05,
    TopbarIcon = Color3.fromHex('#000000'),
    TopbarTitle = Color3.fromHex('#000000'),
    DialogContent = Color3.fromHex('#000000'),
    Text = Color3.fromHex('#000000'),
    ElementDesc = Color3.fromHex('#333333'),
    PopupBackground = Color3.fromHex('#FFFFFF'),
    TopbarButtonIcon = Color3.fromHex('#000000'),
    Placeholder = Color3.fromHex('#666666'),
    Name = 'WhiteFrostedGlass',
    TabTitle = Color3.fromHex('#000000'),
    WindowBackground = Color3.fromHex('#FFFFFF'),
    TabBackground = Color3.fromHex('#F5F5F7'),
    Dialog = Color3.fromHex('#FFFFFF'),
    Accent = Color3.fromHex('#FFFFFF'),
})

CatKingHub:SetTheme('WhiteFrostedGlass')
CatKingHub:ToggleAcrylic(true)
CatKingHub.Transparent = true
CatKingHub.TransparencyValue = 0.6

-- 颜色定义
local ColorGray = Color3.fromHex('#83889E')
local ColorBlue = Color3.fromHex('#257AF7')

-- ========== About 标签页 ==========
local AboutTab = MainWindow:Tab({
    IconShape = 'Square',
    IconColor = ColorGray,
    Title = 'About Cat-King',
    Icon = 'solar:info-square-bold',
})

AboutTab:Paragraph({
    Title = 'What is Cat-King?',
    Desc = [[Cat King is just an ordinary person living in a country somewhere on Earth.
I love Roblox, and in my spare time I focus on researching and creating scripts.
All scripts I release are free to use, and anyone is welcome to use them.
The reason ads are included is not for profit, but because maintaining, updating,
and testing scripts requires a significant amount of time and effort.
In reality, ad revenue is very limited.
If you would like to support me, you can also do so by purchasing a key,
which helps me continue improving and updating the scripts.
My original intention is to allow more players to use safe and reliable scripts for free.
While there are many no-key scripts available online, a large number of them carry risks
such as steal Roblox account or steal Robux.
Even though my scripts may not be as powerful as some others,
I will continue to improve and make them better.
"Free is the most expensive."
Thank you for your understanding and support.
Have fun, enjoy your game, and wish you happiness every day!]],
})

AboutTab:Image({
    Image = 'https://i.pinimg.com/736x/ca/68/6e/ca686e9577d7c2c3801e551ccdaa138f.jpg',
    Radius = 9,
    AspectRatio = '1:1',
})
AboutTab:Space()
AboutTab:Select()

-- ========== Universal 分类 ==========
local UniversalSection = MainWindow:Section({Title = 'Universal'})

-- Players 标签页
local PlayersTab = UniversalSection:Tab({
    IconShape = 'Square',
    IconColor = ColorGray,
    Title = 'Players',
    Icon = 'solar:user-bold',
})

PlayersTab:Section({Title = 'Movement'})
PlayersTab:Toggle({
    Callback = function() end,
    Title = 'Speed',
    Desc = 'Enable speed modification',
})
PlayersTab:Slider({
    Value = {Min = 16, Default = 16, Max = 200},
    Callback = function() end,
    Title = 'Speed Value',
    Step = 1,
})
PlayersTab:Space()

PlayersTab:Toggle({
    Callback = function() end,
    Title = 'Jump Power',
    Desc = 'Enable jump power modification',
})
PlayersTab:Slider({
    Value = {Min = 50, Default = 50, Max = 500},
    Callback = function() end,
    Title = 'Jump Power Value',
    Step = 1,
})
PlayersTab:Space()

PlayersTab:Toggle({
    Callback = function() end,
    Title = 'Fly',
    Desc = 'Enable flying mode',
})
PlayersTab:Slider({
    Value = {Min = 10, Default = 50, Max = 200},
    Callback = function() end,
    Title = 'Fly Speed',
    Step = 1,
})

PlayersTab:Toggle({
    Callback = function() end,
    Title = 'Noclip',
    Desc = 'Walk through walls',
})

PlayersTab:Toggle({
    Callback = function() end,
    Title = 'Infinite Jump',
    Desc = 'Jump endlessly',
})

-- Visual 标签页
local VisualTab = UniversalSection:Tab({
    IconShape = 'Square',
    IconColor = ColorGray,
    Title = 'Visual',
    Icon = 'solar:eye-bold',
})

VisualTab:Toggle({
    Callback = function() end,
    Title = 'ESP',
    Desc = 'HighLight Players',
})
VisualTab:Colorpicker({
    Callback = function() end,
    Title = 'ESP Color',
    Default = Color3.fromRGB(255, 0, 0),
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Rainbow ESP',
    Desc = 'Cycle ESP Colors',
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Name Tags',
    Desc = 'Show Player Names',
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Health',
    Desc = 'Show Player Health',
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Distance',
    Desc = 'Show Distance',
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Tracers',
    Desc = 'Show Tracers',
})
VisualTab:Toggle({
    Callback = function() end,
    Title = 'Full Bright',
    Desc = 'Max Brightness',
})

-- FE 标签页
local FETab = UniversalSection:Tab({
    IconShape = 'Square',
    IconColor = ColorBlue,
    Title = 'FE',
    Icon = 'solar:cursor-square-bold',
})

FETab:Button({
    Callback = function() end,
    Title = 'Super Girl Mode',
    Desc = 'Click to transform into Super Girl',
})

-- ========== Script 分类 ==========
local ScriptSection = MainWindow:Section({Title = 'Script'})

-- 游戏脚本标签页创建工具函数
local function CreateGameScriptTab(gameName, gameId, iconUrl)
    local tab = ScriptSection:Tab({
        IconColor = ColorBlue,
        Title = gameName,
        Icon = 'solar:file-text-bold',
    })
    
    tab:Button({
        Callback = function() end,
        Title = string.format('Load %s Script', gameName),
        Desc = gameName,
    })
    tab:Space()
    
    tab:Paragraph({
        ImageSize = 60,
        Image = iconUrl,
        Title = gameName,
        Desc = string.format('Game ID: %s', gameId),
    })
    tab:Space()
    
    tab:Button({
        Callback = function() end,
        Title = string.format('Join %s', gameName),
        Desc = string.format('Join Game ID %s', gameId),
    })
    
    tab:Button({
        Callback = function() end,
        Title = 'Rejoin Server',
        Desc = 'Rejoin current server',
    })
    
    return tab
end

-- 创建各游戏脚本标签页
CreateGameScriptTab(
    'SCP-Roleplay',
    '5041144419',
    'https://tr.rbxcdn.com/180DAY-1117c66e9250baf84ecf8debcf3a3836/256/256/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'The-Forge',
    '76558904092080',
    'https://tr.rbxcdn.com/180DAY-e6ba7011fa99665f1d1dbb9e675d8466/512/512/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'Naramo-Nuclear-Plant-V2',
    '98626216952426',
    'https://tr.rbxcdn.com/180DAY-b4ff23dd082770983f867452ecc48d5e/256/256/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'War-Tycoon',
    '4639625707',
    'https://tr.rbxcdn.com/180DAY-a848e9d3336f59075c6062d832f77515/512/512/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'Arsenal',
    '286090429',
    'https://tr.rbxcdn.com/180DAY-15a02279fcaaae8b498cd6adc250aca9/512/512/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'Fisch',
    '16732694052',
    'https://tr.rbxcdn.com/180DAY-ea85cd5d279b2c56873db02c146d99a6/512/512/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'Blind-Shot',
    '118614517739520',
    'https://tr.rbxcdn.com/180DAY-fa9425031be3d43f8c393da309b61c90/512/512/Image/Webp/noFilter'
)

CreateGameScriptTab(
    'Wanted',
    '14438406081',
    'https://tr.rbxcdn.com/180DAY-e52001faf1e8f5677fe0510e176a1e2f/512/512/Image/Webp/noFilter'
)

-- ========== Other 分类 ==========
local OtherSection = MainWindow:Section({Title = 'Other'})

-- Config Usage 标签页
local ConfigTab = OtherSection:Tab({
    IconColor = Color3.fromHex('#7775F2'),
    Title = 'Config Usage',
    Icon = 'solar:folder-with-files-bold',
})

local ConfigManager = MainWindow.ConfigManager
ConfigTab:Input({
    Callback = function() end,
    Title = 'Config Name',
    Icon = 'file-cog',
})
ConfigTab:Space()

local allConfigs = ConfigManager:AllConfigs()
ConfigTab:Dropdown({
    Title = 'All Configs',
    Value = 'default',
    Values = allConfigs,
    Callback = function() end,
    Desc = 'Select existing configs',
})
ConfigTab:Space()

ConfigTab:Button({
    Callback = function() end,
    Justify = 'Center',
    Title = 'Save Config',
    Icon = '',
})
ConfigTab:Space()

ConfigTab:Button({
    Callback = function() end,
    Justify = 'Center',
    Title = 'Load Config',
    Icon = '',
})

-- Discord 标签页
local DiscordTab = OtherSection:Tab({
    IconColor = ColorBlue,
    Title = 'Discord',
    Icon = 'solar:chat-round-bold',
})

pcall(function()
    local inviteData = HttpService:JSONDecode(
        CatKingHub.Creator.Request({
            Url = 'https://discord.com/api/v10/invites/vYTxSSRmTS?with_counts=true&with_expiration=true',
            Method = 'GET',
            Headers = {
                ['User-Agent'] = 'WindUI/Example',
                Accept = 'application/json',
            },
        }).Body
    )
    
    DiscordTab:Section({
        Title = 'Join our Discord server!',
        TextSize = 20,
    })
    
    DiscordTab:Paragraph({
        Image = string.format('https://cdn.discordapp.com/icons/%s/%s.png?size=1024', inviteData.guild.id, inviteData.guild.icon),
        Title = tostring(inviteData.guild.name),
        Buttons = {
            {
                Callback = function() end,
                Title = 'Copy link',
                Icon = 'link',
            },
        },
        ImageSize = 48,
        Thumbnail = 'https://cdn.discordapp.com/banners/1300692552005189632/35981388401406a4b7dffd6f447a64c4.png?size=512',
        Desc = tostring(inviteData.guild.description),
    })
end)

-- Donate 标签页
local DonateTab = OtherSection:Tab({
    IconColor = Color3.fromHex('#EF4F1D'),
    Title = 'Donate',
    Icon = 'solar:heart-bold',
})

DonateTab:Paragraph({
    Title = 'Hi !',
    Desc = "If you'd like to support me, you can choose to make a donation. Thank you so much for your support.",
})
DonateTab:Button({
    Callback = function() end,
    Title = 'Donate',
    Desc = 'Support us by donating!',
})

-- ========== Music 分类 ==========
local MusicSection = MainWindow:Section({Title = 'Music'})
local MusicTab = MusicSection:Tab({
    IconColor = Color3.fromHex('#10C550'),
    Title = 'Music',
    Icon = 'solar:music-note-bold',
})

MusicTab:Button({
    Callback = function() end,
    Title = 'Play Music',
    Icon = 'play',
})
MusicTab:Button({
    Callback = function() end,
    Title = 'Stop Music',
    Icon = 'stop',
})

MusicTab:Slider({
    Title = 'Volume',
    Value = {Min = 0, Default = 1, Max = 10},
    Callback = function() end,
    Icon = 'volume-2',
    Step = 0.5,
})

MusicTab:Slider({
    Title = 'Progress',
    Value = {Min = 0, Default = 0, Max = 100},
    Callback = function() end,
    Icon = 'fast-forward',
    Step = 1,
})

MusicTab:Toggle({
    Callback = function() end,
    Title = 'Rainbow Visualizer',
    Desc = 'Show music rhythm bar',
})
MusicTab:Space()

MusicTab:Dropdown({
    Callback = function() end,
    Values = {'Phone Kisses', '鳥の詩(Tori no Uta)', 'Flower Dance', 'Baby don\'t Cry'},
    Title = 'Select Song',
    Desc = 'Choose a song to play',
})

-- ========== 服务连接 ==========
RunService.Stepped:Connect(function() end)
UserInputService.JumpRequest:Connect(function() end)

-- 角色加载监控（修复无限循环）
task.spawn(function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    while not character:FindFirstChild('Humanoid') do
        task.wait(0.1)
    end
end)
