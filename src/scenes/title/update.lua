function update_title()

    local go_to_two = check_for_code(global_vars.two_code)

    --level two
    if btn(4) and go_to_two then
        change_mode_and_reset("level_two")
        return
    end

    --level one
    if btn(4) then
        change_mode_and_reset("level_one")
    end

    update_title_input_queue()
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