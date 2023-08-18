; Loads a map
; --- Inputs ---
; map_id: The map ID to load
; --- Corrupted ---
; a, word_1, word_0
load_map subroutine
	; Set the current map id and clear non-player entities
	tya
	pha
	txa
	pha
	lda temp_x
	pha
	lda temp_y
	pha
	jsr clear_entities
	jsr clear_tile_events
	lda #0
	sta map_heap_size
	; Set the map to need redrawing but not need reloading
	lda #0
	sta does_map_need_reload
	lda #1
	sta does_map_need_redraw
	; Load a pointer to the map's struct into word_1
	lda map_id
	asl
	clc
	adc #<map_pointers
	php
	sta word_0
	lda map_id
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>map_pointers
	sta word_0+1
	ldy #0
	lda (word_0),y
	sta word_1
	iny
	lda (word_0),y
	sta word_1+1
	; Load the map's metatiles
	ldy #0
.load_metatiles_loop
	lda (word_1),y
	sta map_metatiles,y
	iny
	cpy #50
	bne .load_metatiles_loop
	; Colors
	lda (word_1),y
	sta map_colors
	iny
	lda (word_1),y
	sta map_colors+1
	iny
	; Connections
	lda (word_1),y
	sta map_border_connections
	iny
	lda (word_1),y
	sta map_border_connections+1
	iny
	lda (word_1),y
	sta map_border_connections+2
	iny
	lda (word_1),y
	sta map_border_connections+3
	iny
	; Load address of script to call
	lda (word_1),y
	sta script_address
	iny
	lda (word_1),y
	sta script_address+1
	iny
	; Map name
	lda (word_1),y
	sta map_name_address
	iny
	lda (word_1),y
	sta map_name_address+1
	;iny

	; Execute script that should be called when loading the map
	jsr execute_script
	; Set HUD to need redrawing
	lda #1
	sta does_hud_need_redraw
	; Return
	pla
	sta temp_y
	pla
	sta temp_x
	pla
	tax
	pla
	tay
	rts

; Clears all entities by setting them to be none except the player entity in slot 0
; --- Corrupted ---
; a, x
clear_entities subroutine
	; Start at slot 7 and work downwards
	ldx #7
	lda #ENTITY_NONE
.loop
	; Clear the slot
	sta entity_discriminants,x
	; Go to the next slot downwards
	dex
	bne .loop
	; Return if we have cleared all slots
	rts

; Inits entity slot 0 to be the player
; --- Corrupted ---
; a
init_player subroutine
	; Set slot 0 to be a player
	lda #ENTITY_PLAYER
	sta entity_discriminants
	; With a pos at (9, 4)
	lda #9
	sta entity_x_positions
	lda #4
	sta entity_y_positions
	; Make the player face downwards and it needs to be redrawn and have its sprite image updated
	lda #(DIRECTION_DOWN | ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (0 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags
	; Return
	rts

; Spawns an entity in the entity slot that has the lowest index and is empty. Will fail if all 8 slots are fill and do nothing.
; --- Inputs ---
; a:                The entity ID to load
; (temp_x, temp_y): The pos to spawn the entity at
; --- Corrupted ---
; a, x
spawn_entity subroutine
	; Find the slot to put the entity into or return if all slots are full, preserve a.
	pha
	ldx #$FF
.find_empty_entity_slot_loop
	inx
	cpx #8
	bne .skip_return
	rts
.skip_return
	lda entity_discriminants,x
	cmp #ENTITY_NONE
	bne .find_empty_entity_slot_loop
	pla
	; Set discriminant and position of entity
	sta entity_discriminants,x
	lda temp_x
	sta entity_x_positions,x
	lda temp_y
	sta entity_y_positions,x
	; Make the entity faces downwards and it needs to be redrawn and have its sprite image updated
	lda #(DIRECTION_DOWN | ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (0 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	; Return
	rts

; Get the entity slot of the first entity that has an matching ID
; --- Inputs ---
; a: The entity ID to search for
; --- Outputs ---
; x: The entity slot index of the matching entity with the lowest index or $FF if the entity was not found
find_entity_index subroutine
	ldx #$FF
.loop
	inx
	cpx #8
	bne .skip_entity_not_found
	ldx #$FF
	rts
.skip_entity_not_found
	cmp entity_discriminants,x
	bne .loop
	rts

; Sets entity x to face a direction
; --- Inputs ---
; a: The direction to face
; x: The index of the entity
; --- Corrupted ---
; a
make_entity_face_direction subroutine
	sta byte_0
	;lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	;and #%00000011
	;cmp byte_0
	;beq .end
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%11111100
	ora byte_0
	ora #ENTITY_IMAGE_CHANGE
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
.end
	rts

