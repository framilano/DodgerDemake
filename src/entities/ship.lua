function wait_stasis(type, ship) 
    if ship.stasis_ticks_counter <= 0 then
        ship.stasis_ticks_counter = 6
        ship.status = "back_to_reload"
        return
    end

    ship.stasis_ticks_counter -= 1
end

function search_player(type, ship)
    if type == "left" or type == "right" then
        -- if while searching we on direct sight, shoot
        if ship.y == player.y then
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
        ship.y += ship.direction_tick
    elseif type == "up" or type == "down" then
        if (ship.x == player.x) then
            ship.status = "shooting"
            return
        end
       
        if (ship.direction_tick < 0 and ship.x <= player.x) or (ship.direction_tick > 0 and ship.x >= player.x) then 
            ship.status = "shooting"
        end

        if ship.x == 112 then ship.direction_tick = -abs(ship.direction_tick) end
        if ship.x == 8 then ship.direction_tick = abs(ship.direction_tick) end
        ship.x += ship.direction_tick
    end
end

function shoot_player(type, ship)
    new_bullet = {
        x = ship.x,
        y = ship.y,
        from = type
    }
    if type == "left" then
        new_bullet.spr_start,
        new_bullet.height,
        new_bullet.width,
        new_bullet.speed, 
        new_bullet.spr = {2, 1}, 5, 4, 8, 25
    elseif type == "right" then
        new_bullet.spr_start, 
        new_bullet.height,
        new_bullet.width,
        new_bullet.speed,
        new_bullet.spr = {2, 1}, 5, 4, -8, 25
    elseif type == "up" then
        new_bullet.spr_start, 
        new_bullet.height,
        new_bullet.width,
        new_bullet.speed,
        new_bullet.spr = {1, 2}, 4, 5, 8, 26
    elseif type == "down" then
        new_bullet.spr_start,
        new_bullet.height,
        new_bullet.width,
        new_bullet.speed,
        new_bullet.spr = {1, 2}, 4, 5, -8, 26
    end
    add(bullets, new_bullet)

    ship.status,
    ship.stasis_frame_start = "stasis", global_vars.frame_counter 
end

function back_to_reload(type, ship)
    if type == "left" or type == "right" then
        if ship.y == 112 then 
            ship.status,
            ship.direction_tick = "searching_player", -abs(ship.direction_tick)
        end
        if ship.y == 8 then 
            ship.status,
            ship.direction_tick = "searching_player", abs(ship.direction_tick)
        end
        ship.y += ship.direction_tick
    elseif type == "up" or type == "down" then
        if ship.x == 112 then 
            ship.status, 
            ship.direction_tick = "searching_player", -abs(ship.direction_tick)
        end
        if ship.x == 8 then 
            ship.status, 
            ship.direction_tick = "searching_player", abs(ship.direction_tick)
        end
        ship.x += ship.direction_tick
    end
end