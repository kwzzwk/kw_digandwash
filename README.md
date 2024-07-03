# kw_digandwash

# About
- Very configurable
- Reward and cheating logs
- optimized
- Easy to use
# Depencies
- ox_lib, ox_target and ox_inventory. Add these to your ox_inventory/data/items.lua
- <tab><tab>	["pan"] = {
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
	},/ so you can use your items!
