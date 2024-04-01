function draw_player()
    spr(player.spr, player.x, player.y)
end

function draw_strawberries()
    for position in all(strawberries.positions) do
        spr(strawberries.spr, position[1], position[2])
    end 
end

function draw_skeletons()
    for position in all(skeletons.positions) do
        spr(skeletons.spr, position[1], position[2])
    end 
end

function draw_ships()
    for ship in all(ships) do
        if not (ship.status == "disabled") then spr(ship.spr, ship.x, ship.y) end
    end 
end

function draw_bullets()
    for bullet in all(bullets) do
        spr(bullet.spr, bullet.x, bullet.y)
    end
end

function draw_obstacles()
    for obstacle in all(obstacles) do
        if obstacle.type == "walls" then
            for position in all(obstacle.positions) do
                spr(5, position[1], position[2])
            end
        end
    end
end

function draw_grid(start, end_grid)
    row = start
    while row < end_grid do
        column = start
        while column < end_grid do
            is_void_obstacle = false
            for obstacle in all(obstacles) do
                if obstacle.type == "voids" then
                    for obstacle_position in all(obstacle.positions) do
                        if obstacle_position[1] == row and obstacle_position[2] == column then
                            is_void_obstacle = true
                            break
                        end
                    end
                end
            end
            if not is_void_obstacle then
                spr(16, row, column)
                spr(17, row, column)
            else
                spr(4, row, column)
            end
            column += 8
        end
        row += 8
    end
end