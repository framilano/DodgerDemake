function update_transition()
    -- ignoring inputs at first, so people cant skip immediately
    if global_vars.frame_counter < transition_frame + ignore_inputs_duration*global_vars.fps then 
        return
    end

    if btnp(0) or btnp(1) or btnp(2) or btnp(3) or btnp(4) or btnp(5) then
        next_level = "level_"..tostr(global_vars.current_level + 1)
        change_mode_and_reset(next_level)
    end
end