function wait_stasis(ship) 
    if ship.stasis_frame_counter <= 0 then
        ship.status = "back_to_reload"
        return
    end
    ship.stasis_frame_counter -= 1
end

function search_player(ship)
    if ship.id == "left" or ship.id == "right" then
        -- if while searching we on direct sight, shoot
        if (ship.y == player.y) then
            ship.status = "shooting"
            return
        end
        -- if we're searching it means we just mean that we reached the opposites of the grid
        -- the player can't be over us if we're going and down and viceversa, if this happens, shoot! It just took over our position
        if (ship.direction_tick < 0 and ship.y <= player.y) or (ship.direction_tick > 0 and ship.y >= player.y) then 
            ship.status = "shooting"
        end

        -- keep moving if we can't find the enemy
        if ship.y == 112 then ship.direction_tick = -abs(ship.direction_tick) end
        if ship.y == 8 then ship.direction_tick = abs(ship.direction_tick) end
        if (sin(global_vars.frame_counter / ship.movement_rate) == 0) then ship.y += ship.direction_tick end
    elseif ship.id == "up" or ship.id == "down" then
        if (ship.x == player.x) then
            ship.status = "shooting"
            return
        end
       
        if (ship.direction_tick < 0 and ship.x <= player.x) or (ship.direction_tick > 0 and ship.x >= player.x) then 
            ship.status = "shooting"
        end

        if ship.x == 112 then ship.direction_tick = -abs(ship.direction_tick) end
        if ship.x == 8 then ship.direction_tick = abs(ship.direction_tick) end
        if (sin(global_vars.frame_counter / ship.movement_rate) == 0) then ship.x += ship.direction_tick end
    end
end

function shoot_player(ship)
    new_bullet = {
        from = ship.id,
        x = ship.x,
        y = ship.y
    }
    if ship.id == "left" then
        new_bullet["spr_start"] = {2, 1}
        new_bullet["height"] = 5
        new_bullet["width"] = 4
        new_bullet['speed'] = 8
        new_bullet['spr'] = 25
    elseif ship.id == "right" then
        new_bullet["spr_start"] = {2, 1}
        new_bullet["height"] = 5
        new_bullet["width"] = 4
        new_bullet['speed'] = -8
        new_bullet['spr'] = 25
    elseif ship.id == "up" then
        new_bullet["spr_start"] = {1, 2}
        new_bullet["height"] = 4
        new_bullet["width"] = 5
        new_bullet['speed'] = 8
        new_bullet['spr'] = 26
    elseif ship.id == "down" then
        new_bullet["spr_start"] = {1, 2}
        new_bullet["height"] = 4
        new_bullet["width"] = 5
        new_bullet['speed'] = -8
        new_bullet['spr'] = 26
    end
    add(bullets, new_bullet)

    ship.status = "stasis"
    ship.stasis_frame_counter = ship.stasis_duration * global_vars.fps 
end

function back_to_reload(ship)
    if ship.id == "left" or ship.id == "right" then
        if ship.y == 112 then 
            ship.status = "searching_player" 
            ship.direction_tick = -abs(ship.direction_tick)
        end
        if ship.y == 8 then 
            ship.status = "searching_player" 
            ship.direction_tick = abs(ship.direction_tick)
        end
        if (sin(global_vars.frame_counter / ship.movement_rate) == 0) then ship.y += ship.direction_tick end
    elseif ship.id == "up" or ship.id == "down" then
        if ship.x == 112 then 
            ship.status = "searching_player" 
            ship.direction_tick = -abs(ship.direction_tick)
        end
        if ship.x == 8 then 
            ship.status = "searching_player" 
            ship.direction_tick = abs(ship.direction_tick)
        end
        if (sin(global_vars.frame_counter / ship.movement_rate) == 0) then ship.x += ship.direction_tick end
    end
end