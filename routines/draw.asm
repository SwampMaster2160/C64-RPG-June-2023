; Draw routines

; Draws a 2x2 char tile on screen
; --- Inputs ---
; a:                       The tile ID to draw
; x:                       The drawing offset
; sta_x_modable_0_address: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1_address: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable_0_address
; --- Outputs ---
; x: Has 41 added
draw_tile subroutine
	; Get location of where the tile should be copied from (tiles + a * 8)
	tay
	; Low byte
	asl
	asl
	asl
	clc
	adc #<tiles
	php
	sta lda_y_modable_0_address
	; High byte
	tya
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>tiles
	sta lda_y_modable_0_address+1
	; Copy chars to screen
	ldy #0
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	; Copy colors to screen
	iny
	txa
	sec
	sbc #41
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable_0
	jsr sta_x_modable_1
	; Return nothing
	rts

; Draws a 4x4 char metatile on screen
; --- Inputs ---
; a:                       The metatile ID to draw
; x:                       The drawing offset
; sta_x_modable_0_address: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1_address: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable_0_address
; --- Outputs ---
; x: Has 123 added
draw_metatile subroutine
	; Get location to copy metatile from (metatiles + a * 4)
	tay
	; Low byte
	asl
	asl
	clc
	adc #<metatiles
	php
	sta lda_y_modable_0_address
	; High byte
	tya
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>metatiles
	sta lda_y_modable_0_address+1
	; Get tiles
	ldy #3
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
	pha
	dey
	jsr lda_y_modable_0
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

; Draws a map
; --- Inputs ---
; a: The map ID to draw
; --- Corrupted ---
; y, lda_y_modable_0_address, lda_y_modable_1_address, sta_x_modable_0_address, sta_x_modable_1_address
draw_map subroutine
	tay
	; Setup for world interrupt
	lda #((3 | C64_25_ROWS) | %10000000) ; No vertical scroll, 25 rows, screen on, text mode, extended background off
	sta c64_screen_control_0
	lda #32                                              ; Interrupt at line 288
	sta c64_screen_interrupt_line
	lda #0
	sta is_next_screen_interrupt_for_gui
	; Get the location that we should copy the map from (maps + a * 64)
	; Low byte
	tya
	asl
	asl
	asl
	asl
	asl
	asl
	clc
	adc #<maps
	php
	sta lda_y_modable_1_address
	; High byte
	tya
	lsr
	lsr
	plp
	adc #>maps
	sta lda_y_modable_1_address+1
	; Get the locations of the chars and colors that we should copy to for the first row
	lda #<c64_chars
	sta sta_x_modable_0_address
	lda #>c64_chars
	sta sta_x_modable_0_address+1
	lda #<c64_char_colors
	sta sta_x_modable_1_address
	lda #>c64_char_colors
	sta sta_x_modable_1_address+1
	; Load colors
	ldy #50
	jsr lda_y_modable_1
	sta c64_border_color
	lsr
	lsr
	lsr
	lsr
	sta world_background_color
	iny
	jsr lda_y_modable_1
	sta c64_background_colors+1
	lsr
	lsr
	lsr
	lsr
	sta c64_background_colors+2
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
	jsr lda_y_modable_1
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
	lda sta_x_modable_0_address
	clc
	adc #160
	sta sta_x_modable_0_address
	lda sta_x_modable_0_address+1
	adc #0
	sta sta_x_modable_0_address+1
	lda sta_x_modable_1_address
	clc
	adc #160
	sta sta_x_modable_1_address
	lda sta_x_modable_1_address+1
	adc #0
	sta sta_x_modable_1_address+1
	; Continue on to draw next row
	jmp .rows_loop
; One all tiles have been drawn
.end
	; Return
	rts

; Fills screen with tile 0 colored white
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
; sta_x_modable_0_address: The address to draw the textbox at
; text_color:              The color to draw the textbox in
; x:                       The width of the textbox
; y:                       The height of the textbox
; --- Corrupted ---
; sta_x_modable_1_address, a
draw_textbox subroutine
	; Push x to stack
	dex
	txa
	pha
	; Calculate the pointer to the textbox's color area
	lda sta_x_modable_0_address
	sta sta_x_modable_1_address
	lda sta_x_modable_0_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta sta_x_modable_1_address+1
	; Draw first row
	jsr draw_textbox_top_chars_row
	pla
	pha
	tax
	jsr draw_textbox_colors_row
	;
	dey
.loop
	dey
	beq .loop_end
	; Move char and color pointers to the next row
	lda sta_x_modable_0_address
	clc
	adc #40
	sta sta_x_modable_0_address
	sta sta_x_modable_1_address
	lda sta_x_modable_0_address+1
	adc #0
	sta sta_x_modable_0_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta sta_x_modable_1_address+1
	; Draw middle rows
	pla
	pha
	tax
	jsr draw_textbox_middle_chars_row
	pla
	pha
	tax
	jsr draw_textbox_colors_row
	jmp .loop
.loop_end
	; Move char and color pointers to the next row
	lda sta_x_modable_0_address
	clc
	adc #40
	sta sta_x_modable_0_address
	sta sta_x_modable_1_address
	lda sta_x_modable_0_address+1
	adc #0
	sta sta_x_modable_0_address+1
	clc
	adc #>(c64_char_colors - c64_chars)
	sta sta_x_modable_1_address+1
	; Draw last row
	pla
	pha
	tax
	jsr draw_textbox_bottom_chars_row
	pla
	pha
	tax
	jsr draw_textbox_colors_row
	; Restore stack and return
	pla
	rts

