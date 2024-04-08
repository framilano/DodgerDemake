function init_title()
    -- Whenever entering title, reset level_1_start_frame to -1
    global_vars.level_1_start_frame, global_vars.hp, title_input_queue = -1, 3, {}

    fruits = {
        strawberry = {
            spr = 18,
            spr_start = {0, 0},
            positions = get_coordinates_from_string
            "27,24,27,32,33,18,33,38,39,24,39,32,69,42,70,51,72,33,77,56,80,33,83,51,106,48,106,57,106,65,106,73,114,48,114,65,117,57,117,73"
        },
        cherry = {
            spr = 20,
            spr_start = {0, 0},
            positions = get_coordinates_from_string
            "20,60,20,69,28,60,28,69"
        },
        apple = {
            spr = 32,
            spr_start = {0, 0},
            positions = get_coordinates_from_string
            "4,9,4,17,4,25,4,33,13,10,13,32,19,17,19,25,47,22,47,30,47,38,47,46,56,23,56,45,62,30,62,38,90,39,90,47,90,55,90,63,98,39,98,51,98,63"
        }
    }

    obstacles = {
        voids = {
            positions = {}
        }
    }

    -- Removing grid around message
    for x = 0, 128, 8 do
        add(obstacles.voids.positions, {x, 96})
        add(obstacles.voids.positions, {x, 104})
    end
end

function init_transition()
    transition_frame, next_levels_code, congrats_message =
        global_vars.frame_counter,
        global_vars.levels_codes[global_vars.current_level],
        global_vars.levels_messages[global_vars.current_level]
end

function init_end_screen()

    end_screen_start_frame = global_vars.frame_counter

    fruits = {
        strawberry = {
            spr = 18,
            spr_start = {0, 0},
            positions = get_coordinates_from_string
            "10,9,10,53,10,62,10,71,10,80,12,18,16,27,20,56,20,77,21,36,24,67,28,28,35,36,37,61,37,72,40,27,44,18,44,53,44,80,46,9,51,61,51,72,60,9,60,18,60,27,60,36,67,53,67,62,67,71,67,80,69,9,69,23,69,36,75,58,78,67,81,9,81,18,81,27,81,36,81,75,89,53,89,62,89,71,89,80,90,36,103,9,103,18,103,27,103,36,103,53,103,62,103,71,103,80,112,36,112,53,112,67,112,80"
        }
    }
end

function entities_initializer()
    -- saving every bullets on fields
    bullets, -- counts how many times the player is drawn, used to check if we should show an open or closed mouth sprite
    player_draw_counter, -- saving the death frame to have a starting point for the death animation
    death_frame, -- inputs queue containing arrow inputs from the user
    player_input_queue = {}, 0, 0, {}

    player = {
        status = "living", -- living/dying
        previous_direction = 's',
        direction = 's',
        spr = 10,
        spr_start = {0, 0},
        height = 7,
        width = 7,
        death_sprites = {33, 34, 35, 36, 37},
        movement_rate = 5
    }

    ships = {
        left = {
            spawn_x = 0,
            spawn_y = 112,
            x = 0,
            y = 112,
            spawn_status = "searching_player",
            status = "searching_player",
            spr = 23,
            spawn_speed = -8,
            speed = -8,
            stasis_ticks_counter = 45,
            movement_rate = 5
        },
        right = {
            spawn_x = 120,
            spawn_y = 8,
            x = 120,
            y = 8,
            spawn_status = "searching_player",
            status = "searching_player",
            spr = 22,
            spawn_speed = 8,
            speed = 8,
            stasis_ticks_counter = 45,
            movement_rate = 5
        },
        up = {
            spawn_x = 8,
            spawn_y = 0,
            x = 8,
            y = 0,
            spawn_status = "searching_player",
            status = "searching_player",
            spr = 24,
            spawn_speed = 8,
            speed = 8,
            stasis_ticks_counter = 45,
            movement_rate = 5
        },
        down = {
            spawn_x = 112,
            spawn_y = 120,
            x = 112,
            y = 120,
            spawn_status = "searching_player",
            status = "searching_player",
            spr = 21,
            spawn_speed = -8,
            speed = -8,
            stasis_ticks_counter = 45,
            movement_rate = 5
        }
    }

    fruits = {
        apple = {spr = 32, spr_start = {0, 0}, positions = {}},
        strawberry = {spr = 18, spr_start = {0, 0}, positions = {}},
        cherry = {spr = 20, spr_start = {0, 0}, positions = {}}
    }

    skeletons = {spr = 19}

    obstacles = {voids = {}, walls = {}}
