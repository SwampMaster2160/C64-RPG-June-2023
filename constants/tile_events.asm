; Tile events
	newEnum
	enumVariant TILE_EVENT_NONE                          ; Must be 0
	enumVariant TILE_EVENT_WARP_DOOR_OUTSIDE             ; Teleport player to a map and pos when landed on, player will then walk upwards to the pos
	enumVariant TILE_EVENT_WARP_DOOR_INSIDE              ; Teleport player to a map and pos when the player trys to walk to the tile event, player will then walk downwards to the pos
	enumVariant TILE_EVENT_WARP_CAVE_ENTRENCE_LEFT_RIGHT ; Teleport player to a map and x-pos when the player trys to walk to the tile event, player will then walk to the pos, the y-pos and direction facing will not change for the player
	enumVariant TILE_EVENT_WALL_GATE                     ; Opens if the player has the gate key
	enumVariant TILE_EVENT_FALLEN_TREE                   ; Can be removed with a weak axe
	enumVariant TILE_EVENT_CHOPPABLE_TREE                ; Can be removed with an axe