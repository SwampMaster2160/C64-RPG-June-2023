; I/O operations that are not video related

get_keys_pressed subroutine
	; Get which keyboard keys are pressed
	; Row 0
	lda #%11111110
	sta c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed
	lda c64_keyboard_and_port_1_joystick_buttons_pressed
	eor #$FF
	and #%00000010 ; Return
	sta is_action_key_pressed
	; Row 1
	lda #%11111101
	sta c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed
	lda c64_keyboard_and_port_1_joystick_buttons_pressed
	eor #$FF
	tax
	and #%00000010 ; W
	sta is_up_key_pressed
	txa
	and #%00000100 ; A
	sta is_left_key_pressed
	txa
	and #%00100000 ; S
	sta is_down_key_pressed
	; Row 2
	lda #%11111011
	sta c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed
	lda c64_keyboard_and_port_1_joystick_buttons_pressed
	eor #$FF
	and #%00000100 ; D
	sta is_right_key_pressed
	; Joystick 2
	lda #%11111111
	sta c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed
	lda c64_keyboard_row_and_paddle_selection_and_port_2_joystick_buttons_pressed
	eor #$FF
	tax
	and #%00000001
	ora is_up_key_pressed
	sta is_up_key_pressed
	txa
	and #%00000010
	ora is_down_key_pressed
	sta is_down_key_pressed
	txa
	and #%00000100
	ora is_left_key_pressed
	sta is_left_key_pressed
	txa
	and #%00001000
	ora is_right_key_pressed
	sta is_right_key_pressed
	txa
	and #%00010000
	ora is_action_key_pressed
	sta is_action_key_pressed
	; Return
	rts