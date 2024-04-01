function move_player()

    update_input_queue()

    if sin(global_vars.frame_counter / 5) == 0 then
        dequeued_input = -1
        if count(input_queue) > 0 then 
            dequeued_input = input_queue[1]
        end
        if dequeued_input == 0 then player.direction = "l"
        elseif dequeued_input == 1 then player.direction = "r"
        elseif dequeued_input == 2 then player.direction = "u"
        elseif dequeued_input == 3 then player.direction = "d"
        end

        if player.direction == 'l' then
            update_player_spr(7, 11)
            player.x -= 8
        elseif(player.direction == 'r') then
            update_player_spr(6, 10)
            player.x += 8
        elseif(player.direction == 'u') then 
            update_player_spr(8, 12)
            player.y -= 8
        elseif(player.direction == 'd') then
            update_player_spr(9, 13)
            player.y += 8
        end
        
        
        del(input_queue, dequeued_input)
    end
end

function update_player_spr(spr1, spr2) 
    if player_draw_counter % 2 == 0 then
        player.spr = spr1
    else
        player.spr = spr2
    end
end

function update_input_queue()

    if (count(input_queue) > 5) then input_queue = {} end

    if btnp(0) then 
        add(input_queue, 0)
        return
    end

    if btnp(1) then 
        add(input_queue, 1)
        return
    end

    if btnp(2) then 
        add(input_queue, 2)
        return
    end

    if btnp(3) then 
        add(input_queue, 3)
        return
    end
end