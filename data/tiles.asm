; A list of tiles
tiles subroutine
	; Blank
	byte WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK
	tileExtraData C64_COLOR_BLACK, C64_COLOR_BLACK, C64_COLOR_BLACK, C64_COLOR_BLACK, TILE_MOVEMENT_WALL
	; House roof left
	byte WORLD_CHAR_HOUSE_ROOF_TOP_LEFT, WORLD_CHAR_FLAT_ROOF_TOP, WORLD_CHAR_HOUSE_ROOF_BOTTOM_LEFT, WORLD_CHAR_WINDOW_LEFT_WITH_ROOF_ABOVE
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_CYAN, TILE_MOVEMENT_WALL
	; House roof right
	byte WORLD_CHAR_FLAT_ROOF_TOP, WORLD_CHAR_HOUSE_ROOF_TOP_RIGHT, WORLD_CHAR_WINDOW_RIGHT_WITH_ROOF_ABOVE, WORLD_CHAR_HOUSE_ROOF_BOTTOM_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_CYAN, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_WALL
	; Building bottom left with door
	byte WORLD_CHAR_DOOR_TOP_LEFT_WITH_ROOF_ABOVE_AND_LEFT_WALL, WORLD_CHAR_DOOR_TOP_RIGHT_WITH_ROOF_ABOVE, WORLD_CHAR_DOOR_BOTTOM_LEFT_WITH_FLOOR_AND_LEFT_WALL, WORLD_CHAR_DOOR_BOTTOM_RIGHT_WITH_FLOOR
	tileExtraData C64_MULTICOLOR_CYAN, C64_MULTICOLOR_CYAN, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_PLAYER_ONLY
	; Building bottom right with window
	byte WORLD_CHAR_WINDOW_LEFT_WITH_ROOF_ABOVE, WORLD_CHAR_WINDOW_RIGHT_WITH_RIGHT_WALL, WORLD_CHAR_BUILDING_BRICKS_WITH_FLOOR, WORLD_CHAR_BUILDING_BRICKS_WITH_FLOOR_AND_RIGHT_WALL
	tileExtraData C64_MULTICOLOR_CYAN, C64_MULTICOLOR_CYAN, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_WALL
	; Building bottom left with window
	byte WORLD_CHAR_WINDOW_LEFT_WITH_LEFT_WALL, WORLD_CHAR_WINDOW_RIGHT_WITH_ROOF_ABOVE, WORLD_CHAR_BUILDING_BRICKS_WITH_FLOOR_AND_LEFT_WALL, WORLD_CHAR_BUILDING_BRICKS_WITH_FLOOR
	tileExtraData C64_MULTICOLOR_CYAN, C64_MULTICOLOR_CYAN, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_WALL
	; Flat roof left
	byte WORLD_CHAR_FLAT_ROOF_TOP_LEFT, WORLD_CHAR_FLAT_ROOF_TOP, WORLD_CHAR_FLAT_ROOF_LEFT, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_WALL
	; Flat roof right
	byte WORLD_CHAR_FLAT_ROOF_TOP, WORLD_CHAR_FLAT_ROOF_TOP_RIGHT, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_WALL
	; Grass
	byte WORLD_CHAR_GRASS_0, WORLD_CHAR_GRASS_1, WORLD_CHAR_GRASS_1, WORLD_CHAR_GRASS_0
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_CLEAR
	; Town path left
	byte WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path right
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_VERTICAL
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Town path top
	byte WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path bottom
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_GUTTER_HORIZONTAL
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Town path top left
	byte WORLD_CHAR_GUTTER_UP_LEFT, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path top right
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_UP_RIGHT, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path bottom left
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_DOWN_LEFT, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path bottom right
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_DOWN_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Town path top left concave
	byte WORLD_CHAR_GUTTER_DOWN_RIGHT, WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_FLAT_ROOF
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Town path top right concave
	byte WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_GUTTER_DOWN_LEFT, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_VERTICAL
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Town path bottom left concave
	byte WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_UP_RIGHT, WORLD_CHAR_GUTTER_HORIZONTAL
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Town path bottom right concave
	byte WORLD_CHAR_FLAT_ROOF, WORLD_CHAR_GUTTER_VERTICAL, WORLD_CHAR_GUTTER_HORIZONTAL, WORLD_CHAR_GUTTER_UP_LEFT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Tree
	byte WORLD_CHAR_TREE_CANOPY_LEFT, WORLD_CHAR_TREE_CANOPY_RIGHT, WORLD_CHAR_TREE_TRUNK_LEFT, WORLD_CHAR_TREE_TRUNK_RIGHT
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_WALL
	; Water
	byte WORLD_CHAR_WATER, WORLD_CHAR_WATER, WORLD_CHAR_WATER, WORLD_CHAR_WATER
	tileExtraData C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, TILE_MOVEMENT_WALL
	; Shallow water
	byte WORLD_CHAR_SHALLOW_WATER, WORLD_CHAR_SHALLOW_WATER, WORLD_CHAR_SHALLOW_WATER, WORLD_CHAR_SHALLOW_WATER
	tileExtraData C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, C64_MULTICOLOR_BLUE, TILE_MOVEMENT_CLEAR
	; Sand
	byte WORLD_CHAR_SAND, WORLD_CHAR_SAND, WORLD_CHAR_SAND, WORLD_CHAR_SAND
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Dirt path left
	byte WORLD_CHAR_DIRT_PATH_LEFT, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_LEFT, WORLD_CHAR_DIRT_PATH
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Dirt path right
	byte WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_RIGHT, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_CLEAR
	; Dirt path top
	byte WORLD_CHAR_DIRT_PATH_TOP, WORLD_CHAR_DIRT_PATH_TOP, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Dirt path bottom
	byte WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_BOTTOM, WORLD_CHAR_DIRT_PATH_BOTTOM
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_CLEAR
	; Dirt path top left
	byte WORLD_CHAR_DIRT_PATH_TOP_LEFT, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Dirt path top right
	byte WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_TOP_RIGHT, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Dirt path bottom left
	byte WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_BOTTOM_LEFT, WORLD_CHAR_DIRT_PATH
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Dirt path bottom right
	byte WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH, WORLD_CHAR_DIRT_PATH_BOTTOM_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_CLEAR
	; Boardwalk left
	byte WORLD_CHAR_BOARDWALK_LEFT, WORLD_CHAR_BOARDWALK_VERTICAL, WORLD_CHAR_BOARDWALK_LEFT, WORLD_CHAR_BOARDWALK_VERTICAL
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Boardwalk right
	byte WORLD_CHAR_BOARDWALK_VERTICAL, WORLD_CHAR_BOARDWALK_RIGHT, WORLD_CHAR_BOARDWALK_VERTICAL, WORLD_CHAR_BOARDWALK_RIGHT
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Boardwalk top
	byte WORLD_CHAR_BOARDWALK_TOP, WORLD_CHAR_BOARDWALK_TOP, WORLD_CHAR_BOARDWALK_HORIZONTAL, WORLD_CHAR_BOARDWALK_HORIZONTAL
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Boardwalk bottom
	byte WORLD_CHAR_BOARDWALK_HORIZONTAL, WORLD_CHAR_BOARDWALK_HORIZONTAL, WORLD_CHAR_BOARDWALK_BOTTOM, WORLD_CHAR_BOARDWALK_BOTTOM
	tileExtraData C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, C64_MULTICOLOR_YELLOW, TILE_MOVEMENT_CLEAR
	; Rocks
	byte WORLD_CHAR_ROCKS_TOP_LEFT, WORLD_CHAR_ROCKS_TOP_RIGHT, WORLD_CHAR_ROCKS_BOTTOM_LEFT, WORLD_CHAR_ROCKS_BOTTOM_RIGHT
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_WALL
	; Inside wall
	byte WORLD_CHAR_INSIDE_WALL, WORLD_CHAR_INSIDE_WALL, WORLD_CHAR_INSIDE_WALL, WORLD_CHAR_INSIDE_WALL
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_WALL
	; Inside floor
	byte WORLD_CHAR_INSIDE_FLOOR, WORLD_CHAR_INSIDE_FLOOR, WORLD_CHAR_INSIDE_FLOOR, WORLD_CHAR_INSIDE_FLOOR
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_CLEAR
	; Red mat left
	byte WORLD_CHAR_MAT_TOP_LEFT, WORLD_CHAR_MAT_TOP, WORLD_CHAR_MAT_BOTTOM_LEFT, WORLD_CHAR_MAT_BOTTOM
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Red mat right
	byte WORLD_CHAR_MAT_TOP, WORLD_CHAR_MAT_TOP_RIGHT, WORLD_CHAR_MAT_BOTTOM, WORLD_CHAR_MAT_BOTTOM_RIGHT
	tileExtraData C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, C64_MULTICOLOR_RED, TILE_MOVEMENT_CLEAR
	; Fence
	byte WORLD_CHAR_FENCE_TOP, WORLD_CHAR_FENCE_TOP, WORLD_CHAR_FENCE_BOTTOM, WORLD_CHAR_FENCE_BOTTOM
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_WALL
	; Left tunnel entrance top dark
	byte WORLD_CHAR_BLANK, WORLD_CHAR_RIGHT_TUNNEL_ENTRANCE_TOP, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_PLAYER_ONLY
	; Left tunnel entrance bottom dark
	byte WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_RIGHT_TUNNEL_ENTRANCE_BOTTOM
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_PLAYER_ONLY
	; Right tunnel entrance top dark
	byte WORLD_CHAR_LEFT_TUNNEL_ENTRANCE_TOP, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_PLAYER_ONLY
	; Right tunnel entrance bottom dark
	byte WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_LEFT_TUNNEL_ENTRANCE_BOTTOM, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_PLAYER_ONLY
	; Left tunnel entrance top light
	byte WORLD_CHAR_BLANK, WORLD_CHAR_RIGHT_TUNNEL_ENTRANCE_TOP, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, TILE_MOVEMENT_PLAYER_ONLY
	; Left tunnel entrance bottom light
	byte WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_RIGHT_TUNNEL_ENTRANCE_BOTTOM
	tileExtraData C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, TILE_MOVEMENT_PLAYER_ONLY
	; Right tunnel entrance top light
	byte WORLD_CHAR_LEFT_TUNNEL_ENTRANCE_TOP, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, TILE_MOVEMENT_PLAYER_ONLY
	; Right tunnel entrance bottom light
	byte WORLD_CHAR_BLANK, WORLD_CHAR_BLANK, WORLD_CHAR_LEFT_TUNNEL_ENTRANCE_BOTTOM, WORLD_CHAR_BLANK
	tileExtraData C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, C64_MULTICOLOR_WHITE, TILE_MOVEMENT_PLAYER_ONLY
	; Rock floor
	byte WORLD_CHAR_ROCK_FLOOR, WORLD_CHAR_ROCK_FLOOR, WORLD_CHAR_ROCK_FLOOR, WORLD_CHAR_ROCK_FLOOR
	tileExtraData C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, C64_MULTICOLOR_BLACK, TILE_MOVEMENT_CLEAR
	; Pear tree
	byte WORLD_CHAR_PEAR_TREE_CANOPY_LEFT, WORLD_CHAR_PEAR_TREE_CANOPY_RIGHT, WORLD_CHAR_TREE_TRUNK_LEFT, WORLD_CHAR_TREE_TRUNK_RIGHT
	tileExtraData C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, C64_MULTICOLOR_GREEN, TILE_MOVEMENT_WALL