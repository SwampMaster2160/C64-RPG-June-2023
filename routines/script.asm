; Execute the a script
; --- Inputs ---
; script_address: A pointer to the map script
; --- Corrupted ---
; a, x, y, script_address
execute_script subroutine
	ldy #0
.loop
	; Increment script_address by y and set y to 0
	tya
	clc
	adc script_address
	sta script_address
	lda script_address+1
	adc #0
	sta script_address+1
	ldy #0
	; Get opcode
	lda (script_address),y
	iny
	; Script end opcode
	cmp #SCRIPT_END
	bne .skip_end
	rts
.skip_end
	; Draw char
	cmp #32
	bcc .skip_char_draw
	ldy #0
	sta (text_cursor_address),y
	lda text_cursor_address
	sta word_1
	lda text_cursor_address+1
	clc
	adc #>(c64_char_colors-c64_chars)
	sta word_1+1
	lda text_color
	ldy #0
	sta (word_1),y
	lda text_cursor_address
	clc
	adc #1
	sta text_cursor_address
	lda text_cursor_address+1
	adc #0
	sta text_cursor_address+1
	ldy #1
	jmp .loop
.skip_char_draw
	; Call machine code subroutine
	cmp #SCRIPT_CALL_MACHINE_SUBROUTINE
	bne .skip_call_machine_subroutine
	lda script_address
	pha
	lda script_address+1
	pha
	lda (script_address),y
	sta word_1
	iny
	lda (script_address),y
	sta word_1+1
	lda #>(.call_machine_code_subroutine_end-1)
	pha
	lda #<(.call_machine_code_subroutine_end-1)
	pha
	jmp (word_1)
.call_machine_code_subroutine_end
	pla
	sta script_address+1
	pla
	sta script_address
	ldy #3
	jmp .loop
.skip_call_machine_subroutine
	; Spawn entity opcode
	cmp #SCRIPT_SPAWN_ENTITY
	bne .skip_entity
	lda (script_address),y
	tax
	iny
	lda (script_address),y
	sta temp_x
	iny
	lda (script_address),y
	sta temp_y
	iny
	tya
	pha
	txa
	jsr spawn_entity
	pla
	tay
	jmp .loop
.skip_entity
	; Spawn tile event opcode
	cmp #SCRIPT_SPAWN_TILE_EVENT
	bne .skip_tile_event
	lda (script_address),y
	tax
	iny
	lda (script_address),y
	sta temp_x
	iny
	lda (script_address),y
	sta temp_y
	iny
	tya
	pha
	txa
	jsr spawn_tile_event
	pla
	tay
	jmp .loop
.skip_tile_event
	; Draw textbox
	cmp #SCRIPT_DRAW_TEXTBOX
	bne .skip_text_box
	lda (script_address),y
	pha
	iny
	lda (script_address),y
	tax
	pla
	tay
	jsr draw_textbox
	ldy #3
	jmp .loop
.skip_text_box
	; Change text color
	cmp #SCRIPT_CHANGE_TEXT_COLOR
	bne .skip_color_change
	lda (script_address),y
	iny
	sta text_color
	jmp .loop
.skip_color_change
	; Change text cursor pointer
	pha
	and #%11111100
	cmp #SCRIPT_CHANGE_TEXT_CURSOR_POINTER
	bne .skip_change_text_cursor_pointer
	pla
	and #%00000011
	clc
	adc #>c64_chars
	sta text_cursor_address+1
	lda (script_address),y
	iny
	sta text_cursor_address
	jmp .loop
.skip_change_text_cursor_pointer
	pla
	; Next instruction
	jmp .loop