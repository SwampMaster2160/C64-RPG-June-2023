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
	tax
	; Move vertically towards the player if they are above or below
	lda entity_y_positions,x
	cmp entity_y_positions,y
	beq .skip_moving_vertically
	bmi .skip_moving_up
	lda #DIRECTION_UP
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
	rts
.skip_moving_up
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
	rts
	; Else look towards player if they are at the same y pos
.skip_moving_vertically
	lda entity_x_positions,x
	cmp entity_x_positions,y
	bmi .skip_moving_left
	lda #DIRECTION_LEFT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_NONE
	rts
.skip_moving_left
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_NONE
	rts

block_entity_horizontal_tick subroutine
	; Find player index and load into y
	txa
	pha
	lda #ENTITY_PLAYER
	jsr find_entity_index
	txa
	tay
	pla
	tax
	; Move horizontally towards the player if they are to the left or right
	lda entity_x_positions,x
	cmp entity_x_positions,y
	beq .skip_moving_horizontally
	bmi .skip_moving_left
	lda #DIRECTION_LEFT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
	rts
.skip_moving_left
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_TRY_WALK
	rts
	; Else look towards player if they are at the same x pos
.skip_moving_horizontally
	lda entity_y_positions,x
	cmp entity_y_positions,y
	bmi .skip_moving_up
	lda #DIRECTION_UP
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_NONE
	rts
.skip_moving_up
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	ldy #ENTITY_TICK_RETURN_NONE
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