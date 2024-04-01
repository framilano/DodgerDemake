function draw_title()
    cls(0)
    draw_grid(0, 128)
    
    spr(64, 4, 16, 64, 64)

    -- Press Z to START
    if (sin(global_vars.frame_counter / 30) <= 0) then
        str = "press"
        print(str, 33, 69 + 32, 2)
        spr(28, 55, 69 + 32)
        str = "to start"
        print(str, 65, 69 + 32, 2)
    end

    --for i=1, count(title_input_queue) do
    --    print(title_input_queue[i], 10, 18*i)
    --end
end
