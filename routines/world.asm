; Loads and draws a map
; --- Inputs ---
; a: The map ID to draw
; --- Corrupted ---
; y, lda_y_modable_0_address, lda_y_modable_1_address, sta_x_modable_0_address, sta_x_modable_1_address
load_map subroutine
	sta current_map
	jsr draw_map
	jsr clear_entities
	rts

; Clears all entities by setting them to be none except the player entity in slot 0
; --- Corrupted ---
; a, x
clear_entities subroutine
	ldx #7
	lda #ENTITY_NONE
.loop
	sta entity_discriminants,x
	dex
	bne .loop
	rts

; Inits entity slot 0 to be the player
; --- Corrupted ---
; a
init_player subroutine
	lda #ENTITY_PLAYER
	sta entity_discriminants
	lda #1
	sta entity_x_positions
	lda #4
	sta entity_y_positions
	lda #DIRECTION_DOWN
	sta entity_facing_directions_and_walk_offsets
	rts