function init_level_3()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 72,
        spawn_y = 88,
        x = 72,
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
            spawn_status = "disabled",
            status = "disabled",
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
            positions = {{56, 8}, {64, 16}, {72, 8}, {80, 16}, {88, 8}}
        }, {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {
                {16, 16}, {24, 24}, {32, 16}, {48, 48}, {48, 64}, {72, 48},
                {72, 64}, {80, 96}, {88, 104}, {96, 96}, {104, 104}
            }
        }
    }

    skeletons = {}

    obstacles = {
        {
            type = "voids",
            positions = {
                {40, 48}, {40, 56}, {40, 64}, {48, 40}, {48, 72}, {56, 72},
                {64, 72}, {72, 40}, {72, 72}, {80, 48}, {80, 56}, {80, 64}
            }
        }, {
            type = "walls",
            positions = {
                {8, 8}, {8, 16}, {8, 24}, {8, 32}, {8, 40}, {8, 48}, {8, 56},
                {8, 64}, {8, 72}, {16, 8}, {16, 96}, {24, 8}, {24, 32},
                {24, 40}, {24, 48}, {24, 96}, {32, 8}, {32, 32}, {32, 96},
                {40, 8}, {40, 16}, {40, 24}, {40, 96}, {48, 96}, {56, 24},
                {64, 24}, {72, 24}, {72, 96}, {72, 104}, {72, 112}, {80, 24},
                {80, 88}, {80, 112}, {88, 24}, {88, 88}, {88, 112}, {96, 24},
                {96, 64}, {96, 72}, {96, 80}, {96, 88}, {96, 112}, {104, 112},
                {112, 56}, {112, 64}, {112, 72}, {112, 80}, {112, 88},
                {112, 96}, {112, 104}, {112, 112}
            }
        }
    }
end
