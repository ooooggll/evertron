--[[pod_format="raw",created="2024-07-29 20:11:31",modified="2024-08-11 10:30:55",revision=370]]
-- [level loading]

function next_level()
	local next_lvl = lvl_id + 1

	-- check for music trigger
	if music_switches[next_lvl] then
		music(music_switches[next_lvl], 500, 7)
	end

	load_level(next_lvl)
end

function load_level(id)
	has_dashed, has_key = false

	-- remove existing objects
	foreach(objects, destroy_object)

	-- reset camera speed
	cam_spdx, cam_spdy = 0, 0

	local diff_level = lvl_id ~= id

	-- set level index
	lvl_id = id

	-- set level globals
	local lvl_data = split(levels[lvl_id])
	for i = 1, 4 do
		lvl_x, lvl_y, lvl_w, lvl_h = unpack(lvl_data)
	end
	lvl_title = lvl_data[5]
	lvl_pw, lvl_ph = lvl_w * 8, lvl_h * 8

	-- level title setup
	ui_timer = 5

	-- spawn objects
	for tx = 0, lvl_w - 1 do
		for ty = 0, lvl_h - 1 do
			local tile = tile_at(tx, ty)
			local object_type = tiles[tile] or tiles[tile - 0x4000]
			-- horizontally mirrored map tiles have the 15th bit flipped (aka 0x4000)
			if object_type then
				init_object(object_type, tx * 8, ty * 8, tile)
			end
		end
	end
end

-- replace mapdata with hex
function replace_mapdata(x, y, w, h, data)
	for i = 1, #data, 2 do
		mset(x + i \ 2 % w, y + i \ 2 \ w, "0x" .. sub(data, i, i + 1))
	end
end