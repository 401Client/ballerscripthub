--[[

██████╗░░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░  ░██████╗░█████╗░██╗██████╗░██████╗░████████╗
██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗  ██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚══██╔══╝
██████╦╝███████║██║░░░░░██║░░░░░█████╗░░██████╔╝  ╚█████╗░██║░░╚═╝██║██████╔╝██████╔╝░░░██║░░░
██╔══██╗██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗  ░╚═══██╗██║░░██╗██║██╔═══╝░██╔══██╗░░░██║░░░
██████╦╝██║░░██║███████╗███████╗███████╗██║░░██║  ██████╔╝╚█████╔╝██║██║░░░░░██║░░██║░░░██║░░░
╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░

                            ██╗░░██╗██╗░░░██╗██████╗░
                            ██║░░██║██║░░░██║██╔══██╗
                            ███████║██║░░░██║██████╦╝
                            ██╔══██║██║░░░██║██╔══██╗
                            ██║░░██║╚██████╔╝██████╦╝
                            ╚═╝░░╚═╝░╚═════╝░╚═════╝░
                                 By: notpoiu

    Supported Games:
    [x] Prison Life
    [x] Tower of Hell
    [x] Speedrun 4
    [?] Breadwars
    [x] Doors
]]--



local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Baller Script Hub | "..GameName.." | "..game.Players.localPlayer.DisplayName, IntroIcon="http://www.roblox.com/asset/?id=11151804223",IntroText="baller script hub",HidePremium = false, SaveConfig = true, ConfigFolder = "baller"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer
local KeyChams = {}

function applyChams(obj, objName)

    if not ballerData then
        ballerData = Instance.new("Folder",workspace)
        ballerData.Name = "ballerData"
    end

    if objName == "KeyObtain" then
        -- add a highlight object
        local chamsHighlight = Instance.new("Highlight",ballerData)
        chamsHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        chamsHighlight.Enabled = true
        chamsHighlight.FillColor = Color3.new(0.14902, 0.298039, 0.74902)
        chamsHighlight.FillTransparency = .5
        chamsHighlight.OutlineColor = Color3.new(0.2, 0.388235, 1)
        chamsHighlight.OutlineTransparency = 0
        chamsHighlight.Adornee = obj
        chamsHighlight.Name = "ChamsHighlight"

        table.insert(KeyChams,chamsHighlight)
        
        -- create the text under that displays the object name
        local BillboardGui = Instance.new("BillboardGui",obj)
        local TextLabel = Instance.new("TextLabel",BillboardGui)
        
        -- change the property of the billboard gui
        BillboardGui.Name = "ballerScriptGui"
        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        BillboardGui.Active = true
        BillboardGui.AlwaysOnTop = true
        BillboardGui.LightInfluence = 1
        BillboardGui.Size = UDim2.new(3, 0, 0.9, 0)
        BillboardGui.SizeOffset = Vector2.new(0, -1.5)
        
        table.insert(KeyChams,BillboardGui)

        -- change the property of the text inside that gui
        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Font = Enum.Font.Arial
        TextLabel.Text = objName
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextScaled = true
        TextLabel.TextSize = 14
        TextLabel.TextWrapped = true
        
        

    end
    
end



