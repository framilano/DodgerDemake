function init_title()

    --Whenever entering title, reset level_1_start_frame to -1
    global_vars.level_1_start_frame = -1
    
    global_vars.hp = 3

    title_input_queue = {}

    fruits = {
        {
            type = "strawberry",
            spr = 18,
            spr_start = {0, 0},
            positions = {
                {27, 24}, {27, 32}, {33, 18}, {33, 38}, {39, 24}, {39, 32},
                {69, 42}, {70, 51}, {72, 33}, {77, 56}, {80, 33}, {83, 51},
                {106, 48}, {106, 57}, {106, 65}, {106, 73}, {114, 48},
                {114, 65}, {117, 57}, {117, 73}
            }
        }, 
        {
            type = "cherry",
            spr = 20,
            spr_start = {0, 0},
            positions = {{20, 60}, {20, 69}, {28, 60}, {28, 69}}
        }, 
        {
            type = "apple",
            spr = 32,
            spr_start = {0, 0},
            positions = {
                {4, 9}, {4, 17}, {4, 25}, {4, 33}, {13, 10}, {13, 32}, {19, 17},
                {19, 25}, {47, 22}, {47, 30}, {47, 38}, {47, 46}, {56, 23},
                {56, 45}, {62, 30}, {62, 38}, {90, 39}, {90, 47}, {90, 55},
                {90, 63}, {98, 39}, {98, 51}, {98, 63}
            }
        }
    }

    obstacles = {
        {
            type = "voids",
            positions = {
                {0, 0}, {88, 0}, {96, 0}, {104, 0}, {112, 0}, {120, 0},
                {104, 8}, {112, 8}, {120, 8}, {104, 16}, {112, 16}, {120, 16},
                {120, 24}, {120, 32}, {0, 112}, {0, 120}, {8, 120}, {16, 120},
                {112, 120}, {120, 112}, {120, 120}
            }
        }
    }

    -- Removing grid around message
    for x=0,128, 8 do
        add(obstacles[1].positions, {x, 96})
        add(obstacles[1].positions, {x, 104})
    end
end
