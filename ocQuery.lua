if game.PlaceId == 2913303231 then
    local uis = game:GetService("UserInputService")
    function isArceus()
        local mobileDevice
        local noConcatOperators
       
        local kbe = uis.KeyboardEnabled
        local te = uis.TouchEnabled
        if kbe == false and te == false then
            mobileDevice = true
        end
        local succ,err = pcall(function()
            loadstring("local x = '';x ..= 'a'")()
        end)
        if not succ then
            noConcatOperators = true
        end
        if mobileDevice and noConcatOperators then
            return true
        else
            return false
        end
    end
    
    function checkExploit()
        if EVON_LOADED or isArceus() then
            game:Shutdown()
            while true do end
        elseif is_syn_closure or syn then
            return "Synapse X"
        elseif is_fluxus_closure then
            return "Fluxus"
        elseif identifyexecutor() == "ScriptWare" then
            return "Script-Ware"
        elseif is_krnl_closure or KRNL_LOADED then
            return "Krnl"
        elseif OXYGEN_LOADED then
            return "Oxygen U"
        elseif IsElectron or is_electron_closure then
            return "Electron"
        elseif jit then
            return "EasyExploit"
        elseif WrapGlobal then
            return "WeAreDevs"
        elseif is_sirhurt_closure then
            return "SirHurt"
        elseif pebc_execute or is_sentinel_closure then
            return "Sentinel"
        elseif is_proto_closure or secure_load then
            return "Protosmasher"
        elseif is_elysian_closure then
            return "Elysian"
        else
            return "Unknown"
        end
    
    end
    
    
    local colors = {
        ['error'] = Color3.fromRGB(255, 64, 64),
        ['warning'] = Color3.new(1, 0.752941, 0.074509),
        ['success'] = Color3.fromRGB(81, 180, 0),
        ['info'] = Color3.fromRGB(71, 181, 255)
    }
    
    function strtobool(str)
        if str == "true" then
            return true
        elseif str == "false" then
            return false
        end
    end
    
    owner = game.Players.LocalPlayer
    ext, advanced, moderation, global, preferences = {}, {}, {}, {}, {}
    
    function moderation.kick(player)
        game:GetService("ReplicatedStorage").Events.KickPlayer:FireServer(
            player
        )
    end
    
    function moderation.ban(player, isbanned)
        game:GetService("ReplicatedStorage").Events.ChangeWhitelists:FireServer(
            "Banned",
            player,
            isbanned
        )
    end
    
    function moderation.edit(player, isedit)
        game:GetService("ReplicatedStorage").Events.ChangeWhitelists:FireServer(
            "Whitelist",
            player,
            isedit
        )
    end
    
    function advanced.floor(option, value)
        if option:lower() == "collide" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedTools:InvokeServer("Floor", "CanCollide", strtobool(value))
        elseif option:lower() == "color" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Floor", "Color", value)
        elseif option:lower() == "material" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Floor", "Material", value)
        elseif option:lower() == "opacity" or option:lower() == "transparency" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedTools:InvokeServer("Floor", "Transparency", tonumber(value))
        end
    end
    
    function advanced.filter(option)
        if option:lower() == "b&w" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "LightingEffect", "B&W")
        elseif option:lower() == "dark" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "LightingEffect", "Dark")
        elseif option:lower() == "contrast" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "LightingEffect", "Contrast")
        elseif option:lower() == "none" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "LightingEffect", "None")
        end
    end
    
    function advanced.depth(option, value)
        if option:lower() == "depth_enabled" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "ForceDepth", strtobool(value))
        elseif option:lower() == "depth_dist" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "DepthDist", tonumber(value))
        end
    end
    
    function advanced.fog(option, value)
        if option:lower() == "end" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "FogDist", tonumber(value))
        elseif option:lower() == "color" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "FogColor", value)
        end
    end
    
    function advanced.time(option, value)
        if option:lower() == "time_enabled" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "ForceTime", strtobool(value))
        elseif option:lower() == "time" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Lighting", "ClockTime", tonumber(value))
        end
    end
    
    function advanced.extra(option, value)
        if option:lower() == "music" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Extras", "MusicId", tonumber(value))
        elseif option:lower() == "gravity" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Extras", "Gravity", tonumber(value))
        end
    end
    
    function advanced.sky(option, value)
        if option:lower() == "skybox" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "Skybox", value)
        elseif option:lower() == "celestial" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "BodiesShown", strtobool(value))
        elseif option:lower() == "clouds" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "CloudsShown", strtobool(value))
        elseif option:lower() == "clouds_cover" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "CloudsCover", tonumber(value))
        elseif option:lower() == "clouds_dens" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "CloudsDensity", tonumber(value))
        elseif option:lower() == "clouds_color" then
            game:GetService("ReplicatedStorage").Events.ChangeAdvancedToolsEvent:FireServer("Sky", "CloudsColor", value)
        end
    end
    
    function advanced.reset()
        game:GetService("ReplicatedStorage").Events.ResetAdvancedTools:InvokeServer()
    end
    
    function global.set(option, value)
        if option:lower() == "sync" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Options", "Sync", strtobool(value))
        elseif option:lower() == "fly" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Options", "Fly", strtobool(value))
        elseif option:lower() == "walkspeed" or option:lower() == "ws" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Avatar", "Walk", tonumber(value))
        elseif option:lower() == "jumppower" or option:lower() == "jp" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Avatar", "Jump", tonumber(value))
        elseif option:lower() == "heal" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Avatar", "Heal", strtobool(value))
        end
    end
    
    function global.lighting(option, value)
        if option:lower() == "amb" or option:lower() == "ambient" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer("Color", "Lighting", "Amb", value)
        elseif option:lower() == "brightness" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Lighting", "Bri", tonumber(value))
        elseif option:lower() == "shadow_softness" or option:lower() == "s_soft" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Lighting", "Sof", tonumber(value))
        elseif option:lower() == "shadow" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer(nil, "Lighting", "Sha", strtobool(value))
        elseif option:lower() == "shift_top" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer("Color", "Lighting", "Top", value)
        elseif option:lower() == "shift_bottom" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer("Color", "Lighting", "Bot", value)
        elseif option:lower() == "o_amb" or option:lower() == "outdoor" or option:lower() == "outdoor_ambient" then
            game:GetService("ReplicatedStorage").Events.UpdateGlobalProperty:FireServer("Color", "Lighting", "Out", value)
        end
    end
    
    function global.reset(option)
        if option:lower() == "lighting" then
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Lighting")
        elseif option:lower() == "options" then
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Options")
        elseif option:lower() == "avatar" then
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Avatar")
        elseif option:lower() == "all" then
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Avatar")
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Options")
            game:GetService("ReplicatedStorage").Events.ResetGlobalPropertyField:FireServer("Lighting")
        end
    end
    
    function preferences.snap(option, value)
        if option:lower() == "move" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("Move", tonumber(value))
        elseif option:lower() == "rot" or option:lower() == "rotate" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("Rotate", tonumber(value))
        end
    end
    
    function preferences.set(option, value)
        local valuebool = strtobool(value)
        local valuenum = tonumber(value)
        if option:lower() == "drag" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("DragEnabled", valuebool)
        elseif option:lower() == "inv_plr" or option:lower() == "invisible_player" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("InvisiblePlayers", valuebool)
        elseif option:lower() == "team_req" or option:lower() == "team_request" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("TeamRequests", valuenum)
        elseif option:lower() == "copyright" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("Copyrighted", valuebool)
        elseif option:lower() == "time" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("DayValue", valuenum)
        elseif option:lower() == "snap_rot" or option:lower() == "snap_rotation" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("SnapRotation", valuebool)
        elseif option:lower() == "god" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("IsGodMode", valuebool)
        elseif option:lower() == "underground" then
            game:GetService("ReplicatedStorage").Events.UpdateSettings:FireServer("MoveUnderground", valuebool)
        end
    end
    
    function ext.output(str, color)
        game.Players.LocalPlayer.PlayerGui.LocalOutput:Fire(str, color)
    end
    
    function ext.cmdNameParam(str, funcparent, func, isactive)
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower() == str:lower() then
                getfenv()[funcparent][func](v.Name, isactive)
                ext.output('Action was successful!', colors['success'])
            elseif v.Name ~= str then
                local length = #str
                local new = string.sub(v.Name, 1, #str)
                if str:lower() == new:lower() then
                    getfenv()[funcparent][func](v.Name, isactive)
                    ext.output('Action was successful!', colors['success'])
                end
            end
        end
    end
    
    function ext.cmdParam(funcparent, func, ...)
        getfenv()[funcparent][func](...)
        ext.output('Action was successful!', colors['success'])
    end
    
    function ext.loadObby(id)
        game:GetService("ReplicatedStorage").Events.LoadObby:InvokeServer(id)
        ext.output('Loaded ' .. id .. '.', colors['success'])
        ext.output('The obby may not load because of loading cooldown.', colors.warning)
    end
    
    function ext.rejoin()
        ext.output('Rejoining...', colors['success'])
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
        ext.output('If it doesn\'t teleport, please rejoin manually instead.', colors.warning)
    end
    
    function ext.init()
        owner.Chatted:Connect(function(msg)
    
            -- Moderation
    
            if string.match(msg, '^/mod kick%s') then
                arg = string.gsub(msg, '^/mod kick%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'kick', true)
            end
    
            if string.match(msg, '^/mod ban%s') then
                arg = string.gsub(msg, '^/mod ban%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'ban', true)
            end
    
            if string.match(msg, '^/mod tempban%s') then
                arg = string.gsub(msg, '^/mod tempban%s', '', 1)
                arg = arg:split(' ')
                local duration, name = arg[1], arg[2]
                temp = ext.cmdNameParam(name, 'moderation', 'ban', true)
                task.wait(duration)
                temp = ext.cmdNameParam(name, 'moderation', 'ban', false)
            end
    
            if string.match(msg, '^/mod unban%s') then
                arg = string.gsub(msg, '^/mod unban%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'ban', false)
            end
    
            if string.match(msg, '^/mod edit%s') then
                arg = string.gsub(msg, '^/mod edit%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'edit', true)
            end
    
            if string.match(msg, '^/mod unedit%s') then
                arg = string.gsub(msg, '^/mod unedit%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'edit', false)
            end
    
            if string.match(msg, '^/mod unedit%s') then
                arg = string.gsub(msg, '^/mod unedit%s', '', 1)
                arg = ext.cmdNameParam(arg, 'moderation', 'edit', false)
            end
    
            -- advanced
    
            if string.match(msg, '^/adv floor%s') then
                arg = string.gsub(msg, '^/adv floor%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                if option == "color" then
                    value = value:split(",")
                    local ct,a,b,c = value[1], value[2], tonumber(value[3]), tonumber(value[4])
                    if ct:lower() == "hex" then
                        value = Color3.fromHex(a)
                    elseif ct:lower() == "rgb" then
                        value = Color3.fromRGB(tonumber(a), b, c)
                    elseif ct:lower() == "new" then
                        value = Color3.new(tonumber(a), b, c)
                    end
                end
                arg = ext.cmdParam('advanced', 'floor', option, value)
            end
    
            if string.match(msg, '^/adv fog%s') then
                arg = string.gsub(msg, '^/adv fog%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                if option == "color" then
                    value = value:split(",")
                    local ct,a,b,c = value[1], value[2], tonumber(value[3]), tonumber(value[4])
                    if ct:lower() == "hex" then
                        value = Color3.fromHex(a)
                    elseif ct:lower() == "rgb" then
                        value = Color3.fromRGB(tonumber(a), b, c)
                    elseif ct:lower() == "new" then
                        value = Color3.new(tonumber(a), b, c)
                    end
                end
                arg = ext.cmdParam('advanced', 'fog', option, value)
            end
    
            if string.match(msg, '^/adv filter%s') then
                arg = string.gsub(msg, '^/adv filter%s', '', 1)
                arg = ext.cmdParam('advanced', 'filter', arg)
            end
    
            if string.match(msg, '^/adv depth%s') then
                arg = string.gsub(msg, '^/adv depth%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('advanced', 'depth', option, value)
            end
    
            if string.match(msg, '^/adv time%s') then
                arg = string.gsub(msg, '^/adv time%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('advanced', 'time', option, value)
            end
    
            if string.match(msg, '^/adv extra%s') then
                arg = string.gsub(msg, '^/adv extra%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('advanced', 'extra', option, value)
            end
    
            if string.match(msg, '^/adv reset') then
                arg = string.gsub(msg, '^/adv reset', '', 1)
                arg = ext.cmdParam('advanced', 'reset')
            end
    
            if string.match(msg, '^/adv sky%s') then
                arg = string.gsub(msg, '^/adv sky%s', '', 1)
                if arg:split(",")[1]:lower() == "skybox" then
                    arg = arg:split(",")
                else
                    arg = arg:split(" ")
                end
                local option, value = arg[1], arg[2]
                if option == "clouds_color" then
                    value = value:split(",")
                    local ct,a,b,c = value[1], value[2], tonumber(value[3]), tonumber(value[4])
                    if ct:lower() == "hex" then
                        value = Color3.fromHex(a)
                    elseif ct:lower() == "rgb" then
                        value = Color3.fromRGB(tonumber(a), b, c)
                    elseif ct:lower() == "new" then
                        value = Color3.new(tonumber(a), b, c)
                    end
                end
                arg = ext.cmdParam('advanced', 'sky', option, value)
            end
    
            if string.match(msg, '^/global%s') then
                arg = string.gsub(msg, '^/global%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('global', 'set', option, value)
            end
    
            if string.match(msg, '^/global lighting%s') then
                arg = string.gsub(msg, '^/global lighting%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                if (option:lower() == "amb" or 
                    option:lower() == "ambient" or
                    option:lower() == "shift_top" or
                    option:lower() == "shift_bottom" or
                    option:lower() == "o_amb" or
                    option:lower() == "outdoor" or
                    option:lower() == "outdoor_ambient")
                then
                    value = value:split(",")
                    local ct,a,b,c = value[1], value[2], tonumber(value[3]), tonumber(value[4])
                    if ct:lower() == "hex" then
                        value = Color3.fromHex(a)
                    elseif ct:lower() == "rgb" then
                        value = Color3.fromRGB(tonumber(a), b, c)
                    elseif ct:lower() == "new" then
                        value = Color3.new(tonumber(a), b, c)
                    end
                end
                arg = ext.cmdParam('global', 'lighting', option, value)
            end
    
            if string.match(msg, '^/global reset%s') then
                arg = string.gsub(msg, '^/global reset%s', '', 1)
                ext.cmdParam('global', 'reset', arg)
            end
    
            if string.match(msg, '^/settings snap%s') then
                arg = string.gsub(msg, '^/settings snap%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('preferences', 'snap', option, value)
                ext.output("Rejoin to take effect. (/rejoin)", colors['warning'])
            end
    
            if string.match(msg, '^/settings%s') then
                arg = string.gsub(msg, '^/settings%s', '', 1)
                arg = arg:split(" ")
                local option, value = arg[1], arg[2]
                arg = ext.cmdParam('preferences', 'set', option, value)
                ext.output("Rejoin to take effect. (/rejoin)", colors['warning'])
            end
    
            -- uncategorized and custom cmds
    
            if string.match(msg, '^/rejoin') then
                ext.rejoin()
            end
    
            if string.match(msg, '^/load%s') then
                arg = string.gsub(msg, '^/load%s', '', 1)
                ext.loadObby(tostring(owner.UserId) .. "#" .. arg)
            end
    
            if string.match(msg, '^/load_id%s') then
                arg = string.gsub(msg, '^/load_id%s', '', 1)
                arg = arg:split("#")
                if tonumber(arg[1]) == nil and typeof(arg[1]) == "string" then
                    local id
                    local s, re = pcall(function()
                        id = game.Players:GetUserIdFromNameAsync(arg[1])
                    end)
                    if s then
                        ext.loadObby(tostring(id) .. "#" .. arg[2])
                    end
                elseif tonumber(arg[1]) ~= nil then
                    ext.loadObby(tostring(arg[1]) .. "#" .. arg[2])
                end
            end
        end)
    end
   
    ext.init()
    ext.output("ocQuery has been loaded.", colors.info)
    ext.output("You're using " .. checkExploit() .. '.', colors.info)
end
