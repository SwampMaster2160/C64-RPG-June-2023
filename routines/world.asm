; Loads a map
; --- Inputs ---
; a: The map ID to draw
; --- Corrupted ---
; y, lda_y_modable_0_address, lda_y_modable_1_address, sta_x_modable_0_address, sta_x_modable_1_address
load_map subroutine
	; Set the current map id and clear non-player entities
	sta current_map
	jsr clear_entities
	; Set the map to need redrawing
	lda #1
	sta does_map_need_redraw
	;
	lda #ENTITY_TEST
	sta entity_discriminants+1
	; With a pos at (1, 4)
	lda #16
	sta entity_x_positions+1
	lda #5
	sta entity_y_positions+1
	; Make the test face downwards and it needs to be redrawn and have its sprite image updated
	lda #(DIRECTION_DOWN | ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE | (0 << 2))
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags+1
	; Return
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
	cpy #ENTITY_TICK_RETURN_TRY_WALK
	bne .skip_walk
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