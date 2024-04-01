function init_level_4()
    
    global_vars.current_level = 4

    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living",      --living/dying
        spawn_x = 112,
        spawn_y = 112,
        x = 112,
        y = 112,
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
                {56, 32}, {56, 80}, {64, 32}, {64, 80}, {112, 8}
                }
        },
        {   
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {
                {8, 112}, {24, 16}, {24, 48}, {24, 64}, {24, 96}, {32, 112}, {88, 112}, {96, 16}, {96, 48}, {96, 64}, {96, 96}
            }
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
                {8, 48}, {8, 96}, {16, 16}, {16, 48}, {16, 64}, {16, 96}, {16, 112}, {24, 24}, {24, 40}, {24, 72}, {24, 88}, {24, 112}, {32, 16}, {32, 48}, {32, 64}, {32, 96}, {40, 16}, {40, 32}, {40, 48}, {40, 64}, {40, 80}, {40, 96}, {40, 112}, {48, 16}, {48, 32}, {48, 48}, {48, 64}, {48, 80}, {48, 96}, {48, 112}, {56, 16}, {56, 48}, {56, 64}, {56, 96}, {56, 112}, {64, 16}, {64, 48}, {64, 64}, {64, 96}, {64, 112}, {72, 16}, {72, 32}, {72, 48}, {72, 64}, {72, 80}, {72, 96}, {72, 112}, {80, 16}, {80, 32}, {80, 48}, {80, 64}, {80, 80}, {80, 96}, {80, 112}, {88, 16}, {88, 48}, {88, 64}, {88, 96}, {96, 24}, {96, 40}, {96, 72}, {96, 88}, {96, 112}, {104, 16}, {104, 48}, {104, 64}, {104, 96}, {112, 16}, {112, 64}
            }
        }
    }
end