; Checks if an entity can walk to a tile that is not offscreen
; --- Inputs ---
; x:                The index of the entity
; (temp_x, temp_y): The position that we want to check
; --- Outputs ---
; a: Can we walk to this tile
; --- Corrupted ---
; y
is_onscreen_tile_clear subroutine
	; Collision with walls
	jsr get_tile
	ldy #4
	jsr get_tile_high_nibble
	cmp #TILE_MOVEMENT_WALL
	beq .not_clear
	; Player only tiles
	cmp #TILE_MOVEMENT_PLAYER_ONLY
	bne .skip_player_only_movment
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .not_clear
.skip_player_only_movment
	; Collision with other entities
	; Loop through all entities
	ldy #8
.entity_collision_check_loop
	dey
	; If we have looped through all entities then the tile is clear
	bmi .entity_collision_check_loop_end
	; Skip entity if it is a none entity
	lda entity_discriminants,y
	cmp #ENTITY_NONE
	beq .entity_collision_check_loop
	; Skip entity if its x pos is not equal to temp_x
	lda temp_x
	cmp entity_x_positions,y
	bne .entity_collision_check_loop
	; Skip entity if its y pos is not equal to temp_y
	lda temp_y
	cmp entity_y_positions,y
	bne .entity_collision_check_loop
	; Otherwise the tile is not clear
	jmp .not_clear
.entity_collision_check_loop_end
	lda #TILE_MOVEMENT_CLEAR
	rts
.not_clear
	lda #TILE_MOVEMENT_WALL
	rts

; Check if a position is inside a event script's area
; --- Inputs ---
; y:                The index of the event script
; (temp_x, temp_y): The position to check
; --- Outputs ---
; a: Is the pos inside the script area (bool)
is_pos_on_tile_event subroutine
	; Return false if entity X is not on the tile event
	lda tile_event_x_positions,y
	cmp #$FF
	beq .entity_does_x_overlap
	and #%00011111
	sta byte_0
	sec
	sbc #1
	cmp temp_x
	bpl .not_on_tile_event
	lda tile_event_x_positions,y
	lsr
	lsr
	lsr
	lsr
	lsr
	clc
	adc byte_0
	cmp temp_x
	bmi .not_on_tile_event
.entity_does_x_overlap
	; Return false if entity Y is not on the tile event
	lda tile_event_y_positions,y
	cmp #$FF
	beq .entity_does_y_overlap
	and #%00001111
	sec
	sbc #1
	cmp temp_y
	bpl .not_on_tile_event
	lda tile_event_y_positions,y
	lsr
	lsr
	lsr
	lsr
	cmp temp_y
	bmi .not_on_tile_event
.entity_does_y_overlap
	; Return true
	lda #1
	rts
.not_on_tile_event
	; Return false
	lda #0
	rts

; Called whenever an entity finnishes walking from a tile to another and lands on a tile
; --- Inputs ---
; x: The index of the entity
; --- Corrupted ---
; a, y, temp_x, temp_y
entity_lands_on_tile subroutine
	; Check which tile events the entity has landed on a tile
	ldy #$FF
.next_tile_event
	iny
	cpy #MAX_TILE_EVENTS
	beq .tile_event_loop_end
	; Skip null tile events
	lda tile_event_discriminants,y
	beq .next_tile_event
	; Is the entity standing on the tile event? Skip if not.
	lda entity_x_positions,x
	sta temp_x
	lda entity_y_positions,x
	sta temp_y
	jsr is_pos_on_tile_event
	cmp #0
	beq .next_tile_event
	; If we are on the tile event
	lda tile_event_discriminants,y
	asl
	asl
	clc
	adc #<tile_events
	sta word_0
	php
	lda tile_event_discriminants,y
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>tile_events
	sta word_0+1
	tya
	pha
	ldy #0
	lda (word_0),y
	sta word_1
	iny
	lda (word_0),y
	sta word_1+1
	pla
	tay
	lda #>(.tile_event_subroutine_end-1)
	pha
	lda #<(.tile_event_subroutine_end-1)
	pha
	jmp (word_1)
.tile_event_subroutine_end
	; Next tile event
	jmp .next_tile_event
.tile_event_loop_end
	; Return
	rts

; Called whenever an entity trys to walk to a tile, executes map scripts on said tile
; --- Inputs ---
; x:                The index of the entity
; (temp_x, temp_y): The location the player is trying to walk to
; --- Corrupted ---
; a, y, word_0, word_2
do_tile_events_looked_at subroutine
	ldy #$FF
