; A list of metatiles
metatiles subroutine
	byte TILE_BLANK,              TILE_BLANK,               TILE_BLANK,                          TILE_BLANK                             ; Blank
	byte TILE_HOUSE_ROOF_LEFT,    TILE_HOUSE_ROOF_RIGHT,    TILE_BUILDING_BOTTOM_LEFT_WITH_DOOR, TILE_BUILDING_BOTTOM_RIGHT_WITH_WINDOW ; House
	byte TILE_FLAT_ROOF_LEFT,     TILE_FLAT_ROOF_RIGHT,     TILE_BUILDING_BOTTOM_LEFT_WITH_DOOR, TILE_BUILDING_BOTTOM_RIGHT_WITH_WINDOW ; Building
	byte TILE_GRASS,              TILE_GRASS,               TILE_GRASS,                          TILE_GRASS                             ; Grass
	byte TILE_TOWN_PATH_LEFT,     TILE_TOWN_PATH_RIGHT,     TILE_TOWN_PATH_LEFT,                 TILE_TOWN_PATH_RIGHT                   ; Path town vertical
	byte TILE_TOWN_PATH_TOP,      TILE_TOWN_PATH_TOP,       TILE_TOWN_PATH_BOTTOM,               TILE_TOWN_PATH_BOTTOM                  ; Path town horizontal
	byte TILE_TOWN_PATH_TOP_LEFT, TILE_TOWN_PATH_TOP_RIGHT, TILE_TOWN_PATH_BOTTOM_LEFT,          TILE_TOWN_PATH_BOTTOM_RIGHT            ; Path town cross
	byte TILE_TREE,               TILE_TREE,                TILE_TREE,                           TILE_TREE                              ; Trees
	byte TILE_WATER,              TILE_WATER,               TILE_WATER,                          TILE_WATER                             ; Water
	byte TILE_SHALLOW_WATER,      TILE_SHALLOW_WATER,       TILE_SHALLOW_WATER,                  TILE_SHALLOW_WATER                     ; Shallow water
	byte TILE_SAND,               TILE_SAND,                TILE_SAND,                           TILE_SAND                              ; Sand
	byte TILE_DIRT_PATH_LEFT,     TILE_DIRT_PATH_RIGHT,     TILE_DIRT_PATH_LEFT,                 TILE_DIRT_PATH_RIGHT                   ; Dirt path vertical
	byte TILE_DIRT_PATH_TOP_LEFT, TILE_DIRT_PATH_RIGHT,     TILE_DIRT_PATH_BOTTOM_LEFT,          TILE_DIRT_PATH_RIGHT                   ; Dirt path vertical left
	byte TILE_DIRT_PATH_LEFT,     TILE_DIRT_PATH_TOP_RIGHT, TILE_DIRT_PATH_LEFT,                 TILE_DIRT_PATH_BOTTOM_RIGHT            ; Dirt path vertical right
	byte TILE_DIRT_PATH_TOP,      TILE_DIRT_PATH_TOP,       TILE_DIRT_PATH_BOTTOM,               TILE_DIRT_PATH_BOTTOM                  ; Dirt path horizontal
	byte TILE_DIRT_PATH_TOP_LEFT, TILE_DIRT_PATH_TOP_RIGHT, TILE_DIRT_PATH_BOTTOM,               TILE_DIRT_PATH_BOTTOM                  ; Dirt path horizontal up
	byte TILE_DIRT_PATH_TOP,      TILE_DIRT_PATH_TOP,       TILE_DIRT_PATH_BOTTOM_LEFT,          TILE_DIRT_PATH_BOTTOM_RIGHT            ; Dirt path horizontal down
	byte TILE_DIRT_PATH_TOP_LEFT, TILE_DIRT_PATH_TOP_RIGHT, TILE_DIRT_PATH_BOTTOM_LEFT,          TILE_DIRT_PATH_BOTTOM_RIGHT            ; Dirt path cross
	byte TILE_BOARDWALK_LEFT,     TILE_BOARDWALK_RIGHT,     TILE_BOARDWALK_LEFT,                 TILE_BOARDWALK_RIGHT                   ; Boardwalk vertical
	byte TILE_BOARDWALK_TOP,      TILE_BOARDWALK_TOP,       TILE_BOARDWALK_BOTTOM,               TILE_BOARDWALK_BOTTOM                  ; Boardwalk horizontal
	byte TILE_ROCKS,              TILE_ROCKS,               TILE_ROCKS,                          TILE_ROCKS                             ; Rocks