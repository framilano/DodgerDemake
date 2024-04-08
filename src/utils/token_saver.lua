function get_coordinates_from_string(coordinates_string)
    local list_of_numbers = split(coordinates_string)
    local list_of_coordinates = {}
    local i = 1
    while i < count(list_of_numbers) do
        add(list_of_coordinates, {list_of_numbers[i], list_of_numbers[i+1]})
        i += 2
    end

    return list_of_coordinates
end