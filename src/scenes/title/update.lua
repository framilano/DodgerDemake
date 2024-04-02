function update_title()

    -- checks if user is requesting a new palette color
    check_for_color_palette_changer()
    

    -- checks if user is using a new level code
    for i=1,count(global_vars.levels_codes) do
        local go_to_level = check_for_code(global_vars.levels_codes[i])
        if btn(4) and go_to_level then
            level_number = tonum(i+1)
            change_mode_and_reset("level_"..level_number)
            return
        end
    end

    if btn(4) then
        change_mode_and_reset("level_1")
        return
    end

    animate_dodger_screen()

    update_title_input_queue()
end

function check_for_color_palette_changer()
    if btnp(5) then
        if dget(0) == 0 then use_alternative_color_palette(1)
        else use_alternative_color_palette(0)
        end
    end
end

function update_title_input_queue()

    if count(title_input_queue) > 5 then title_input_queue = {} end

    if btnp(0) then 
        add(title_input_queue, 0)
        return
    end

    if btnp(1) then 
        add(title_input_queue, 1)
        return
    end

    if btnp(2) then 
        add(title_input_queue, 2)
        return
    end

    if btnp(3) then 
        add(title_input_queue, 3)
        return
    end


    --resetting when user click on 4
    if btnp(4) then 
        title_input_queue = {}
    end
end

function check_for_code(code_list)
    for i=1, count(title_input_queue) do
        if title_input_queue[i] == code_list[1] then
            for j=2, count(code_list) do
                i += 1
                if code_list[j] != title_input_queue[i] then return false end
            end
            return true
        end
    end
    return false
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