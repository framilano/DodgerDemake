function draw_title()
    cls(0)
    draw_grid(0, 128, 0, 128)
    
    draw_title_screen_fruits()

    -- Press Z to START
    if (sin(global_vars.frame_counter / 28) <= 0) then
        str = "press "..chr(142).." to start"
        print(str, 33, 101, 2)
    end

    --for i=1, count(title_input_queue) do
    --    print(title_input_queue[i], 10, 18*i)
    --end
end

function draw_title_screen_fruits()
    for fruit in all(fruits) do
        for position in all(fruit.positions) do
            if fruit.type == "cherry" then
                spr(fruit.spr, position[1], position[2])
            else
                if (sin(global_vars.frame_counter / 28) <= 0) then
                    spr(fruit.spr, position[1], position[2] + 2)
                else
                    spr(fruit.spr, position[1], position[2] - 2)
                end
            end
        end
    end
end
