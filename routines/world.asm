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
	lda #(DIRECTION_DOWN | ENTITY_CHANGE | ENTITY_IMAGE_CHANGE)
	sta entity_facing_directions_and_walk_offsets
	; Return
	rts

; Called 50 times/second
world_tick subroutine
	; Calculate which entities should be visable
	; An entity is visable if it is not a none entity
	ldx #7
	lda #0
.entities_visable_loop
	asl
	ldy entity_discriminants,x
	beq .entity_invisable
	ora #%00000001
.entity_invisable
	dex
	bpl .entities_visable_loop
	sta world_sprites_visable
	; Return
	rts