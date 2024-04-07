function init_level_4()
    bullets = {}
    player_draw_counter = 0
    death_frame = 0
    input_queue = {}

    player = {
        status = "living", -- living/dying
        spawn_x = 56,
        spawn_y = 72,
        x = 56,
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
            positions = {{32, 32}, {32, 88}, {88, 32}, {88, 88}}
        }, {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{16, 16}, {16, 104}, {104, 16}, {104, 104}}
        }, {
            type = "apple",
            spr = 32,
            spr_start = {0, 0},
            positions = {{48, 48}, {48, 72}, {72, 48}, {72, 72}}
        }
    }

    skeletons = {}

    obstacles = {
        {type = "voids", positions = {}}, {
            type = "walls",
            positions = {
                {24, 24}, {24, 32}, {24, 40}, {24, 48}, {24, 56}, {24, 64},
                {24, 72}, {24, 80}, {24, 88}, {24, 96}, {32, 24}, {32, 96},
                {40, 24}, {40, 40}, {40, 48}, {40, 56}, {40, 64}, {40, 72},
                {40, 80}, {40, 96}, {48, 24}, {48, 40}, {48, 80}, {56, 24},
                {56, 56}, {56, 80}, {64, 24}, {64, 56}, {64, 80}, {72, 24},
                {72, 40}, {72, 80}, {80, 24}, {80, 40}, {80, 48}, {80, 56},
                {80, 64}, {80, 72}, {80, 80}, {80, 96}, {88, 24}, {88, 96},
                {96, 24}, {96, 32}, {96, 40}, {96, 48}, {96, 56}, {96, 64},
                {96, 72}, {96, 80}, {96, 88}, {96, 96}
            }
        }
    }
end
