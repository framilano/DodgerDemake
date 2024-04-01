function init_level_one()
    
    global_vars.current_level = "one"

    --saving every bullets on fields
    bullets = {}
    --counts how many times the player is drawn, used to check if we should show an open or closed mouth sprite
    player_draw_counter = 0
    --saving the death frame to have a starting point for the death animation
    death_frame = 0
    --inputs queue containing arrow inputs from the user
    input_queue = {}

    player = {
        status = "living",      --living/dying
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

    strawberries = {
        spr = 18,
        spr_start = {0, 0},
        positions = {
            {8, 8}, {112, 112}, {8, 112}, {112, 8},
            {24, 24}, {24, 96}, {96, 96}, {96, 24},
            {40, 80}, {80, 40}, {80, 80}, {40, 40},
            {8, 64}, {112, 64},
            {8, 8}, {112, 112}, {8, 112}, {112, 8},
            {48, 16}, {72, 16}, {48, 104}, {72, 104}
        }
    }

    skeletons = {
        spr = 19,
        spr_start = {0, 0},
        positions = {
            {16, 16}, {16, 104}, {104, 16}, {104, 104},
            {32, 88}, {88, 32}, {32, 32}, {88, 88},
            {16, 56}, {104, 56}, {16, 72}, {104, 72},
            {48, 8}, {72, 8}, {48, 112}, {72, 112},
            {48, 24}, {72, 24}, {48, 96}, {72, 96}
        }
    }

    obstacles = {}
end