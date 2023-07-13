; Draws a 2x2 char tile on screen
; --- Inputs ---
; a:                 The tile ID to draw
; x:                 The drawing offset
; sta_x_modable_0+1: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1+1: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable+1
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
	sta lda_y_modable+1
	; High byte
	tya
	ror
	ror
	ror
	and #%00000111
	plp
	adc #>tiles
	sta lda_y_modable+2
	; Copy chars to screen
	ldy #0
	jsr lda_y_modable
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable
	jsr sta_x_modable_0
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable
	jsr sta_x_modable_0
	iny
	inx
	jsr lda_y_modable
	jsr sta_x_modable_0
	; Copy colors to screen
	iny
	txa
	sec
	sbc #41
	tax
	jsr lda_y_modable
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable
	jsr sta_x_modable_1
	; Next row
	iny
	txa
	clc
	adc #39
	tax
	jsr lda_y_modable
	jsr sta_x_modable_1
	iny
	inx
	jsr lda_y_modable
	jsr sta_x_modable_1
	; Return nothing
	rts

; Draws a 4x4 char metatile on screen
; --- Inputs ---
; a:                 The metatile ID to draw
; x:                 The drawing offset
; sta_x_modable_0+1: The address of the top left char on the screen that should be drawn over
; sta_x_modable_1+1: The address of the top left char's color on the screen that should be drawn over
; --- Corrupted ---
; y, lda_y_modable+1
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
	sta lda_y_modable+1
	; High byte
	tya
	ror
	ror
	and #%00000011
	plp
	adc #>metatiles
	sta lda_y_modable+2
	; Get tiles
	ldy #3
	jsr lda_y_modable
	pha
	dey
	jsr lda_y_modable
	pha
	dey
	jsr lda_y_modable
	pha
	dey
	jsr lda_y_modable
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
draw_map subroutine
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
	sta c64_tile_colors,x
	sta c64_tile_colors+$100,x
	sta c64_tile_colors+$200,x
	inx
	bne .loop
	; Clear the last partial page of the screen such that a total of 1000 chars will have been cleared
	ldx #$0
.last_loop
	lda #$0
	sta $0700,x
	lda #C64_COLOR_WHITE
	sta c64_tile_colors+$300,x
	inx
	cpx #<1000
	bne .last_loop
	rts

; Display all 256 chars in the top left as a 16x16 box
display_all_chars subroutine
	; Load $0400 into sta_x_modable's address
	lda #$00
	sta sta_x_modable_0+1
	lda #$04
	sta sta_x_modable_0+2
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
	lda sta_x_modable_0+1
	clc
	adc #(40-16)
	sta sta_x_modable_0+1
	lda sta_x_modable_0+2
	adc #0
	sta sta_x_modable_0+2
	; If not then we will skip to here
.skip_next_row
	; If the tile number overflows to 0 then we have drawn all tiles so return
	txa
	bne .loop
	rts