--[ Prison Life ]--
if game.PlaceId == 155615604 then

    -- Values
    _G.superP = false
    _G.kAll = false

    -- function
    function delDoors()
        Workspace.Prison_Cellblock.doors:Destroy()
			
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "Doors" then
                v:Destroy()
            end
        end
    end

    

    function getGun(Value)
        local tooltipModule = require(game:GetService("ReplicatedStorage").Modules_client:WaitForChild("TooltipModule"));
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Prison_ITEMS.giver[Value].ITEMPICKUP.CFrame
        wait(.2)
        local gunRemote = workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Value].ITEMPICKUP)
        
        if gunRemote then
            tooltipModule.update(gunRemote)
        end

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
    end

    function arrestAll()
        wait(0.1)
        Player = game.Players.LocalPlayer
        Pcf = Player.Character.HumanoidRootPart.CFrame

        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
            if v.Name ~= Player.Name then
                local i = 10
                repeat
                    wait()
                    i = i-1
                    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                until i == 0
            end
        end
        
    end

    function kill(a)
        local A_1 =
        {
        [1] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
        ["Distance"] = 3.2524313926697,
        ["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
        ["Hit"] = a.Character.Head
        },
          [2] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
        ["Distance"] = 3.2699294090271,
        ["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
        ["Hit"] = a.Character.Head
        },
        [3] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
        ["Distance"] = 3.1665518283844,
        ["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
        ["Hit"] = a.Character.Head
        },
        [4] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
        ["Distance"] = 3.3218522071838,
        ["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
        ["Hit"] = a.Character.Head
        },
        [5] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
        ["Distance"] = 3.222757101059,
        ["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
        ["Hit"] = a.Character.Head
        }
        }
        local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
        local Event = game:GetService("ReplicatedStorage").ShootEvent
        Event:FireServer(A_1, A_2)
        Event:FireServer(A_1, A_2)
    end

    function punch()
        cooldown = true
        local part = Instance.new("Part", game.Players.LocalPlayer.Character)
        part.Transparency = 1
        part.Size = Vector3.new(5, 2, 3)
        part.CanCollide = false
        local w1 = Instance.new("Weld", part)
        w1.Part0 = game.Players.LocalPlayer.Character.Torso
        w1.Part1 = part
        w1.C1 = CFrame.new(0,0,2)

        part.Touched:connect(function(hit)
            if game.Players:FindFirstChild(hit.Parent.Name) and _G.superP == true then
            
                local plr = game.Players:FindFirstChild(hit.Parent.Name)
            
                if plr.Name ~= game.Players.LocalPlayer.Name then
                    part:Destroy()
                end

                for i = 1,100 do
                    game:GetService("ReplicatedStorage").meleeEvent:FireServer(plr)
                end
            end

            wait(1)
            cooldown = false
            part:Destroy()
        end)
        
    end

    function killHacker(player)
        
    end

    function superPunch()
        mouse = game.Players.LocalPlayer:GetMouse()

        punching = false
        cooldown = false

        

        mouse.KeyDown:connect(function(key)
            if cooldown == false then
                if key:lower() == "f" and _G.superP == true then
                    punch()
                end
            end
        end)
    end

    -- Tabs
    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    local CombatTab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://12009773169",
        PremiumOnly = false
    })
    
    -- Sections
    local ItemSection = PlayerTab:AddSection({
        Name = "Items"
    })

    local UtilitySection = PlayerTab:AddSection({
        Name = "Utility"
    })

    local MiscSection = PlayerTab:AddSection({
        Name = "Misc"
    })

    CombatTab:AddToggle({
        Name = "Super Punch",
        Default = false,
        Callback = function(Value)
            _G.superP = Value
            superPunch()
        end
    })

    CombatTab:AddButton({
        Name = "Kill All",
        Default = false,
        Callback = function()

            workspace.Remote.TeamEvent:FireServer("Medium stone grey")
            game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
            wait(0.5)

            for i,v in pairs(game.Players:GetChildren())do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    kill(v)
                end
            end
            wait(1)
            workspace.Remote.TeamEvent:FireServer("Bright orange")

        end
    })
    --[[
    CombatTab:AddToggle({
        Name = "Kill hackcar",
        Default = false,
        Callback = function(Value)
            _G.hackCar = Value
            --killHacker(game:GetService("Players").Vicentecanta)
        end
    })]]--


    UtilitySection:AddButton({
        Name = "Arrest All",
        Callback = function()
            arrestAll()
        end
    })

    UtilitySection:AddButton({
        Name = "Admin Cmds",
        Callback = function()
            loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"))()
        end
    })

    UtilitySection:AddButton({
        Name = "Delete Doors",
        Callback = function()
            delDoors()
        end
    })

    UtilitySection:AddSlider({
        Name = "WalkSpeed",
        Min = 16,
        Max = 200,
        Default = 16,
        Color = Color3.fromRGB(196, 70, 51),
        Increment = 1,
        ValueName = "ws",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end    
    })

    UtilitySection:AddSlider({
        Name = "JumpPower",
        Min = 50,
        Max = 200,
        Default = 50,
        Color = Color3.fromRGB(196, 70, 51),
        Increment = 1,
        ValueName = "jp",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end    
    })

    ItemSection:AddDropdown({
        Name = "Gun Selection",
        Default = "M9",
        Options = {"M9", "Remington 870","M4A1","AK-47"},
        Callback = function(Value)
            getGun(Value)
        end
    })

    MiscSection:AddDropdown({
        Name = "Change Teams",
        Default = "Inmates",
        Options = {"Inmates", "Neutral","Criminals","Guards"},
        Callback = function(Value)
            game.Players.LocalPlayer.TeamColor = game:GetService("Teams"):FindFirstChild(Value).TeamColor
        end
    })