.next_tile_event
	iny
	cpy #MAX_TILE_EVENTS
	beq .tile_event_loop_end
	; Skip null tile events
	lda tile_event_discriminants,y
	beq .next_tile_event
	; Does entity want to move to tile event tile event? Skip if not.
	jsr is_pos_on_tile_event
	cmp #0
	beq .next_tile_event
	; If we are on the tile event
	lda tile_event_discriminants,y
	asl
	asl
	clc
	adc #<tile_events
	sta word_0
	php
	lda tile_event_discriminants,y
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>tile_events
	sta word_0+1
	tya
	pha
	ldy #2
	lda (word_0),y
	sta word_2
	iny
	lda (word_0),y
	sta word_2+1
	pla
	tay
	lda #>(.tile_event_subroutine_end-1)
	pha
	lda #<(.tile_event_subroutine_end-1)
	pha
	jmp (word_2)
.tile_event_subroutine_end
	; Next tile event
	jmp .next_tile_event
.tile_event_loop_end
	; Return
	rts

; Calculate the position of the tile infront of the entity and store it into (temp_x, temp_y)
; --- Inputs ---
; x: The index of the entity in the current entity list
; --- Outputs ---
; (temp_x, temp_y): The position of the tile infront of the entity
; --- Corrupted ---
; a
get_tile_pos_infront_of_entity subroutine
	; Load position the entity is standing on into (temp_x, temp_y)
	lda entity_x_positions,x
	sta temp_x
	lda entity_y_positions,x
	sta temp_y
	; Get the direction the entity is facing
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	; Decrement the y pos if the entity is facing up
	cmp #DIRECTION_UP
	bne .skip_up
	dec temp_y
.skip_up
	; Increment the x pos if the entity is facing right
	cmp #DIRECTION_RIGHT
	bne .skip_right
	inc temp_x
.skip_right
	; Increment the y pos if the entity is facing down
	cmp #DIRECTION_DOWN
	bne .skip_down
	inc temp_y
.skip_down
	; Decrement the x pos if the entity is facing left
	cmp #DIRECTION_LEFT
	bne .skip_left
	dec temp_x
.skip_left
	; Return
	rts

; Entity tick
; --- Inputs ---
; x: The index of the entity
; --- Corrupted ---
; a, y, word_0, byte_0, byte_1, temp_x, temp_y
entity_tick subroutine
	; Move forward if walking
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00111100
	beq .skip_steping_forward
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	sec
	sbc #%00000100
	ora #ENTITY_NEEDS_REDRAW
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00111100
	beq .landing_on_tile
	rts
.landing_on_tile
	jsr entity_lands_on_tile
	rts
.skip_steping_forward
	; Call the entities tick subroutine
	lda entity_discriminants,x
	asl
	asl
	asl
	clc
	adc #<(entities+6)
	php
	sta word_0
	lda entity_discriminants,x
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>(entities+6)
	sta word_0+1
	ldy #0
	lda (word_0),y
	sta word_1
	iny
	lda (word_0),y
	sta word_1+1
	lda #>(.entity_tick_subroutine_end-1)
	pha
	lda #<(.entity_tick_subroutine_end-1)
	pha
	jmp (word_1)
.entity_tick_subroutine_end
	; Return if the entity should do nothing
	cpy #ENTITY_TICK_RETURN_NONE
	bne .skip_none
	rts
.skip_none
	; Calculate the tile pos the entity is facing
	jsr get_tile_pos_infront_of_entity
	; Try walk if the entity should walk
	; Skip if the entity does not want to walk
	cpy #ENTITY_TICK_RETURN_TRY_WALK
	beq .do_walk
	rts
.do_walk
	; Call tile events that should be called when the player thys to walk towards them
	jsr do_tile_events_looked_at
	; If the entity wants to walk off the map then warp to the map connected to that side if it is a player, otherwise do not let the entity walk offscreen.
	lda temp_x
	cmp #$FF
	bne .skip_walk_left_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	beq .skip_return_0
	rts
.skip_return_0
	lda map_border_connections+3
	beq .skip_walk
	sta map_id
	lda #19
	sta temp_x
	lda #1
	sta does_map_need_reload
	jmp .can_walk
.skip_walk_left_off_map
	lda temp_x
	cmp #20
	bne .skip_walk_right_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda map_border_connections+1
	beq .skip_walk
	sta map_id
	lda #0
	sta temp_x
	lda #1
	sta does_map_need_reload
	jmp .can_walk
.skip_walk_right_off_map
	lda temp_y
	cmp #$FF
	bne .skip_walk_up_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda map_border_connections
	beq .skip_walk
	sta map_id
	lda #9
	sta temp_y
	lda #1
	sta does_map_need_reload
	jmp .can_walk
