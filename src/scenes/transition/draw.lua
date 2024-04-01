function draw_transition()

    x_start = 16
    y_start = 32
    width = 10
    height = 7

    --first line
    spr(38, x_start, y_start)
    for i=1,width do
        spr(39, x_start + 8*i, y_start, 1, 1, false, true)
    end
    spr(38, x_start + (width+1)*8, y_start, 1, 1, true, false)


    --middle lines
    for j = 1, height do
        spr(40, x_start, y_start + j*8)
        for i=1,width do
            spr(41, x_start + 8*i, y_start + j*8)
        end
        spr(40, x_start + (width+1)*8, y_start + j*8, 1, 1, true, false)
    end

    --last line
    spr(38, x_start, y_start + (height+1)*8, 1, 1, false, true)
    for i=1,width do
        spr(39, x_start + 8*i, y_start + (height+1)*8)
    end
    spr(38, x_start + (width+1)*8, y_start + (height+1)*8, 1, 1, true, true)

    print(congrats_message, horizontal_center_text(#congrats_message), y_start+8, 14)

    for i=1,count(next_level_code) do
        local symbol_spr = 0
        if next_level_code[i] == 2 then
            symbol_spr = 0
        elseif next_level_code[i] == 0 then
            symbol_spr = 1
        elseif next_level_code[i] == 1 then
            symbol_spr = 3
        elseif next_level_code[i] == 3 then
            symbol_spr = 2
        end

        spr(symbol_spr, 48+8*(i-1), y_start+24)
    end

    local str = "press"
    print(str, horizontal_center_text(#str), 72, 14)
    local str = "any button"
    print(str, horizontal_center_text(#str), 80, 8)
    local str = "to continue"
    print(str, horizontal_center_text(#str), 88, 14)
end