end

-- Bee swarm
if game.PlaceId == 1537690962 then

    function makeHoney()
        pauseTP = true

        local lastPlayerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        -- Get the Hive property from the LocalPlayer's Honeycomb object
        local playerHive = game.Players.LocalPlayer.Honeycomb.Value

        -- Loop through all the HivePlatform models in the Workspace
        for _, platform in pairs(game.Workspace.HivePlatforms:GetChildren()) do
            -- Check if the Hive property of the platform is equal to the player's Hive
            if platform.Hive.Value == playerHive then
                -- Get the CFrame of the "circle" part
                local circleCFrame = platform.Circle.CFrame
                
                -- Set the player's humanoid root part's CFrame to the CFrame of the "circle" part
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = circleCFrame
                game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")

                repeat
                    wait()
                until game.Players.LocalPlayer.CoreStats.Pollen.Value == 0
                pauseTP = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastPlayerPos
            end
        end
    end

    local pauseTP = false

    local tool

    -- Function to find and store the player's tool
    function findTool()
        -- Check if the tool variable is already set
        if not tool then
            -- Loop through the player's Character's children
            for _, child in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                -- Check if the child is a Tool instance
                if child:IsA("Tool") then
                    -- Set the tool variable to the found Tool instance
                    tool = child
                    break
                end
            end
        end
    end


    function annoy(player)

        while _G.annoy == true do


            if game.Players.LocalPlayer.CoreStats.Pollen.Value == game.Players.LocalPlayer.CoreStats.Capacity.Value then
                makeHoney()
            end
            
            --[[f pauseTP == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            end]]

            findTool()
            tool.ClickEvent:FireServer()
            wait()

        end

    end

    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    PlayerTab:AddToggle({
        Name = "Annoy maged",
        Default = false,
        Callback = function(Value)
            _G.annoy = Value
            annoy(game.Players.notpoiu_1)
        end
    })

end

