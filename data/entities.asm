entities = entities_actual - 16

entities_actual subroutine
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BLUE,  player_entity_tick,           blank_entity_interacted_with ; Player
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_TEST_DOWN,   ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_RED,   dummy_entity_tick,            dummy_entity_interacted_with ; Test entity
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BROWN, block_entity_vertical_tick,   blank_entity_interacted_with ; Block vertical
	entityData ENTITY_SPRITE_PLAYER_UP, ENTITY_SPRITE_PLAYER_RIGHT, ENTITY_SPRITE_PLAYER_DOWN, ENTITY_SPRITE_PLAYER_LEFT, C64_COLOR_BROWN, block_entity_horizontal_tick, blank_entity_interacted_with ; Block horizontal