end

function init_level_1()
    entities_initializer()

    for type, ship in pairs(ships) do
        ship.movement_rate = 9
    end

    player.spawn_x, player.spawn_y, player.x, player.y = 64, 64, 64, 64

    fruits.apple.positions = get_coordinates_from_string 
    "16,24,16,32,16,40,16,48,16,56,16,64,16,72,16,80,16,88,16,96,24,24,24,96,32,32,32,88,40,40,40,80,48,24,48,32,48,88,48,96,56,24,56,96,64,24,64,96,72,24,72,32,72,88,72,96,80,40,80,80,88,32,88,88,96,24,96,96,104,24,104,32,104,40,104,48,104,56,104,64,104,72,104,80,104,88,104,96"
end

function init_level_2()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 80, 72, 80, 72

    fruits.strawberry.positions = get_coordinates_from_string
    "16,40,16,72,24,32,24,64,32,24,32,56,32,96,40,48,40,88,48,40,48,80,56,32,56,72,64,24,64,64,72,56,72,96,80,48,80,88,88,40,88,80,96,32,96,72,104,24,104,64"
    
    obstacles.voids.positions = get_coordinates_from_string
    "8,8,8,16,8,32,8,40,8,48,8,104,8,112,16,8,16,112,40,8,40,112,48,8,48,104,48,112,72,8,80,8,80,16,80,112,88,8,88,16,88,104,88,112,96,8,96,16,96,112,104,8,104,40,104,48,104,80,104,88,112,32,112,40,112,48,112,56,112,72,112,80,112,88,112,96"

end

function init_level_3()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 72, 88, 72, 88

    ships.left.spawn_status = "disabled"
    ships.left.status = "disabled"
    ships.down.spawn_status = "disabled"
    ships.down.status = "disabled"

    fruits.strawberry.positions = get_coordinates_from_string
    "56,8,64,16,72,8,80,16,88,8"
    
    fruits.cherry.positions = get_coordinates_from_string
    "16,16,24,24,32,16,48,48,48,64,72,48,72,64,80,96,88,104,96,96,104,104"

    obstacles.voids.positions = get_coordinates_from_string
    "40,48,40,56,40,64,48,40,48,72,56,72,64,72,72,40,72,72,80,48,80,56,80,64"

    obstacles.walls.positions = get_coordinates_from_string
    "8,8,8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,16,8,16,96,24,8,24,32,24,40,24,48,24,96,32,8,32,32,32,96,40,8,40,16,40,24,40,96,48,96,56,24,64,24,72,24,72,96,72,104,72,112,80,24,80,88,80,112,88,24,88,88,88,112,96,24,96,64,96,72,96,80,96,88,96,112,104,112,112,56,112,64,112,72,112,80,112,88,112,96,112,104,112,112"
end

