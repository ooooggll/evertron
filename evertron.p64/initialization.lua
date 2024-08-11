--[[pod_format="raw",created="2024-07-29 19:52:34",modified="2024-08-11 10:30:55",revision=401]]
-- [initialization]

function rectangle(x, y, w, h)
	return {x = x, y = y, w = w, h = h}
end

-- global tables
objects, got_fruit = {}, {}
-- global timers
freeze, delay_restart, music_timer, ui_timer = 0, 0, 0, -99
-- global camera values
draw_x, draw_y, cam_x, cam_y, cam_spdx, cam_spdy, cam_gain = 0, 0, 0, 0, 0, 0, 0.25

game_map = fetch("map/0.map")

-- [entry point]

function _init()
	actual_frames = 0
	frames, start_game_flash = 0, 0
	music(40, 0, 7)
	lvl_id = 0
	
	set_font("p8")
end

function begin_game()
	max_djump = 1
	deaths, frames, seconds, minutes, music_timer, time_ticking, fruit_count, bg_col, cloud_col = 0, 0, 0, 0, 0, true, 0, 0, 1
	music(0, 0, 7)
	load_level(1)
end

function is_title()
	return lvl_id == 0
end

-- [effects]

clouds = {}
for i = 0, 32 do
	add(clouds, {
		x = rnd(game_w), 
		y = rnd(game_h), 
		spd = 1 + rnd(4), 
		w = 32 + rnd(32)})
end

particles = {}
for i = 0, 32 do
	add(particles, {
		x = rnd(game_w), 
		y = rnd(game_h), 
		s = flr(rnd(1.25)), 
		spd = 0.25 + rnd(5), 
		off = rnd(), 
		c = 6 + rnd(2), 
	})
end

dead_particles = {}

-- [function library]

function round(x)
	return flr(x + 0.5)
end

function appr(val, target, amount)
	return val > target and max(val - amount, target) or min(val + amount, target)
end

function sign(v)
	return v ~= 0 and sgn(v) or 0
end

function two_digit_str(x)
	return x < 10 and "0"..x or x
end

function tile_at(x, y, layer)
--	return mget(lvl_x + x, lvl_y + y)
	local mapfile = game_map or fetch("map/0.map")
	
	return mapfile[layer or 1].bmp:get(x, y)
end

function spikes_at(x1, y1, x2, y2, xspd, yspd)
	for i = max(0, x1 \ 8), min(lvl_w - 1, x2 / 8) do
		for j = max(0, y1 \ 8), min(lvl_h - 1, y2 / 8) do
			if({[62] = y2 % 8 >= 6 and yspd >= 0,
				[55] = y1 % 8 <= 2 and yspd <= 0,
				[54] = x1 % 8 <= 2 and xspd <= 0,
				[63] = x2 % 8 >= 6 and xspd >= 0})[tile_at(i, j, 2)] then
					return true
			end
		end
	end
end

function draw_layer(layer, ...)
	local mapfile = game_map or fetch("map/0.map")
	
	map(mapfile[layer].bmp, ...)
end

function center_print(text, x, y, c)
	local w = print(text, 0, -1000)
	print(text, x - w / 2, y, c)
end

-- pass in "lil", "lil_mono", or "p8"
function set_font(font)
	fetch("/system/fonts/" .. font .. ".font"):poke(0x4000)
	game_font = font
end