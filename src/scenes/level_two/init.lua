function init_level_two()
    
    global_vars.current_level = "two"

    bullets = {}
    player_draw_counter = 0
    death_frame = 0
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

    strawberries = {
        spr = 18,
        spr_start = {0, 0},
        positions = {{16, 16}, {104, 104}, {16, 104}, {104, 16}}
    }

    skeletons = {
        spr = 19,
        spr_start = {0, 0},
        positions = {{24, 24}, {96, 96}, {24, 96}, {96, 24}}
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

    obstacles = {
        {
            type = "voids",
            positions = {
                {24, 8},  {32, 8},  {40,8},   {48, 8},
                {24, 16}, {32, 16}, {40, 16}, {48, 16}
            }
        },
        {
            type = "walls",
            positions = {{88, 80}, {96, 80}}
        }
    }
end