function init_level_4()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 56, 72, 56, 72

    fruits.strawberry.positions = get_coordinates_from_string
    "32,32,32,88,88,32,88,88"
    fruits.cherry.positions = get_coordinates_from_string
    "16,16,16,104,104,16,104,104"
    fruits.apple.positions = get_coordinates_from_string
    "48,48,48,72,72,48,72,72"

    obstacles.walls.positions = get_coordinates_from_string
    "24,24,24,32,24,40,24,48,24,56,24,64,24,72,24,80,24,88,24,96,32,24,32,96,40,24,40,40,40,48,40,56,40,64,40,72,40,80,40,96,48,24,48,40,48,80,56,24,56,56,56,80,64,24,64,56,64,80,72,24,72,40,72,80,80,24,80,40,80,48,80,56,80,64,80,72,80,80,80,96,88,24,88,96,96,24,96,32,96,40,96,48,96,56,96,64,96,72,96,80,96,88,96,96"
end

function init_level_5()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 24, 88, 24, 88

    ships.left.spawn_status = "disabled"
    ships.left.status = "disabled"

    fruits.strawberry.positions = get_coordinates_from_string
    "88,88,88,96,88,104,104,88,104,96"

    fruits.cherry.positions = get_coordinates_from_string
    "56,16,64,8,64,16,72,8,72,16,80,8,80,16,88,8,88,16,96,8,104,8"

    fruits.apple.positions = get_coordinates_from_string
    "88,40,88,48,96,40,96,48,112,40,112,48"

    obstacles.voids.positions = get_coordinates_from_string
    "8,8,8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,8,96,8,104,8,112,16,8,16,16,16,24,16,32,16,40,16,48,16,56,16,64,16,104,16,112,24,8,24,16,24,24,24,40,24,48,24,104,24,112,32,8,32,16,32,24,32,40,32,112,40,8,40,16,40,24,48,8,48,16,56,8,96,112,104,104,104,112,112,96,112,104,112,112"

    obstacles.walls.positions = get_coordinates_from_string
    "24,32,32,32,40,32,48,32,56,80,56,88,64,32,64,80,64,88,72,32,72,40,72,72,72,80,72,88,80,32,80,40,80,48,80,56,80,72,80,80,80,88,88,32,88,72,88,80,96,32,96,80,104,32,104,40,104,48,104,56,104,80,112,32"
end

function init_level_6()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 56, 56, 56, 56

    fruits.strawberry.positions = get_coordinates_from_string
    "16,16,16,24,16,32,16,40,16,48,16,56,16,64,16,72,16,80,16,88,16,96,16,104,24,16,24,104,32,16,32,104,40,16,40,104,48,16,48,104,56,16,56,104,64,16,64,104,72,16,72,104,80,16,80,104,88,16,88,104,96,16,96,104,104,16,104,24,104,32,104,40,104,48,104,56,104,64,104,72,104,80,104,88,104,96,104,104"

    fruits.cherry.positions = get_coordinates_from_string
    "56,32,56,88,64,32,64,88"

    fruits.apple.positions = get_coordinates_from_string
    "32,32,32,40,32,80,32,88,40,32,40,88,80,32,80,88,88,32,88,40,88,80,88,88"

    obstacles.voids.positions = get_coordinates_from_string
    "24,24,24,32,24,40,24,48,24,72,24,80,24,88,24,96,32,24,32,48,32,72,32,96,40,24,40,48,40,72,40,96,48,24,48,32,48,48,48,72,48,88,48,96,56,24,56,96,64,24,64,96,72,24,72,32,72,48,72,72,72,88,72,96,80,24,80,48,80,72,80,96,88,24,88,48,88,72,88,96,96,24,96,32,96,40,96,48,96,72,96,80,96,88,96,96"

    skeletons.positions = get_coordinates_from_string
    "8,8,8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,8,80,8,88,8,96,8,104,8,112,16,8,16,112,24,8,24,112,32,8,32,112,40,8,40,112,48,8,48,112,56,8,56,112,64,8,64,112,72,8,72,112,80,8,80,112,88,8,88,112,96,8,96,112,104,8,104,112,112,8,112,16,112,24,112,32,112,40,112,48,112,56,112,64,112,72,112,80,112,88,112,96,112,104,112,112"

end

