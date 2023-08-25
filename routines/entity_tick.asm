dummy_entity_tick subroutine
	jsr generate_random
	and #%11110000
	bne .do_not_walk
	jsr generate_random
	and #%00000011
	jsr make_entity_face_direction
	jsr entity_try_walk
.do_not_walk
	rts

blank_entity_tick subroutine
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
	jsr entity_try_walk
	rts
.skip_moving_up
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	jsr entity_try_walk
	rts
	; Else look towards player if they are at the same y pos
.skip_moving_vertically
	lda entity_x_positions,x
	cmp entity_x_positions,y
	bmi .skip_moving_left
	lda #DIRECTION_LEFT
	jsr make_entity_face_direction
	rts
.skip_moving_left
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
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
	jsr entity_try_walk
	rts
.skip_moving_left
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
	jsr entity_try_walk
	rts
	; Else look towards player if they are at the same x pos
.skip_moving_horizontally
	lda entity_y_positions,x
	cmp entity_y_positions,y
	bmi .skip_moving_up
	lda #DIRECTION_UP
	jsr make_entity_face_direction
	rts
.skip_moving_up
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
	rts

player_entity_tick subroutine
	; Interact then return if the player is pressing the action button
	jsr is_action_key_pressed_starting_this_frame
	beq .no_interaction
	jsr entity_interact
	rts
.no_interaction
	; Load a null direction
	lda #$FF
	; If a movement key is pressed then load it's direction over the null direction
	; Up
	ldy is_up_key_pressed
	beq .not_pressing_up
	lda #DIRECTION_UP
.not_pressing_up
	; Down
	ldy is_down_key_pressed
	beq .not_pressing_down
	lda #DIRECTION_DOWN
.not_pressing_down
	; Left
	ldy is_left_key_pressed
	beq .not_pressing_left
	lda #DIRECTION_LEFT
.not_pressing_left
	; Right
	ldy is_right_key_pressed
	beq .not_pressing_right
	lda #DIRECTION_RIGHT
.not_pressing_right
	; If a key was pressed then look in that direction and try to walk
	cmp #$FF
	beq .skip_walk
	jsr make_entity_face_direction
	jsr entity_try_walk
.skip_walk
	; Return
	rts