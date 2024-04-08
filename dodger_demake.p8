pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
	
	global_vars = {
		frame_counter = 0,
		ignore_inputs_duration = 1, --to avoid accidental clicks we set a time frame user input are ignored
		fps = 30,
		hp = 3,
		mode = "title", 	--initial mode
		current_level = 1,
		levels_codes = {	--levels code
			{2, 1, 1, 2},	--level 2
			{3, 0, 1, 3},	--level 3
			{0, 0, 2, 2},	--level 4
			{2, 2, 0, 0},	--level 5
		    {1, 1, 3, 1},	--level 6
			{2, 1, 2, 3},	--level 7
			{1, 1, 0, 3},	--level 8
			{1, 2, 3, 3},	--level 9
			{3, 1, 2, 3},	--level 10
			{1, 3, 3, 1}	--level 11

		},
		levels_messages = {
			"congrats!",	--level 2 message
			"nice!",
			"cool",
			"good",
			"okay",
			"just luck",
			"enough",
			"you're wasting time",
			"run",
			":)"
		},
		level_1_start_frame = -1,	--saving the frame when level 1 starts, used to check final time
	}

	--load saved data
	-- slot 0 contains info on using or not the alternative color_palette (0 -> no, 1 -> yes)
	load_saved_data()

	--set global_vars.mode to start
	change_mode_and_reset(global_vars.mode)
end

function _update()
	if (global_vars.mode == "title") update_title()
	if (sub(global_vars.mode, 1, 5) == "level") update_level()

	if (global_vars.mode == "end_screen") update_end_screen()
	if (global_vars.mode == "transition") update_transition()

	global_vars.frame_counter += 1
end

function _draw()
	if (global_vars.mode == "title") draw_title()
	if (sub(global_vars.mode, 1, 5) == "level") draw_level()


	if (global_vars.mode == "end_screen") draw_end_screen()
	if (global_vars.mode == "transition") draw_transition()

	--print(global_vars.level_1_start_frame, 10, 10)
	--print("current global_vars.mode = "..global_vars.mode, 20, 20, 7)
	--print(global_vars.current_level, 10, 10)
	--print(count(global_vars.levels_codes), 10, 20)
	--print(global_vars.hp, 10, 10)
	--print(dget(0), 10, 10)
end

function change_mode_and_reset(new_mode)
	if new_mode == "title" then init_title()
	elseif new_mode == "level_1" then init_level_1()
	elseif new_mode == "level_2" then init_level_2()
	elseif new_mode == "level_3" then init_level_3()
	elseif new_mode == "level_4" then init_level_4()
	elseif new_mode == "level_5" then init_level_5()
	elseif new_mode == "level_6" then init_level_6()
	elseif new_mode == "level_7" then init_level_7()
	elseif new_mode == "level_8" then init_level_8()
	elseif new_mode == "level_9" then init_level_9()
	elseif new_mode == "level_10" then init_level_10()
	elseif new_mode == "level_11" then init_level_11()

	elseif new_mode == "end_screen" then init_end_screen()
	elseif new_mode == "transition" then init_transition()
	end
	
	global_vars.mode = new_mode
end

function change_mode(new_mode) global_vars.mode = new_mode end


function load_saved_data()
	cartdata("dodger_demake_0")
	-- loading color palette
	if dget(0) == nil then dset(0, 0) end
	use_alternative_color_palette(dget(0))
end

function use_alternative_color_palette(alternative_color_palette)
	if alternative_color_palette == 1 then
		for o=0,15 do
			pal(o,o+128,1)
		end
		dset(0, 1)
	else
		for o=0,15 do
			pal(o,o,1)
		end
		dset(0, 0)
	end

	poke(0x5f2e,1) 
end

---draws---
#include src/draws.lua
---inits---
#include src/inits.lua
---updates---
#include src/updates.lua

---shared levels sources---
#include src/shared/draw_functions.lua
#include src/shared/update_functions.lua

---entities sources---
#include src/entities/ship.lua
#include src/entities/player.lua

---utility libraries---
#include src/utils/text.lua
#include src/utils/token_saver.lua


