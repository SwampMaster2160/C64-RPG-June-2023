blank_map_feature_script subroutine
	byte SCRIPT_END

newtown_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_TEST, 16, 5
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_OUTSIDE
	tileEventPos 0, 3, 0, 3
	byte 3, MAP_NEWTOWN_HOUSE_0, 8, 9
	byte SCRIPT_END

midland_path_1_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 9, 0
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 2
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 7
	byte SCRIPT_END

midland_path_2_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 0, 7
	byte SCRIPT_END

two_islands_path_1_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 2, 0
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 19, 0
	byte SCRIPT_END

two_islands_path_2_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 0, 0
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 17, 0
	byte SCRIPT_END

two_islands_path_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 0, 5
	byte SCRIPT_END

two_islands_path_4_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 5
	byte SCRIPT_END

bayswater_beach_6_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 3
	byte SCRIPT_END

warf_path_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 9, 0
	byte SCRIPT_END