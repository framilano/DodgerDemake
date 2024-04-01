function init_level_three()
    
    global_vars.current_level = "three"

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
                {16, 32}, {16, 88}, {32, 16}, {32, 48}, {32, 72}, {32, 104}, {40, 56}, {40, 64}, {48, 32}, {48, 88}, {56, 40}, {56, 80}, {64, 40}, {64, 80}, {72, 32}, {72, 88}, {80, 56}, {80, 64}, {88, 16}, {88, 48}, {88, 72}, {88, 104}, {104, 32}, {104, 88}
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
                {16, 16}, {16, 48}, {16, 72}, {16, 104}, {24, 24}, {24, 40}, {24, 80}, {24, 96}, {32, 32}, {32, 88}, {40, 24}, {40, 40}, {40, 80}, {40, 96}, {48, 16}, {48, 48}, {48, 72}, {48, 104}, {56, 56}, {56, 64}, {64, 56}, {64, 64}, {72, 16}, {72, 48}, {72, 72}, {72, 104}, {80, 24}, {80, 40}, {80, 80}, {80, 96}, {88, 32}, {88, 88}, {96, 24}, {96, 40}, {96, 80}, {96, 96}, {104, 16}, {104, 48}, {104, 72}, {104, 104}
                }
        }
    }
end