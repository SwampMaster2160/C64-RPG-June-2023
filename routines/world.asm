; Loads a map
; --- Inputs ---
; a: The map ID to load
; --- Corrupted ---
; a
load_map subroutine
	; Set the current map id and clear non-player entities
	sta current_map
	txa
	pha
	lda temp_x
	pha
	lda temp_y
	pha
	jsr clear_entities
	; Set the map to need redrawing
	lda #1
	sta does_map_need_redraw
	; Test entity
	lda #16
	sta temp_x
	lda #5
	sta temp_y
	lda #ENTITY_TEST
	jsr spawn_entity
	; Return
	pla
	sta temp_y
	pla
	sta temp_x
	pla
	tax
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
	; With a pos at (1, 4)
	lda #1
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
	cmp #TILE_MOVEMENT_CLEAR
	bne .not_clear
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

; Checks if an entity can walk to a tile that is not offscreen
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
	sta lda_y_modable_0_address
	lda entity_discriminants,x
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>(entities+6)
	sta lda_y_modable_0_address+1
	ldy #0
	jsr lda_y_modable_0
	sta word_0
	iny
	jsr lda_y_modable_0
	sta word_0+1
	lda #>(.entity_tick_subroutine_end-1)
	pha
	lda #<(.entity_tick_subroutine_end-1)
	pha
	jmp (word_0)
.entity_tick_subroutine_end
	; Return if the entity should do nothing
	cpy #ENTITY_TICK_RETURN_NONE
	bne .skip_none
	rts
.skip_none
	; Get the location of the map
	; Low byte
	lda current_map
	asl
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<maps
	php
	sta lda_y_modable_1_address
	; High byte
	lda current_map
	lsr
	lsr
	plp
	adc #>maps
	sta lda_y_modable_1_address+1
	; Calculate the tile pos the entity is facing
	lda entity_x_positions,x
	sta temp_x
	lda entity_y_positions,x
	sta temp_y
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	cmp #DIRECTION_UP
	bne .skip_up
	dec temp_y
.skip_up
	cmp #DIRECTION_RIGHT
	bne .skip_right
	inc temp_x
.skip_right
	cmp #DIRECTION_DOWN
	bne .skip_down
	inc temp_y
.skip_down
	cmp #DIRECTION_LEFT
	bne .skip_left
	dec temp_x
.skip_left
	; Try walk if the entity should walk
	; Skip if the entity does not want to walk
	cpy #ENTITY_TICK_RETURN_TRY_WALK
	bne .skip_walk
	; If the entity wants to walk off the map then warp to the map connected to that side if it is a player, otherwise do not let the entity walk offscreen.
	lda temp_x
	cmp #$FF
	bne .skip_walk_left_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda #19
	sta temp_x
	ldy #55
	jsr lda_y_modable_1
	jsr load_map
.skip_walk_left_off_map
	lda temp_x
	cmp #20
	bne .skip_walk_right_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda #0
	sta temp_x
	ldy #53
	jsr lda_y_modable_1
	jsr load_map
.skip_walk_right_off_map
	lda temp_y
	cmp #$FF
	bne .skip_walk_up_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda #9
	sta temp_y
	ldy #52
	jsr lda_y_modable_1
	jsr load_map
.skip_walk_up_off_map
	lda temp_y
	cmp #10
	bne .skip_walk_down_off_map
	lda entity_discriminants,x
	cmp #ENTITY_PLAYER
	bne .skip_walk
	lda #0
	sta temp_y
	ldy #54
	jsr lda_y_modable_1
	jsr load_map
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
; temp_x, temp_y, current_map
; --- Outputs ---
; a: The metatile at the location
; --- Corrupted ---
; byte_0, lda_y_modable_1_address, y
get_metatile subroutine
	; Get the location of the map data
	jsr load_map_data_pointer
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
	jsr lda_y_modable_1
	;sta c64_chars
	rts

; Get the tile ID of the tile at (temp_x, temp_y) of the currently loaded map
; --- Inputs ---
; temp_x, temp_y, current_map
; --- Outputs ---
; a: The tile at the location
; --- Corrupted ---
; byte_0, lda_y_modable_1_address, lda_y_modable_0_address, y
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
	jsr lda_y_modable_0
	;sta c64_chars
	rts

; Get the high nibble #y of the tile
; --- Inputs ---
; a: The tile ID
; y: The byte index of the tile's struct that we should get the high nibble from
; --- Outputs ---
; a: The high nibble
; --- Corrupted ---
; byte_1, lda_y_modable_0_address
get_tile_high_nibble subroutine
	; Get location of the tile's data
	jsr load_tile_data_pointer
	; Get nibble
	jsr lda_y_modable_0
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
	; Return
	rts