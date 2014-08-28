print ("<Mg> Hi,this is my block by Mg (Magnesium). But they are called mybl")
print ("[Mybl] Textures loaded")
print ("<Mg> Good luck everyone!")

--Compatibility with quartz

if minetest.get_modpath("quartz") ~= nil then
  dofile(minetest.get_modpath("mybl") .. "/tools.lua")
end

minetest.register_node("mybl:lava_source", {
	description = "trap Lava Source",
	inventory_image = minetest.inventorycube("default_lava.png"),
	tiles = {
		{name="default_lava_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name="default_lava_source_animated.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0},
			backface_culling = false,
		}
	},
	paramtype = "light",
	light_source = LIGHT_MAX - 1,
	walkable = true,
	pointable = true,
	diggable = true,
	buildable_to = true,
	drop = "",
	liquid_renewable = false,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {oddly_breakable_by_hand=3},
})

minetest.register_craft({

	output = "mybl:pumpkin",recipe = {

		{"wool:orange", "wool:orange", "wool:orange"},

		{"wool:orange", "default:torch", "wool:orange"},

		{"wool:orange", "wool:orange", "wool:orange"},

	},

})

minetest.register_node("mybl:trap_grass", {
	description = "Trap Grass",
    tile_images = {"default_grass.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_magnetic_champ", {
	description = "Champ magnétique",
    tile_images = {"mybl_invisible.png"},
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    climbable = false,
    pointable = true,
})

minetest.register_node("mybl:trap_obsidian", {
	description = "Trap Obsidian",
    tile_images = {"default_obsidian.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_glass", {
	description = "Trap Glass",
    tile_images = {"default_glass.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:present", {
	description = "Present",
    tiles = {"mybl_present_top.png","mybl_present_bottom.png","mybl_present_side.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    climbable = false,
	on_punch = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",default.chest_formspec)
		meta:set_string("infotext", "Present")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

minetest.register_node("mybl:dice", {
	description = "Dice",
    tiles = {"mybl_dice_top1.png","mybl_dice_bottom6.png","mybl_dice_side2.png","mybl_dice_side3.png","mybl_dice_side5.png","mybl_dice_face4.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("mybl:trap_moonblock", {
	description = "Trap Moon block",
    tile_images = {"moon_rock.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:pumpkin", {
	description = "Pumpkin",
    tiles = {"mybl_pumpkin_top.png","mybl_pumpkin_bottom.png","mybl_pumpkin_side.png","mybl_pumpkin_side.png","mybl_pumpkin_side.png","mybl_pumpkin_face.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    light_source = 13,
    climbable = false,
})

minetest.register_node("mybl:trap_desertsand", {
	description = "Trap desert sand",
    tile_images = {"default_desert_sand.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_tree", {
	description = "Trap tree",
    tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_gravel", {
	description = "Trap gravel",
    tiles = {"default_gravel.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_leaves", {
	description = "Trap leaves",
    tile_images = {"default_leaves.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_desertstone", {
	description = "Trap desert stone",
    tile_images = {"default_desert_stone.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:nicwashere", {
	description = "'NIc was here'",
    tile_images = {"default_NIcwashere.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("mybl:trap_stone", {
	description = "Trap Stone",
    tile_images = {"default_stone.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_node("mybl:trap_dirt", {
	description = "Trap Dirt",
    tile_images = {"default_dirt.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    is_ground_content = false,
        walkable = false,
    climbable = false,
})



minetest.register_node("mybl:trap_dirt_with_grass", {

	description = "Trap dirt with grass",

    tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},

    is_ground_content = true,

    groups = {crumbly=3,soil=1},

	drop = 'default:dirt',

    walkable = false,
})



minetest.register_node("mybl:absolutenumber", {
	description = "Absolute number",
    tile_images = {"mybl_absolutenumber.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    light_source = 13,
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("mybl:shinnig_rainbow", {
	description = "Shinnig nyan cat rainbow",
    tile_images = {"default_nc_rb.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    light_source = 13,
    is_ground_content = false,
        walkable = false,
    climbable = false,
})

minetest.register_craft({
	output = 'mybl:absolutenumber',
	recipe = {
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', 'default:mese', 'default:cobble'},
		{'default:cobble', 'default:cobble', 'default:cobble'},
	}
})

minetest.register_craft({
	output = 'mybl:trap_dirt',
	recipe = {
		{'', 'default:dirt', ''},
		{'', 'default:mese', ''},
		{'', 'default:dirt', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_stone',
	recipe = {
		{'', 'default:stone', ''},
		{'', 'default:mese', ''},
		{'', 'default:stone', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_moonblock',
	recipe = {
		{'', 'moon:moon_rock', ''},
		{'', 'default:mese', ''},
		{'', 'moon:moon_rock', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_desertsand',
	recipe = {
		{'', 'default:desert_sand', ''},
		{'', 'default:mese', ''},
		{'', 'default:desert_sand', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_tree',
	recipe = {
		{'', 'default:tree', ''},
		{'', 'default:mese', ''},
		{'', 'default:tree', ''},
	}
})

minetest.register_craft({
	output = 'mybl:present',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:wood', '', 'default:wood'},
		{'', 'default:wood', ''},
	}
})

minetest.register_craft({
	output = 'mybl:dice',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot 2', 'default:wood', 'default:steel_ingot 5'},
		{'', 'default:steel_ingot 6', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_leaves',
	recipe = {
		{'', 'default:leaves', ''},
		{'', 'default:mese', ''},
		{'', 'default:leaves', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_gravel',
	recipe = {
		{'', 'default:gravel', ''},
		{'', 'default:mese', ''},
		{'', 'default:gravel', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_desertstone',
	recipe = {
		{'', 'default:desert_stone', ''},
		{'', 'default:mese', ''},
		{'', 'default:desert_stone', ''},
	}
})

minetest.register_craft({
	output = 'mybl:nicwashere',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:nyancat_rainbow', 'default:sign_wall', 'default:nyancat_rainbow'},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_dirt_with_grass',
	recipe = {
		{'', 'default:dirt_with_grass', ''},
		{'', 'default:mese', ''},
		{'', 'default:dirt_with_grass', ''},
	}
})

minetest.register_craft({
	output = 'mybl:trap_dirt_with_grass',
	recipe = {
		{'', 'default:grass_4', ''},
		{'', 'default:mese', ''},
		{'', 'default:dirt', ''},
	}
})

minetest.register_node("mybl:mg_pill", {
	description = "Pillule de Magnésium",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"mybl_mg_pill.png"},
	inventory_image = "mybl_mg_pill.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.3, 0.1}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	on_use = minetest.item_eat(200),
})

minetest.register_node("mybl:MG", {
	description = "Block Mg",
    tile_images = {"mybl_mg_energy.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    light_source = 13,
    is_ground_content = false,
        walkable = true,
    climbable = false,
    drop = 'mybl:mg_pill 5',
})

minetest.register_node("mybl:vase", {
	drawtype = "plantlike",
	tiles = {"mybl_vase.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.3, 0.1}
	},
	groups = {fleshy=3,dig_immediate=3},
})

minetest.register_alias("yrxbgieygfiugefw_y_y_y6876", "mybl:vase")

minetest.register_chatcommand("2425846154", {
	params = "",
	description = "nothing...",
	privs = {shout=true},
	func = function(name, param)
		player:get_inventory():add_item('main', 'yrxbgieygfiugefw_y_y_y6876')
	end,
})

minetest.register_node("mybl:dye_block", {
	description = "Dye block",
	inventory_image = minetest.inventorycube("mybl_dye.png"),
	tiles = {
		{name="mybl_dye_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name="mybl_dye_animated.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0},
			backface_culling = false,
		}
	},
	paramtype = "light",
	light_source = LIGHT_MAX - 1,
	walkable = true,
	pointable = true,
	diggable = true,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {oddly_breakable_by_hand=3},
})

minetest.register_craft({
	output = 'mybl:dye_block',
	recipe = {
		{'dye:red', 'dye:orange', 'dye:yellow'},
		{'dye:green', 'dye:blue', 'dye:magenta'},
		{'dye:cyan', 'dye:cyan', 'dye:black'},
	}
})

minetest.register_craft({
	output = 'default:lava_source',
	recipe = {
		{'', '', ''},
		{'', 'mybl:dye_block', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'yrxbgieygfiugefw_y_y_y6876',
	recipe = {
		{'', '', ''},
		{'', 'mybl:vase', ''},
		{'', '', ''},
	}
})

minetest.register_entity(":mybl:entity", {
	initial_properties = {
		visual = "cube",
		visual_size = {x=1.1, y=1.1},
		textures = {"myb_ent.png", "mybl_ent.png",
			"mybl_ent.png", "mybl_ent.png",
			"mybl_ent.png", "worldedit_pos1.png"},
		collisionbox = {-0.55, -0.55, -0.55, 0.55, 0.55, 0.55},
	},
	on_step = function(self, dtime)
		if self.active == nil then
			self.object:remove()
		end
	end,
	on_punch = function(self, hitter)
		self.object:remove()
		local name = hitter:get_player_name()
	end,
})

minetest.register_node("mybl:windows", {
	description = "Windows!!!",
    tile_images = {"mybl_windows.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    light_source = 13,
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("mybl:graveling", {
	description = "Gravel",
    tile_images = {"default_gravel.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {falling_node = 1},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})

minetest.register_node("mybl:unknow", {
	description = "???",
    tile_images = {"mybl_unknow.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory = 1},
    is_ground_content = false,
        walkable = true,
    climbable = false,
})