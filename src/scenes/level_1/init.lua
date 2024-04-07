function init_level_1()
    -- saving every bullets on fields
    bullets = {}
    -- counts how many times the player is drawn, used to check if we should show an open or closed mouth sprite
    player_draw_counter = 0
    -- saving the death frame to have a starting point for the death animation
    death_frame = 0
    -- inputs queue containing arrow inputs from the user
    input_queue = {}

    player = {
        status = "living", -- living/dying
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
            type = "apple",
            spr = 32,
            spr_start = {0, 0},
            positions = {
                {16, 24}, {16, 32}, {16, 40}, {16, 48}, {16, 56}, {16, 64},
                {16, 72}, {16, 80}, {16, 88}, {16, 96}, {24, 24}, {24, 96},
                {32, 32}, {32, 88}, {40, 40}, {40, 80}, {48, 24}, {48, 32},
                {48, 88}, {48, 96}, {56, 24}, {56, 96}, {64, 24}, {64, 96},
                {72, 24}, {72, 32}, {72, 88}, {72, 96}, {80, 40}, {80, 80},
                {88, 32}, {88, 88}, {96, 24}, {96, 96}, {104, 24}, {104, 32},
                {104, 40}, {104, 48}, {104, 56}, {104, 64}, {104, 72},
                {104, 80}, {104, 88}, {104, 96}
            }
        }
    }

    skeletons = {}

    obstacles = {}
end