-- [Tower of Hell] --
if game.PlaceId == 1962086868 then

    -- values
    
    -- functions
    function delAnticheese()
        -- get all of the code used in every localscript on roblox
        local reg = getreg()
        
        -- for each function get their information and if they contain a kick command
        for i, Function in next, reg do
            if type(Function) == 'function' then
                local info = getinfo(Function)
    
                if info.name == 'kick' then
                    -- replace the function with a function thats empty
                    if (hookfunction(info.func, function(...)end)) then
                        print('succesfully hooked kick')
                    else
                        OrionLib:MakeNotification({
                            Name = "Baller Script Hub",
                            Content = "baller script hub failed to hook kick :(",
                            Image = "rbxassetid://4871684504",
                            Time = 5
                        })
                    end
                end
            end
        end

        -- disable the scripts then delete them

        local playerscripts = game:GetService('Players').LocalPlayer.PlayerScripts
    
        local script1 = playerscripts.LocalScript
        local script2 = playerscripts.LocalScript2
    
        local script1signal = script1.Changed
        local script2signal = script2.Changed
    
        for i, connection in next, getconnections(script1signal) do
            connection:Disable()
        end
        for i, connection in next, getconnections(script2signal) do
            connection:Disable()
        end
    
        script1:Destroy()
        script2:Destroy()

    end

    function tp2end()
        local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame
 
        local player = game.Players.LocalPlayer.Character
        player.HumanoidRootPart.CFrame = endzone
    end

    function getLocalPlrTools()
        for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if e:IsA("Tool") then
                e:Destroy()
            end
        end
        wait() 
        for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
            if v:IsA("Tool") then
                local CloneThings = v:Clone()
                wait()
                CloneThings.Parent = game.Players.LocalPlayer.Backpack
    
            end
        end
        
    end

    -- tabs
    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    -- sections
    local ExploitsSection = PlayerTab:AddSection({
        Name = "Exploits"
    })
    local UtilitySection = PlayerTab:AddSection({
        Name = "Utility"
    })

    -- buttons
    ExploitsSection:AddButton({
        Name = "Bypass Anticheat",
        Callback = function()
            delAnticheese()
                
            OrionLib:MakeNotification({
                Name = "Baller Script Hub",
                Content = "baller script hub has successfully bypassed toh anticheese feel free to use any scripts now :)",
                Image = "rbxassetid://4871684504",
                Time = 5
            })
        end
    })

    UtilitySection:AddButton({
        Name = "Goto end",
        Callback = function()
            tp2end()
        end
    })

    UtilitySection:AddButton({
        Name = "Get All Tools",
        Callback = function()
            getLocalPlrTools()
        end
    })

    UtilitySection:AddSlider({
        Name = "WalkSpeed",
        Min = 16,
        Max = 200,
        Default = 16,
        Color = Color3.fromRGB(196, 70, 51),
        Increment = 1,
        ValueName = "ws",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end    
    })

    UtilitySection:AddSlider({
        Name = "JumpPower",
        Min = 50,
        Max = 200,
        Default = 50,
        Color = Color3.fromRGB(196, 70, 51),
        Increment = 1,
        ValueName = "jp",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end    
    })

    UtilitySection:AddButton({
        Name = "Admin Cmds",
        Callback = function()
            loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"))()
        end
    })

end

-- [Speedrun 4] --
if game.PlaceId == 183364845 then
    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    local FarmTab = Window:MakeTab({
        Name = "Farm",
        Icon = "rbxassetid://6433106861",
        PremiumOnly = false
    })

    -- sections
    local ExploitsSection = PlayerTab:AddSection({
        Name = "Exploits"
    })

    ExploitsSection:AddButton({
        Name = "Skip Current Level",
        Callback = function()
            if game:GetService("Players").LocalPlayer.Team.Name == "Winners" then
                game:GetService("ReplicatedStorage").SetLevel:FireServer(0)
            else
                game:GetService("ReplicatedStorage").BeatLevel:FireServer(24.474801540374756,game.Players.LocalPlayer.Team.Name,"Normal",true)
            end
        end
    })

    FarmTab:AddToggle({
        Name = "Farm Gems",
        Default = false,
        Callback = function(Value)
            while Value == true do
                wait(0.1)
                if game:GetService("Players").LocalPlayer.Team.Name == "Winners" then
                    game:GetService("ReplicatedStorage").SetLevel:FireServer(0)
                else
                    game:GetService("ReplicatedStorage").BeatLevel:FireServer(24.474801540374756,game.Players.LocalPlayer.Team.Name,"Normal",true)
                end
            end
        end
    })


end


-- [rawblocc bedraws] --
if game.PlaceId == 6872265039 or game.PlaceId == 8560631822 or game.PlaceId == 8444591321 then

    local CombatTab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://12009773169",
        PremiumOnly = false
    })

    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    local MovementTab = Window:MakeTab({
        Name = "Movement",
        Icon = "rbxassetid://9525535512",
        PremiumOnly = false
    })

    local RenderTab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://284663799",
        PremiumOnly = false
    })

end

