function init_transition()
    transition_frame = global_vars.frame_counter
    ignore_inputs_duration = 1 --seconds to ignore input, so people can't skip to next level immediately

    next_levels_code = global_vars.levels_codes[global_vars.current_level]
    congrats_message = global_vars.levels_messages[global_vars.current_level]
end