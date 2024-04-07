function move_player()
    dequeued_input = -1
    if count(player_input_queue) > 0 then dequeued_input = player_input_queue[1]
    end
    if dequeued_input == 0 then player.direction = "left"
    elseif dequeued_input == 1 then player.direction = "right"
    elseif dequeued_input == 2 then player.direction = "up"
    elseif dequeued_input == 3 then player.direction = "down"
    end

    if player.direction == "left" then
        update_player_spr(7, 11)
        player.x -= 8
    elseif player.direction == "right" then
        update_player_spr(6, 10)
        player.x += 8
    elseif player.direction == "up" then 
        update_player_spr(8, 12)
        player.y -= 8
    elseif player.direction == "down" then
        update_player_spr(9, 13)
        player.y += 8
    end
    
    
    del(player_input_queue, dequeued_input)
end

function update_player_spr(spr1, spr2) 
    if player_draw_counter % 2 == 0 then player.spr = spr1
    else player.spr = spr2
    end
end