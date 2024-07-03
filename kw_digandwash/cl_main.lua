function Wash()

    if not IsEntityInWater(PlayerPedId(), data) then
        lib.notify({
            title = Config.NotInWaterNotify.title,
            description = Config.NotInWaterNotify.description,
            type = Config.NotInWaterNotify.type,
        })
        return true 
    end

    if IsPedSwimming(PlayerPedId()) then 
        lib.notify({
            title = Config.SwimmingNotify.title,
            description = Config.SwimmingNotify.description,
            type = Config.SwimmingNotify.type,
        })
        return 
    end
    
    local count = exports.ox_inventory:Search('count', Config.WantedItem.item)
    if count < Config.WantedItem.count then
        lib.notify({
            title = Config.WantedItemNotify.title,
            description = Config.WantedItemNotify.description,
            type = Config.WantedItemNotify.type,
        })
    elseif 
        lib.progressCircle({
        duration = Config.ProgressCircle.duration,
        position = Config.ProgressCircle.position,
        useWhileDead = Config.ProgressCircle.useWhileDead,
        canCancel = Config.ProgressCircle.canCancel,
        disable = {
            car = Config.ProgressCircle.car,
            move = Config.ProgressCircle.move,
        },
        anim = {
            scenario = Config.ProgressCircle.scenario,
        },
        prop = {
            model = Config.ProgressCircle.model,
            pos = Config.ProgressCircle.pos,
            rot = Config.ProgressCircle.rot,
        },
    }) then lib.callback.await('kw:digandwash:reward', data) 
        else
    end
end exports('Wash', Wash)

local DigZones = {
    [1333033863] = true,
    [-1885547121] = true,
    [-1907520769] = true,
    [-1595148316] = true,
    [-1286696947] = true,
    [-840216541] = true,
    [1288448767] = true,
    [-1942898710] = true,
    [951832588] = true,
    [-461750719] = true,
    [2409420175] = true, 
    [3833216577] = true,
    [1333033863] = true,
    [4170197704] = true,
    [1109728704] = true,
    [2352068586] = true,
    [581794674] =  true,
    [3008270349] = true,
    [223086562] =  true,
    [3594309083] = true,
    [2461440131] = true,
    [1144315879] = true,
    [2128369009] = true, 
}

function GetGroundHash(ped)
    local posped = GetEntityCoords(ped)
    local num = StartShapeTestCapsule(posped.x,posped.y,posped.z+4,posped.x,posped.y,posped.z-2.0, 2, 1, ped, 7)
    local arg1, arg2, arg3, arg4, arg5 = GetShapeTestResultEx(num)
    return arg5
end

function ShovelSand()
    local hash = GetGroundHash(PlayerPedId(), DataGround)

    if not DigZones[hash] then 
        lib.notify({
            title = Config.NoDigNotify.title,
            description = Config.NoDigNotify.description,
            type = Config.NoDigNotify.type,
        })
    else
        if lib.progressCircle({
            duration = Config.DigProgressCircle.duration,
            position = Config.DigProgressCircle.position,
            useWhileDead = Config.DigProgressCircle.useWhileDead,
            canCancel = Config.DigProgressCircle.canCancel,
            disable = {
                car = Config.DigProgressCircle.car,
                move = Config.DigProgressCircle.move,
            },
            anim = {
                dict = Config.DigProgressCircle.dict,
                clip = Config.DigProgressCircle.clip,
            },
            prop = {
                model = Config.DigProgressCircle.model,
                bone = Config.DigProgressCircle.bone,
                pos = Config.DigProgressCircle.pos,
                rot = Config.DigProgressCircle.rot,
            },
        }) then lib.callback.await('kw:digandwash:GiveSand', DataGround)
        end
    end
end exports('ShovelSand', ShovelSand)