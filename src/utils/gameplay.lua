function is_colliding(entity_one, entity_two)
	local entity_one_top = entity_one.y + entity_one.spr_start[2]
	local entity_one_bottom = entity_one.y + entity_one.spr_start[2] + entity_one.height
	local entity_one_left = entity_one.x + entity_one.spr_start[1]
	local entity_one_right = entity_one.x + entity_one.spr_start[1] + entity_one.width

	local entity_two_top = entity_two.y + entity_two.spr_start[2]
	local entity_two_bottom = entity_two.y + entity_two.spr_start[2] + entity_two.height
	local entity_two_left = entity_two.x + entity_two.spr_start[1]
	local entity_two_right = entity_two.x + entity_two.spr_start[1] + entity_two.width

	if (entity_one_top > entity_two_bottom) return false
	if (entity_two_top > entity_one_bottom) return false
	if (entity_one_left > entity_two_right) return false
	if (entity_two_left > entity_one_right) return false
	
	return true
end