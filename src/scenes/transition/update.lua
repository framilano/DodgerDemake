function update_transition()
    -- ignoring inputs at first, so people cant skip immediately
    if global_vars.frame_counter < transition_frame + ignore_inputs_duration*global_vars.fps then 
        return
    end

    if btnp(0) or btnp(1) or btnp(2) or btnp(3) or btnp(4) or btnp(5) then
        if global_vars.current_level == "one" then
            change_mode_and_reset("level_two")
        elseif global_vars.current_level == "two" then
            change_mode_and_reset("level_three")
        elseif global_vars.current_level == "three" then
            change_mode_and_reset("level_four")
        end
    end
end