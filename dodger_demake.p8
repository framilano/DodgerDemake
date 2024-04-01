pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
	global_vars = {
		frame_counter = 0,
		fps = 30,
		hp = 3,
		mode = "title", --initial mode
		current_level = "one",
		--levels code
    	two_code = {2, 1, 1, 2},
		three_code = {3, 0, 1, 3}
	}
	

	--set global_vars.mode to start
	change_mode_and_reset(global_vars.mode)
end

function _update()
	if (global_vars.mode == "title") update_title()
	if (global_vars.mode == "level_one") update_level_one()
	if (global_vars.mode == "level_two") update_level_two()
	
	if (global_vars.mode == "transition") update_transition()

	global_vars.frame_counter += 1
	update_timers()
end

function _draw()
	if (global_vars.mode == "title") draw_title()
	if (global_vars.mode == "level_one") draw_level_one()
	if (global_vars.mode == "level_two") draw_level_two()
	
	if (global_vars.mode == "transition") draw_transition()

	--print("current global_vars.mode = "..global_vars.mode, 20, 20, 7)
	--print(global_vars.current_level, 10, 10)
end

function change_mode_and_reset(new_mode)
	if new_mode == "title" then
		init_title()
		global_vars.mode = "title"
	elseif new_mode == "level_one" then
		init_level_one()
		global_vars.mode = "level_one"
	elseif new_mode == "level_two" then
		init_level_two()
		global_vars.mode = "level_two"
	
	elseif new_mode == "transition" then
		init_transition()
		global_vars.mode = "transition"
	end

	--Resetting timers
	timers = {}
end

function change_mode(new_mode)
	if (new_mode == "title") global_vars.mode = "title"
	if (new_mode == "level_one") global_vars.mode = "level_one"
	if (new_mode == "level_two") global_vars.mode = "level_two"

	if (new_mode == "transition") global_vars.mode = "transition"
end

---shared levels sources---
#include src/scenes/shared/draw_functions.lua
#include src/scenes/shared/update_functions.lua

---title sources---
#include src/scenes/title/init.lua
#include src/scenes/title/draw.lua
#include src/scenes/title/update.lua

---level_one sources---
#include src/scenes/level_one/init.lua
#include src/scenes/level_one/draw.lua
#include src/scenes/level_one/update.lua

---level_two sources---
#include src/scenes/level_two/init.lua
#include src/scenes/level_two/draw.lua
#include src/scenes/level_two/update.lua

---transition sources---
#include src/scenes/transition/init.lua
#include src/scenes/transition/draw.lua
#include src/scenes/transition/update.lua

---entities sources---
#include src/entities/ship.lua
#include src/entities/player.lua

---utility libraries---
#include src/utils/text.lua
#include src/utils/gameplay.lua
#include src/utils/timers.lua
#include src/utils/tables.lua

