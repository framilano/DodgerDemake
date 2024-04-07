function update_transition()

    -- if the current level is higher than the available indexes for levels code, then the game has finished!
    if global_vars.current_level > count(global_vars.levels_codes) then
        change_mode_and_reset("end_screen")
        return
    end

    -- ignoring inputs at first, so people cant skip immediately
    if global_vars.frame_counter < transition_frame + global_vars.ignore_inputs_duration*global_vars.fps then 
        return
    end

    if btnp(0) or btnp(1) or btnp(2) or btnp(3) or btnp(4) or btnp(5) then
        next_level = "level_"..tostr(global_vars.current_level + 1)
        global_vars.current_level += 1
        change_mode_and_reset(next_level)
    end
end

function update_title()

    -- checks if user is requesting a new palette color
    _check_for_color_palette_changer()
    

    -- checks if user is using a new level code
    for i=1,count(global_vars.levels_codes) do
        local go_to_level = _check_for_code(global_vars.levels_codes[i])
        if btnp(4) and go_to_level then
            level_number = tonum(i+1)
            global_vars.current_level = level_number
            change_mode_and_reset("level_"..level_number)
            return
        end
    end

    if btnp(4) then
        global_vars.current_level = 1
        global_vars.level_1_start_frame = global_vars.frame_counter
        change_mode_and_reset("level_1")
        return
    end

    update_title_input_queue()
end

function _check_for_color_palette_changer()
    if btnp(5) then
        if dget(0) == 0 then use_alternative_color_palette(1)
        else use_alternative_color_palette(0)
        end
    end
end

function _check_for_code(code_list)
    for i=1, count(title_input_queue) do
        if title_input_queue[i] == code_list[1] then
            for j=2, count(code_list) do
                i += 1
                if code_list[j] != title_input_queue[i] then return false end
            end
            return true
        end
    end
    return false
end

function update_title_input_queue()

    if count(title_input_queue) > 5 then title_input_queue = {} end

    if btnp(0) then 
        add(title_input_queue, 0)
        return
    end

    if btnp(1) then 
        add(title_input_queue, 1)
        return
    end

    if btnp(2) then 
        add(title_input_queue, 2)
        return
    end

    if btnp(3) then 
        add(title_input_queue, 3)
        return
    end


    --resetting when user click on 4
    if btnp(4) then 
        title_input_queue = {}
    end
end

function update_end_screen()

    -- ignoring inputs at first, so people cant skip immediately
    if global_vars.frame_counter < end_screen_start_frame + global_vars.ignore_inputs_duration*global_vars.fps then 
        return
    end

    if btnp(4) then
        change_mode_and_reset("title")
        return
    end
end

function update_level()
    _update_player_input_queue()
    
    check_fruits_eating()
    
    if sin(global_vars.frame_counter / 12) == 0 then
        handle_ships()
    end
    
    if sin(global_vars.frame_counter / 5) == 0 then    
        handle_player()
        handle_bullets()
        check_bullets_collision()
        check_skeletons_impact()
    end
end


function _update_player_input_queue()

    if count(player_input_queue) > 3 then player_input_queue = {} end

    if btnp(0) then 
        add(player_input_queue, 0)
        return
    end

    if btnp(1) then 
        add(player_input_queue, 1)
        return
    end

    if btnp(2) then 
        add(player_input_queue, 2)
        return
    end

    if btnp(3) then 
        add(player_input_queue, 3)
        return
    end
end