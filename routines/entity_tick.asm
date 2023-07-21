dummy_entity_tick subroutine
	rts

player_tick subroutine
	; Rotation
	lda is_up_key_pressed
	beq .not_pressing_up
	lda #DIRECTION_UP
	jsr make_entity_face_direction
.not_pressing_up
	lda is_down_key_pressed
	beq .not_pressing_down
	lda #DIRECTION_DOWN
	jsr make_entity_face_direction
.not_pressing_down
	lda is_left_key_pressed
	beq .not_pressing_left
	lda #DIRECTION_LEFT
	jsr make_entity_face_direction
.not_pressing_left
	lda is_right_key_pressed
	beq .not_pressing_right
	lda #DIRECTION_RIGHT
	jsr make_entity_face_direction
.not_pressing_right
	; Return
	rts