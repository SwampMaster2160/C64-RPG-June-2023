; Draw routines

; Draws a 2x2 char tile on screen
; --- Inputs ---
; a:      The tile ID to draw
; x:      The drawing offset
; word_2: The address of the top left char on the screen that should be drawn over
; --- Corrupted ---
; y, word_0, byte_1
; --- Outputs ---
; x: Has 41 added
draw_tile subroutine
	; Get location of where the tile should be copied from (tiles + a * 8)
	jsr load_tile_data_pointer
	; Copy chars to screen
	ldy #0
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	ldy #1
	inx
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	; Next row
	ldy #2
	txa
	clc
	adc #39
	tax
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	ldy #3
	inx
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	; Copy colors to screen
	lda word_2+1
	clc
	adc #>(c64_char_colors-c64_chars)
	sta word_2+1
	;
	ldy #4
	txa
	sec
	sbc #41
	tax
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	ldy #5
	inx
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	; Next row
	ldy #6
	txa
	clc
	adc #39
	tax
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	ldy #7
	inx
	lda (word_0),y
	pha
	txa
	tay
	pla
	sta (word_2),y
	;
	lda word_2+1
	sec
	sbc #>(c64_char_colors-c64_chars)
	sta word_2+1
	; Return nothing
	rts

; Draws a 4x4 char metatile on screen
; --- Inputs ---
; a:      The metatile ID to draw
; x:      The drawing offset
; word_2: The address of the top left char on the screen that should be drawn over
; --- Corrupted ---
; y, word_0, byte_1
; --- Outputs ---
; x: Has 123 added
draw_metatile subroutine
	; Get location to copy metatile from
	jsr load_metatile_data_pointer
	; Get tiles
	ldy #3
	lda (word_0),y
	pha
	dey
	lda (word_0),y
	pha
	dey
	lda (word_0),y
	pha
	dey
	lda (word_0),y
	; Draw tiles
	jsr draw_tile
	txa
	sec
	sbc #39
	tax
	pla
	jsr draw_tile
	txa
	clc
	adc #37
	tax
	pla
	jsr draw_tile
	txa
	sec
	sbc #39
	tax
	pla
	jsr draw_tile
	; Return
	rts

draw_map_colors subroutine
	lda map_colors
	sta c64_border_color
	lsr
	lsr
	lsr
	lsr
	asl
	tax
	lda map_palettes,x
	sta world_background_color
	lsr
	lsr
	lsr
	lsr
	sta c64_background_colors+1
	lda map_palettes+1,x
	sta c64_background_colors+2
	rts

; Redraws the map
; --- Corrupted ---
; a, x, y, word_0, word_2, byte_1
redraw_map subroutine
	; Setup for world interrupt
	lda #((3 | C64_25_ROWS) | %10000000) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #32                              ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #0
	sta is_next_screen_interrupt_for_gui
	; Draw map colors
	jsr draw_map_colors
	; Get the locations of the chars and colors that we should copy to for the first row
	lda #<c64_chars
	sta word_2
	lda #>c64_chars
	sta word_2+1
	; Set the index into the metatiles of the map to 0
	ldy #0
	; At the start or each time we finnish drawing a row of metatiles
.rows_loop
	; Set the amount of metatiles we have drawn this row to 0
	lda #0
	sta byte_0
	; Set char offset to 0
	ldx #0
.row_loop
	; Draw metatile
	tya
	pha
	lda map_metatiles,y
	jsr draw_metatile
	pla
	tay
	; Set char offset for the next metatile
	txa
	sec
	sbc #119
	tax
	; Increment the index into the maps metatiles
	iny
	; If we have copied 50 tiles then return from the subroutine
	cpy #50
	beq .end
	; Increment the amount of metatiles that have been drawn this row
	lda byte_0
	clc
	adc #1
	sta byte_0
	; If we have drawn less than 10 tiles this row then continue on to draw the next char
	cmp #10
	bne .row_loop
	; If we have drawn 10 tiles then move the screen char and color pointers to point one metatile down
	lda word_2
	clc
	adc #160
	sta word_2
	lda word_2+1
	adc #0
	sta word_2+1
	; Continue on to draw next row
	jmp .rows_loop
; One all tiles have been drawn
.end
	; Return
	rts

; Fills screen with tile 0 colored white
; --- Corrupted ---
; a, x
clear_screen subroutine
	; Clear the first 3 pages of the screen
	ldx #$00
.loop
	lda #$0
	sta $0400,x
	sta $0500,x
	sta $0600,x
	lda #C64_COLOR_WHITE
	sta c64_char_colors,x
	sta c64_char_colors+$100,x
	sta c64_char_colors+$200,x
	inx
	bne .loop
	; Clear the last partial page of the screen such that a total of 1000 chars will have been cleared
	ldx #$0
