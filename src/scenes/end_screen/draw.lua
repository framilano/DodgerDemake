function draw_end_screen()
    cls(0)
    draw_grid(0, 128, 0, 90)
    
    draw_end_screen_fruits()

    if global_vars.level_1_start_frame == -1 then
        str = "time: -.-'"
    else
        str = "time: "..flr((end_screen_start_frame - global_vars.level_1_start_frame) / 30).." seconds"
    end
    print(str, horizontal_center_text(#str), 101, 2)

    -- Press Z to START
    if (sin(global_vars.frame_counter / 28) <= 0) then
        str = "press "..chr(142).." to quit"
        print(str, horizontal_center_text(#str+1), 112, 2)
    end
end

function draw_end_screen_fruits()
    for fruit in all(fruits) do
        for position in all(fruit.positions) do
            if (sin(global_vars.frame_counter / 28) <= 0) then
                spr(fruit.spr, position[1], position[2] + 2)
            else
                spr(fruit.spr, position[1], position[2] - 2)
            end
        end
    end
end