function init_level_7()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 24, 8, 24, 8

    ships.up.spawn_status = "disabled"
    ships.up.status = "disabled"

    fruits.strawberry.positions = get_coordinates_from_string
    "96,88"

    fruits.cherry.positions = get_coordinates_from_string
    "64,96,64,104,72,96,72,104"

    fruits.apple.positions = get_coordinates_from_string
    "16,24,16,72,16,112,24,48,24,96,40,8,40,56,48,32,48,80,64,40,72,16,88,96,96,24,96,48,96,72,112,16,112,112"

    obstacles.walls.positions = get_coordinates_from_string
    "8,8,8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,8,80,8,88,8,96,8,104,8,112,32,8,32,16,32,24,32,32,32,40,32,48,32,56,32,64,32,72,32,80,32,88,32,96,32,112,56,16,56,24,56,32,56,40,56,48,56,56,56,64,56,72,56,80,56,88,56,96,56,104,56,112,64,32,64,80,64,112,72,8,72,32,72,56,72,80,72,112,80,8,80,32,80,56,80,80,80,96,80,104,80,112,88,8,88,32,88,56,88,80,96,8,96,32,96,56,96,80,96,96,104,8,104,32,104,56,104,80,104,88,112,8,112,56"

end

function init_level_8()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 64, 56, 64, 56

    fruits.cherry.positions = get_coordinates_from_string
    "56,8,64,8"

    skeletons.positions = get_coordinates_from_string
    "16,8,16,112,24,8,24,112,32,8,32,112,40,8,40,112,48,8,48,112,56,112,64,112,72,8,72,112,80,8,80,112,88,8,88,112,96,8,96,112,104,8,104,112"

    obstacles.voids.positions = get_coordinates_from_string
    "16,56,24,32,24,56,24,88,40,24,48,80,48,96,96,32"

    obstacles.walls.positions = get_coordinates_from_string
    "8,8,8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,8,80,8,88,8,96,8,104,8,112,24,40,24,48,24,64,24,96,32,24,32,64,32,80,32,96,40,48,40,56,40,80,40,96,48,24,48,40,56,24,56,40,56,64,56,80,56,96,64,24,64,48,64,64,64,80,64,96,72,24,72,32,72,56,72,80,72,96,80,32,80,40,80,80,80,96,88,24,88,56,88,64,88,72,88,80,96,24,96,40,96,48,96,72,96,96,104,88,112,8,112,16,112,24,112,32,112,40,112,48,112,56,112,64,112,72,112,80,112,88,112,96,112,104,112,112"

end

function init_level_9()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 80, 48, 80, 48

    for type, ship in pairs(ships) do
        ship.movement_rate = 9
    end

    fruits.cherry.positions = get_coordinates_from_string
    "24,32,24,40"

    fruits.strawberry.positions = get_coordinates_from_string
    "48,88,48,96,56,88,56,96"

    fruits.apple.positions = get_coordinates_from_string
    "8,104,8,112,16,104,16,112,32,88,32,96,64,16,80,16,80,64,80,88,96,104,112,40,112,80"

    skeletons.positions = get_coordinates_from_string
    "8,48,16,16,16,32,16,40,16,48,24,16,24,48,32,16,32,24,32,32,32,40,32,48,48,8,48,16,48,24,48,32,48,40,48,48"

    obstacles.voids.positions = get_coordinates_from_string
    "72,32,72,104,72,112,80,32,80,112,88,32,96,8,96,32,96,40,96,48,96,56,96,64,96,72,96,80,96,88,104,8,104,16,104,64,104,72,104,80,104,88,112,8,112,16,112,24,112,112"

    obstacles.walls.positions = get_coordinates_from_string
    "16,64,16,80,24,64,24,80,32,64,32,80,32,104,40,64,40,80,40,88,40,96,40,104,48,56,48,64,48,80,48,104,56,80,64,32,64,40,64,48,64,56,64,64,64,72,64,80,64,88,64,96,64,104,64,112"