-- Ecka Clash
if game.PlaceId == 12322240640 then

    local CombatTab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://12009773169",
        PremiumOnly = false
    })

    local ExploitsSection = CombatTab:AddSection({
        Name = "Exploits"
    })

    ExploitsSection:AddButton({
        Name = "Kill All",
        Callback = function()
            for i, player in ipairs(game.Players:GetPlayers()) do
                if not (player.Name == game.Players.LocalPlayer.Name) then
                    game.Players.LocalPlayer.Backpack["M4A1"].Resource.Events.DamageEvent:FireServer(player.Character.Humanoid,300)       
                end
            end
        end
    })
    

end

-- Doors
if game.PlaceId == 6839171747 then

    local ballerData = workspace:FindFirstChild("ballerData")
    local prevKeyEsp = nil
    local prevRoomNum = replicatedStorage.GameData.LatestRoom.Value

    -- values
    _G.esp = true

    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://2795572800",
        PremiumOnly = false
    })

    local MovementTab = Window:MakeTab({
        Name = "Movement",
        Icon = "rbxassetid://9525535512",
        PremiumOnly = false
    })

    local RenderTab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://284663799",
        PremiumOnly = false
    })

    -- Sections
    local EspSection = RenderTab:AddSection({
        Name = "ESP"
    })

    local UtilitySection = PlayerTab:AddSection({
        Name = "Utility"
    })

    local MiscSection = PlayerTab:AddSection({
        Name = "Misc"
    })
    

    

    EspSection:AddToggle({
        Name = "Key Esp",
        Default = false,
        Flag = "KeyToggle",
        Save = true,
        Callback = function(Value)
            local ballerData = workspace:FindFirstChild("ballerData")

            while Value do
                for i,v in ipairs(workspace.CurrentRooms[replicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do

                    if not ballerData and replicatedStorage.GameData.LatestRoom.Value == 0 then
                        applyChams(workspace.CurrentRooms[replicatedStorage.GameData.LatestRoom.Value].Assets.KeyObtain,"KeyObtain")
                    end

                    for i,ballerHighlight in ipairs(ballerData:GetDescendants()) do
                        if ballerHighlight:IsA("Highlight") then
                            if v.Name == "KeyObtain" and not (ballerHighlight.Adornee == v or v:FindFirstChild("ballerScriptGui")) then
                                applyChams(v,"KeyObtain")
                            end
                        end
                    end
                end

                for i,v in pairs(KeyChams) do
                    v.Enabled = Value
                end

            end
            
        end
    })

    UtilitySection:AddToggle({
        Name = "Instant Interact",
        Default = false,
        Save = true,
        Callback = function(Value)
            game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
                if Value == true then
                    fireproximityprompt(prompt)
                end
            end)
        end
    })

end


-- Global Settings
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://8285095937",
    PremiumOnly = false
})

-- Global functions
function antiAeafka(isEnabled)
    if isEnabled == true then
        local vu = game:GetService("VirtualUser")

        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end

SettingsTab:AddButton({
	Name = "Self Destruct",
	Callback = function()
		OrionLib:Destroy()
	end
})

SettingsTab:AddToggle({
	Name = "FullBright",
    Default = false,
	Callback = function(Value)
		local Light = game:GetService("Lighting")

        function dofullbright()
            Light.Ambient = Color3.new(1, 1, 1)
            Light.ColorShift_Bottom = Color3.new(1, 1, 1)
            Light.ColorShift_Top = Color3.new(1, 1, 1)
        end
        if Value == true then
            dofullbright()
            Light.LightingChanged:Connect(dofullbright)
        end
	end
})

SettingsTab:AddToggle({
	Name = "AntiAFK",
    Default = false,
	Callback = function(Value)
		antiAeafka(Value)
	end
})

-- Game Specific Settings
-- [Prison Life] --
if game.PlaceId == 155615604 then
    SettingsTab:AddButton({
        Name = "Remove Shade",
        Callback = function()
            game.Players.localPlayer.PlayerGui.Home.fadeFrame:Destroy()
        end
    })
end



OrionLib:Init()
