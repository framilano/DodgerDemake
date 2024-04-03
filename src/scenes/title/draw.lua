function draw_title()
    cls(0)
    draw_grid(0, 128, 0, 128)
    
    draw_fruits()

    -- Press Z to START
    if (sin(global_vars.frame_counter / 30) <= 0) then
        str = "press "..chr(142).." to start"
        print(str, 33, 101, 2)
    end

    --for i=1, count(title_input_queue) do
    --    print(title_input_queue[i], 10, 18*i)
    --end
end