end

function init_level_10()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 8, 8, 8, 8

    ships.left.spawn_status = "disabled"
    ships.left.status = "disabled"
    ships.right.spawn_status = "disabled"
    ships.right.status = "disabled"
    ships.up.spawn_status = "disabled"
    ships.up.status = "disabled"

    ships.down.movement_rate = 7

    fruits.cherry.positions = get_coordinates_from_string
    "16,104,24,8,40,8,48,104,56,8,72,8,80,104,88,8,104,8"

    fruits.strawberry.positions = get_coordinates_from_string
    "8,112,24,112,32,16,40,112,56,112,64,16,72,112,88,112,96,16"

    fruits.apple.positions = get_coordinates_from_string
    "8,16,8,24,8,32,8,40,8,48,8,56,8,64,8,72,8,80,8,88,8,96,8,104,24,16,24,24,24,32,24,40,24,48,24,56,24,64,24,72,24,80,24,88,24,96,24,104,40,16,40,24,40,32,40,40,40,48,40,56,40,64,40,72,40,80,40,88,40,96,40,104,56,16,56,24,56,32,56,40,56,48,56,56,56,64,56,72,56,80,56,88,56,96,56,104,72,16,72,24,72,32,72,40,72,48,72,56,72,64,72,72,72,80,72,88,72,96,72,104,88,16,88,24,88,32,88,40,88,48,88,56,88,64,88,72,88,80,88,88,88,96,88,104,104,16,104,24,104,32,104,40,104,48,104,56,104,64,104,72,104,80,104,88,104,96,104,104,104,112"

    skeletons.positions = get_coordinates_from_string
    "16,112,32,8,48,112,64,8,80,112,96,8"

    obstacles.walls.positions = get_coordinates_from_string
    "16,8,16,16,16,24,16,32,16,40,16,48,16,56,16,64,16,72,16,80,16,88,16,96,32,24,32,32,32,40,32,48,32,56,32,64,32,72,32,80,32,88,32,96,32,104,32,112,48,8,48,16,48,24,48,32,48,40,48,48,48,56,48,64,48,72,48,80,48,88,48,96,64,24,64,32,64,40,64,48,64,56,64,64,64,72,64,80,64,88,64,96,64,104,64,112,80,8,80,16,80,24,80,32,80,40,80,48,80,56,80,64,80,72,80,80,80,88,80,96,96,24,96,32,96,40,96,48,96,56,96,64,96,72,96,80,96,88,96,96,96,104,96,112,112,8,112,16,112,24,112,32,112,40,112,48,112,56,112,64,112,72,112,80,112,88,112,96,112,104,112,112"
end

function init_level_11()
    entities_initializer()

    player.spawn_x, player.spawn_y, player.x, player.y = 72, 64, 72, 64

    ships.left.spawn_status = "disabled"
    ships.left.status = "disabled"

    fruits.strawberry.positions = get_coordinates_from_string
    "56,64"

    skeletons.positions = get_coordinates_from_string
    "8,8,8,48,8,96,16,72,24,112,32,40,40,16,40,88,48,104,56,40,64,8,64,80,72,112,80,32,96,104,104,8,104,80,112,56,112,104"

    obstacles.walls.positions = get_coordinates_from_string
    "24,24,24,32,24,40,24,48,24,56,24,64,24,72,24,80,24,88,24,96,32,24,32,32,32,96,40,24,40,64,40,72,40,96,48,24,48,48,48,56,48,64,48,72,48,96,56,24,56,72,56,96,64,24,64,56,64,64,64,72,64,96,72,24,72,48,72,72,72,96,80,24,80,40,80,48,80,72,80,96,88,24,88,32,88,40,88,64,88,88,88,96,96,56,96,64,96,80,96,88,96,96,104,40,104,48,112,8,112,16,112,24,112,32,112,40,112,48"

end