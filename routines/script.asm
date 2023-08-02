; Execute the a script
; --- Inputs ---
; script_address: A pointer to the map script
; --- Corrupted ---
; a, x, y, script_address
execute_feature_script subroutine
	ldy #0
.loop
	lda (script_address),y
	iny
	cmp #SCRIPT_END
	bne .skip_end
	rts
.skip_end
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
	cmp #SCRIPT_DRAW_TEXT_BOX
	bne .skip_text_box
.skip_text_box
	jmp .loop