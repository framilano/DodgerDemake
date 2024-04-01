function init_level_4()
    
    global_vars.current_level = 4

    bullets = {}
    player_draw_counter = 0
    death_frame = 0
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
                {112, 112}
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
                {16, 16}, {16, 24}, {16, 32}, {16, 40}, {16, 48}, {16, 56}, {16, 64}, {16, 72}, {16, 80}, {16, 88}, {16, 96}, {16, 104}, {24, 16}, {24, 104}, {32, 32}, {32, 40}, {32, 48}, {32, 56}, {32, 64}, {32, 72}, {32, 80}, {32, 88}, {32, 104}, {40, 16}, {40, 32}, {40, 88}, {40, 104}, {48, 16}, {48, 32}, {48, 48}, {48, 56}, {48, 64}, {48, 72}, {48, 88}, {48, 104}, {56, 16}, {56, 32}, {56, 72}, {56, 88}, {56, 104}, {64, 16}, {64, 32}, {64, 48}, {64, 72}, {64, 104}, {72, 16}, {72, 32}, {72, 48}, {72, 56}, {72, 64}, {72, 72}, {72, 88}, {72, 104}, {80, 16}, {80, 32}, {80, 88}, {80, 104}, {88, 16}, {88, 32}, {88, 40}, {88, 48}, {88, 56}, {88, 64}, {88, 72}, {88, 80}, {88, 88}, {88, 104}, {96, 16}, {96, 104}, {104, 16}, {104, 24}, {104, 32}, {104, 40}, {104, 48}, {104, 56}, {104, 64}, {104, 72}, {104, 80}, {104, 88}, {104, 96}, {104, 104}
                }
        }
    }
end