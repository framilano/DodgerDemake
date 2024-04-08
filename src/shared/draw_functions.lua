function draw_player()
    spr(player.spr, player.x, player.y)
end

function draw_fruits()
    for type, fruit in pairs(fruits) do
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
    for type, ship in pairs(ships) do
        if ship.status != "disabled" then spr(ship.spr, ship.x, ship.y) end
    end 
end

function draw_bullets()
    for bullet in all(bullets) do
        spr(bullet.spr, bullet.x, bullet.y)
    end
end

function draw_obstacles()
    for position in all(obstacles.walls.positions) do
        spr(5, position[1], position[2])
    end
end

function draw_grid(x_start, x_end, y_start, y_end)
    row = y_start
    while row < y_end do
        column = x_start
        while column < x_end do
            is_void_obstacle = false
            for obstacle_position in all(obstacles.voids.positions) do
                if obstacle_position[1] == column and obstacle_position[2] == row then
                    is_void_obstacle = true
                    break
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