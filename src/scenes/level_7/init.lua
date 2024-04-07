function init_level_7()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 24,
        spawn_y = 8,
        x = 24,
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
            spawn_y = 120,
            spawn_status = "searching_player",
            status = "searching_player",
            x = 120,
            y = 120,
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
            spawn_status = "disabled",
            status = "disabled",
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
            positions = {{96, 88}}
        }, {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{64, 96}, {64, 104}, {72, 96}, {72, 104}}
        }, {
            type = "apple",
            spr = 32,
            spr_start = {0, 0},
            positions = {
                {16, 24}, {16, 72}, {16, 112}, {24, 48}, {24, 96}, {40, 8},
                {40, 56}, {48, 32}, {48, 80}, {64, 40}, {72, 16}, {88, 96},
                {96, 24}, {96, 48}, {96, 72}, {112, 16}, {112, 112}
            }
        }
    }

    skeletons = {spr = 19, spr_start = {0, 0}, positions = {}}

    obstacles = {
        {
            type = "walls",
            positions = {
                {8, 8}, {8, 16}, {8, 24}, {8, 32}, {8, 40}, {8, 48}, {8, 56},
                {8, 64}, {8, 72}, {8, 80}, {8, 88}, {8, 96}, {8, 104}, {8, 112},
                {32, 8}, {32, 16}, {32, 24}, {32, 32}, {32, 40}, {32, 48},
                {32, 56}, {32, 64}, {32, 72}, {32, 80}, {32, 88}, {32, 96},
                {32, 112}, {56, 16}, {56, 24}, {56, 32}, {56, 40}, {56, 48},
                {56, 56}, {56, 64}, {56, 72}, {56, 80}, {56, 88}, {56, 96},
                {56, 104}, {56, 112}, {64, 32}, {64, 80}, {64, 112}, {72, 8},
                {72, 32}, {72, 56}, {72, 80}, {72, 112}, {80, 8}, {80, 32},
                {80, 56}, {80, 80}, {80, 96}, {80, 104}, {80, 112}, {88, 8},
                {88, 32}, {88, 56}, {88, 80}, {96, 8}, {96, 32}, {96, 56},
                {96, 80}, {96, 96}, {104, 8}, {104, 32}, {104, 56}, {104, 80},
                {104, 88}, {112, 8}, {112, 56}
            }
        }
    }
end
