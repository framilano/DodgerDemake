function init_level_2()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 80,
        spawn_y = 72,
        x = 80,
        y = 72,
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
            spawn_status = "searching_player",
            status = "searching_player", -- disabled/searching_player/shooting/stasis/back_to_reload
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
            spawn_y = 112,
            spawn_status = "searching_player",
            status = "searching_player",
            x = 120,
            y = 112,
            spr = 22,
            spawn_direction_tick = -8,
            direction_tick = -8,
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
            positions = {
                {16, 40}, {16, 72}, {24, 32}, {24, 64}, {32, 24}, {32, 56},
                {32, 96}, {40, 48}, {40, 88}, {48, 40}, {48, 80}, {56, 32},
                {56, 72}, {64, 24}, {64, 64}, {72, 56}, {72, 96}, {80, 48},
                {80, 88}, {88, 40}, {88, 80}, {96, 32}, {96, 72}, {104, 24},
                {104, 64}
            }
        }
    }

    skeletons = {}

    obstacles = {
        {
            type = "voids",
            positions = {
                {8, 8}, {8, 16}, {8, 32}, {8, 40}, {8, 48}, {8, 104}, {8, 112},
                {16, 8}, {16, 112}, {40, 8}, {40, 112}, {48, 8}, {48, 104},
                {48, 112}, {72, 8}, {80, 8}, {80, 16}, {80, 112}, {88, 8},
                {88, 16}, {88, 104}, {88, 112}, {96, 8}, {96, 16}, {96, 112},
                {104, 8}, {104, 40}, {104, 48}, {104, 80}, {104, 88}, {112, 32},
                {112, 40}, {112, 48}, {112, 56}, {112, 72}, {112, 80},
                {112, 88}, {112, 96}
            }
        }
    }
end
