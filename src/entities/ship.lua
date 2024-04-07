function wait_stasis(type, ship) 
    if ship.stasis_ticks_counter <= 0 then
        ship.stasis_ticks_counter = 45
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
        if (ship.speed < 0 and ship.y <= player.y) or (ship.speed > 0 and ship.y >= player.y) then 
            ship.status = "shooting"
        end

        -- keep moving if we can't find the enemy
        if ship.y == 112 then ship.speed = -abs(ship.speed) end
        if ship.y == 8 then ship.speed = abs(ship.speed) end
        if sin(global_vars.frame_counter / ship.movement_rate) == 0 then ship.y += ship.speed end
    
    elseif type == "up" or type == "down" then
        if ship.x == player.x then
            ship.status = "shooting"
            return
        end
       
        if (ship.speed < 0 and ship.x <= player.x) or (ship.speed > 0 and ship.x >= player.x) then 
            ship.status = "shooting"
        end

        if ship.x == 112 then ship.speed = -abs(ship.speed) end
        if ship.x == 8 then ship.speed = abs(ship.speed) end
        if sin(global_vars.frame_counter / ship.movement_rate) == 0 then ship.x += ship.speed end
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
        new_bullet.movement_rate, 
        new_bullet.spr = {2, 1}, 5, 4, 5, 25
        new_bullet.x += 8
    elseif type == "right" then
        new_bullet.spr_start, 
        new_bullet.height,
        new_bullet.width,
        new_bullet.movement_rate,
        new_bullet.spr = {2, 1}, 5, 4, 5, 25
        new_bullet.x -= 8
    elseif type == "up" then
        new_bullet.spr_start, 
        new_bullet.height,
        new_bullet.width,
        new_bullet.movement_rate,
        new_bullet.spr = {1, 2}, 4, 5, 5, 26
        new_bullet.y += 8
    elseif type == "down" then
        new_bullet.spr_start,
        new_bullet.height,
        new_bullet.width,
        new_bullet.movement_rate,
        new_bullet.spr = {1, 2}, 4, 5, 5, 26
        new_bullet.y -= 8
    end
    add(bullets, new_bullet)

    ship.status,
    ship.stasis_frame_start = "stasis", global_vars.frame_counter 
end

function back_to_reload(type, ship)
    if type == "left" or type == "right" then
        if ship.y == 112 then 
            ship.status,
            ship.speed = "searching_player", -abs(ship.speed)
        end
        if ship.y == 8 then 
            ship.status,
            ship.speed = "searching_player", abs(ship.speed)
        end
        if sin(global_vars.frame_counter / ship.movement_rate) == 0 then ship.y += ship.speed end
    elseif type == "up" or type == "down" then
        if ship.x == 112 then 
            ship.status, 
            ship.speed = "searching_player", -abs(ship.speed)
        end
        if ship.x == 8 then 
            ship.status, 
            ship.speed = "searching_player", abs(ship.speed)
        end
        if sin(global_vars.frame_counter / ship.movement_rate) == 0 then ship.x += ship.speed end
    end
end