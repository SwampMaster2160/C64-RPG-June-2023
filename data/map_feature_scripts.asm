blank_map_feature_script subroutine
	byte SCRIPT_END

newtown_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_TEST, 16, 5

	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_OUTSIDE
	tileEventPos 0, 3, 0, 3
	byte 3, MAP_NEWTOWN_HOUSE_0, 8, 9

	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_OUTSIDE
	tileEventPos 4, 3, 4, 3
	byte 3, MAP_NEWTOWN_BUILDING_0, 8, 9

	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_OUTSIDE
	tileEventPos 18, 3, 18, 3
	byte 3, MAP_NEWTOWN_BUILDING_1, 8, 9

	byte SCRIPT_END

midland_path_1_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 9, 0
	byte SCRIPT_END

midland_path_2_map_feature_script subroutine
	byte SCRIPT_END

two_islands_path_1_map_feature_script subroutine
	byte SCRIPT_END

two_islands_path_2_map_feature_script subroutine
	byte SCRIPT_END

two_islands_path_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 0, 5
	byte SCRIPT_END

two_islands_path_4_map_feature_script subroutine
	byte SCRIPT_END

bayswater_beach_6_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 3
	byte SCRIPT_END

warf_path_map_feature_script subroutine
	byte SCRIPT_END

longtown_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_HORIZONTAL, 9, 0
	byte SCRIPT_END

newtown_house_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_INSIDE
	tileEventPos 8, 10, 9, 10
	byte 3, MAP_NEWTOWN, 0, 4
	byte SCRIPT_END

newtown_building_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_INSIDE
	tileEventPos 8, 10, 9, 10
	byte 3, MAP_NEWTOWN, 4, 4
	byte SCRIPT_END

newtown_building_1_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_DOOR_INSIDE
	tileEventPos 8, 10, 9, 10
	byte 3, MAP_NEWTOWN, 18, 4
	byte SCRIPT_END

tunnel_path_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_CAVE_ENTRENCE_LEFT_RIGHT
	tileEventPos 14, 4, 14, 5
	byte 2, MAP_TANUKI_TUNNEL_0, 2
	byte SCRIPT_END

tunnel_path_1_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_CAVE_ENTRENCE_LEFT_RIGHT
	tileEventPos 5, 4, 5, 5
	byte 2, MAP_TANUKI_TUNNEL_2, 17
	byte SCRIPT_SPAWN_ENTITY, ENTITY_BLOCK_VERTICAL, 19, 4
	byte SCRIPT_END

tanuki_tunnel_0_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_CAVE_ENTRENCE_LEFT_RIGHT
	tileEventPos 1, 4, 1, 5
	byte 2, MAP_TUNNEL_PATH_0, 13
	byte SCRIPT_END

tanuki_tunnel_2_map_feature_script subroutine
	byte SCRIPT_SPAWN_TILE_EVENT, TILE_EVENT_WARP_CAVE_ENTRENCE_LEFT_RIGHT
	tileEventPos 18, 4, 18, 5
	byte 2, MAP_TUNNEL_PATH_1, 6
	byte SCRIPT_END