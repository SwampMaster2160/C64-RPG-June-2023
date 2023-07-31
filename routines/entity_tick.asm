dummy_entity_tick subroutine
	ldy #ENTITY_TICK_RETURN_NONE
	jsr generate_random
	and #%11110000
	bne .do_not_walk
	jsr generate_random
	and #%00000011
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
.do_not_walk
	rts

block_entity_vertical_tick subroutine
	; Find player index and load into y
	txa
	pha
	lda #ENTITY_PLAYER
	jsr find_entity_index
	txa
	tay
	pla
	pha
	tax
	;
	lda entity_y_positions,x
	cmp entity_y_positions,y
	beq .skip_moving_vertically
	bpl .skip_moving_up
	tya
	tax
	lda #DIRECTION_UP
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
	pla
	tax
	rts
.skip_moving_up
	tya
	tax
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	pla
	tax
	rts
.skip_moving_vertically
	; Return
	ldy #ENTITY_TICK_RETURN_NONE
	pla
	tax
	rts

player_entity_tick subroutine
	ldy #ENTITY_TICK_RETURN_NONE
	; Rotation
	lda is_up_key_pressed
	beq .not_pressing_up
	lda #DIRECTION_UP
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
.not_pressing_up
	lda is_down_key_pressed
	beq .not_pressing_down
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
.not_pressing_down
	lda is_left_key_pressed
	beq .not_pressing_left
	lda #DIRECTION_LEFT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
.not_pressing_left
	lda is_right_key_pressed
	beq .not_pressing_right
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
.not_pressing_right
	; Return
	rts