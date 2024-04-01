function init_level_one()
    
    global_vars.current_level = "one"

    --saving every bullets on fields
    bullets = {}
    --counts how many times the player is drawn, used to check if we should show an open or closed mouth sprite
    player_draw_counter = 0
    --saving the death frame to have a starting point for the death animation
    death_frame = 0
    --inputs queue containing arrow inputs from the user
    input_queue = {}

    player = {
        status = "living",      --living/dying
        spawn_x = 64,
        spawn_y = 64,
        x = 64,
        y = 64,
        previous_direction = 's',
        direction = 's',
        spr = 10,
        spr_start = {0, 0},
        height = 7,
        width = 7,
        death_sprites = {33, 34, 35, 36, 37}
    }

    ships = {
        stasis_duration = 2,
        {   
            id = "left",
            spawn_x = 0,
            spawn_y = 112,
            spawn_speed = -8,
            spawn_status = "searching_player",
            status =  "searching_player",   --disabled/searching_player/shooting/stasis/back_to_reload
            x = 0,
            y = 112,
            spr = 23,
            speed = -8,
            stasis_duration = 2,
            stasis_frame_counter = 0
        },
        {   
            id = "right",
            spawn_x = 120,
            spawn_y = 8,
            spawn_status = "searching_player",
            status =  "searching_player",
            x = 120,
            y = 8,
            spr = 22,
            spawn_speed = 8,
            speed = 8,
            stasis_duration = 2,
            stasis_frame_counter = 0
        },
        {   
            id = "up",
            spawn_x = 8,
            spawn_y = 0,
            spawn_status = "disabled",
            status =  "disabled",
            x = 8,
            y = 0,
            spr = 24,
            spawn_speed = 8,
            speed = 8,
            stasis_duration = 2,
            stasis_frame_counter = 0
        },
        {   
            id = "down",
            spawn_x = 112,
            spawn_y = 120,
            spawn_status = "disabled",
            status =  "disabled",
            x = 112,
            y = 120,
            spr = 21,
            spawn_speed = -8,
            speed = -8,
            stasis_duration = 2,
            stasis_frame_counter = 0
        }
    }

    fruits = {
        {   
            type = "strawberry",
            spr = 18,
            spr_start = {0, 0},
            positions = {
                {16, 56}, {16, 64}, {24, 24}, {24, 56}, {24, 64}, {24, 96}, {40, 40}, 
                {40, 80}, {56, 16}, {56, 24}, {56, 96}, {56, 104}, {64, 16}, {64, 24}, 
                {64, 96}, {64, 104}, {80, 40}, {80, 80}, {96, 24}, {96, 56}, {96, 64}, 
                {96, 96}, {104, 56}, {104, 64}
            }
        },
        {   
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {}
        }
    }

    skeletons = {
        spr = 19,
        spr_start = {0, 0},
        positions = {{16, 16}, {16, 104}, {32, 32}, {32, 88}, {88, 32}, {88, 88}, {104, 16}, {104, 104}}
    }

    obstacles = {}
end