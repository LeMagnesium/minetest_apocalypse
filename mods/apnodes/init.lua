hud = {}

local health_hud = {}
hud.hunger = {}
local hunger_hud = {}
hud.air = {}
local air_hud = {}

local SAVE_INTERVAL = 0.5*60--currently useless

local ENABLE_HUNGER = minetest.setting_getbool("enable_damage") -- set to false if no hunger wanted
local NO_HUNGER_TIME = 300 --=5min (so 1h playing == hunger)

--minetest.after(SAVE_INTERVAL, timer, SAVE_INTERVAL)

local function hide_builtin(player)

	 player:hud_set_flags({crosshair = false, healthbar = false, wielditem = true, breathbar = false})

end


local function costum_hud(player)
  --crosshair

        player:hud_add({

            hud_elem_type = "image",

            text = "hud_cross.png",

            position = {x=0.5, y=0.5},

            scale = {x=1, y=1},

        })

end


minetest.register_node("apnodes:gravel", {

	description = "Gravel demoniaque",

	tiles = {"apnodes_gravel.png"},

	is_ground_content = true,

	groups = {crumbly=2, falling_node=1},

})


minetest.register_node("apnodes:obsidian_with_coal", {

	description = "Minerai de charbon démoniaque",

	tiles = {"default_obsidian.png^default_mineral_coal.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:coal_lump',


})



minetest.register_node("apnodes:obsidian_with_copper", {

	description = "Minerai de cuivre démoniaque",

	tiles = {"default_obsidian.png^default_mineral_copper.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:copper_lump',


})



minetest.register_node("apnodes:obsidian_with_diamond", {

	description = "Minerai de crystale démoniaque",

	tiles = {"default_obsidian.png^default_mineral_diamond.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:diamond',


})



minetest.register_node("apnodes:obsidian_with_gold", {

	description = "Minerai d'or démoniaque",

	tiles = {"default_obsidian.png^default_mineral_gold.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:gold_lump',


})



minetest.register_node("apnodes:obsidian_with_iron", {

	description = "Minerai de métal démoniaque",

	tiles = {"default_obsidian.png^default_mineral_iron.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:iron_lump',


})



minetest.register_node("apnodes:obsidian_with_mese", {

	description = "Minerai de mese démoniaque",

	tiles = {"default_obsidian.png^default_mineral_mese.png"},

	is_ground_content = true,

	groups = {cracky=3},

	drop = 'default:mese_crystal',


})


minetest.register_node("apnodes:demoniac_apple", {

	description = "Pomme démoniaque",

	drawtype = "plantlike",

	visual_scale = 1.0,

	tiles = {"apnodes_demoniac_apple.png"},

	inventory_image = "apnodes_demoniac_apple.png",

	paramtype = "light",

	sunlight_propagates = true,

	walkable = false,

	selection_box = {

		type = "fixed",

		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},

	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},

	on_use = minetest.item_eat(-20),

	after_place_node = function(pos, placer)

		if placer:is_player() then

		minetest.set_node(pos, {name="apnodes:demoniac_apple", param2=1})

	end
		
	end,

})

minetest.register_node("apnodes:desert_sand", {
	description = "Sable apocalyptique du désert",
    tile_images = {"apnodes_desert_sand.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,falling_node=1},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("apnodes:cactus", {
	description = "Cactus apocalyptique",
    tile_images = {"apnodes_cactus.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=2},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_craft({

	output = "apnodes:torch",recipe = {

		{"apnodes:cactus", "apnodes:cactus", "apnodes:cactus"},

		{"apnodes:cactus", "default:mese", "apnodes:cactus"},

		{"apnodes:cactus", "apnodes:cactus", "apnodes:cactus"},

	},

})

minetest.register_node("apnodes:torch", {
	description = "torch apocalyptique",
    tile_images = {"apnodes_torchs.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    light_source = 13,
    is_ground_content = false,
        walkable = true,
    climbable = false,
    drop = 'default:cobble',
})

minetest.register_node("apnodes:rb_apple", {

	description = "Pomme Arc-en-ciel",

	drawtype = "plantlike",

	visual_scale = 1.0,

	tiles = {"apnodes_rb_apple.png"},

	inventory_image = "apnodes_rb_apple.png",

	paramtype = "light",

	light_source = 100,
	sunlight_propagates = true,

	walkable = false,

	selection_box = {

		type = "fixed",

		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},

	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},

	on_use = minetest.item_eat(20),

	after_place_node = function(pos, placer)

		if placer:is_player() then

		minetest.set_node(pos, {name="apnodes:rb_apple", param2=1})

	end
		
	end,

})

minetest.register_node("apnodes:oerkki_torch", {

	description = "Torche oerkki",

	drawtype = "torchlike",

	--tiles = {"apnodes_torch_on_floor.png", "apnodes_torch_on_ceiling.png", "apnodes_torch.png"},

	tiles = {

		{name="apnodes_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},

		{name="apnodes_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},

		{name="apnodes_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}

	},

	inventory_image = "apnodes_torch_on_floor.png",

	wield_image = "apnodes_torch_on_floor.png",

	paramtype = "light",

	paramtype2 = "wallmounted",

	sunlight_propagates = true,

	walkable = false,

	light_source = 101-1,

	selection_box = {

		type = "wallmounted",

		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},

		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},

		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},

	},

	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},

	legacy_wallmounted = true,

})

minetest.register_node("apnodes:fire", {

	description = "Feu funèbre",

	drawtype = "torchlike",

	--tiles = {"apnodes_fire_on_floor.png", "apnodes_fire_on_ceiling.png", "apnodes_fire.png"},

	tiles = {

		{name="apnodes_fire_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},

		{name="apnodes_fire_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},

		{name="apnodes_fire_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}

	},

	inventory_image = "apnodes_fire_on_floor.png",

	wield_image = "apnodes_fire_on_floor.png",

	paramtype = "light",

	paramtype2 = "wallmounted",

	sunlight_propagates = true,

	walkable = false,

	light_source = 101-1,

	selection_box = {

		type = "wallmounted",

		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},

		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},

		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},

	},

	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},

	legacy_wallmounted = true,

})

minetest.register_node("apnodes:crux", {
	description = "Croix funèbre",
    tile_images = {"apnodes_crux.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_abm({
	nodenames = {"apnodes:crux"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.env:add_node(pos, {name="default:obsidian"})
		pos.y = pos.y+1
		minetest.env:add_node(pos, {name="default:obsidian"})
		pos.y = pos.y+1
		minetest.env:add_node(pos, {name="default:obsidian"})
		pos.y = pos.y+1
		minetest.env:add_node(pos, {name="default:obsidian"})
		pos.y=pos.y-1
		pos.x=pos.x+1
		minetest.env:add_node(pos, {name="default:obsidian"})
		pos.x=pos.x-2
		minetest.env:add_node(pos, {name="default:obsidian"})
	end,
})

minetest.register_craftitem("apnodes:magic_stone", {
	description = "Pierre Magique",
    tile_images = {"apnodes_magic.png"},
    groups = {not_in_creative_inventory = 1},
})

minetest.register_craft({
	output = "apnodes:magic_stone",recipe = {
		{"bones:bones", "bones:bones", "bones:bones"},
		{"bones:bones", "default:mese_crystal", "bones:bones"},
		{"bones:bones", "bones:bones", "bones:bones"},
	},
})