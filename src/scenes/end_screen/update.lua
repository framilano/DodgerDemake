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