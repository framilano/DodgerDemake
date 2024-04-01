function init_title()
    global_vars.hp = 3

    title_input_queue = {}

    obstacles = {
        {
            type = "voids",
            positions = {
                        {88, 0},  {96, 0}, {104, 0}, {112, 0}, {120, 0},
                        {88, 8}, {96, 8}, {104, 8}, {112, 8}, {120, 8}, 
                                          {104, 16}, {112, 16}, {120, 16},
                                                                {120, 24},
                                                     {112, 32}, {120, 32},
                                                                {120, 40},
            }
        }
    }
end