__gfx__
22e2222222e2222222222222222e2222000000006777777000aaaa000aaaa0000a000a0000aaa00000aaaa000aaaa0000aa0aa0000aaa0000000000000000000
2eee22222e222222222e22222222e22200000000566666700aaaaaa0aaaaaa00aa000aa00aaaaa000aaaaaa0aaaaaa00aaa0aaa00aaaaa000000000000000000
e2e2e222eeeeee22222e2222eeeeee220000000056666670aaaaa00000aaaaa0aaa0aaa0aaaaaaa0aaaaaaa0aaaaaaa0aaa0aaa0aaaaaaa00000000000000000
22e222222e222222222e22222222e2220000000056666670aaaa0000000aaaa0aaaaaaa0aaaaaaa0aaaa0000000aaaa0aaaaaaa0aaaaaaa00000000000000000
22e2222222e222222e2e2e22222e22220000000056666670aaaaa00000aaaaa0aaaaaaa0aaa0aaa0aaaaaaa0aaaaaaa0aaaaaaa0aaa0aaa00000000000000000
22e22222222222222eeeee222222222200000000566666700aaaaaa0aaaaaa000aaaaa00aa000aa00aaaaaa0aaaaaa000aaaaa00aaa0aaa00000000000000000
222222222222222222eee22222222222000000005555557000aaaa000aaaa00000aaa0000a000a0000aaaa000aaaa00000aaa0000aa0aa000000000000000000
2222222222222222222e222222222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000001000000333000007770000000300000000000000003300bb0000003888b0000000000000000000000000000000000000000000000000000000000
000000000001000008888800077777000003000000b0b00000033333bbbbb0003333bbb000999900000000000000000000000000000000000000000000000000
000000000001000088988980070707000030300000b0b0000bb333388bbbbbb03333bbb000000000090009000000000000000000000000000000000000000000
11111111000100008888888007777700030003000bb3330000033338833330000333bb0000000000090009000000000000000000000000000000000000000000
00000000000100000888980006707600888088800bb333000bbbbbb883333bb00333bb0000000000090009000000000000000000000000000000000000000000
000000000001000008898800007770008e808e80bbb33330000bbbbb3333300000b0b00000999900090009000000000000000000000000000000000000000000
0000000000010000008880000066600088808880bbb3333000000bb00330000000b0b00000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000b88830000000000000000000000000000000000000000000000000000000000000000000000000000000000
0044b0000000000000000000a00000a0a00a00a0a00a00a0eeeeeeee22222222e222222222222222000000000000000000000000000000000000000000000000
0bb4bb00000000000a000a000a000a000a0a0a0000000000e222222222222222e222222222222222000000000000000000000000000000000000000000000000
bbbbbbb000a0a00000a0a00000a0a0000000000000000000e222222222222222e222222222222222000000000000000000000000000000000000000000000000
bbbbbbb0000a00000000000000000000aa000aa0a00000a0e222222222222222e222222222222222000000000000000000000000000000000000000000000000
bbbbbbb000a0a00000a0a00000a0a0000000000000000000e222222222222222e222222222222222000000000000000000000000000000000000000000000000
0bbbbb00000000000a000a000a000a000a0a0a0000000000e222222222222222e222222222222222000000000000000000000000000000000000000000000000
00bbb0000000000000000000a00000a0a00a00a0a00a00a0e222222222222222e222222222222222000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000e2222222eeeeeeeee222222222222222000000000000000000000000000000000000000000000000
__label__
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010044b00100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010bb4bb0100044b01000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
0001bbbbbbb100bb4bb1000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
1111bbbbbbb11bbbbbbb111111111111111111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000
0001bbbbbbb10bbbbbbb000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010bbbbb010bbbbbbb000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
000100bbb00100bbbbb1000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
000100000001000bbb01000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000
00010044b00100000001044b00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00010bb4bb0100000001bb4bb0010000000555000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
0001bbbbbbb10000000bbbbbbb010000008888800001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
1111bbbbbbb11111111bbbbbbb111111188988981111111111111111111111111111111111111111111111111111111111111111111111111111111100000000
0001bbbbbbb10000000bbbbbbb010000088888880001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00010bbbbb0100000001bbbbb00100000088898000010000044b0000000100000001000000010000000100000001000000010000000100000001000000000000
000100bbb001000000010bbb000100000088988000010000bb4bb0000044b0000001000000010000000100000001000000010000000100000001000000000000
00010000000100000001000000010555000888000555000bbbbbbb000bb4bb000001000000010000000100000001000000010000000100000001000000000000
00010044b00100000001044b00018888800100008888800bbbbbbb00bbbbbbb00001000000010000000100000001000000010000000100000001000000000000
00010bb4bb0100000001bb4bb0088988980100088988980bbbbbbb00bbbbbbb00001000000010000000100000001000000010000000100000001000000000000
0001bbbbbbb10000000bbbbbbb0888888801000888888800bbbbb000bbbbbbb00001000000010000000100000001000000010000000100000001000000000000
1111bbbbbbb11111111bbbbbbb11888981111111888981111bbb11111bbbbb111111111111111111111111111111111111111111111111111111111100000000
0001bbbbbbb10000000bbbbbbb01889880010000889880000001000000bbb0000001000000010000000100000001000000010000000100000001000000000000
00010bbbbb0100000001bbbbb00108880001000008880000044b00000001000044b1000000010000000100000001000000010000000100000001000000000000
000100bbb001000000010bbb000100000001000000010000bb4bb0000001000bb4bb000000010000000100000001000000010000000100000001000000000000
00010000000100044b01000000010555000100000555000bbbbbbb00000100bbbbbbb00000010000000100000001000000010000000100000001000000000000
00010044b00100bb4bb1000000018888800100008888800bbbbbbb00000100bbbbbbb00000555000005550000001000000010000000100000001000000010000
00010bb4bb010bbbbbbb000000088988980100088988980bbbbbbb00000100bbbbbbb00008888800088888000001000000010000000100000001000000010000
0001bbbbbbb10bbbbbbb0000000888888801000888888800bbbbb0000001000bbbbb000088988980889889800001000000010000000100000001000000010000
1111bbbbbbb11bbbbbbb11111111888981111111888981111bbb111111111111bbb1111188888881888888811111111111111111111111111111111111111111
0001bbbbbbb100bbbbb1000000018898800100008898800000010000000100000001000008889800088898000001000000010000000100000001000000010000
00010bbbbb01000bbb010000000108880005550008880000044b00000001000044b1000008898800088988000001000000010000000100000001000000010000
000100bbb001000000010000000100000088888000010000bb4bb0000001000bb4bb00000088800000888000000144b0000144b0000100000001000000010000
00010000000100000001000000010000088988980001000bbbbbbb00000100bbbbbbb0000001000000010000000bb4bb000bb4bb000100000001000000010000
00010000000100000001000000010000088888880001000bbbbbbb00000100bbbbbbb000000100000001000000bbbbbbb0bbbbbbb00100000001000000010000
00010000000100000001000000010000008889800001000bbbbbbb00000100bbbbbbb005550100000001000000bbbbbbb0bbbbbbb00100000001000000010000
000100000001000000010000000100000088988000010000bbbbb0000001000bbbbb0088888100000001000000bbbbbbb0bbbbbbb00100000001000000010000
1111111111111111111111111111111111188811111111111bbb111111111111bbb118898898111111111111111bbbbb111bbbbb111111111111111111111111
000100000001000000010000000100000001000000010000000100000044b0000001088888880000000100000001bbb00001bbb0000100000001000000010000
000100000001000000010000000100000001000000010000044b00000bb4bb000001008889810000000100000001000000010000000100000001000000010000
000100000001000000010000000100000001000000010000bb4bb000bbbbbbb0000100889881000000010000000144b000010000000100000001000000010000
00010000000100000001000000010000000100000001000bbbbbbb00bbbbbbb0000100088801000000010000000bb4bb00010000000155500001555000010000
00010000000100000001000000010000000100000001000bbbbbbb00bbbbbbb000010000000100000001000000bbbbbbb0010000000888880008888800010000
00010000000100000001000000010000000100000001000bbbbbbb000bbbbb0000010000000100000001000000bbbbbbb0010000008898898088988980010000
000100000001000000010000000100000001000000010000bbbbb00000bbb00000010000555100000001055500bbbbbbb00144b0008888888088888880010000
1111111111111111111111111111111111111111111111111bbb111111111111111111188888111111118888811bbbbb111bb4bb111888981118889811111111
00010000000100000001000000010000000100000001000000010000000100000001008898898000000889889801bbb000bbbbbbb00889880008898800010000
00010000000100000001000000010000000100000001000000010000000100000001008888888000000888888801000000bbbbbbb00188800001888000010000
0001000000010000000100000001000000010000000100000001000000010000000100088898000000018889800144b000bbbbbbb00100000001000000010000
0001000000010000000100000001000000010000000100000001000000010000000100088988000555018898800bb4bb000bbbbb000100000001000000010000
000100000001000000010000000100000001000000010000000100000001000000010000888100888881088800bbbbbbb001bbb0000155500001000555010000
000100000001000000010000000100000001000000010000000100000001000000010000000108898898000000bbbbbbb0010000000888880001008888810000
000100000001000000010000000100000001000000010000000100000001000000010000000108888888000000bbbbbbb0010000008898898001088988980000
1111111111111111111111113111111131111111111111111111111111111111111111111111118889811111111bbbbb11111111118888888111188888881111
00010000000100000001000300010003000100000001000000010000000100000001000000010088988100000001bbb000010000000888980001008889810000
00010000000100000001003030010030300100000001000000010000000100000001000000010008880100000001000000010000000889880001008898810000
0001000000010000000103000301030003010000000100000001000000010000000100000001000000010000000144b0000144b0000188800001000888010000
0001000000010000000188808881888088810000000100000001000000010000000100000001000000010000000bb4bb000bb4bb000100000001000000010000
000100000001000000018e808e818e808e81000000010000000100000001000000010000000100000001000000bbbbbbb0bbbbbbb00155500001555000010000
000100000001000000018880888188808881000000010000000100000001000000010000000100000001000000bbbbbbb0bbbbbbb00888880008888800010000
000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000bbbbbbb0bbbbbbb08898898088988980010000
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111bbbbb111bbbbb118888888188888881111111
00010000000100000001000030010000300100000001000000010000000100000001000000010000000100000001bbb00001bbb0000888980008889800010000
00010000000100000001000300010003000100000001000000010000000100000001000000010000000100000001000000010000000889880008898800010000
00010000000100000001003030010030300100000001000000010000000100000001000000010000000100000001000000010000000188800001888000010000
00010000000100000001030003010300030100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001888088818880888100000001000000010000000100000001000000010000000100000001000000010000000155500001000555010000
000100000001000000018e808e818e808e8100000001000000010000000100000001000000010000000100000001000000010000000888880001008888810000
00010000000100000001888088818880888100000001000000010000000100000001000000010000000100000001000000010000008898898001088988980000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111118888888111188888881111
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000888980001008889810000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000889880001008898810000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000188800001000888010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000022202220222002200220000002222200001022200220000002202220222022202220000000100000001000000010000
00010000000100000001000000010000020202020201020002010000022100220001002002020000020100200202020200210000000100000001000000010000
00010000000100000001000000010000022202200221022202220000022120220001002002020000022200200222022000210000000100000001000000010000
00010000000100000001000000010000020102020201000200020000022100220001002002020000000200200202020200210000000100000001000000010000
00010000000100000001000000010000020102020222022002210000002222200001002002210000022100200202020200210000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000
00000000000000000000000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000

__sfx__
000100001d7201e7201f72020720217202272025720297202e7202e72032700327003270011700117000b3000f30014300183001a3001d3002030022300223002330024300000000000000000000000000000000
0010000012010180101901023010270101a010130101a0101301023010250002a00000000000003d0003b70003700027000020001200002000020000200000000000000000000000000000000000000000000000
__music__
00 01424344

