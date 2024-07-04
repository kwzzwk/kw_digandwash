local function PlayerIdentifiers(source)
    local identifiers = {
        steamid = false,
        license = false,
        discord = false,
        ip = false
    }

    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifiers.steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            identifiers.license = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            identifiers.ip = v:gsub('ip:', '')
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifiers.discord = v
        end
    end

    return identifiers
end

lib.callback.register('kw:digandwash:GiveSand', function(source, DataGround)
    if DataGround then 
        local identifiers = PlayerIdentifiers(source)
        local modColor = 4521984
        local information = "Player wasn't on allowed digging zone, and tried to get reward. \nPlayer can be a modder!"
        local identifiersLog = string.format(
            "Steam ID: %s\nLicense: %s\nDiscord: %s\nIP Address: %s",
            identifiers.steamid or "N/A",
            identifiers.license or "N/A",
            '<@' .. (identifiers.discord and identifiers.discord:gsub('discord:', '') or 'N/A') .. '>',
            identifiers.ip or "N/A"
        )
        WebhookLog(modColor, information, identifiersLog)
    else
        local chanceTotal = 0
        for _, itemData in ipairs(Config.Dig) do
            chanceTotal = chanceTotal + itemData.chance
        end

        local chanceRandom = math.random(1, chanceTotal)
        local itemSelected
        local chance = 0
        for _, itemData in ipairs(Config.Dig) do 
            chance = chance + itemData.chance
            if chanceRandom <= chance then 
                itemSelected = itemData 
                break
            end
        end

        if itemSelected then
            local itemAmount = math.random(itemSelected.minAmount, itemSelected.maxAmount)
            exports.ox_inventory:AddItem(source, itemSelected.item, itemAmount)

            local identifiers = PlayerIdentifiers(source)
            local logColor = 65280
            local information = string.format('Player digged and got %s x %s', itemSelected.item, itemAmount)
            local identifiersLog = string.format(
                "Steam ID: %s\nLicense: %s\nDiscord: %s\nIP Address: %s",
                identifiers.steamid or "N/A",
                identifiers.license or "N/A",
                '<@' .. (identifiers.discord and identifiers.discord:gsub('discord:', '') or 'N/A') .. '>',
                identifiers.ip or "N/A"
            )
            WebhookLog(logColor, information, identifiersLog)
        end
    end
end)

lib.callback.register('kw:digandwash:reward', function(source, data)
    if not data then 
        local identifiers = PlayerIdentifiers(source)
        local modColor = 4521984
        local information = "Player wasn't in water, and tried to get reward. \nPlayer can be a modder!"
        local identifiersLog = string.format(
            "Steam ID: %s\nLicense: %s\nDiscord: %s\nIP Address: %s",
            identifiers.steamid or "N/A",
            identifiers.license or "N/A",
            '<@' .. (identifiers.discord and identifiers.discord:gsub('discord:', '') or 'N/A') .. '>',
            identifiers.ip or "N/A"
        )
        WebhookLog(modColor, information, identifiersLog)
    else
        local chanceTotal = 0
        for _, itemData in ipairs(Config.items) do
            chanceTotal = chanceTotal + itemData.chance
        end

        local chanceRandom = math.random(1, chanceTotal)
        local itemSelected
        local chance = 0
        for _, itemData in ipairs(Config.items) do 
            chance = chance + itemData.chance
            if chanceRandom <= chance then 
                itemSelected = itemData 
                break
            end
        end

        if itemSelected then
            local itemAmount = math.random(itemSelected.minAmount, itemSelected.maxAmount)
            exports.ox_inventory:AddItem(source, itemSelected.item, itemAmount)
            exports.ox_inventory:RemoveItem(source, Config.WantedItem.item, 1, nil, nil, true)

            local identifiers = PlayerIdentifiers(source)
            local logColor = 65280
            local information = string.format('Player cleaned sand and received %s x %s', itemSelected.item, itemAmount)
            local identifiersLog = string.format(
                "Steam ID: %s\nLicense: %s\nDiscord: %s\nIP Address: %s",
                identifiers.steamid or "N/A",
                identifiers.license or "N/A",
                '<@' .. (identifiers.discord and identifiers.discord:gsub('discord:', '') or 'N/A') .. '>',
                identifiers.ip or "N/A"
            )
            WebhookLog(logColor, information, identifiersLog)
        end
    end
end)


function WebhookLog(LogColor, information, identifiers)
    local discordWebhookUrl = ""
    local embeds = {
        {
            ["color"] = LogColor,
            ["title"] = 'KW DIGANDWASH AGENT',
            ["fields"] = {
                {
                    ["name"] = 'Info',
                    ["value"] = information,
                },
                {
                    ["name"] = 'Player data:',
                    ["value"] = identifiers,
                },
            }
        }
    }

    PerformHttpRequest(discordWebhookUrl, function(err, text, headers) end, 'POST', json.encode({username = "KW DIGANDWASH", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
