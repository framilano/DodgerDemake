function handle_player()
    if player.status == "living" then move_player() end
    if player.status == "dying" then death_event() end
    check_player_boundaries()
end

function death_event()
    for type, ship in pairs(ships) do
        ship.status = "disabled"
    end

    for bullet in all(bullets) do
        del(bullets, bullet)
    end

    local frames_diff = global_vars.frame_counter - death_frame
    local index = flr(frames_diff / 5)
    if index > 4 then 
        if global_vars.hp > 0 then reset_ships_and_player()
        else change_mode_and_reset("title") end
        return
    end 
    player.spr = player.death_sprites[index+1]

end

function check_player_boundaries()
    if player.x < 8 then
        player_draw_counter,    -- stopping animation when on boundaries, like the original
        player.x = 0, 8
    end

    if player.x > 112 then
        player_draw_counter,
        player.x = 0, 112
    end

    if player.y < 8 then
        player_draw_counter,
        player.y = 0, 8
    end

    if player.y > 112 then
        player_draw_counter,
        player.y = 0, 112
    end

    -- checking obstacles
    for type, obstacle in pairs(obstacles) do
        for position in all(obstacle.positions) do
            if position[1] == player.x and position[2] == player.y then
                player_draw_counter = 0
                if player.direction == "up" then player.y += 8 end
                if player.direction == "down" then player.y -= 8 end
                if player.direction == "left" then player.x += 8 end
                if player.direction == "right" then player.x -= 8 end
            end
        end
    end

end

function check_fruits_eating()
    local all_eaten = true
    for type, fruit in pairs(fruits) do
        for position in all(fruit.positions) do
            if player.x == position[1] and player.y == position[2] then
                sfx(0)
                del(fruit.positions, position)
            end
        end
        if count(fruit.positions) != 0  then
            all_eaten = false
        end
    end
    if all_eaten then change_mode_and_reset("transition") end
end

function check_skeletons_impact()
    for position in all(skeletons.positions) do
        if player.x == position[1] and player.y == position[2] and player.status == "living" then
            global_vars.hp,
            death_frame,
            player.status = global_vars.hp - 1, global_vars.frame_counter, "dying"
            music(0)
            return
        end
    end
end

function check_bullets_collision() 
    for bullet in all(bullets) do
        if  (player.x == bullet.x and player.y == bullet.y) or
            (player.direction == "up" and bullet.from == "up" and player.x == bullet.x and player.y == bullet.y - 8) or
            (player.direction == "down" and bullet.from == "down" and player.x == bullet.x and player.y == bullet.y + 8) or
            (player.direction == "left" and bullet.from == "left" and player.y == bullet.y and player.x == bullet.x - 8) or
            (player.direction == "right" and bullet.from == "right" and player.y == bullet.y and player.x == bullet.x + 8) then
                del(bullets, bullet)
                global_vars.hp,
                death_frame,
                player.status = global_vars.hp - 1, global_vars.frame_counter, "dying"
                music(0)
                return
        end
    end
end

function handle_ships()
    for type, ship in pairs(ships) do
        if ship.status == "disabled" then end
        if ship.status == "searching_player" then search_player(type, ship) end
        if ship.status == "shooting" then shoot_player(type, ship) end
        if ship.status == "back_to_reload" then back_to_reload(type, ship) end
        if ship.status == "stasis" then wait_stasis(type, ship) end
    end
end

function handle_bullets()
    for bullet in all(bullets) do
        if (bullet.x > 120 or bullet.x < 0 or bullet.y > 120 or bullet.x < 0) then
            del(bullets, bullet)
        end
        if bullet.from == "left" or bullet.from == "right" then
            bullet.x += bullet.speed
        elseif bullet.from == "down" or bullet.from == "up" then
            bullet.y += bullet.speed
        end
    end
end

function reset_ships_and_player()
    player.x,
    player.y,
    player.status,
    player.direction,
    player.previous_direction,
    player.spr,
    player_input_queue = player.spawn_x, player.spawn_y, "living", "s", "s", 10, {}

    for type, ship in pairs(ships) do
        ship.x,
        ship.y,
        ship.status,
        ship.direction_tick = ship.spawn_x, ship.spawn_y, ship.spawn_status, ship.spawn_direction_tick
    end
end