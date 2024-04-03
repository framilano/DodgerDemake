function blink()
    if (sin(global_vars.frame_counter / 30) < 0.2) then
        return 6
    else
        return 7
    end
end

function horizontal_center_text(text_length)
    return flr(64-text_length*2)
end