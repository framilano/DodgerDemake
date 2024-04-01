function draw_level_two()

    player_draw_counter += 1
    cls(0)
    draw_grid(8, 120)
    
    draw_strawberries()
    draw_skeletons()
    
    
    draw_obstacles()
    
    draw_ships()
    draw_bullets()
    
    draw_player()
    --print(ships[3].status, 10, 10)
    --print(global_vars.hp, 10, 10)
    --print(dequeued_input, 10, 10)
end