.last_loop
	lda #$0
	sta $0700,x
	lda #C64_COLOR_WHITE
	sta c64_char_colors+$300,x
	inx
	cpx #<1000
	bne .last_loop
	rts

; Draws a textbox
; --- Inputs ---
; text_cursor_address: The address to draw the textbox at
; text_color:          The color to draw the textbox in
; y:                   The width of the textbox
; x:                   The height of the textbox
; --- Corrupted ---
; word_1, a
draw_textbox subroutine
	; Push x to stack
	dey
	tya
	pha
	; Calculate the pointer to the textbox's color area
	lda text_cursor_address
	sta word_1
	lda text_cursor_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta word_1+1
	; Draw first row
	jsr draw_textbox_top_chars_row
	pla
	pha
	tay
	jsr draw_textbox_colors_row
	;
	dex
.loop
	dex
	beq .loop_end
	; Move char and color pointers to the next row
	lda text_cursor_address
	clc
	adc #40
	sta text_cursor_address
	sta word_1
	lda text_cursor_address+1
	adc #0
	sta text_cursor_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta word_1+1
	pla
	pha
	tay
	jsr draw_textbox_middle_chars_row
	pla
	pha
	tay
	jsr draw_textbox_colors_row
	jmp .loop
.loop_end
	; Move char and color pointers to the next row
	lda text_cursor_address
	clc
	adc #40
	sta text_cursor_address
	sta word_1
	lda text_cursor_address+1
	adc #0
	sta text_cursor_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta word_1+1
	; Draw last row
	pla
	pha
	tay
	jsr draw_textbox_bottom_chars_row
	pla
	pha
	tay
	jsr draw_textbox_colors_row
	; Restore stack and return
	pla
	rts

; Draws the top row of a textbox
; --- Inputs ---
; text_cursor_address: The address to draw the textbox at
; y:                   The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_top_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_DOWN_LEFT
	sta (text_cursor_address),y
	; Draw middle chars
	lda #GUI_CHAR_LINE_HORIZONTAL
.loop
	dey
	beq .loop_end
	sta (text_cursor_address),y
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_RIGHT_DOWN
	sta (text_cursor_address),y
	; Return
	rts

; Draws a middle row of a textbox
; --- Inputs ---
; text_cursor_address: The address to draw the textbox at
; y:                   The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_middle_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_VERTICAL
	sta (text_cursor_address),y
	; Draw middle chars
	lda #'  ; Space
.loop
	dey
	beq .loop_end
	sta (text_cursor_address),y
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_VERTICAL
	sta (text_cursor_address),y
	; Return
	rts

; Draws the bottom row of a textbox
; --- Inputs ---
; text_cursor_address: The address to draw the textbox at
; y:                   The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_bottom_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_UP_LEFT
	sta (text_cursor_address),y
	; Draw middle chars
	lda #GUI_CHAR_LINE_HORIZONTAL
.loop
	dey
	beq .loop_end
	sta (text_cursor_address),y
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_UP_RIGHT
	sta (text_cursor_address),y
	; Return
	rts

; Draw a color row of a textbox
; --- Inputs ---
; word_1: The address of the row's color ram to color
; y:      The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_colors_row subroutine
	lda text_color
.loop
	sta (word_1),y
	dey
	bmi .loop_end
	jmp .loop
.loop_end
	rts

; Display all 256 chars in the top left as a 16x16 box
; --- Corrupted ---
; word_0, y, a
display_all_chars subroutine
	; Load $0400 into word_0
	lda #<c64_chars
	sta word_0
	lda #>c64_chars
	sta word_0+1
	; Start with tile 0
	ldy #0
.loop
	; Draw tile
	tya
	sta (word_0),y
	; Increment tile count
	iny
	; Check if we should go to the next row (if the tile id is a multiple of 16)
	tya
	and #%00001111 ; a %= 16
	bne .skip_next_row
	; If so add (40-16) to word_0's address
	lda word_0
	clc
	adc #(40-16)
	sta word_0
	lda word_0+1
	adc #0
	sta word_0+1
	; If not then we will skip to here
.skip_next_row
	; If the tile number overflows to 0 then we have drawn all tiles so return
	tya
	bne .loop
	rts

; Changes the position of sprite x to where entity x is
; --- Inputs ---
; x: The entity that we should update the position of
; --- Corrupted ---
; a, byte_0
redraw_entity_position subroutine
	stx byte_0
	; Clear X pos high bit for sprite
	lda #1
	ldx #0
.bit_loop_0
	cpx byte_0
	beq .bit_loop_0_end
	inx
	asl
	jmp .bit_loop_0
