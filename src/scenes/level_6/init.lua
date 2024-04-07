function init_level_6()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 56,
        spawn_y = 56,
        x = 56,
        y = 56,
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
                {16, 16}, {16, 24}, {16, 32}, {16, 40}, {16, 48}, {16, 56},
                {16, 64}, {16, 72}, {16, 80}, {16, 88}, {16, 96}, {16, 104},
                {24, 16}, {24, 104}, {32, 16}, {32, 104}, {40, 16}, {40, 104},
                {48, 16}, {48, 104}, {56, 16}, {56, 104}, {64, 16}, {64, 104},
                {72, 16}, {72, 104}, {80, 16}, {80, 104}, {88, 16}, {88, 104},
                {96, 16}, {96, 104}, {104, 16}, {104, 24}, {104, 32}, {104, 40},
                {104, 48}, {104, 56}, {104, 64}, {104, 72}, {104, 80},
                {104, 88}, {104, 96}, {104, 104}
            }
        }, {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{56, 32}, {56, 88}, {64, 32}, {64, 88}}
        }, {
            type = "apple",
            spr = 32,
            spr_start = {0, 0},
            positions = {
                {32, 32}, {32, 40}, {32, 80}, {32, 88}, {40, 32}, {40, 88},
                {80, 32}, {80, 88}, {88, 32}, {88, 40}, {88, 80}, {88, 88}
            }
        }
    }

    skeletons = {
        spr = 19,
        spr_start = {0, 0},
        positions = {
            {8, 8}, {8, 16}, {8, 24}, {8, 32}, {8, 40}, {8, 48}, {8, 56},
            {8, 64}, {8, 72}, {8, 80}, {8, 88}, {8, 96}, {8, 104}, {8, 112},
            {16, 8}, {16, 112}, {24, 8}, {24, 112}, {32, 8}, {32, 112}, {40, 8},
            {40, 112}, {48, 8}, {48, 112}, {56, 8}, {56, 112}, {64, 8},
            {64, 112}, {72, 8}, {72, 112}, {80, 8}, {80, 112}, {88, 8},
            {88, 112}, {96, 8}, {96, 112}, {104, 8}, {104, 112}, {112, 8},
            {112, 16}, {112, 24}, {112, 32}, {112, 40}, {112, 48}, {112, 56},
            {112, 64}, {112, 72}, {112, 80}, {112, 88}, {112, 96}, {112, 104},
            {112, 112}
        }
    }

    obstacles = {
        {
            type = "voids",
            positions = {
                {24, 24}, {24, 32}, {24, 40}, {24, 48}, {24, 72}, {24, 80},
                {24, 88}, {24, 96}, {32, 24}, {32, 48}, {32, 72}, {32, 96},
                {40, 24}, {40, 48}, {40, 72}, {40, 96}, {48, 24}, {48, 32},
                {48, 48}, {48, 72}, {48, 88}, {48, 96}, {56, 24}, {56, 96},
                {64, 24}, {64, 96}, {72, 24}, {72, 32}, {72, 48}, {72, 72},
                {72, 88}, {72, 96}, {80, 24}, {80, 48}, {80, 72}, {80, 96},
                {88, 24}, {88, 48}, {88, 72}, {88, 96}, {96, 24}, {96, 32},
                {96, 40}, {96, 48}, {96, 72}, {96, 80}, {96, 88}, {96, 96}
            }
        }
    }
end
