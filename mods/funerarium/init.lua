local sheet =	{ -1/2  , -1/2   , -1/2   , 1/2    , -7/16  ,  1/2  }
local info  =	'Ci-gît '
local sign  =	' décédé le '

minetest.register_node("funerarium:sign_wall", {
	description = "Panneau funeraire",
	drawtype = "signlike",
	tiles = {"funerarium_sign_wall.png"},
	inventory_image = "funerarium_sign_wall.png",
	wield_image = "funerarium_sign_wall.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("nom","")
		meta:set_string("date","")
		meta:set_string(
					"formspec", 
					"size[10,7]"..
					"field[1,1;8.5,1;nom; Nom du defunt;${nom}]"..
					"field[1,3;4.25,1;date; Date de la mort (optionnel);${date}]"..
					"button_exit[0.75,5;4.25,1;text,signed;Enterrer]"
				)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		if fields.nom == nil or fields.date == nil then
      meta:set_string("nom","")
      meta:set_string("date","")
      meta:set_string("infotext","")
      return
    end
		if fields.nom == "" then
      minetest.chat_send_player(sender:get_player_name(), "No name entered. Cannot burry.")
      return
		end
		
		nom = fields.nom
		date = fields.date
		
		meta:set_string("nom", nom)
		meta:set_string("date", date)
		if date ~= "" then
			meta:set_string("infotext", info..nom..sign..date)
		else
      meta:set_string("infotext", info..nom..".")
    end
	end,
})