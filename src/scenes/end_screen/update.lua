function update_end_screen()

    -- ignoring inputs at first, so people cant skip immediately
    if global_vars.frame_counter < end_screen_start_frame + global_vars.ignore_inputs_duration*global_vars.fps then 
        return
    end

    if btnp(4) then
        change_mode_and_reset("title")
        return
    end

    animate_dodger_screen()
end

function animate_dodger_screen()
    for fruit in all(fruits) do
        if fruit.type == "apple" or fruit.type == "strawberry" then
            if (sin(global_vars.frame_counter / 28) == 1) then
                for position in all(fruit.positions) do
                    position[2] += 2
                end
            end

            if (sin(global_vars.frame_counter / 28) == -1) then
                for position in all(fruit.positions) do
                    position[2] -= 2
                end
            end
        end
    end
end