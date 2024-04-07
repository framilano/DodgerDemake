function init_level_9()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 80,
        spawn_y = 48,
        x = 80,
        y = 48,
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
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{24, 32}, {24, 40}}
        }, {
            type = "strawberry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{48, 88}, {48, 96}, {56, 88}, {56, 96}}
        }, {
            type = "apple",
            spr = 20,
            spr_start = {0, 0},
            positions = {
                {8, 104}, {8, 112}, {16, 104}, {16, 112}, {32, 88}, {32, 96},
                {64, 16}, {80, 16}, {80, 64}, {80, 88}, {96, 104}, {112, 40},
                {112, 80}
            }
        }
    }

    skeletons = {
        spr = 19,
        spr_start = {0, 0},
        positions = {
            {8, 48}, {16, 16}, {16, 32}, {16, 40}, {16, 48}, {24, 16}, {24, 48},
            {32, 16}, {32, 24}, {32, 32}, {32, 40}, {32, 48}, {48, 8}, {48, 16},
            {48, 24}, {48, 32}, {48, 40}, {48, 48}
        }
    }

    obstacles = {
        {
            type = "voids",
            positions = {
                {72, 32}, {72, 104}, {72, 112}, {80, 32}, {80, 112}, {88, 32},
                {96, 8}, {96, 32}, {96, 40}, {96, 48}, {96, 56}, {96, 64},
                {96, 72}, {96, 80}, {96, 88}, {104, 8}, {104, 16}, {104, 64},
                {104, 72}, {104, 80}, {104, 88}, {112, 8}, {112, 16}, {112, 24},
                {112, 112}
            }
        }, {
            type = "walls",
            positions = {
                {16, 64}, {16, 80}, {24, 64}, {24, 80}, {32, 64}, {32, 80},
                {32, 104}, {40, 64}, {40, 80}, {40, 88}, {40, 96}, {40, 104},
                {48, 56}, {48, 64}, {48, 80}, {48, 104}, {56, 80}, {64, 32},
                {64, 40}, {64, 48}, {64, 56}, {64, 64}, {64, 72}, {64, 80},
                {64, 88}, {64, 96}, {64, 104}, {64, 112}
            }
        }
    }
end
