entities = entities_actual - 16

entities_actual subroutine
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BLUE,    player_entity_tick,           blank_entity_interacted_with              ; Player
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_TEST_DOWN,   ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_RED,     dummy_entity_tick,            dummy_entity_interacted_with              ; Test entity
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BROWN,   block_entity_vertical_tick,   blank_entity_interacted_with              ; Block vertical
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BROWN,   block_entity_horizontal_tick, blank_entity_interacted_with              ; Block horizontal
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_BLUE,    blank_entity_tick,            gem_entity_interacted_with                ; Saphire
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_RED,     blank_entity_tick,            gem_entity_interacted_with                ; Ruby
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_GREEN,   blank_entity_tick,            gem_entity_interacted_with                ; Emerald
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_MAGENTA, blank_entity_tick,            gem_entity_interacted_with                ; Amethyst
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_ORANGE,  blank_entity_tick,            gem_entity_interacted_with                ; Topaz
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_WHITE,   blank_entity_tick,            gem_entity_interacted_with                ; Quartz
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_YELLOW,  blank_entity_tick,            gem_entity_interacted_with                ; Legrandite
	entityData ENTITY_SPRITE_GEM,       ENTITY_SPRITE_GEM,          ENTITY_SPRITE_GEM,         ENTITY_SPRITE_GEM,         C64_COLOR_CYAN,    blank_entity_tick,            gem_entity_interacted_with                ; Diamond
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_RED,     blank_entity_tick,            do_not_block_amulet_giver_interacted_with ; Do not block amulet giver
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_GREEN,   block_entity_vertical_tick,   beach_blocker_interacted_with             ; Beach blocker