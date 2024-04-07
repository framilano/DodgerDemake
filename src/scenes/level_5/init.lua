function init_level_5()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 24,
        spawn_y = 88,
        x = 24,
        y = 88,
        previous_direction = 's',
        direction = 's',
        spr = 10,
        spr_start = {0, 0},
        height = 7,
        width = 7,
        death_sprites = {33, 34, 35, 36, 37}
    }

    ships = {
        {
            id = "left",
            spawn_x = 0,
            spawn_y = 112,
            spawn_direction_tick = -8,
            spawn_status = "disabled",
            status = "disabled", -- disabled/searching_player/shooting/stasis/back_to_reload
            x = 0,
            y = 112,
            spr = 23,
            direction_tick = -8,
            movement_rate = 7,
            stasis_duration = 2,
            stasis_frame_counter = 0
        }, {
            id = "right",
            spawn_x = 120,
            spawn_y = 8,
            spawn_status = "searching_player",
            status = "searching_player",
            x = 120,
            y = 8,
            spr = 22,
            spawn_direction_tick = 8,
            direction_tick = 8,
            movement_rate = 7,
            stasis_duration = 2,
            stasis_frame_counter = 0
        }, {
            id = "up",
            spawn_x = 8,
            spawn_y = 0,
            spawn_status = "searching_player",
            status = "searching_player",
            x = 8,
            y = 0,
            spr = 24,
            spawn_direction_tick = 8,
            direction_tick = 8,
            movement_rate = 7,
            stasis_duration = 2,
            stasis_frame_counter = 0
        }, {
            id = "down",
            spawn_x = 112,
            spawn_y = 120,
            spawn_status = "searching_player",
            status = "searching_player",
            x = 112,
            y = 120,
            spr = 21,
            spawn_direction_tick = -8,
            direction_tick = -8,
            movement_rate = 7,
            stasis_duration = 2,
            stasis_frame_counter = 0
        }
    }

    fruits = {
        {
            type = "strawberry",
            spr = 18,
            spr_start = {0, 0},
            positions = {{88, 88}, {88, 96}, {88, 104}, {104, 88}, {104, 96}}
        }, {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {
                {56, 16}, {64, 8}, {64, 16}, {72, 8}, {72, 16}, {80, 8},
                {80, 16}, {88, 8}, {88, 16}, {96, 8}, {104, 8}

            }
        }, {
            type = "apple",
            spr = 20,
            spr_start = {0, 0},
            positions = {
                {88, 40}, {88, 48}, {96, 40}, {96, 48}, {112, 40}, {112, 48}
            }
        }
    }

    skeletons = {}

    obstacles = {
        {
            type = "voids",
            positions = {
                {8, 8}, {8, 16}, {8, 24}, {8, 32}, {8, 40}, {8, 48}, {8, 56},
                {8, 64}, {8, 72}, {8, 96}, {8, 104}, {8, 112}, {16, 8},
                {16, 16}, {16, 24}, {16, 32}, {16, 40}, {16, 48}, {16, 56},
                {16, 64}, {16, 104}, {16, 112}, {24, 8}, {24, 16}, {24, 24},
                {24, 40}, {24, 48}, {24, 104}, {24, 112}, {32, 8}, {32, 16},
                {32, 24}, {32, 40}, {32, 112}, {40, 8}, {40, 16}, {40, 24},
                {48, 8}, {48, 16}, {56, 8}, {96, 112}, {104, 104}, {104, 112},
                {112, 96}, {112, 104}, {112, 112}
            }
        }, 
        {
            type = "walls",
            positions = {
                {24, 32}, {32, 32}, {40, 32}, {48, 32}, {56, 80}, {56, 88},
                {64, 32}, {64, 80}, {64, 88}, {72, 32}, {72, 40}, {72, 72},
                {72, 80}, {72, 88}, {80, 32}, {80, 40}, {80, 48}, {80, 56},
                {80, 72}, {80, 80}, {80, 88}, {88, 32}, {88, 72}, {88, 80},
                {96, 32}, {96, 80}, {104, 32}, {104, 40}, {104, 48}, {104, 56},
                {104, 80}, {112, 32}
            }
        }

    }
end
