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
        change_mode_and_reset(next_level)
    end
end