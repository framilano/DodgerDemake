function draw_player()
    spr(player.spr, player.x, player.y)
end

function draw_fruits()
    for fruit in all(fruits) do
        for position in all(fruit.positions) do
            spr(fruit.spr, position[1], position[2])
        end
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

function draw_grid(x_start, x_end, y_start, y_end)
    row = y_start
    while row < y_end do
        column = x_start
        while column < x_end do
            is_void_obstacle = false
            for obstacle in all(obstacles) do
                if obstacle.type == "voids" then
                    for obstacle_position in all(obstacle.positions) do
                        if obstacle_position[1] == column and obstacle_position[2] == row then
                            is_void_obstacle = true
                            break
                        end
                    end
                end
            end
            if not is_void_obstacle then
                spr(16, column, row)
                spr(17, column, row)
            else
                spr(4, column, row)
            end
            column += 8
        end
        row += 8
    end
end