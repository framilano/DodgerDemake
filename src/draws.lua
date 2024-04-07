function draw_title()
    cls(0)
    draw_grid(0, 128, 0, 128)
    
    _draw_title_screen_fruits()

    -- Press Z to START
    if sin(global_vars.frame_counter / 28) <= 0 then
        str = "press "..chr(142).." to start"
        print(str, 33, 101, 2)
    end

    --for i=1, count(title_input_queue) do
    --    print(title_input_queue[i], 10, 18*i)
    --end
end

function draw_transition()
    x_start,
    y_start,
    width,
    height = 16, 32, 10, 7
    
    --first line
    spr(38, x_start, y_start)
    for i=1,width do
        spr(39, x_start + 8*i, y_start, 1, 1, false, true)
    end
    spr(38, x_start + (width+1)*8, y_start, 1, 1, true, false)


    --middle lines
    for j = 1, height do
        spr(40, x_start, y_start + j*8)
        for i=1,width do
            spr(41, x_start + 8*i, y_start + j*8)
        end
        spr(40, x_start + (width+1)*8, y_start + j*8, 1, 1, true, false)
    end

    --last line
    spr(38, x_start, y_start + (height+1)*8, 1, 1, false, true)
    for i=1,width do
        spr(39, x_start + 8*i, y_start + (height+1)*8)
    end
    spr(38, x_start + (width+1)*8, y_start + (height+1)*8, 1, 1, true, true)

    print(congrats_message, horizontal_center_text(#congrats_message), y_start+8, 14)

    for i=1,count(next_levels_code) do
        local symbol_spr = 0
        if next_levels_code[i] == 2 then symbol_spr = 0
        elseif next_levels_code[i] == 0 then symbol_spr = 1
        elseif next_levels_code[i] == 1 then symbol_spr = 3
        elseif next_levels_code[i] == 3 then symbol_spr = 2
        end

        spr(symbol_spr, 48+8*(i-1), y_start+24)
    end

    local str = "press"
    print(str, horizontal_center_text(#str), 72, 14)
    local str = "any button"
    print(str, horizontal_center_text(#str), 80, 8)
    local str = "to continue"
    print(str, horizontal_center_text(#str), 88, 14)
end

function draw_end_screen()
    cls(0)
    draw_grid(0, 128, 0, 90)
    
    _draw_end_screen_fruits()

    if global_vars.level_1_start_frame == -1 then str = "time: -.-'"
    else str = "time: "..flr((end_screen_start_frame - global_vars.level_1_start_frame) / 30).." seconds"
    end
    print(str, horizontal_center_text(#str), 101, 2)

    -- Press Z to START
    if sin(global_vars.frame_counter / 28) <= 0 then
        str = "press "..chr(142).." to quit"
        print(str, horizontal_center_text(#str+1), 112, 2)
    end
end

function draw_level()
    cls(0)

    player_draw_counter += 1
    draw_grid(8, 120, 8, 120)
    
    draw_fruits()
    draw_skeletons()
    
    
    draw_obstacles()
    
    draw_ships()
    draw_bullets()
    
    draw_player()

    --print(count(fruits[1].positions), 10, 10)
    --print(count(fruits[2].positions), 10, 18)
    --print(ships[3].status, 10, 10)
    --print(global_vars.hp, 10, 10)
    --print(dequeued_input, 10, 10)
end

function _draw_title_screen_fruits()
    for type, fruit in pairs(fruits) do
        for position in all(fruit.positions) do
            if type == "cherry" then
                spr(fruit.spr, position[1], position[2])
            else
                if sin(global_vars.frame_counter / 28) <= 0 then
                    spr(fruit.spr, position[1], position[2] + 2)
                else
                    spr(fruit.spr, position[1], position[2] - 2)
                end
            end
        end
    end
end

function _draw_end_screen_fruits()
    for type, fruit in pairs(fruits) do
        for position in all(fruit.positions) do
            if sin(global_vars.frame_counter / 28) <= 0 then
                spr(fruit.spr, position[1], position[2] + 2)
            else
                spr(fruit.spr, position[1], position[2] - 2)
            end
        end
    end
end


