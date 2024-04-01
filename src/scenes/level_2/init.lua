function init_level_2()
    
    global_vars.current_level = 2

    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living",      --living/dying
        spawn_x = 8,
        spawn_y = 8,
        x = 8,
        y = 8,
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
                {16, 56}, {24, 24}, {24, 88}, {32, 32}, {32, 56}, {32, 96}, {40, 24}, {40, 88}, {48, 56}, {72, 64}, {80, 32}, {80, 96}, {88, 24}, {88, 64}, {88, 88}, {96, 32}, {96, 96}, {104, 64}
                }
        },
        {   
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {}
        }
    }

    skeletons = {}

    obstacles = {
        {
            type = "voids",
            positions = {}
        },
        {
            type = "walls",
            positions = {
                {16, 16}, {16, 24}, {16, 32}, {16, 40}, {16, 64}, {16, 80}, {16, 88}, {16, 96}, {16, 104}, {24, 16}, {24, 40}, {24, 64}, {24, 80}, {24, 104}, {32, 40}, {32, 64}, {32, 104}, {40, 16}, {40, 40}, {40, 64}, {40, 80}, {40, 104}, {48, 16}, {48, 24}, {48, 32}, {48, 40}, {48, 64}, {48, 80}, {48, 88}, {48, 96}, {48, 104}, {56, 64}, {64, 56}, {72, 16}, {72, 24}, {72, 32}, {72, 40}, {72, 56}, {72, 80}, {72, 88}, {72, 96}, {72, 104}, {80, 16}, {80, 40}, {80, 56}, {80, 80}, {80, 104}, {88, 40}, {88, 56}, {88, 104}, {96, 16}, {96, 40}, {96, 56}, {96, 80}, {96, 104}, {104, 16}, {104, 24}, {104, 32}, {104, 40}, {104, 56}, {104, 80}, {104, 88}, {104, 96}, {104, 104}
            }
        }
    }
end