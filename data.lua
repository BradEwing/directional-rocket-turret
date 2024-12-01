local drtEntity = table.deepcopy(data.raw["ammo-turret"]["rocket-turret"]) -- copy the table that defines the original rocket turret

drtEntity.name = "directional-rocket-turret"
drtEntity.attack_parameters.turn_range = 0.33
drtEntity.turret_base_has_direction = true
drtEntity.minable = {
    mining_time = 0.5, 
    result = "directional-rocket-turret"
}
drtEntity.circuit_connector = { 
	drtEntity.circuit_connector[1], 
	drtEntity.circuit_connector[1], 
	drtEntity.circuit_connector[1],
	drtEntity.circuit_connector[1] 
}

local drtItem = table.deepcopy(data.raw["item"]["rocket-turret"])
drtItem.name = "directional-rocket-turret"
drtItem.place_result = "directional-rocket-turret"
drtItem.icons = {
    {
        icon = drtItem.icon,
        icon_size = drtItem.icon_size,
        tint = {r=0.9,g=0.9,b=0.9,a=0.5}
    },
}

-- create the recipe prototype from scratch
-- Require same ingredients as default rocket-turret to prevent cheesy quality grinding.
local recipe = {
    type = "recipe",
    name = "directional-rocket-turret",
    enabled = false,
    energy_required = 10, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
        {type = "item", name = "rocket-launcher", amount = 4},
        {type = "item", name = "processing-unit", amount = 4},
        {type = "item", name = "carbon-fiber", amount = 20},
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "iron-gear-wheel", amount = 20}
    },
    results = {{type = "item", name = "directional-rocket-turret", amount = 1}}
}

data:extend{drtEntity, drtItem, recipe}
table.insert(data.raw["technology"]["rocket-turret"].effects, {type = "unlock-recipe", recipe = "directional-rocket-turret"})