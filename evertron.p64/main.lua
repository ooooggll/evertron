--[[pod_format="raw",created="2024-03-24 00:48:06",modified="2024-08-11 10:30:55",revision=440]]
-- E V E R T R O N --
-- equinox's port of evercore to picotron

-- based on evercore+ v2.0.1, which is based on evercore v2.3.0, which is based on smalleste, which is based on celeste classic

--[[ Credits
	Celeste Classic
		Maddy Thorson
		Noel Berry
	Evercore
		petra
		meep
		gonengazit
		akliant
	Evercore+ and Evertron
		equinox
	PICO-8 Instruments
		pancelor
--]]

-- vid(0) should be supported if you really want more pixels (but I think it looks bad.)
-- vid(4) works except for the title screen.
vid(3)
game_w, game_h = get_display():width(), get_display():height()

include "initialization.lua"
include "update.lua"
include "draw.lua"
include "player.lua"
include "objects.lua"
include "levels.lua"
include "metadata.lua"

-- todo
--[[
		fix btn calls
		probably delete the "reload map" part in levels.lua
		make objects actually spawn
		make all objects actually spawn
		multiple map layer support
		make the "calculate dash speeds" line comprehensible
		make object dictionary comprehensible
		clamp player not in the draw function
		use vec over vector
		stop using psfx
		stop using params
		better object layering?
		make jumpthroughs draw
	make memorials type
	make the noise instrument not sound bad
	recreate music
	figure out how multiple levels work (different .map for each one?)
		make the "100m" thing centered
	60fps? smoothleste? maybe in a different branch
--]]