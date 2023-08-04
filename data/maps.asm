maps = maps_actual - 64

; Data for maps
maps_actual subroutine
	; Newtown
	byte METATILE_TREES,                METATILE_BUILDING,             METATILE_TREES,                METATILE_TREES,                METATILE_TOWN_PATH_VERTICAL, METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	byte METATILE_HOUSE,                METATILE_GRASS,                METATILE_BUILDING,             METATILE_GRASS,                METATILE_TOWN_PATH_VERTICAL, METATILE_HOUSE,                METATILE_HOUSE,                METATILE_HOUSE,                METATILE_BUILDING,             METATILE_BUILDING
	byte METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_CROSS,    METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL, METATILE_TOWN_PATH_HORIZONTAL
	byte METATILE_BUILDING,             METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_TOWN_PATH_VERTICAL, METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_BUILDING
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TOWN_PATH_VERTICAL, METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_LIME, C64_COLOR_GREY, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_MIDLAND_PATH_4, MAP_TWO_ISLANDS_PATH_4, MAP_MIDLAND_PATH_5, MAP_TWO_ISLANDS_PATH_3, newtown_map_feature_script, newtown_name

	; Midland path 1
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_DIRT_PATH_VERTICAL,       METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL,       METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL_RIGHT, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL,       METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL,       METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_NULL, MAP_MIDLAND_PATH_2, MAP_NULL, midland_path_1_map_feature_script, midland_path_name

	; Midland path 2
	byte METATILE_TREES,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_WATER,                METATILE_WATER,                METATILE_WATER,                METATILE_WATER,                METATILE_BOARDWALK_VERTICAL,      METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_VERTICAL_LEFT, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_MIDLAND_PATH_1, MAP_NULL, MAP_MIDLAND_PATH_3, MAP_NULL, midland_path_2_map_feature_script, midland_path_name

	; Midland path 3
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_MIDLAND_PATH_2, MAP_NULL, MAP_MIDLAND_PATH_4, MAP_NULL, blank_map_feature_script, midland_path_name

	; Midland path 4
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_DIRT_PATH_VERTICAL, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_MIDLAND_PATH_3, MAP_NULL, MAP_NEWTOWN, MAP_NULL, blank_map_feature_script, midland_path_name

	; Midland path 5
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_DIRT_PATH_VERTICAL,      METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_VERTICAL_LEFT, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_DIRT_PATH_VERTICAL,      METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NEWTOWN, MAP_NULL, MAP_BAYSWATER_BEACH_3, MAP_LITTLE_LAKE, blank_map_feature_script, midland_path_name

	; Two islands path 0
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_TWO_ISLANDS_PATH_1, MAP_NULL, MAP_NULL, two_islands_path_0_map_feature_script, two_islands_path_name

	; Two islands path 1
	byte METATILE_TREES,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_DIRT_PATH_VERTICAL,      METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL_UP, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                   METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                   METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_TWO_ISLANDS_PATH_2, MAP_NULL, MAP_TWO_ISLANDS_PATH_0, two_islands_path_1_map_feature_script, two_islands_path_name

	; Two islands path 2
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_TREES
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_TWO_ISLANDS_PATH_3, MAP_NULL, MAP_TWO_ISLANDS_PATH_1, two_islands_path_2_map_feature_script, two_islands_path_name

	; Two islands path 3
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_TREES
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_BOARDWALK_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_TREES
	byte METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_NEWTOWN, MAP_NULL, MAP_TWO_ISLANDS_PATH_2, blank_map_feature_script, two_islands_path_name

	; Two islands path 4
	byte METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES
	byte METATILE_TREES,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_TREES
	byte METATILE_DIRT_PATH_HORIZONTAL, METATILE_BOARDWALK_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_BOARDWALK_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_BOARDWALK_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_TREES,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_GRASS,                METATILE_WATER,                METATILE_GRASS,                METATILE_TREES
	byte METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES,                METATILE_WATER,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_NULL, MAP_NULL, MAP_NEWTOWN, two_islands_path_4_map_feature_script, two_islands_path_name

	; Bayswater beach 0
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_ROCKS, METATILE_ROCKS, METATILE_ROCKS, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_ROCKS, METATILE_ROCKS, METATILE_ROCKS, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_BAYSWATER_BEACH_1, MAP_NULL, MAP_NULL, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 1
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_BAYSWATER_BEACH_2, MAP_BAYSWATER_PENINSULA, MAP_BAYSWATER_BEACH_0, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 2
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_WATER,         METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SHALLOW_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SHALLOW_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,         METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,         METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_BAYSWATER_BEACH_3, MAP_NULL, MAP_BAYSWATER_BEACH_1, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 3
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_DIRT_PATH_VERTICAL, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,               METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,               METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,              METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,              METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_MIDLAND_PATH_5, MAP_BAYSWATER_BEACH_4, MAP_NULL, MAP_BAYSWATER_BEACH_2, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 4
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_BAYSWATER_BEACH_5, MAP_NULL, MAP_BAYSWATER_BEACH_3, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 5
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_BOARDWALK_VERTICAL, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_BOARDWALK_VERTICAL, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_BOARDWALK_VERTICAL, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_BOARDWALK_VERTICAL, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_WARF_PATH, MAP_BAYSWATER_BEACH_6, MAP_TWIN_WARFS_WEST, MAP_BAYSWATER_BEACH_4, blank_map_feature_script, bayswater_beach_name

	; Bayswater beach 6
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_WATER,         METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SHALLOW_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SHALLOW_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,         METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,         METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_NULL, MAP_NULL, MAP_BAYSWATER_BEACH_5, bayswater_beach_6_map_feature_script, bayswater_beach_name

	; Warf path
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_DIRT_PATH_VERTICAL, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_DIRT_PATH_VERTICAL, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_GRASS, METATILE_TREES
	mapExtraData C64_COLOR_GREEN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_NULL, MAP_BAYSWATER_BEACH_5, MAP_NULL, warf_path_map_feature_script, warf_path_name

	; Little lake
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_WATER, METATILE_TREES, METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL, METATILE_DIRT_PATH_HORIZONTAL
	byte METATILE_TREES, METATILE_GRASS, METATILE_GRASS, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS,                METATILE_GRASS
	byte METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_TREES, METATILE_WATER, METATILE_TREES, METATILE_TREES,                METATILE_TREES,                METATILE_TREES,                METATILE_TREES
	mapExtraData C64_COLOR_BLUE, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_NULL, MAP_MIDLAND_PATH_5, MAP_NULL, MAP_NULL, blank_map_feature_script, little_lake_name

	; Bayswater peninsula
	byte METATILE_WATER, METATILE_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_SAND,  METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_BAYSWATER_BEACH_1, MAP_NULL, MAP_NULL, MAP_NULL, blank_map_feature_script, bayswater_peninsula_name

	; Twin warfs west
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_BOARDWALK_VERTICAL,  METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_BOARDWALK_VERTICAL,  METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_BOARDWALK_VERTICAL,  METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,               METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	byte METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER,               METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER, METATILE_WATER
	mapExtraData C64_COLOR_CYAN, C64_COLOR_LIGHT_BLUE, C64_COLOR_LIME, C64_COLOR_BROWN, MAP_BAYSWATER_BEACH_5, MAP_NULL, MAP_NULL, MAP_NULL, blank_map_feature_script, twin_warfs_name

	; Newtown house 0
	byte METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,                     METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL,  METATILE_INSIDE_WALL
	byte METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR,                    METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR
	byte METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR,                    METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR
	byte METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR,                    METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR
	byte METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR_WITH_RED_MAT_BELOW, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR, METATILE_INSIDE_FLOOR
	mapExtraData C64_COLOR_BLACK, C64_COLOR_LIGHT_GREY, C64_COLOR_ORANGE, C64_COLOR_BROWN, MAP_NULL, MAP_NULL, MAP_NULL, MAP_NULL, blank_map_feature_script, newtown_name