; Draws the top row of a textbox
; --- Inputs ---
; sta_x_modable_0_address: The address to draw the textbox at
; x:                       The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_top_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_DOWN_LEFT
	jsr sta_x_modable_0
	; Draw middle chars
	lda #GUI_CHAR_LINE_HORIZONTAL
.loop
	dex
	beq .loop_end
	jsr sta_x_modable_0
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_RIGHT_DOWN
	jsr sta_x_modable_0
	; Return
	rts

; Draws a middle row of a textbox
; --- Inputs ---
; sta_x_modable_0_address: The address to draw the textbox at
; x:                       The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_middle_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_VERTICAL
	jsr sta_x_modable_0
	; Draw middle chars
	lda '  ; Space
.loop
	dex
	beq .loop_end
	jsr sta_x_modable_0
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_VERTICAL
	jsr sta_x_modable_0
	; Return
	rts

; Draws the bottom row of a textbox
; --- Inputs ---
; sta_x_modable_0_address: The address to draw the textbox at
; x:                       The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_bottom_chars_row subroutine
	; Draw rightmost char
	lda #GUI_CHAR_LINE_UP_LEFT
	jsr sta_x_modable_0
	; Draw middle chars
	lda #GUI_CHAR_LINE_HORIZONTAL
.loop
	dex
	beq .loop_end
	jsr sta_x_modable_0
	jmp .loop
.loop_end
	; Draw leftmost char
	lda #GUI_CHAR_LINE_UP_RIGHT
	jsr sta_x_modable_0
	; Return
	rts

; Draw a color row of a textbox
; --- Inputs ---
; sta_x_modable_1_address: The address to draw the textbox at
; x:                       The width of the textbox - 1
; --- Corrupted ---
; a
draw_textbox_colors_row subroutine
	lda text_color
.loop
	jsr sta_x_modable_1
	dex
	bmi .loop_end
	jsr .loop
.loop_end
	rts

; Display all 256 chars in the top left as a 16x16 box
display_all_chars subroutine
	; Load $0400 into sta_x_modable_address
	lda #<c64_chars
	sta sta_x_modable_0_address
	lda #>c64_chars
	sta sta_x_modable_0_address+1
	; Start with tile 0
	ldx #0
.loop
	; Draw tile
	txa
	jsr sta_x_modable_0
	; Increment tile count
	inx
	; Check if we should go to the next row (if the tile id is a multiple of 16)
	txa
	and #%00001111 ; a %= 16
	bne .skip_next_row
	; If so add (40-16) to sta_x_modable's address
	lda sta_x_modable_0_address
	clc
	adc #(40-16)
	sta sta_x_modable_0_address
	lda sta_x_modable_0_address+1
	adc #0
	sta sta_x_modable_0_address+1
	; If not then we will skip to here
.skip_next_row
	; If the tile number overflows to 0 then we have drawn all tiles so return
	txa
	bne .loop
	rts

update_sprite_graphics subroutine
	; TODO: Add walk offset
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
	adc byte_0;#24
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

update_sprite_image_graphics subroutine
	; Calculate pointer to the sprite once loaded
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
	sta sta_x_modable_0_address
	txa
	lsr
	lsr
	plp
	adc #>sprite_shapes
	sta sta_x_modable_0_address+1
	; Clear sprite
	txa
	pha
	ldx #63
	lda #0;%00011011
.clear_sprite_loop
	jsr sta_x_modable_0
	dex
	bpl .clear_sprite_loop
	pla
	tax
	; Calculate pointer to the data for the sprite
	lda entity_discriminants,x
	asl
	asl
	asl
	clc
	adc #<entities
	php
	sta lda_y_modable_0_address
	lda entity_discriminants,x
	lsr
	lsr
	lsr
	lsr
	lsr
	plp
	adc #>entities
	sta lda_y_modable_0_address+1
	; Sprite color
	ldy #4
	jsr lda_y_modable_0
	sta c64_sprite_color_0s,x
	; Get sprite image to use
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #%00000011
	tay
	jsr lda_y_modable_0
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
	sta lda_y_modable_0_address
	tya
	lsr
	lsr
	lsr
	plp
	adc #>entity_sprites
	sta lda_y_modable_0_address+1
	; Copy sprite
	txa
	pha
	ldx #0
	ldy #0
.sprite_copy_loop
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	inx
	iny
	jsr lda_y_modable_0
	jsr sta_x_modable_0
	inx
	inx
	iny
	cpy #32
	bne .sprite_copy_loop
	pla
	tax
	; Return
	rts

update_graphics subroutine
	; Redraw map if needed then set it to not need redrawing
	lda does_map_need_redraw
	beq .skip_map_redraw
	lda #0
	sta does_map_need_redraw
	lda current_map
	jsr draw_map
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
	jsr update_sprite_graphics
.skip_sprite_redraw
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #ENTITY_IMAGE_CHANGE
	beq .skip_sprite_image_redraw
	jsr update_sprite_image_graphics
.skip_sprite_image_redraw
	lda entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	and #~(ENTITY_NEEDS_REDRAW | ENTITY_IMAGE_CHANGE)
	sta entity_facing_directions_and_walk_offsets_and_redraw_flags,x
	dex
	bpl .sprite_redraw_loop
	; Return
	rts