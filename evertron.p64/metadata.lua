--[[pod_format="raw",created="2024-07-29 20:13:01",modified="2024-08-12 08:08:16",revision=475]]
-- [metadata]

-- level table
-- {path, ?title}
levels = {
	{map="map/0.map"},
	{map="map/1.map",title="summit",music=30},
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
