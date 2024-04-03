function draw_end_screen()
    cls(0)
    draw_grid(0, 128, 0, 90)
    
    draw_fruits()

    if global_vars.level_1_start_frame == -1 then
        str = "time: -.-'"
    else
        str = "time: "..flr((end_screen_start_frame - global_vars.level_1_start_frame) / 30).." seconds"
    end
    print(str, horizontal_center_text(#str), 101, 2)

    -- Press Z to START
    if (sin(global_vars.frame_counter / 30) <= 0) then
        str = "press "..chr(142).." to quit"
        print(str, horizontal_center_text(#str+1), 112, 2)
    end
end