.bit_loop_0_end
	eor #$FF
	and c64_sprite_height_last_bits
	sta c64_sprite_height_last_bits
	ldx byte_0
	; Get x walking/border offset
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	tay
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	lsr
	lsr
	and #%00001111
	sta byte_0
	lda #24
	cpy #DIRECTION_LEFT
	bne .skip_add_x_walk_offset
	clc
	adc byte_0
.skip_add_x_walk_offset
	cpy #DIRECTION_RIGHT
	bne .skip_sub_x_walk_offset
	sec
	sbc byte_0
.skip_sub_x_walk_offset
	sta byte_0
	; Calculate X position
	; Low byte
	lda entity_x_positions,x
	asl
	asl
	asl
	asl
	clc
	adc byte_0
	php
	stx byte_0
	tay
	txa
	asl
	tax
	tya
	sta c64_sprite_coordinates,x
	ldx byte_0
	; High bit
	lda entity_x_positions,x
	lsr
	lsr
	lsr
	lsr
	plp
	adc #0
	; Shift high bit into the correct bit position for the sprite
	ldx #0
.bit_loop_1
	cpx byte_0
	beq .bit_loop_1_end
	inx
	asl
	jmp .bit_loop_1
.bit_loop_1_end
	ora c64_sprite_height_last_bits
	sta c64_sprite_height_last_bits
	ldx byte_0
	; Calculate Y position
	; Get y walking offset
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	tay
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	lsr
	lsr
	and #%00001111
	sta byte_0
	;
	lda entity_y_positions,x
	asl
	asl
	asl
	asl
	clc
	adc #50
	cpy #DIRECTION_UP
	bne .skip_add_y_walk_offset
	clc
	adc byte_0
.skip_add_y_walk_offset
	cpy #DIRECTION_DOWN
	bne .skip_sub_y_walk_offset
	sec
	sbc byte_0
.skip_sub_y_walk_offset
	pha
	txa
	asl
	tax
	pla
	sta c64_sprite_coordinates+1,x
	txa
	lsr
	tax
	; Return
	rts

; Changes the image of sprite x to be the image that entity x should have
; --- Inputs ---
; x: The entity that we should update the image of
; --- Corrupted ---
; a, word_2, y
redraw_entity_image subroutine
	; Calculate pointer to the sprite shape once loaded
	txa
	asl
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<sprite_shapes
	php
	sta word_1
	txa
	lsr
	lsr
	plp
	adc #>sprite_shapes
	sta word_1+1
	; Calculate pointer to the data for the sprite
	lda entity_discriminants,x
	asl
	asl
	asl
	clc
	adc #<entities
	php
	sta word_0
	lda entity_discriminants,x
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>entities
	sta word_0+1
	; Sprite color
	ldy #4
	lda (word_0),y
	sta c64_sprite_color_0s,x
	; Get sprite image to use
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	tay
	lda (word_0),y
	; Calculate pointer to the sprite image to load
	tay
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<entity_sprites
	php
	sta word_0
	tya
	lsr
	lsr
	lsr
	plp
	adc #>entity_sprites
	sta word_0+1
	; Copy sprite
	txa
	pha
	lda #0
	sta byte_0
	sta byte_1
.sprite_copy_loop
	ldy byte_0
	lda (word_0),y
	ldy byte_1
	sta (word_1),y
	inc byte_0
	inc byte_1
	ldy byte_0
	lda (word_0),y
	ldy byte_1
	sta (word_1),y
	inc byte_0
	inc byte_1
	inc byte_1
	lda byte_0
	cmp #32
	bne .sprite_copy_loop
	pla
	tax
	; Return
	rts

; Updates anything onscreen that should be redrawn
; --- Corrupted ---
; a, x, y, word_0, word_1, word_2, byte_1
redraw subroutine
	; Redraw map if needed then set it to not need redrawing
	lda does_map_need_redraw
	beq .skip_map_redraw
	lda #0
	sta does_map_need_redraw
	lda map_id
	jsr redraw_map
.skip_map_redraw
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
	; Redraw the sprites if needed
	ldx #7
.sprite_redraw_loop
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #ENTITY_NEEDS_REDRAW
	beq .skip_sprite_redraw
	jsr redraw_entity_position
.skip_sprite_redraw
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #ENTITY_IMAGE_CHANGE
	beq .skip_sprite_image_redraw
	jsr redraw_entity_image
.skip_sprite_image_redraw
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #~(ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE)
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	dex
	bpl .sprite_redraw_loop
	; Redraw HUD
	lda does_hud_need_redraw
	beq .skip_hud_redraw
	lda #0
	sta does_hud_need_redraw
	lda <#draw_hud
	sta script_address
	lda >#draw_hud
	sta script_address+1
	jsr execute_script
.skip_hud_redraw
	; Return
	rts