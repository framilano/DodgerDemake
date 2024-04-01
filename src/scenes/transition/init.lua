function init_transition()
    congrats_message = ""
    next_level_code = {}

    transition_frame = global_vars.frame_counter
    ignore_inputs_duration = 1.5 --seconds to ignore input, so people can't skip to next level immediately

    if global_vars.current_level == "one" then
        congrats_message = "congrats!"
        next_level_code = global_vars.two_code
    elseif global_vars.current_level == "two" then
        congrats_message = "nice!"
        next_level_code = global_vars.three_code
    elseif global_vars.current_level == "three" then
        congrats_message = "cool!"
        next_level_code = global_vars.four_code
    end
end