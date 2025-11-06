5237267
    Title = "神秘脚本"538237268235265252-- 创建UI按钮，点击它即可加载并执行脚本
Tabs.ForestNight:Button({
    Title = "H4X(汉化)",
    Desc = "
    Locked = false,
    Callback = function()
        pcall(func22852
            print("H4x汉化脚本开始加载...")
            
            -- 定义自动执行函数
            local function startAutoLogic()
                _G.Auto = true -- 设置自动开
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                -- 请再次确认这个RemoteEvent的路径是否正确
                local Event = ReplicatedStorage.RemoteEvents.CarnivalCompleteShootingGallery

                local function findTargets(parent, depth)
                    if depth > 3 then return {} end
                    local targets = {}
                    for _, child in ipairs(parent:GetChildren()) do
                        if child:IsA("BasePart") then
                            table.insert(targets, child)
                        end
                        for _, subTarget in ipairs(findTargets(child, depth + 1)) do
                            table.insert(targets, subTarget)
                        end
                    end
                    return targets
                end

                -- 使用spawn创建一个独立的协程来运行循环，避免阻塞UI
                spawn(function()
                    while task.wait(3) and _G.Auto do -- 循环条件包含_G.Auto，方便后续停止
                        local targets = {}
                        local areas = {workspace.Map, workspace.Items, workspace.Characters}
                        
                        for _, area in ipairs(areas) do
                            for _, target in ipairs(findTargets(area, 0)) do
                                table.insert(targets, target)
                            end
                        end
                        
                        for index, target in ipairs(targets) do
                            if not _G.Auto then break end -- 每次循环前再次检查开关
                            
                            local success = pcall(function()
                                Event:FireServer(target)
                            end)
                            if not success then
                                -- 如果发送事件失败，可以记录日志（可选）
                                -- warn("向目标发送事件失败: " .. tostring(target))
                            end
                            task.wait(0.05)
                        end
                    end
                    print("H4x脚本自动逻辑已停止。")
                end)
            end

            -- 调用函数，启动自动逻辑
            startAutoLogic()
            print("H4x汉化脚本加载并启动成功！")
            
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
            print("H4x汉化加载成功")
        end)
    end
})
-- 创建UI按钮，点击它即可加载并执行脚本
Tabs.ForestNight:Button({
    Title = "H4X(汉化)",
    Desc = "点击加载并执行H4X脚本",
    Locked = false,
    Callback = function()
        pcall(function()
            print("H4x汉化脚本开始加载...")
            
            -- 定义自动执行函数
            local function startAutoLogic()
                _G.Auto = true -- 设置自动开关为开启

                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                -- 请再次确认这个RemoteEvent的路径是否正确
                local Event = ReplicatedStorage.RemoteEvents.CarnivalCompleteShootingGallery

                local function findTargets(parent, depth)
                    if depth > 3 then return {} end
                    local targets = {}
                    for _, child in ipairs(parent:GetChildren()) do
                        if child:IsA("BasePart") then
                            table.insert(targets, child)
                        end
                        for _, subTarget in ipairs(findTargets(child, depth + 1)) do
                            table.insert(targets, subTarget)
                        end
                    end
                    return targets
                end

                -- 使用spawn创建一个独立的协程来运行循环，避免阻塞UI
                spawn(function()
                    while task.wait(3) and _G.Auto do -- 循环条件包含_G.Auto，方便后续停止
                        local targets = {}
                        local areas = {workspace.Map, workspace.Items, workspace.Characters}
                        
                        for _, area in ipairs(areas) do
                            for _, target in ipairs(findTargets(area, 0)) do
                                table.insert(targets, target)
                            end
                        end
                        
                        for index, target in ipairs(targets) do
                            if not _G.Auto then break end -- 每次循环前再次检查开关
                            
                            local success = pcall(function()
                                Event:FireServer(target)
                            end)
                            if not success then
                                -- 如果发送事件失败，可以记录日志（可选）
                                -- warn("向目标发送事件失败: " .. tostring(target))
                            end
                            task.wait(0.05)
                        end
                    end
                    print("H4x脚本自动逻辑已停止。")
                end)
            end

            -- 调用函数，启动自动逻辑
            startAutoLogic()
            print("H4x汉化脚本加载并启动成功！")
            
        end)
    end
})
_G.Auto = true --true or false



local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Event = ReplicatedStorage.RemoteEvents.CarnivalCompleteShootingGallery



local function findTargets(parent, depth)

    if depth > 3 then return {} end

    

    local targets = {}

    

    for _, child in ipairs(parent:GetChildren()) do

        if child:IsA("BasePart") then

            table.insert(targets, child)

        end

        

        for _, subTarget in ipairs(findTargets(child, depth + 1)) do

            table.insert(targets, subTarget)

        end

    end

    

    return targets

end



spawn(function()

    while task.wait(3) do

    

        local targets = {}

        local areas = {

            workspace.Map,

            workspace.Items, 

            workspace.Characters

        }

        

        for _, area in ipairs(areas) do

            for _, target in ipairs(findTargets(area, 0)) do

                table.insert(targets, target)

            end

        end

        

        for index, target in ipairs(targets) do

            if not _G.Auto then break end

            

            local success = pcall(function()

                Event:FireServer(target)

            end)

            task.wait(0.05)

        end

    end

end)
