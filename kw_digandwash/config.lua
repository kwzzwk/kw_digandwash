Config = {}

Config.WantedItem = { 
    item = 'sand', count = 1
}

Config.items = {
    {item = 'money', minAmount = 245, maxAmount = 580, chance = 70},
    {item = 'weapon_pistol', minAmount = 1, maxAmount = 1, chance = 10},
}

Config.Dig = {
    {item = 'sand', minAmount = 1, maxAmount = 3, chance = 100},
}

Config.NotInWaterNotify = {
    title = 'Error!',
    description = 'You can\'t use pan here, you are not in water!',
    type = 'error',
}

Config.SwimmingNotify = {
    title = 'Error!',
    description = 'You can\'t use pan if you are swimming!',
    type = 'error',
}
Config.WantedItemNotify = {
    title = 'Error!',
    description = string.format('You don\'t have enough sand, you need %sx %s', Config.WantedItem.count, Config.WantedItem.item),
    type = 'error',
}
Config.ProgressCircle = {
    duration = 10000,
    position = 'bottom',
    useWhileDead = false, 
    canCancel = true,
    car = true, 
    move = false,
    scenario = 'WORLD_HUMAN_BUM_WASH',
    model = 'bkr_prop_coke_metalbowl_02',
    pos = vec3(0.129, 0.14, 0.13),
    rot = vec3(270.0, 90.0, 100.0),
}


Config.NoDigNotify = {
    title = 'Error!',
    description = 'You can\'t shovel here, change your location!',
    type = 'error',
}
Config.DigProgressCircle = {
    duration = 10000,
    position = 'bottom',
    useWhileDead = false, 
    canCancel = true,
    car = true, 
    move = true,
    dict = 'random@burial',
    clip = 'a_burial',
    model = 'prop_tool_shovel',
    bone = 28422,
    pos = vec3(0.000000, 0.000000, 0.240000),
    rot = vec3(0.000000, 0.000000, 0.000000),
}