.skip_walk_up_off_map
	lda temp_y
	cmp #10
	bne .skip_walk_down_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda map_border_connections+2
	beq .skip_walk
	sta map_id
	lda #0
	sta temp_y
	lda #1
	sta does_map_need_reload
	jmp .can_walk
.skip_walk_down_off_map
	; If the entity is walking onto a tile that is onscreen then check that it can do so
	jsr is_onscreen_tile_clear
	cmp #TILE_MOVEMENT_WALL
	beq .skip_walk
	; Walk
.can_walk
	lda temp_x
	sta entity_x_positions,x
	lda temp_y
	sta entity_y_positions,x
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	ora #(%00111100 | ENTITY_NEEDS_REDRAW)
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
.skip_walk
	; Return
	rts

; Get the metatile ID of the metatile containing the tile at (temp_x, temp_y) of the currently loaded map
; --- Inputs ---
; temp_x, temp_y, map_id
; --- Outputs ---
; a: The metatile at the location
; --- Corrupted ---
; byte_0, y
get_metatile subroutine
	; Get metatile id
	lda temp_y
	pha
	lsr
	asl
	sta temp_y
	asl
	asl
	clc
	adc temp_y
	sta byte_0
	pla
	sta temp_y
	lda temp_x
	lsr
	clc
	adc byte_0
	tay
	lda map_metatiles,y
	rts

; Get the tile ID of the tile at (temp_x, temp_y) of the currently loaded map
; --- Inputs ---
; temp_x, temp_y, map_id
; --- Outputs ---
; a: The tile at the location
; --- Corrupted ---
; byte_0, word_1, word_0, y
get_tile subroutine
	; Get location of the tiles
	jsr get_metatile
	jsr load_metatile_data_pointer
	; Get tile
	lda temp_y
	and #%00000001
	asl
	sta byte_0
	lda temp_x
	and #%00000001
	clc
	adc byte_0
	tay
	lda (word_0),y
	;sta c64_chars
	rts

; Get the high nibble #y of the tile
; --- Inputs ---
; a: The tile ID
; y: The byte index of the tile's struct that we should get the high nibble from
; --- Outputs ---
; a: The high nibble
; --- Corrupted ---
; byte_1, word_0
get_tile_high_nibble subroutine
	; Get location of the tile's data
	jsr load_tile_data_pointer
	; Get nibble
	lda (word_0),y
	lsr
	lsr
	lsr
	lsr
	rts

; Called 50 times/second
world_tick subroutine
	jsr get_keys_pressed
	; Tick each non-null entity
	ldx #0
.entity_tick_loop
	lda entity_discriminants,x
	beq .dont_tick_entity
	jsr entity_tick
.dont_tick_entity
	inx
	cpx #8
	bne .entity_tick_loop
	; Reload map if needed
	lda does_map_need_reload
	beq .map_does_not_need_reloading
	jsr load_map
.map_does_not_need_reloading
	; Return
	rts

; Clears all tile events, setting them to have #TILE_EVENT_NONE as a discriminant
; --- Corrupted ---
; a, x
clear_tile_events subroutine
	ldx #MAX_TILE_EVENTS - 1
	lda #TILE_EVENT_NONE
.loop
	sta tile_event_discriminants,x
	dex
	bpl .loop
	rts

; Spawns a tile event, placing it in the lowest indexed slot that is clear, the entity is loaded from a script
; --- Corrupted ---
; a, x
spawn_tile_event subroutine
	; Search for an empty slot and load empty slot index into x
	ldx #$FF
.find_empty_slot_loop
	inx
	lda tile_event_discriminants,x
	bne .find_empty_slot_loop ; TILE_EVENT_NONE is 0
	; Spawn entity
	lda (script_address),y
	iny
	sta tile_event_discriminants,x
	lda (script_address),y
	iny
	sta tile_event_x_positions,x
	lda (script_address),y
	iny
	sta tile_event_y_positions,x
	lda map_heap_size
	sta tile_event_extra_bytes,x
	tax
	lda (script_address),y
	sta byte_0
	iny
	jsr map_heap_allocate
	; Increment script_address by y and set y to 0
	tya
	clc
	adc script_address
	sta script_address
	lda script_address+1
	adc #0
	sta script_address+1
	ldy #0
	; Copy extra data
.copy_loop
	cpy byte_0
	beq .copy_loop_end
	lda (script_address),y
	sta map_heap,x
	iny
	inx
	jmp .copy_loop
.copy_loop_end
	; Return
	rts