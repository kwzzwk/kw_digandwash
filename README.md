# kw_digandwash

# About
- Very configurable
- Reward and cheating logs
- optimized
- Easy to use
Video: https://youtu.be/uLV_W6DLx1c

Discord: https://discord.gg/Txmp68Jj8C
# Depencies
- ox_lib, ox_target and ox_inventory. Add these to your ox_inventory/data/items.lua
```
	["pan"] = {
		label = "Pan",
		weight = 1,
		stack = true,
		buttons = {
			{
				label = 'Use pan',
				action = function(slot)
					exports.ox_inventory:closeInventory()
					exports['kw_digandwash']:Wash()
				end	
			},
		},
	},
	["shovel"] = {
		label = "Shovel",
		weight = 1,
		stack = true,
		buttons = {
			{
				label = 'Use shovel',
				action = function(slot)
					exports.ox_inventory:closeInventory()
					exports['kw_digandwash']:ShovelSand()
				end	
			},
		},
	},
```