__gfx__
22e2222222e2222222222222222e2222000000006777777700aaaa000aaaa0000a000a0000aaa00000aaaa000aaaa0000aa0aa0000aaa0000000000000000000
2eee22222e222222222e22222222e22200000000566666670aaaaaa0aaaaaa00aa000aa00aaaaa000aaaaaa0aaaaaa00aaa0aaa00aaaaa000000000000000000
e2e2e222eeeeee22222e2222eeeeee220000000056666667aaaaa00000aaaaa0aaa0aaa0aaaaaaa0aaaaaaa0aaaaaaa0aaa0aaa0aaaaaaa00000000000000000
22e222222e222222222e22222222e2220000000056666667aaaa0000000aaaa0aaaaaaa0aaaaaaa0aaaa0000000aaaa0aaaaaaa0aaaaaaa00000000000000000
22e2222222e222222e2e2e22222e22220000000056666667aaaaa00000aaaaa0aaaaaaa0aaa0aaa0aaaaaaa0aaaaaaa0aaaaaaa0aaa0aaa00000000000000000
22e22222222222222eeeee222222222200000000566666670aaaaaa0aaaaaa000aaaaa00aa000aa00aaaaaa0aaaaaa000aaaaa00aaa0aaa00000000000000000
222222222222222222eee22222222222000000005666666700aaaa000aaaa00000aaa0000a000a0000aaaa000aaaa00000aaa0000aa0aa000000000000000000
2222222222222222222e222222222222000000005555555600000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0044b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb4bb0000044b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb000bb4bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00bbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00bbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbbbb000bbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbb00000bbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0044b00000000000044b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb4bb0000000000bb4bb00000000005550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb0000000088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb0000000889889800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb0000000888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbbbb0000000000bbbbb00000000088898000000000044b00000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbb000000000000bbb000000000088988000000000bb4bb0000044b00000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000555000888000555000bbbbbbb000bb4bb0000000000000000000000000000000000000000000000000000000000000000000000
0044b00000000000044b00008888800000008888800bbbbbbb00bbbbbbb000000000000000000000000000000000000000000000000000000000000000000000
0bb4bb0000000000bb4bb0088988980000088988980bbbbbbb00bbbbbbb000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb0888888800000888888800bbbbb000bbbbbbb000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb00888980000000888980000bbb00000bbbbb0000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbb00000000bbbbbbb00889880000000889880000000000000bbb00000000000000000000000000000000000000000000000000000000000000000000000
0bbbbb0000000000bbbbb00008880000000008880000044b00000000000044b00000000000000000000000000000000000000000000000000000000000000000
00bbb000000000000bbb000000000000000000000000bb4bb0000000000bb4bb0000000000000000000000000000000000000000000000000000000000000000
0000000000044b00000000000555000000000555000bbbbbbb00000000bbbbbbb000000000000000000000000000000000000000000000000000000000000000
0044b00000bb4bb0000000008888800000008888800bbbbbbb00000000bbbbbbb000005550000055500000000000000000000000000000000000000000000000
0bb4bb000bbbbbbb000000088988980000088988980bbbbbbb00000000bbbbbbb000088888000888880000000000000000000000000000000000000000000000
bbbbbbb00bbbbbbb0000000888888800000888888800bbbbb0000000000bbbbb0000889889808898898000000000000000000000000000000000000000000000
bbbbbbb00bbbbbbb00000000888980000000888980000bbb000000000000bbb00000888888808888888000000000000000000000000000000000000000000000
bbbbbbb000bbbbb00000000088988000000088988000000000000000000000000000088898000888980000000000000000000000000000000000000000000000
0bbbbb00000bbb000000000008880005550008880000044b00000000000044b00000088988000889880000000000000000000000000000000000000000000000
00bbb000000000000000000000000088888000000000bb4bb0000000000bb4bb00000088800000888000000044b0000044b00000000000000000000000000000
0000000000000000000000000000088988980000000bbbbbbb00000000bbbbbbb0000000000000000000000bb4bb000bb4bb0000000000000000000000000000
0000000000000000000000000000088888880000000bbbbbbb00000000bbbbbbb000000000000000000000bbbbbbb0bbbbbbb000000000000000000000000000
0000000000000000000000000000008889800000000bbbbbbb00000000bbbbbbb005550000000000000000bbbbbbb0bbbbbbb000000000000000000000000000
00000000000000000000000000000088988000000000bbbbb0000000000bbbbb0088888000000000000000bbbbbbb0bbbbbbb000000000000000000000000000
000000000000000000000000000000088800000000000bbb000000000000bbb008898898000000000000000bbbbb000bbbbb0000000000000000000000000000
00000000000000000000000000000000000000000000000000000044b0000000088888880000000000000000bbb00000bbb00000000000000000000000000000
00000000000000000000000000000000000000000000044b00000bb4bb0000000088898000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000bb4bb000bbbbbbb0000000889880000000000000000044b0000000000000000000000000000000000000
0000000000000000000000000000000000000000000bbbbbbb00bbbbbbb0000000088800000000000000000bb4bb000000000000555000005550000000000000
0000000000000000000000000000000000000000000bbbbbbb00bbbbbbb000000000000000000000000000bbbbbbb00000000008888800088888000000000000
0000000000000000000000000000000000000000000bbbbbbb000bbbbb0000000000000000000000000000bbbbbbb00000000088988980889889800000000000
00000000000000000000000000000000000000000000bbbbb00000bbb00000000000555000000000055500bbbbbbb00044b00088888880888888800000000000
000000000000000000000000000000000000000000000bbb000000000000000000088888000000008888800bbbbb000bb4bb0008889800088898000000000000
0000000000000000000000000000000000000000000000000000000000000000008898898000000889889800bbb000bbbbbbb008898800088988000000000000
0000000000000000000000000000000000000000000000000000000000000000008888888000000888888800000000bbbbbbb000888000008880000000000000
000000000000000000000000000000000000000000000000000000000000000000088898000000008889800044b000bbbbbbb000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000088988000555008898800bb4bb000bbbbb0000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000888000888880088800bbbbbbb000bbb00000555000000005550000000000
00000000000000000000000000000000000000000000000000000000000000000000000008898898000000bbbbbbb00000000008888800000088888000000000
00000000000000000000000000000000000000000000000000000000000000000000000008888888000000bbbbbbb00000000088988980000889889800000000
000000000000000000003000000030000000000000000000000000000000000000000000008889800000000bbbbb000000000088888880000888888800000000
0000000000000000000300000003000000000000000000000000000000000000000000000088988000000000bbb0000000000008889800000088898000000000
00000000000000000030300000303000000000000000000000000000000000000000000000088800000000000000000000000008898800000088988000000000
000000000000000003000300030003000000000000000000000000000000000000000000000000000000000044b0000044b00000888000000008880000000000
000000000000000088808880888088800000000000000000000000000000000000000000000000000000000bb4bb000bb4bb0000000000000000000000000000
00000000000000008e808e808e808e80000000000000000000000000000000000000000000000000000000bbbbbbb0bbbbbbb000555000005550000000000000
00000000000000008880888088808880000000000000000000000000000000000000000000000000000000bbbbbbb0bbbbbbb008888800088888000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbb0bbbbbbb088988980889889800000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb000bbbbb0088888880888888800000000000
0000000000000000000030000000300000000000000000000000000000000000000000000000000000000000bbb00000bbb00008889800088898000000000000
00000000000000000003000000030000000000000000000000000000000000000000000000000000000000000000000000000008898800088988000000000000
00000000000000000030300000303000000000000000000000000000000000000000000000000000000000000000000000000000888000008880000000000000
00000000000000000300030003000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000008880888088808880000000000000000000000000000000000000000000000000000000000000000000000000555000000005550000000000
00000000000000008e808e808e808e80000000000000000000000000000000000000000000000000000000000000000000000008888800000088888000000000
00000000000000008880888088808880000000000000000000000000000000000000000000000000000000000000000000000088988980000889889800000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000088888880000888888800000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008889800000088898000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008898800000088988000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000888000000008880000000000
__sfx__
000100001d7201e7201f72020720217202272025720297202e7202e72032700327003270011700117000b3000f30014300183001a3001d3002030022300223002330024300000000000000000000000000000000
0010000012010180101901023010270101a010130101a0101301023010250002a00000000000003d0003b70003700027000020001200002000020000200000000000000000000000000000000000000000000000
__music__
00 01424344

