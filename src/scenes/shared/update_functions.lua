function handle_player()
    if player.status == "living" then move_player() end
    if player.status == "dying" then death_event() end
    check_player_boundaries()
end

function death_event()
    for ship in all(ships) do
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
        player_draw_counter = 0    -- stopping animation when on boundaries, like the original
        player.x = 8
    end

    if player.x > 112 then
        player_draw_counter = 0
        player.x = 112
    end

    if player.y < 8 then
        player_draw_counter = 0
        player.y = 8
    end

    if player.y > 112 then
        player_draw_counter = 0
        player.y = 112
    end

    -- checking obstacles
    for obstacle in all(obstacles) do
        for position in all(obstacle.positions) do
            if position[1] == player.x and position[2] == player.y then
                player_draw_counter = 0
                if player.direction == "u" then player.y += 8 end
                if player.direction == "d" then player.y -= 8 end
                if player.direction == "l" then player.x += 8 end
                if player.direction == "r" then player.x -= 8 end
            end
        end
    end

end

function check_fruits_eating()
    local all_eaten = true
    for fruit in all(fruits) do
        for position in all(fruit.positions) do
            if player.x == position[1] and player.y == position[2] then
                sfx(0)
                del(fruit.positions, position)
            end
        end
        if count(fruit.positions) != 0 then
            all_eaten = false
        end
    end
    if all_eaten then change_mode_and_reset("transition") end
end

function check_skeletons_impact()
    for position in all(skeletons.positions) do
        if player.x == position[1] and player.y == position[2] and player.status == "living" then
            global_vars.hp -= 1
            death_frame = global_vars.frame_counter
            player.status = "dying"
            music(0)
            return
        end
    end
end

function check_bullets_collision() 
    for bullet in all(bullets) do
        if (is_colliding(player, bullet)) then
            global_vars.hp -= 1
            death_frame = global_vars.frame_counter
            player.status = "dying"
            music(0)
            return
        end
    end
end

function handle_ships()
    for ship in all(ships) do
        if ship.status == "disabled" then
        elseif ship.status == "back_to_reload" then back_to_reload(ship)
        elseif ship.status == "stasis" then wait_stasis(ship)
        elseif ship.status == "searching_player" then search_player(ship)
        elseif ship.status == "shooting" then shoot_player(ship)
        end
    end
end

function handle_bullets()
    for bullet in all(bullets) do
        if (bullet.x > 120 or bullet.x < 0 or bullet.y > 120 or bullet.x < 0) then
            del(bullets, bullet)
        end
        if bullet.from == "left" or bullet.from == "right" then
            if (sin(global_vars.frame_counter / 5) == 0) then bullet.x += bullet.speed end
        elseif bullet.from == "down" or bullet.from == "up" then
            if (sin(global_vars.frame_counter / 5) == 0) then bullet.y += bullet.speed end
        end
    end
end

function reset_ships_and_player()
    player.x = player.spawn_x
    player.y = player.spawn_y
    player.status = "living"
    player.direction = "s"
    player.previous_direction = "s"
    player.spr = 10
    input_queue = {}

    for ship in all(ships) do
        ship.x = ship.spawn_x
        ship.y = ship.spawn_y
        ship.status = ship.spawn_status
        ship.direction_tick = ship.spawn_direction_tick
    end
end