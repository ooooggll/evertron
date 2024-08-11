--[[pod_format="raw",created="2024-07-29 20:13:01",modified="2024-08-11 10:30:55",revision=462]]
-- [metadata]

-- level table
-- {x, y, w, h, ?title}
levels = {
	{0, 0, 60, 34},
}

-- list of music switch triggers
-- assigned levels will start the tracks set here
music_switches = {
	[2] = 20,
	[3] = 30,
}

-- tiles stack
-- assigned objects will spawn from tiles set here
tiles = {
	[1] = player_spawn,
	[8] = spring, -- right-facing (make a left-facing one by flipping the map tile)
	[9] = spring, -- up-facing
	[11] = chest,
	[12] = message,
	[13] = big_chest,
	[14] = fake_wall,
	[15] = platform,
	[16] = flag,
	[19] = balloon,
	[20] = fruit,
	[24] = berry_key,
	[32] = fall_floor,
	[40] = fly_fruit,
}
