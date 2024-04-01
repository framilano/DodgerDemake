function is_colliding(entity_1, entity_2)
	local entity_1_top = entity_1.y + entity_1.spr_start[2]
	local entity_1_bottom = entity_1.y + entity_1.spr_start[2] + entity_1.height
	local entity_1_left = entity_1.x + entity_1.spr_start[1]
	local entity_1_right = entity_1.x + entity_1.spr_start[1] + entity_1.width

	local entity_2_top = entity_2.y + entity_2.spr_start[2]
	local entity_2_bottom = entity_2.y + entity_2.spr_start[2] + entity_2.height
	local entity_2_left = entity_2.x + entity_2.spr_start[1]
	local entity_2_right = entity_2.x + entity_2.spr_start[1] + entity_2.width

	if (entity_1_top > entity_2_bottom) return false
	if (entity_2_top > entity_1_bottom) return false
	if (entity_1_left > entity_2_right) return false
	if (entity_2_left > entity_1_right) return false
	
	return true
end