minetest.register_tool("mybl:pick_quartz", {
	description = "Quartz pickaxe",
	inventory_image = "mybl_tool_quartz.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_craft({
	output = 'mybl:pick_quartz',
	recipe = {
		{'quartz:quartz_crystal_piece', 'quartz:quartz_crystal_piece', 'quartz:quartz_crystal_piece'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'quartz:quartz_crystal',
	recipe = {
		{'quartz:quartz_crystal_piece', 'quartz:quartz_crystal_piece', 'quartz:quartz_crystal_piece'},
		{'', '', ''},
		{'', '', ''},
	}
})